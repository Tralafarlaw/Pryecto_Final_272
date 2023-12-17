package main

import (
	"Pryecto_Final_272/db_adapter"
	"database/sql"
	"fmt"
	"github.com/pterm/pterm"
	"github.com/pterm/pterm/putils"
	"strconv"
)

const appName string = "Mi Finca"

func displayTitle() {
	pterm.DefaultHeader.WithFullWidth().Println("Bienvenido al sistema")
	err := pterm.DefaultBigText.WithLetters(putils.LettersFromString(appName)).Render()
	handleError(err)
}

func selectDBMS() *sql.DB {
	var opts []string
	for i := 0; i < DatabasesCount; i++ {
		opts = append(opts, mDatabase(i).String())
	}
	seleccion, _ := pterm.DefaultInteractiveSelect.WithOptions(opts).Show()
	pterm.DefaultHeader.WithFullWidth().Println(fmt.Sprintf("%s se ha seleccionado como DBMS", seleccion))
	dbms = parseDatabase(seleccion)
	db, err := db_adapter.Connect(int(dbms))
	if err != nil {
		pterm.Error.Println("Error al conectar con la Base de Datos")
		panic(err)
	}
	pterm.Info.Println("Coneccion exitosa a la base de datos")
	if init := db_adapter.InitializeDb(int(dbms), db); !init {
		pterm.Error.Println("Error al Inizializar la Base de datos")
	}
	if init := db_adapter.PopulateDB(int(dbms), db); !init {
		pterm.Error.Println("Error al llenar la Base de datos")
	}
	return db
}

func menu(db *sql.DB) {

	var MenuOptions = []string{
		/*00*/ "Salir",
		/*01*/ "Listar Todos los administradores",
		/*02*/ "Listar Todas las Comunidades de Vecinos",
		/*03*/ "Mostrar Propietarios con Inquilinos",
		/*04*/ "Listar Recibos Impagos ",
		/*05*/ "Listar Presidentes de Comunidades",
		/*06*/ "Listar cuentas con saldo mayor a:",
		/*07*/ "Listar propietarios con una participacion mayor a:",
		/*08*/ "Empresas contratadas por la comunidad:",
		/*09*/ "Listar comercios en la comunidad:",
		/*10*/ "Listar Propietarios sin inquilinos",
		/*11*/ "Listar comunidades con recibos impagos",
		/*12*/ "Listar propietarios con cuentas en el banco: ",
		/*13*/ "Listar Vocales de la comunidad: ",
		/*14*/ "Listar las actividades de las oficinas en la comunidad: ",
		/*15*/ "Listar bancos con cuentas en saldo negativo",
		/*16*/ "Ejecutar Custom Query",
	}
	selectedOption, _ := pterm.DefaultInteractiveSelect.WithOptions(MenuOptions).Show()
	var query string
	var opt = indexOf(selectedOption, MenuOptions)
	if opt == 0 {
		Adios()
		return
	}
	query = QueryBuilder(opt, db)

	rows, err := db.Query(query)
	if err != nil {
		pterm.Error.Println("Query: ", query)
		pterm.Error.Println("Error: ", err.Error())
		return
	}
	showTable(rows)
	result, _ := pterm.DefaultInteractiveConfirm.WithDefaultText("Desea realizar una otra consulta?").Show()

	// Print a blank line for better readability.
	pterm.Println()

	// Print the user's answer in a formatted way.
	if result {
		menu(db)
	} else {
		Adios()
	}
}

func showTable(table *sql.Rows) {
	var data [][]string
	header, err := table.Columns()
	handleError(err)
	cols, err := table.ColumnTypes()
	handleError(err)
	data = append(data, header)
	// Make a slice for the values
	values := make([]interface{}, len(cols))

	// rows.Scan wants '[]interface{}' as an argument, so we must copy the
	// references into such a slice
	// See http://code.google.com/p/go-wiki/wiki/InterfaceSlice for details
	scanArgs := make([]interface{}, len(values))
	for i := range values {
		scanArgs[i] = &values[i]
	}

	// Fetch rows
	for table.Next() {
		err = table.Scan(scanArgs...)
		if err != nil {
			panic(err.Error())
		}

		var row []string
		// Print data
		for _, value := range values {
			var aux string
			switch value.(type) {
			case nil:
				aux = "NULL"
			case []byte:
				aux = string(value.([]byte))
			default:
				aux = fmt.Sprintf("%v", value)
			}
			row = append(row, aux)
		}
		data = append(data, row)
	}
	err = pterm.DefaultTable.WithHasHeader().WithBoxed().WithRowSeparator("-").WithHeaderRowSeparator("-").WithData(data).Render()
	handleError(err)

}
func indexOf(word string, data []string) int {
	for k, v := range data {
		if word == v {
			return k
		}
	}
	return -1
}

func handleError(err error) {
	if err != nil {
		pterm.Error.Println(err)
		return
	}
}

func QueryBuilder(opt int, db *sql.DB) string {
	rawquery := db_adapter.GetQuery(strconv.Itoa(opt), int(dbms))
	switch opt {
	case 6:
		//6 "Listar cuentas con saldo mayor a:",
		saldo := ReadInput()
		return fmt.Sprintf(rawquery, saldo)
	case 7:
		//7 "Listar propietarios con una participacion mayor a:",
		saldo := ReadInput()
		return fmt.Sprintf(rawquery, saldo, saldo, saldo)
	case 8, 9, 14:
		//*08*/	"Empresas contratadas por la comunidad:",
		//*09*/	"Listar comercios en la comunidad:",
		//*13*/	"Listar Vocales de la comunidad: ",
		//*14*/	"Listar las actividades de las oficinas en la comunidad: ",
		com := selectCommunity(db)
		return fmt.Sprintf(rawquery, com)
	case 13:
		com := selectCommunity(db)
		return fmt.Sprintf(rawquery, com, com, com, com)

	case 12:
		//*12*/	"Listar propietarios con cuentas en el banco: ",
		com := selectBank(db)
		return fmt.Sprintf(rawquery, com)
	case 16:
		//16*/	"Ejecutar Custom Query",
		query := ReadInput()
		return query
	default:
		///*15*/	"Listar bancos con cuentas en saldo negativo",
		//*11*/	"Listar comunidades con recibos impagos",
		//"Listar Todos los administradores",
		//"Listar Todas las Comunidades de Vecinos",
		//"Mostrar Propietarios con Inquilinos",
		//"Listar Recibos Impagos del ultimo trimestre",
		//"Listar Presidentes de Comunidades",
		//"Listar Propietarios sin inquilinos",
		return rawquery
	}
}

func ReadInput() string {
	textInput := pterm.DefaultInteractiveTextInput.WithMultiLine(false).WithDefaultText("Ingrese un valor")
	result, _ := textInput.Show()
	return result
}
func selectCommunity(db *sql.DB) string {
	q := db_adapter.GetQuery("comunidades", int(dbms))
	query, err := db.Query(q)
	handleError(err)
	options := RowsList(query)
	selectedOption, _ := pterm.DefaultInteractiveSelect.WithOptions(options).Show()
	return selectedOption
}
func selectBank(db *sql.DB) string {
	q := db_adapter.GetQuery("bancos", int(dbms))
	query, err := db.Query(q)
	handleError(err)
	options := RowsList(query)
	selectedOption, _ := pterm.DefaultInteractiveSelect.WithOptions(options).Show()
	return selectedOption
}
func RowsList(query *sql.Rows) []string {
	var list []string
	var com string
	for query.Next() {
		err := query.Scan(&com)
		handleError(err)
		list = append(list, com)
	}
	return list
}

func Adios() {
	newHeader := pterm.HeaderPrinter{
		TextStyle:       pterm.NewStyle(pterm.FgBlack),
		BackgroundStyle: pterm.NewStyle(pterm.BgRed),
		Margin:          20,
	}
	newHeader.Println("Adios...")
}
