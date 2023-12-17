package db_adapter

import (
	"fmt"
	"path"
)

func MySqlStr() string {
	const (
		user string = ""
		pass
		port
		host
	)
	return fmt.Sprintf("%s:%s@tcp(%s:%s)/", user, pass, host, port)
}

var MySqlSqlFile string = path.Join("sql", "mysql.sql")
