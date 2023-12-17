SELECT br.creation_date as fecha, br.amount as Monto
FROM bank_receipts as br
WHERE is_paid = false