SELECT bk.bank_name as Name, ba.balance as Saldo
FROM bank_accounts as ba, banks as bk
WHERE ba.balance < 0
and bk.bank_id = ba.bank_id