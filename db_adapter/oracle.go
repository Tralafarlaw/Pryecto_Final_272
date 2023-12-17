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
		service        = "XE"
		jdbc           = "jdbc:oracle:thin:@//146.190.145.177:1521/XEPDB1"
	)
	var urlOptions = map[string]string{
		"ssl":        "true",  // or enable
		"ssl verify": "false", // stop ssl certificate verification
	}
	return go_ora.BuildUrl(host, port, service, user, pass, urlOptions)
	//return go_ora.BuildJDBC(user, pass, jdbc, urlOptions)
	//return "jdbc:oracle:thin:pdbadmin/pass@//146.190.145.177:1521/XEPDB1"
}

var OracleSqlFile string = path.Join("sql", "oracle.sql")
var OracleInsertFile string = path.Join("sql", "populate_oracle.sql")
