SELECT owners_firs_name as Nombre, owners_last_name as Apellido, owners_address as Direccion
FROM owners as ow LEFT JOIN
(SELECT  owners.id_propietario
FROM  owners, tentants
where tentants.id_propietario = owners.id_propietario) as aux ON ow.id_propietario = aux.id_propietario
