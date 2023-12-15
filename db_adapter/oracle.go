package db_adapter

import go_ora "github.com/sijms/go-ora"

func OracleStr() string {
	const (
		port int    = 1521
		host string = "146.190.145.177"
		user
		pass
		service
	)
	return go_ora.BuildUrl(host, port, service, user, pass, nil)
}
