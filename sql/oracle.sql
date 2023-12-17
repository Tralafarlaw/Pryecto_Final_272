--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Modelo logico.DM1
--
-- Date Created : Saturday, December 16, 2023 22:52:57
-- Target DBMS : Oracle 19c
--

DROP TABLE apartment CASCADE CONSTRAINTS
;
DROP TABLE bank_accounts CASCADE CONSTRAINTS
;
DROP TABLE bank_receipts CASCADE CONSTRAINTS
;
DROP TABLE banks CASCADE CONSTRAINTS
;
DROP TABLE bussiness_locals CASCADE CONSTRAINTS
;
DROP TABLE communities CASCADE CONSTRAINTS
;
DROP TABLE community_admins CASCADE CONSTRAINTS
;
DROP TABLE companies CASCADE CONSTRAINTS
;
DROP TABLE contact_infos CASCADE CONSTRAINTS
;
DROP TABLE offices CASCADE CONSTRAINTS
;
DROP TABLE owners CASCADE CONSTRAINTS
;
DROP TABLE spends CASCADE CONSTRAINTS
;
DROP TABLE tentants CASCADE CONSTRAINTS
;
-- 
-- TABLE: apartment 
--

CREATE TABLE apartment(
    id_propiedad            NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    id_propietario          NUMBER(38, 0)    NOT NULL,
    community_id            NUMBER(38, 0)    NOT NULL,
    admin_id                NUMBER(38, 0)    NOT NULL,
    id_cuenta               NUMBER(38, 0)    NOT NULL,
    bank_id                 NUMBER(38, 0)    NOT NULL,
    id_persona              NUMBER(38, 0)    NOT NULL,
    rooms_number            NUMBER(38, 0)    NOT NULL,
    owner_account_number    VARCHAR2(10),
    door_number             VARCHAR2(10)     NOT NULL,
    floor_and_letter        VARCHAR2(20)     NOT NULL,
    spends_percent          NUMBER(5, 2)     NOT NULL,
    owners_bank_account     VARCHAR2(20)     NOT NULL,
    CONSTRAINT PK21_2 PRIMARY KEY (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
)
;



-- 
-- TABLE: bank_accounts 
--

CREATE TABLE bank_accounts(
    id_cuenta         NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    bank_id           NUMBER(38, 0)    NOT NULL,
    id_persona        NUMBER(38, 0)    NOT NULL,
    balance           BINARY_FLOAT     NOT NULL,
    account_number    VARCHAR2(10),
    agency_code       VARCHAR2(10)     NOT NULL,
    control_code      CHAR(2)          NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY (id_cuenta, bank_id, id_persona)
)
;



-- 
-- TABLE: bank_receipts 
--

CREATE TABLE bank_receipts(
    id_recibo         NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    id_cuenta         NUMBER(38, 0)    NOT NULL,
    bank_id           NUMBER(38, 0)    NOT NULL,
    id_persona        NUMBER(38, 0)    NOT NULL,
    id_propietario    NUMBER(38, 0)    NOT NULL,
    creation_date     DATE             NOT NULL,
    amount            BINARY_FLOAT     NOT NULL,
    is_paid           NUMBER(1, 0)     NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY (id_recibo, id_cuenta, bank_id, id_persona, id_propietario)
)
;



-- 
-- TABLE: banks 
--

CREATE TABLE banks(
    bank_id       NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    id_persona    NUMBER(38, 0)    NOT NULL,
    bank_code     VARCHAR2(10),
    bank_name     VARCHAR2(60)     NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY (bank_id, id_persona)
)
;



-- 
-- TABLE: bussiness_locals 
--

CREATE TABLE bussiness_locals(
    id_propiedad           NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    id_propietario         NUMBER(38, 0)    NOT NULL,
    community_id           NUMBER(38, 0)    NOT NULL,
    admin_id               NUMBER(38, 0)    NOT NULL,
    id_cuenta              NUMBER(38, 0)    NOT NULL,
    bank_id                NUMBER(38, 0)    NOT NULL,
    id_persona             NUMBER(38, 0)    NOT NULL,
    schedule               CLOB             NOT NULL,
    door_number            VARCHAR2(10)     NOT NULL,
    bussiness_type         VARCHAR2(40)     NOT NULL,
    floor_and_letter       VARCHAR2(20)     NOT NULL,
    spends_percent         NUMBER(5, 2)     NOT NULL,
    owners_bank_account    VARCHAR2(20)     NOT NULL,
    CONSTRAINT PK21_1 PRIMARY KEY (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
)
;



-- 
-- TABLE: communities 
--

CREATE TABLE communities(
    community_id      NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    admin_id          NUMBER(38, 0)    NOT NULL,
    id_presidente     NUMBER(38, 0)    NOT NULL,
    id_cuenta         NUMBER(38, 0)    NOT NULL,
    bank_id           NUMBER(38, 0)    NOT NULL,
    id_persona        NUMBER(38, 0)    NOT NULL,
    community_name    VARCHAR2(60)     NOT NULL,
    street            VARCHAR2(5)      NOT NULL,
    population        NUMBER(38, 0)    NOT NULL,
    zip_code          CHAR(5),
    CONSTRAINT community_pk PRIMARY KEY (community_id, admin_id, id_cuenta, bank_id, id_persona)
)
;



-- 
-- TABLE: community_admins 
--

CREATE TABLE community_admins(
    admin_id           NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    admin_full_name    VARCHAR2(60)     NOT NULL,
    admin_dni          VARCHAR2(18)     NOT NULL,
    college_number     VARCHAR2(10)     NOT NULL,
    CONSTRAINT PK19 PRIMARY KEY (admin_id)
)
;



-- 
-- TABLE: companies 
--

CREATE TABLE companies(
    id_empresa      NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    id_persona      NUMBER(38, 0)    NOT NULL,
    nit             VARCHAR2(18)     NOT NULL,
    company_name    VARCHAR2(60)     NOT NULL,
    service         VARCHAR2(60)     NOT NULL,
    phone_number    VARCHAR2(15)     NOT NULL,
    address         VARCHAR2(250)    NOT NULL,
    sector          VARCHAR2(60)     NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY (id_empresa, id_persona)
)
;



-- 
-- TABLE: contact_infos 
--

CREATE TABLE contact_infos(
    id_persona       NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    contact_name     VARCHAR2(60)     NOT NULL,
    contact_phone    VARCHAR2(15)     NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY (id_persona)
)
;



-- 
-- TABLE: offices 
--

CREATE TABLE offices(
    id_propiedad           NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    id_propietario         NUMBER(38, 0)    NOT NULL,
    community_id           NUMBER(38, 0)    NOT NULL,
    admin_id               NUMBER(38, 0)    NOT NULL,
    id_cuenta              NUMBER(38, 0)    NOT NULL,
    bank_id                NUMBER(38, 0)    NOT NULL,
    id_persona             NUMBER(38, 0)    NOT NULL,
    owners_bank_account    VARCHAR2(20)     NOT NULL,
    activity               VARCHAR2(80)     NOT NULL,
    door_number            VARCHAR2(10)     NOT NULL,
    floor_and_letter       VARCHAR2(20)     NOT NULL,
    spends_percent         NUMBER(5, 2)     NOT NULL,
    CONSTRAINT PK21 PRIMARY KEY (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
)
;



-- 
-- TABLE: owners 
--

CREATE TABLE owners(
    id_propietario      NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    is_vocal            NUMBER(1, 0)     NOT NULL,
    owners_firs_name    VARCHAR2(60)     NOT NULL,
    owners_last_name    VARCHAR2(60)     NOT NULL,
    owners_address      VARCHAR2(250)    NOT NULL,
    owners_phone        VARCHAR2(15)     NOT NULL,
    CONSTRAINT PK25 PRIMARY KEY (id_propietario)
)
;



-- 
-- TABLE: spends 
--

CREATE TABLE spends(
    id_gasto          NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    community_id      NUMBER(38, 0)    NOT NULL,
    admin_id          NUMBER(38, 0)    NOT NULL,
    id_cuenta         NUMBER(38, 0)    NOT NULL,
    bank_id           NUMBER(38, 0)    NOT NULL,
    id_persona        NUMBER(38, 0)    NOT NULL,
    id_empresa        NUMBER(38, 0)    NOT NULL,
    amount            BINARY_FLOAT     NOT NULL,
    receipt_date      DATE             NOT NULL,
    receipt_number    VARCHAR2(10),
    CONSTRAINT PK17 PRIMARY KEY (id_gasto, community_id, admin_id, id_cuenta, bank_id, id_persona, id_empresa)
)
;



-- 
-- TABLE: tentants 
--

CREATE TABLE tentants(
    id_inquilino          NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    tentant_first_name    VARCHAR2(60)     NOT NULL,
    tentant_last_name     VARCHAR2(60)     NOT NULL,
    tentant_address       VARCHAR2(250)    NOT NULL,
    tentant_phone         VARCHAR2(15)     NOT NULL,
    id_propiedad          NUMBER(38, 0),
    id_propietario        NUMBER(38, 0),
    community_id          NUMBER(38, 0),
    admin_id              NUMBER(38, 0),
    id_cuenta             NUMBER(38, 0),
    bank_id               NUMBER(38, 0),
    id_persona            NUMBER(38, 0),
    CONSTRAINT PK26 PRIMARY KEY (id_inquilino)
)
;



-- 
-- TABLE: apartment 
--

ALTER TABLE apartment ADD CONSTRAINT Refcommunities331 
    FOREIGN KEY (community_id, admin_id, id_cuenta, bank_id, id_persona)
    REFERENCES communities(community_id, admin_id, id_cuenta, bank_id, id_persona)
;

ALTER TABLE apartment ADD CONSTRAINT Refowners201 
    FOREIGN KEY (id_propietario)
    REFERENCES owners(id_propietario)
;


-- 
-- TABLE: bank_accounts 
--

ALTER TABLE bank_accounts ADD CONSTRAINT Refbanks31 
    FOREIGN KEY (bank_id, id_persona)
    REFERENCES banks(bank_id, id_persona)
;


-- 
-- TABLE: bank_receipts 
--

ALTER TABLE bank_receipts ADD CONSTRAINT Refbank_accounts441 
    FOREIGN KEY (id_cuenta, bank_id, id_persona)
    REFERENCES bank_accounts(id_cuenta, bank_id, id_persona)
;

ALTER TABLE bank_receipts ADD CONSTRAINT Refowners491 
    FOREIGN KEY (id_propietario)
    REFERENCES owners(id_propietario)
;


-- 
-- TABLE: banks 
--

ALTER TABLE banks ADD CONSTRAINT Refcontact_infos381 
    FOREIGN KEY (id_persona)
    REFERENCES contact_infos(id_persona)
;


-- 
-- TABLE: bussiness_locals 
--

ALTER TABLE bussiness_locals ADD CONSTRAINT Refcommunities321 
    FOREIGN KEY (community_id, admin_id, id_cuenta, bank_id, id_persona)
    REFERENCES communities(community_id, admin_id, id_cuenta, bank_id, id_persona)
;

ALTER TABLE bussiness_locals ADD CONSTRAINT Refowners191 
    FOREIGN KEY (id_propietario)
    REFERENCES owners(id_propietario)
;


-- 
-- TABLE: communities 
--

ALTER TABLE communities ADD CONSTRAINT Refowners301 
    FOREIGN KEY (id_presidente)
    REFERENCES owners(id_propietario)
;

ALTER TABLE communities ADD CONSTRAINT Refcommunity_admins421 
    FOREIGN KEY (admin_id)
    REFERENCES community_admins(admin_id)
;

ALTER TABLE communities ADD CONSTRAINT Refbank_accounts431 
    FOREIGN KEY (id_cuenta, bank_id, id_persona)
    REFERENCES bank_accounts(id_cuenta, bank_id, id_persona)
;


-- 
-- TABLE: companies 
--

ALTER TABLE companies ADD CONSTRAINT Refcontact_infos401 
    FOREIGN KEY (id_persona)
    REFERENCES contact_infos(id_persona)
;


-- 
-- TABLE: offices 
--

ALTER TABLE offices ADD CONSTRAINT Refcommunities311 
    FOREIGN KEY (community_id, admin_id, id_cuenta, bank_id, id_persona)
    REFERENCES communities(community_id, admin_id, id_cuenta, bank_id, id_persona)
;

ALTER TABLE offices ADD CONSTRAINT Refowners181 
    FOREIGN KEY (id_propietario)
    REFERENCES owners(id_propietario)
;


-- 
-- TABLE: spends 
--

ALTER TABLE spends ADD CONSTRAINT Refcommunities361 
    FOREIGN KEY (community_id, admin_id, id_cuenta, bank_id, id_persona)
    REFERENCES communities(community_id, admin_id, id_cuenta, bank_id, id_persona)
;

ALTER TABLE spends ADD CONSTRAINT Refcompanies41 
    FOREIGN KEY (id_empresa, id_persona)
    REFERENCES companies(id_empresa, id_persona)
;


-- 
-- TABLE: tentants 
--

ALTER TABLE tentants ADD CONSTRAINT Refapartment451 
    FOREIGN KEY (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
    REFERENCES apartment(id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
;

ALTER TABLE tentants ADD CONSTRAINT Refoffices461 
    FOREIGN KEY (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
    REFERENCES offices(id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
;

ALTER TABLE tentants ADD CONSTRAINT Refbussiness_locals471 
    FOREIGN KEY (id_propiedad, id_propietario, community_id, admin_id, bank_id, id_persona)
    REFERENCES bussiness_locals(id_propiedad, id_propietario, community_id, admin_id, bank_id, id_persona)
;


