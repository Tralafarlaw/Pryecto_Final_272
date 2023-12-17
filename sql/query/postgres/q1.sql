SELECT communities.community_name as comunidad, cm.admin_full_name as nombre, cm.admin_dni as CI
FROM community_admins as cm
JOIN communities ON cm.admin_id = communities.admin_id;