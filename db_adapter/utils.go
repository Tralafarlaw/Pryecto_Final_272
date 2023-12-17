package db_adapter

import "os"

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
