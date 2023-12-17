-- Para la tabla 'contact_infos'
INSERT INTO contact_infos VALUES (DEFAULT, 'Pedro Choque', '2581892');
INSERT INTO contact_infos VALUES (DEFAULT, 'Juan Quiroga', '2886830');
INSERT INTO contact_infos VALUES (DEFAULT, 'Ana Martinez', '2722170');
INSERT INTO contact_infos VALUES (DEFAULT, 'Jose Luis Perales', '2064501');
INSERT INTO contact_infos VALUES (DEFAULT, 'Aldo Perez', '2788009');
INSERT INTO contact_infos VALUES (DEFAULT, 'Antonio Paredez', '2468746');
INSERT INTO contact_infos VALUES (DEFAULT, 'Manuela Calderon', '2863455');
INSERT INTO contact_infos VALUES (DEFAULT, 'Daniela Zambrana', '2135594');
INSERT INTO contact_infos VALUES (DEFAULT, 'Francisco Javier Paredes', '2535934');
INSERT INTO contact_infos VALUES (DEFAULT, 'Raul Colque', '2683068');
INSERT INTO contact_infos VALUES (DEFAULT, 'Andres Chambi', '2654304');
INSERT INTO contact_infos VALUES (DEFAULT, 'Maria Jose Copa', '2785763');
INSERT INTO contact_infos VALUES (DEFAULT, 'Cesar Aguayo', '2723454');
INSERT INTO contact_infos VALUES (DEFAULT, 'Sebastian Ticona', '2803692');
INSERT INTO contact_infos VALUES (DEFAULT, 'Juan Coca', '2572023');
INSERT INTO contact_infos VALUES (DEFAULT, 'Rosa Jimenez', '2059343');
INSERT INTO contact_infos VALUES (DEFAULT, 'Sara Quisbert', '2434736');
INSERT INTO contact_infos VALUES (DEFAULT, 'Encarnacion Marca', '2174170');
INSERT INTO contact_infos VALUES (DEFAULT, 'Juan Aguayo', '2197448');
INSERT INTO contact_infos VALUES (DEFAULT, 'Olga Cossio', '2321878');

-- Para la tabla 'banks'
INSERT INTO banks VALUES (DEFAULT, 1, '123A', 'Banco Visa');
INSERT INTO banks VALUES (DEFAULT, 2, '123B', 'Banco Sol');
INSERT INTO banks VALUES (DEFAULT, 3, '123C', 'Banco Ganadero');
INSERT INTO banks VALUES (DEFAULT, 4, '123D', 'Ecofuturo');
INSERT INTO banks VALUES (DEFAULT, 5, '123E', 'Banco Fassil');
INSERT INTO banks VALUES (DEFAULT, 6, '123F', 'BNB');
INSERT INTO banks VALUES (DEFAULT, 7, '123G', 'La sagrada familia');
INSERT INTO banks VALUES (DEFAULT, 8, '123H', 'Fortaleza');
INSERT INTO banks VALUES (DEFAULT, 9, '123I', 'BCP');
INSERT INTO banks VALUES (DEFAULT, 10, '123J', 'FIE');
INSERT INTO banks VALUES (DEFAULT, 11, '123K', 'Banco Central');


-- Para la tabla 'companies'
INSERT INTO companies VALUES (DEFAULT, 1, '123-asd', 'San luis', 'Gestion administrativa', '2487539', 'av.montes', 'Centro urbano');
INSERT INTO companies VALUES (DEFAULT, 2, '123-ser', 'Nueva Esperanza', 'Manejo de Documentacion', '2487540', 'av.camacho', 'Zona Residencial');
INSERT INTO companies VALUES (DEFAULT, 3, '456-tyu', 'La francesa', 'Elaboracion de contratos', '2487541', 'periferica', 'Area Industrial');
INSERT INTO companies VALUES (DEFAULT, 4, '963-edc', 'La española', 'Mantenimiento de propiedades', '2487542', 'ciudad satelite', 'Area Rural');
INSERT INTO companies VALUES (DEFAULT, 5, '159-jkl', 'Nuevo amanecer', 'Gestion de presupuesto', '2487543', 'La portada', 'Parque o Industria');
INSERT INTO companies VALUES (DEFAULT, 6, '152-fgb', 'Urubo', 'Asesoria legal', '2487544', 'La ceja', 'Ciudad satelite');
INSERT INTO companies VALUES (DEFAULT, 7, '789-scd', 'Entel', 'Servicios de seguridad', '2487545', 'Garita', 'Distrito financiero');
INSERT INTO companies VALUES (DEFAULT, 8, '120-ert', 'Tigo', 'Gestion de condominios', '2487546', 'Max Paredes', 'Zona comercial');
INSERT INTO companies VALUES (DEFAULT, 9, '947-iop', 'R.F.A', 'Servicios tecnologicos', '2487547', 'Kollasuyo', 'Suburbios');


-- Para la tabla 'bank_accounts'
INSERT INTO bank_accounts VALUES (DEFAULT, 1, 1, 1000, '123456', 'AAA-1', '1');
INSERT INTO bank_accounts VALUES (DEFAULT, 2, 2, 2000, '123457', 'AAA-2', '2');
INSERT INTO bank_accounts VALUES (DEFAULT, 3, 3, 1000, '123458', 'AAA-1', '3');
INSERT INTO bank_accounts VALUES (DEFAULT, 4, 4, 5000, '123459', 'AAA-2', '4');
INSERT INTO bank_accounts VALUES (DEFAULT, 5, 5, 80000, '123460', 'AAA-3', '5');
INSERT INTO bank_accounts VALUES (DEFAULT, 6, 6, 1500, '123461', 'AAA-4', '6');
INSERT INTO bank_accounts VALUES (DEFAULT, 7, 7, 2600, '123462', 'AAA-5', '7');
INSERT INTO bank_accounts VALUES (DEFAULT, 8, 8, 12000, '123463', 'AAA-6', '8');
INSERT INTO bank_accounts VALUES (DEFAULT, 9, 9, 15000, '123464', 'AAA-7', '9');
INSERT INTO bank_accounts VALUES (DEFAULT, 10, 10, 8000, '123465', 'AAA-8', '10');
INSERT INTO bank_accounts VALUES (DEFAULT, 11, 11, 1500, '123466', 'AAA-9', '11');

-- Para la tabla 'community_admins'
INSERT INTO community_admins VALUES (DEFAULT, 'Leonardo Molina Sánchez', 9994561, 1);
INSERT INTO community_admins VALUES (DEFAULT, 'Valentina Herrera Castro', 9875489, 2);
INSERT INTO community_admins VALUES (DEFAULT, 'Martín Rojas Vargas', 7894586, 3);
INSERT INTO community_admins VALUES (DEFAULT, 'Isabella Castro Medina', 24578, 4);
INSERT INTO community_admins VALUES (DEFAULT, 'Sebastián Torres Salgado', 9325478, 5);

-- Para la tabla 'owners'
INSERT INTO owners VALUES (DEFAULT, true, 'Pedro', 'Pereira', 'Zona sur', '2801475');
INSERT INTO owners VALUES (DEFAULT, true, 'Jose', 'Mamani', 'obrajes', '2801476');
INSERT INTO owners VALUES (DEFAULT, true, 'Juan', 'Francisco', 'Calacoto', '2801477');
INSERT INTO owners VALUES (DEFAULT, false, 'Fernando', 'Fernandez', 'Chasquipampa', '2801478');
INSERT INTO owners VALUES (DEFAULT, false, 'Juoaquin', 'Botero', 'San miguel', '2801479');
INSERT INTO owners VALUES (DEFAULT, false, 'Marcelo', 'Triverio', 'Achumani', '2801480');






-- Para la tabla 'bank_receipts'
INSERT INTO bank_receipts VALUES (DEFAULT, 1, 1, 1, 1, TO_DATE('10/10/2000', 'DD/MM/YYYY'), 1000, true);
INSERT INTO bank_receipts VALUES (DEFAULT, 2, 2, 2, 2, TO_DATE('12/07/1999', 'DD/MM/YYYY'), 2000, true);
INSERT INTO bank_receipts VALUES (DEFAULT, 3, 3, 3, 3, TO_DATE('12/04/2005', 'DD/MM/YYYY'), 3000, true);
INSERT INTO bank_receipts VALUES (DEFAULT, 4, 4, 4, 4, TO_DATE('11/08/2000', 'DD/MM/YYYY'), 1000, true);
INSERT INTO bank_receipts VALUES (DEFAULT, 5, 5, 5, 5, TO_DATE('01/09/2010', 'DD/MM/YYYY'), 2500, true);
INSERT INTO bank_receipts VALUES (DEFAULT, 6, 6, 6, 1, TO_DATE('02/03/2003', 'DD/MM/YYYY'), 3000, false );
INSERT INTO bank_receipts VALUES (DEFAULT, 7, 7, 7, 2, TO_DATE('20/02/2008', 'DD/MM/YYYY'), 2900, false );
INSERT INTO bank_receipts VALUES (DEFAULT, 8, 8, 8, 3, TO_DATE('26/08/2015', 'DD/MM/YYYY'), 1500, false );
INSERT INTO bank_receipts VALUES (DEFAULT, 9, 9, 9, 4, TO_DATE('11/12/2014', 'DD/MM/YYYY'), 2000, false );
INSERT INTO bank_receipts VALUES (DEFAULT, 10, 10, 10, 5, TO_DATE('06/04/2005', 'DD/MM/YYYY'), 1000, false );
INSERT INTO bank_receipts VALUES (DEFAULT, 11, 11, 11, 1, TO_DATE('30/03/1995', 'DD/MM/YYYY'), 1200, true);

-- Para la tabla 'communities'
INSERT INTO communities VALUES (DEFAULT, 005, 005, 005, 05, 005, 'Santa Rosa', '1', 50, '111-A');
INSERT INTO communities VALUES (DEFAULT, 001, 001, 001, 01, 001, 'Monte Verde', '2', 70, '112-B');
INSERT INTO communities VALUES (DEFAULT, 002, 002, 002, 02, 002, 'Rio Azul', '3', 30, '113-C');
INSERT INTO communities VALUES (DEFAULT, 003, 003, 003, 03, 003, 'Ciudad de las flores', '4', 10, '114-D');
INSERT INTO communities VALUES (DEFAULT, 004, 004, 004, 04, 004, 'Santa Esmeralda', '5', 20, '115-E');