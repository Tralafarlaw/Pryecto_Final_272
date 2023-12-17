package db_adapter

import (
	"fmt"
	"path"
)

func MySqlStr() string {
	const (
		user   string = "root"
		pass          = "pass"
		port          = "3306"
		dbname        = "admin_fincas"
		host          = "146.190.145.177"
	)
	return fmt.Sprintf("%s:%s@tcp(%s:%s)/%s", user, pass, host, port, dbname)
}

var MySqlSqlFile string = path.Join("sql", "mysql.sql")
var MySqlInsertFile string = path.Join("sql", "populate_mysql.sql")
