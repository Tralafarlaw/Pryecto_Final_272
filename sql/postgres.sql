--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Modelo logico.DM1
--
-- Date Created : Saturday, December 16, 2023 22:52:31
-- Target DBMS : PostgreSQL 10.x-12.x
--

DROP TABLE apartment
;
DROP TABLE bank_accounts
;
DROP TABLE bank_receipts
;
DROP TABLE banks
;
DROP TABLE bussiness_locals
;
DROP TABLE communities
;
DROP TABLE community_admins
;
DROP TABLE companies
;
DROP TABLE contact_infos
;
DROP TABLE offices
;
DROP TABLE owners
;
DROP TABLE spends
;
DROP TABLE tentants
;
-- 
-- TABLE: apartment 
--

CREATE TABLE apartment(
    id_propiedad            integer          GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    id_propietario          integer          NOT NULL,
    community_id            integer          NOT NULL,
    admin_id                integer          NOT NULL,
    id_cuenta               integer          NOT NULL,
    bank_id                 integer          NOT NULL,
    id_persona              integer          NOT NULL,
    rooms_number            integer          NOT NULL,
    owner_account_number    varchar(10),
    door_number             varchar(10)      NOT NULL,
    floor_and_letter        varchar(20)      NOT NULL,
    spends_percent          decimal(5, 2)    NOT NULL,
    owners_bank_account     varchar(20)      NOT NULL,
    CONSTRAINT PK21_2 PRIMARY KEY (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
)
;



-- 
-- TABLE: bank_accounts 
--

CREATE TABLE bank_accounts(
    id_cuenta         integer         GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    bank_id           integer         NOT NULL,
    id_persona        integer         NOT NULL,
    balance           float4          NOT NULL,
    account_number    varchar(10),
    agency_code       varchar(10)     NOT NULL,
    control_code      character(2)    NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY (id_cuenta, bank_id, id_persona)
)
;



-- 
-- TABLE: bank_receipts 
--

CREATE TABLE bank_receipts(
    id_recibo         integer    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    id_cuenta         integer    NOT NULL,
    bank_id           integer    NOT NULL,
    id_persona        integer    NOT NULL,
    id_propietario    integer    NOT NULL,
    creation_date     date       NOT NULL,
    amount            float4     NOT NULL,
    is_paid           boolean    NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY (id_recibo, id_cuenta, bank_id, id_persona, id_propietario)
)
;



-- 
-- TABLE: banks 
--

CREATE TABLE banks(
    bank_id       integer        GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    id_persona    integer        NOT NULL,
    bank_code     varchar(10),
    bank_name     varchar(60)    NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY (bank_id, id_persona)
)
;



-- 
-- TABLE: bussiness_locals 
--

CREATE TABLE bussiness_locals(
    id_propiedad           integer          GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    id_propietario         integer          NOT NULL,
    community_id           integer          NOT NULL,
    admin_id               integer          NOT NULL,
    id_cuenta              integer          NOT NULL,
    bank_id                integer          NOT NULL,
    id_persona             integer          NOT NULL,
    schedule               text             NOT NULL,
    door_number            varchar(10)      NOT NULL,
    bussiness_type         varchar(40)      NOT NULL,
    floor_and_letter       varchar(20)      NOT NULL,
    spends_percent         decimal(5, 2)    NOT NULL,
    owners_bank_account    varchar(20)      NOT NULL,
    CONSTRAINT PK21_1 PRIMARY KEY (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
)
;



-- 
-- TABLE: communities 
--

CREATE TABLE communities(
    community_id      integer         GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    admin_id          integer         NOT NULL,
    id_presidente     integer         NOT NULL,
    id_cuenta         integer         NOT NULL,
    bank_id           integer         NOT NULL,
    id_persona        integer         NOT NULL,
    community_name    varchar(60)     NOT NULL,
    street            varchar(5)      NOT NULL,
    population        integer         NOT NULL,
    zip_code          character(5),
    CONSTRAINT community_pk PRIMARY KEY (community_id, admin_id, id_cuenta, bank_id, id_persona)
)
;



-- 
-- TABLE: community_admins 
--

CREATE TABLE community_admins(
    admin_id           integer        GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    admin_full_name    varchar(60)    NOT NULL,
    admin_dni          varchar(18)    NOT NULL,
    college_number     varchar(10)    NOT NULL,
    CONSTRAINT PK19 PRIMARY KEY (admin_id)
)
;



-- 
-- TABLE: companies 
--

CREATE TABLE companies(
    id_empresa      integer         GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    id_persona      integer         NOT NULL,
    nit             varchar(18)     NOT NULL,
    company_name    varchar(60)     NOT NULL,
    service         varchar(60)     NOT NULL,
    phone_number    varchar(15)     NOT NULL,
    address         varchar(250)    NOT NULL,
    sector          varchar(60)     NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY (id_empresa, id_persona)
)
;



-- 
-- TABLE: contact_infos 
--

CREATE TABLE contact_infos(
    id_persona       integer        GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    contact_name     varchar(60)    NOT NULL,
    contact_phone    varchar(15)    NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY (id_persona)
)
;



-- 
-- TABLE: offices 
--

CREATE TABLE offices(
    id_propiedad           integer          GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    id_propietario         integer          NOT NULL,
    community_id           integer          NOT NULL,
    admin_id               integer          NOT NULL,
    id_cuenta              integer          NOT NULL,
    bank_id                integer          NOT NULL,
    id_persona             integer          NOT NULL,
    owners_bank_account    varchar(20)      NOT NULL,
    activity               varchar(80)      NOT NULL,
    door_number            varchar(10)      NOT NULL,
    floor_and_letter       varchar(20)      NOT NULL,
    spends_percent         decimal(5, 2)    NOT NULL,
    CONSTRAINT PK21 PRIMARY KEY (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
)
;



-- 
-- TABLE: owners 
--

CREATE TABLE owners(
    id_propietario      integer         GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    is_vocal            boolean         NOT NULL,
    owners_firs_name    varchar(60)     NOT NULL,
    owners_last_name    varchar(60)     NOT NULL,
    owners_address      varchar(250)    NOT NULL,
    owners_phone        varchar(15)     NOT NULL,
    CONSTRAINT PK25 PRIMARY KEY (id_propietario)
)
;



-- 
-- TABLE: spends 
--

CREATE TABLE spends(
    id_gasto          integer        GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    community_id      integer        NOT NULL,
    admin_id          integer        NOT NULL,
    id_cuenta         integer        NOT NULL,
    bank_id           integer        NOT NULL,
    id_persona        integer        NOT NULL,
    id_empresa        integer        NOT NULL,
    amount            float4         NOT NULL,
    receipt_date      date           NOT NULL,
    receipt_number    varchar(10),
    CONSTRAINT PK17 PRIMARY KEY (id_gasto, community_id, admin_id, id_cuenta, bank_id, id_persona, id_empresa)
)
;



-- 
-- TABLE: tentants 
--

CREATE TABLE tentants(
    id_inquilino          integer         GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    tentant_first_name    varchar(60)     NOT NULL,
    tentant_last_name     varchar(60)     NOT NULL,
    tentant_address       varchar(250)    NOT NULL,
    tentant_phone         varchar(15)     NOT NULL,
    id_propiedad          integer,
    id_propietario        integer,
    community_id          integer,
    admin_id              integer,
    id_cuenta             integer,
    bank_id               integer,
    id_persona            integer,
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


