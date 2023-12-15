package db_adapter

import (
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
	_ "github.com/lib/pq"
	_ "github.com/microsoft/go-mssqldb"
	_ "github.com/microsoft/go-mssqldb/integratedauth/krb5"
	_ "github.com/sijms/go-ora"
)

func Connect(database int) *sql.DB {
	var driver, url = getAdapter(database)
	con, err := sql.Open(driver, url)
	if err != nil {
		return nil
	}
	return con
}
