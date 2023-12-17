SELECT cp.company_name as Nombre, cp.sector as Sector, cp.service as Servicio
FROM spends as sp, companies as cp, communities as com
WHERE com.community_name = '%s'
AND sp.community_id = com.community_id
AND cp.id_empresa = sp.id_empresa