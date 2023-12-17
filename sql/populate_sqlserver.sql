-- Para la tabla 'contact_infos'
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Pedro Choque', '2581892');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Juan Quiroga', '2886830');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Ana Martinez', '2722170');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Jose Luis Perales', '2064501');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Aldo Perez', '2788009');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Antonio Paredez', '2468746');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Manuela Calderon', '2863455');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Daniela Zambrana', '2135594');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Francisco Javier Paredes', '2535934');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Raul Colque', '2683068');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Andres Chambi', '2654304');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Maria Jose Copa', '2785763');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Cesar Aguayo', '2723454');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Sebastian Ticona', '2803692');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Juan Coca', '2572023');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Rosa Jimenez', '2059343');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Sara Quisbert', '2434736');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Encarnacion Marca', '2174170');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Juan Aguayo', '2197448');
INSERT INTO contact_infos ( contact_name, contact_phone) VALUES ( 'Olga Cossio', '2321878');

-- Para la tabla 'banks'
INSERT INTO banks ( id_persona, bank_code, bank_name) VALUES (0, '123A', 'Banco Visa');
INSERT INTO banks ( id_persona, bank_code, bank_name) VALUES (1, '123B', 'Banco Sol');
INSERT INTO banks ( id_persona, bank_code, bank_name) VALUES (2, '123C', 'Banco Ganadero');
INSERT INTO banks ( id_persona, bank_code, bank_name) VALUES (3, '123D', 'Ecofuturo');
INSERT INTO banks ( id_persona, bank_code, bank_name) VALUES (4, '123E', 'Banco Fassil');
INSERT INTO banks ( id_persona, bank_code, bank_name) VALUES (5, '123F', 'BNB');
INSERT INTO banks ( id_persona, bank_code, bank_name) VALUES (6, '123G', 'La sagrada familia');
INSERT INTO banks ( id_persona, bank_code, bank_name) VALUES (7, '123H', 'Fortaleza');
INSERT INTO banks ( id_persona, bank_code, bank_name) VALUES (8, '123I', 'BCP');
INSERT INTO banks ( id_persona, bank_code, bank_name) VALUES (9, '123J', 'FIE');
INSERT INTO banks ( id_persona, bank_code, bank_name) VALUES (10, '123K', 'Banco Central');


-- Para la tabla 'companies'
INSERT INTO companies VALUES (2000, 1010, '123-asd', 'San luis', 'Gestion administrativa', '2487539', 'av.montes', 'Centro urbano');
INSERT INTO companies VALUES (2001, 1011, '123-ser', 'Nueva Esperanza', 'Manejo de Documentacion', '2487540', 'av.camacho', 'Zona Residencial');
INSERT INTO companies VALUES (2002, 1012, '456-tyu', 'La francesa', 'Elaboracion de contratos', '2487541', 'periferica', 'Area Industrial');
INSERT INTO companies VALUES (2003, 1013, '963-edc', 'La española', 'Mantenimiento de propiedades', '2487542', 'ciudad satelite', 'Area Rural');
INSERT INTO companies VALUES (2004, 1014, '159-jkl', 'Nuevo amanecer', 'Gestion de presupuesto', '2487543', 'La portada', 'Parque o Industria');
INSERT INTO companies VALUES (2005, 1015, '152-fgb', 'Urubo', 'Asesoria legal', '2487544', 'La ceja', 'Ciudad satelite');
INSERT INTO companies VALUES (2006, 1016, '789-scd', 'Entel', 'Servicios de seguridad', '2487545', 'Garita', 'Distrito financiero');
INSERT INTO companies VALUES (2007, 1017, '120-ert', 'Tigo', 'Gestion de condominios', '2487546', 'Max Paredes', 'Zona comercial');
INSERT INTO companies VALUES (2008, 1018, '947-iop', 'R.F.A', 'Servicios tecnologicos', '2487547', 'Kollasuyo', 'Suburbios');


-- Para la tabla 'bank_accounts'
INSERT INTO bank_accounts VALUES (4000, 100, 1000, 1000, '123456', 'AAA-1', '1');
INSERT INTO bank_accounts VALUES (4001, 101, 1001, 2000, '123457', 'AAA-2', '2');
INSERT INTO bank_accounts VALUES (4002, 102, 1002, 1000, '123458', 'AAA-1', '3');
INSERT INTO bank_accounts VALUES (4003, 103, 1003, 5000, '123459', 'AAA-2', '4');
INSERT INTO bank_accounts VALUES (4004, 104, 1004, 80000, '123460', 'AAA-3', '5');
INSERT INTO bank_accounts VALUES (4005, 105, 1005, 1500, '123461', 'AAA-4', '6');
INSERT INTO bank_accounts VALUES (4006, 106, 1006, 2600, '123462', 'AAA-5', '7');
INSERT INTO bank_accounts VALUES (4007, 107, 1007, 12000, '123463', 'AAA-6', '8');
INSERT INTO bank_accounts VALUES (4008, 108, 1008, 15000, '123464', 'AAA-7', '9');
INSERT INTO bank_accounts VALUES (4009, 109, 1009, 8000, '123465', 'AAA-8', '10');
INSERT INTO bank_accounts VALUES (4010, 110, 1010, 1500, '123466', 'AAA-9', '11');

-- Para la tabla 'community_admins'
INSERT INTO community_admins VALUES (3000, 'Leonardo Molina Sánchez', 9994561, 1);
INSERT INTO community_admins VALUES (3001, 'Valentina Herrera Castro', 9875489, 2);
INSERT INTO community_admins VALUES (3002, 'Martín Rojas Vargas', 7894586, 3);
INSERT INTO community_admins VALUES (3003, 'Isabella Castro Medina', 24578, 4);
INSERT INTO community_admins VALUES (3004, 'Sebastián Torres Salgado', 9325478, 5);

-- Para la tabla 'owners'
INSERT INTO owners VALUES (6000, 1, 'Pedro', 'Pereira', 'Zona sur', '2801475');
INSERT INTO owners VALUES (6001, 2, 'Jose', 'Mamani', 'obrajes', '2801476');
INSERT INTO owners VALUES (6002, 3, 'Juan', 'Francisco', 'Calacoto', '2801477');
INSERT INTO owners VALUES (6003, 4, 'Fernando', 'Fernandez', 'Chasquipampa', '2801478');
INSERT INTO owners VALUES (6004, 5, 'Juoaquin', 'Botero', 'San miguel', '2801479');
INSERT INTO owners VALUES (6005, 6, 'Marcelo', 'Triverio', 'Achumani', '2801480');






-- Para la tabla 'bank_receipts'
INSERT INTO bank_receipts VALUES (5000, 4000, 100, 1000, 6000, CONVERT(date, 'DD/MM/YYYY','10/10/2000'), 1000, 1);
INSERT INTO bank_receipts VALUES (5001, 4001, 101, 1001, 6001, CONVERT(date, 'DD/MM/YYYY','12/07/1999'), 2000, 1);
INSERT INTO bank_receipts VALUES (5002, 4002, 102, 1002, 6002, CONVERT(date, 'DD/MM/YYYY','12/04/2005'), 3000, 1);
INSERT INTO bank_receipts VALUES (5003, 4003, 103, 1003, 6003, CONVERT(date, 'DD/MM/YYYY','11/08/2000'), 1000, 2);
INSERT INTO bank_receipts VALUES (5004, 4004, 104, 1004, 6004, CONVERT(date, 'DD/MM/YYYY','01/09/2010'), 2500, 3);
INSERT INTO bank_receipts VALUES (5005, 4005, 105, 1005, 6005, CONVERT(date, 'DD/MM/YYYY','02/03/2003'), 3000, 2);
INSERT INTO bank_receipts VALUES (5006, 4006, 106, 1006, 6000, CONVERT(date, 'DD/MM/YYYY','20/02/2008'), 2900, 1);
INSERT INTO bank_receipts VALUES (5007, 4007, 107, 1007, 6001, CONVERT(date, 'DD/MM/YYYY','26/08/2015'), 1500, 1);
INSERT INTO bank_receipts VALUES (5008, 4008, 108, 1008, 6002, CONVERT(date, 'DD/MM/YYYY','11/12/2014'), 2000, 2);
INSERT INTO bank_receipts VALUES (5009, 4009, 109, 1009, 6003, CONVERT(date, 'DD/MM/YYYY','06/04/2005'), 1000, 5);
INSERT INTO bank_receipts VALUES (5010, 4010, 110, 1010, 6004, CONVERT(date, 'DD/MM/YYYY','30/03/1995'), 1200, 3);

-- Para la tabla 'communities'
INSERT INTO communities VALUES (8000, 3000, 6000, 4000, 100, 1000, 'Santa Rosa', '1', 50, '111-A');
INSERT INTO communities VALUES (8001, 3001, 6001, 4001, 101, 1001, 'Monte Verde', '2', 70, '112-B');
INSERT INTO communities VALUES (8002, 3002, 6002, 4002, 102, 1002, 'Rio Azul', '3', 30, '113-C');
INSERT INTO communities VALUES (8003, 3003, 6003, 4003, 103, 1003, 'Ciudad de las flores', '4', 10, '114-D');
INSERT INTO communities VALUES (8004, 3004, 6004, 4004, 104, 1004, 'Santa Esmeralda', '5', 20, '115-E');