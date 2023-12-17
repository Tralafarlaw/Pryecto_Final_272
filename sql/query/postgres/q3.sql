SELECT owners_firs_name, owners_last_name
FROM  owners, tentants
where tentants.id_propietario = owners.id_propietario