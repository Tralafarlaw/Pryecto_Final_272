SELECT com.community_name as Nombre, br.amount as "Monto Pendiente"
FROM bank_receipts as br, communities as com
WHERE is_paid = false
and br.bank_id = com.bank_id
