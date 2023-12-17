package db_adapter

import (
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
	_ "github.com/lib/pq"
	_ "github.com/microsoft/go-mssqldb"
	_ "github.com/microsoft/go-mssqldb/integratedauth/krb5"
	_ "github.com/sijms/go-ora"
	"log"
)

const DB_NAME = "administraciondefincas"

func Connect(database int) (*sql.DB, error) {
	var driver, url = getAdapter(database)
	con, err := sql.Open(driver, url)
	err = con.Ping()
	if err != nil {
		panic(err)
		return nil, err
	}

	return con, err
}

func InitializeDb(database int, db *sql.DB) bool {
	_, err := db.Exec(getInitDatabaseScript(database))
	if err != nil {
		log.Fatal(err)
		return false
	}

	return true
}
