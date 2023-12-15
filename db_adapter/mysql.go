package db_adapter

import "fmt"

func MySqlStr() string {
	const (
		user string = ""
		pass
		port
		host
	)
	return fmt.Sprintf("%s:%s@tcp(%s:%s)/", user, pass, host, port)
}
