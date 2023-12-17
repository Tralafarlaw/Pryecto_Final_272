package main

var dbms mDatabase

func main() {
	displayTitle()
	db := selectDBMS()
	menu(db)
}
