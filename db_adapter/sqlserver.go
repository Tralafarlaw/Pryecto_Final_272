package db_adapter

import (
	"fmt"
	"path"
)

func sqlServerStr() string {
	const (
		username string = "sa"
		password        = "password_1"
		hostname        = "146.190.145.177"
		port            = "1433"
		database        = "admin_fincas"
	)
	return fmt.Sprintf("sqlserver://%s:%s@%s:%s?database=%s", username, password, hostname, port, database)
}

var SqlServerSqlFile string = path.Join("sql", "sqlserver.sql")
var SqlServerInsertFile string = path.Join("sql", "populate_sqlserver.sql")
