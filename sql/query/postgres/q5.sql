SELECT owners_firs_name as Nombre, owners_last_name as Apellido, community_name as Comunidad
FROM communities, owners
where communities.id_presidente = owners.id_propietario
