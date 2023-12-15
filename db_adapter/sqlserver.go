package db_adapter

import (
	"fmt"
	"net/url"
)

func sqlServerStr() string {
	const (
		username string = ""
		password
		hostname
		port
	)
	u := &url.URL{
		Scheme: "sqlserver",
		User:   url.UserPassword(username, password),
		Host:   fmt.Sprintf("%s:%s", hostname, port),
	}
	return u.String()
}
