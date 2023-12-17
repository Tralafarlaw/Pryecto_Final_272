SELECT ow.owners_firs_name as Nombre, ow.owners_last_name as Apellido
FROM owners as ow,
     communities as com,
     bussiness_locals as bl,
     offices as of,
     apartment as ap
WHERE ow.is_vocal
  AND (
    (bl.id_propietario = ow.id_propietario)
        OR
    ap.id_propietario = ow.id_propietario
        OR
    of.id_propietario = ow.id_propietario
    )
  AND bl.community_id = '%s'
  AND ap.community_id = '%s'
  AND of.community_id = '%s'
  AND com.community_id = '%s'
