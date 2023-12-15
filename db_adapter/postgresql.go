package db_adapter

import "fmt"

func PostgresStr() string {
	const (
		HOST string = "146.190.145.177"
		PORT int    = 5432
		USER string = "usuario"
		PASS string = "pass"
	)
	return fmt.Sprintf("host=%s port=%d user=%s password=%s sslmode=disable", HOST, PORT, USER, PASS)
}
