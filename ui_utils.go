package main

import (
	"Pryecto_Final_272/db_adapter"
	"database/sql"
	"fmt"
	"github.com/pterm/pterm"
	"github.com/pterm/pterm/putils"
)

const appName string = "Mi Finca"

func displayTitle() {
	pterm.DefaultHeader.WithFullWidth().Println("Bienvenido al sistema")
	pterm.DefaultBigText.WithLetters(putils.LettersFromString(appName)).Render()
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
	return db
}

func menu(db *sql.DB) {

}
