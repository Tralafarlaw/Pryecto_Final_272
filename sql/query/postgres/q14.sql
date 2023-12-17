SELECT of.activity as Actividades
FROM offices as of, communities as com
where com.community_id = of.community_id
and com.community_name = '%s'
GROUP BY of.activity
