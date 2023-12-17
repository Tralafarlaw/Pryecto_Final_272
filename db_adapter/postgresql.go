package db_adapter

import (
	"fmt"
	"path/filepath"
	"strings"
)

func PostgresStr() string {
	const (
		HOST string = "146.190.145.177"
		PORT int    = 5432
		USER string = "usuario"
		PASS string = "pass"
	)
	return fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable", HOST, PORT, USER, PASS, strings.ToLower(DB_NAME))
}

var PostgresSqlFile string = filepath.Join("sql", "postgres.sql")
var PostgresInsertFile string = filepath.Join("sql", "populate_postgres.sql")
