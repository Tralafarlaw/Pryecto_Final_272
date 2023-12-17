SELECT ow.owners_firs_name as Nombre,
       ow.owners_last_name as Apellido,
       ow.owners_address as Direccion,
       ap.spends_percent as "Participacion Gastos Departamento",
       bl.spends_percent as "Participacion Gastos Negocio",
       of.spends_percent as "Participacion Gastos Oficina"
FROM ((owners as ow JOIN offices as of ON ow.id_propietario = of.id_propietario)
    JOIN apartment as ap ON ow.id_propietario = ap.id_propietario)
         JOIN bussiness_locals as bl ON ow.id_propietario = bl.id_propietario
-- %s es el paceholder para la variable que se busca no cambiar
WHERE ap.spends_percent > %s
   OR of.spends_percent > %s
   OR bl.spends_percent > %s