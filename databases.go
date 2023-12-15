package main

type mDatabase uint

const (
	MySql mDatabase = iota
	Oracle
	Postgres
	SQLServer
)

func parseDatabase(name string) mDatabase {
	switch name {
	case "MySql":
		return mDatabase(0)
	case "Oracle":
		return mDatabase(1)
	case "Postgresql":
		return mDatabase(2)
	case "SQLServer":
		return mDatabase(3)
	default:
		return mDatabase(0)
	}
}

func (database mDatabase) String() string {
	switch database {
	case MySql:
		return "MySql"
	case Oracle:
		return "Oracle"
	case Postgres:
		return "Postgresql"
	case SQLServer:
		return "SQlServer"
	default:
		return "None"
	}
}

const DatabasesCount int = 4

func databasesArray() [4]string {
	var ans [4]string
	for i := 0; i < DatabasesCount; i++ {
		ans[i] = mDatabase(i).String()
	}
	return ans
}
