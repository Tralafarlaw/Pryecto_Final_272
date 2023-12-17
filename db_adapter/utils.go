package db_adapter

import (
	"fmt"
	"github.com/pterm/pterm"
	"os"
	"path"
)

func getAdapter(selection int) (string, string) {
	switch selection {
	case 0:
		return "mysql", MySqlStr()
	case 1:
		return "oracle", OracleStr()
	case 2:
		return "postgres", PostgresStr()
	case 3:
		return "sqlserver", sqlServerStr()
	default:
		return "", ""
	}
}

func readSqlFile(path string) string {
	c, err := os.ReadFile(path)
	if err != nil {
		panic(err)
	}
	return string(c)
}

func getInitDatabaseScript(db int) string {
	switch db {
	case 0:
		return readSqlFile(MySqlSqlFile)
	case 1:
		return readSqlFile(OracleSqlFile)
	case 2:
		return readSqlFile(PostgresSqlFile)
	case 3:
		return readSqlFile(SqlServerSqlFile)
	default:
		return ""
	}
}
func getPopulateDatabaseScript(db int) string {
	switch db {
	case 0:
		return readSqlFile(MySqlInsertFile)
	case 1:
		return readSqlFile(OracleInsertFile)
	case 2:
		return readSqlFile(PostgresInsertFile)
	case 3:
		return readSqlFile(SqlServerInsertFile)
	default:
		return ""
	}
}

func GetQuery(num string, dbms int) string {
	var folder string
	switch dbms {
	case 0:
		folder = "mysql"
	case 1:
		folder = "oracle"
	case 2:
		folder = "postgres"
	case 3:
		folder = "sqlserver"
	}
	file := fmt.Sprintf("q%s.sql", num)
	filePath := path.Join("sql", "query", folder, file)
	pterm.Info.Println(filePath)
	return readSqlFile(filePath)
}
