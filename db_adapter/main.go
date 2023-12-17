package db_adapter

import (
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
	_ "github.com/lib/pq"
	_ "github.com/microsoft/go-mssqldb"
	_ "github.com/microsoft/go-mssqldb/integratedauth/krb5"
	"github.com/pterm/pterm"
	_ "github.com/sijms/go-ora"
	"log"
	"strings"
)

const DB_NAME = "administraciondefincas"

func Connect(database int) (*sql.DB, error) {
	var driver, url = getAdapter(database)
	con, err := sql.Open(driver, url)
	//log.Println("Con err: ", err)
	//ans, errr := con.Query("SELECT * FROM v$version;")

	//log.Println("Query: ", ans)
	//log.Println("Error: ", errr.Error())

	if err != nil {
		log.Fatal("Ping Fail ", err)
		return nil, err
	}

	return con, err
}

func InitializeDb(database int, db *sql.DB) bool {

	requests := strings.Split(getInitDatabaseScript(database), ";")
	p, _ := pterm.DefaultProgressbar.WithTotal(len(requests)).WithTitle("Limpiando Base de datos").Start()
	for _, r := range requests {
		p.Increment()
		if len(strings.TrimSpace(r)) == 0 {
			continue
		}
		_, err := db.Exec(r)
		if err != nil {
			pterm.Error.Println("Query: " + r)
			pterm.Error.Println("Detalles: " + err.Error())
			return false
		}
	}

	return true
}

func PopulateDB(database int, db *sql.DB) bool {
	requests := strings.Split(getPopulateDatabaseScript(database), ";")
	p, _ := pterm.DefaultProgressbar.WithTotal(len(requests)).WithTitle("Llenando Base de datos").Start()
	for _, r := range requests {
		p.Increment()
		if len(strings.TrimSpace(r)) == 0 {
			continue
		}
		_, err := db.Exec(r)
		if err != nil {
			pterm.Error.Println("Query: " + r)
			pterm.Error.Println("Detalles: " + err.Error())
			return false
		}
	}

	return true
}
