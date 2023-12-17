SELECT tentant_first_name as Nombre, bussiness_type as Tipo, bussiness_locals.schedule as Horario
FROM communities, bussiness_locals, tentants
WHERE communities.community_id = bussiness_locals.community_id
and tentants.id_propiedad = bussiness_locals.id_propiedad
and community_name = '%s'