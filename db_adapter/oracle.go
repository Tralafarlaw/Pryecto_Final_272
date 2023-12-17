package db_adapter

import (
	go_ora "github.com/sijms/go-ora"
	"path"
)

func OracleStr() string {
	const (
		port    int    = 1521
		host    string = "146.190.145.177"
		user           = "pdbadmin"
		pass           = "pass"
		service        = "XEPDB1"
	)
	return go_ora.BuildUrl(host, port, service, user, pass, nil)
}

var OracleSqlFile string = path.Join("sql", "oracle.sql")
