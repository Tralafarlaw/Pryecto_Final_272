-- Query 6
SELECT bk.account_number AS "Nro de Cuenta", bk.agency_code AS "Codigo de Agencia" ,bk.balance as Saldo
FROM bank_accounts AS bk
WHERE bk.balance > %s -- %s es el Placeholder para el valor de consulta NO CAMBIAR