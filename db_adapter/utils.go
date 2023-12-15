package db_adapter

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
