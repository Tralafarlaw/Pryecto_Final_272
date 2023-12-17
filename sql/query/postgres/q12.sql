SELECT community_name as Comunidad, bk.bank_name as Banco, COUNT(bank_name) as Cuentas
FROM communities as com JOIN banks as bk ON com.bank_id = bk.bank_id
WHERE bk.bank_name = '%s'
group by bk.bank_name, community_name
