--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Modelo logico.DM1
--
-- Date Created : Saturday, December 16, 2023 22:53:20
-- Target DBMS : MySQL 8.x
--

DROP TABLE IF EXISTS apartment;
DROP TABLE IF EXISTS bank_accounts;
DROP TABLE IF EXISTS bank_receipts;
DROP TABLE IF EXISTS banks;
DROP TABLE IF EXISTS bussiness_locals;
DROP TABLE IF EXISTS communities;
DROP TABLE IF EXISTS community_admins;
DROP TABLE IF EXISTS companies;
DROP TABLE IF EXISTS contact_infos;
DROP TABLE IF EXISTS offices;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS spends;
DROP TABLE IF EXISTS tentants;

-- 
-- TABLE: apartment 
--

CREATE TABLE apartment(
    id_propiedad            INT              AUTO_INCREMENT,
    id_propietario          INT              NOT NULL,
    community_id            INT              NOT NULL,
    admin_id                INT              NOT NULL,
    id_cuenta               INT              NOT NULL,
    bank_id                 INT              NOT NULL,
    id_persona              INT              NOT NULL,
    rooms_number            INT              NOT NULL,
    owner_account_number    VARCHAR(10),
    door_number             VARCHAR(10)      NOT NULL,
    floor_and_letter        VARCHAR(20)      NOT NULL,
    spends_percent          DECIMAL(5, 2)    NOT NULL,
    owners_bank_account     VARCHAR(20)      NOT NULL,
    PRIMARY KEY (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: bank_accounts 
--

CREATE TABLE bank_accounts(
    id_cuenta         INT            AUTO_INCREMENT,
    bank_id           INT            NOT NULL,
    id_persona        INT            NOT NULL,
    balance           FLOAT(8, 0)    NOT NULL,
    account_number    VARCHAR(10),
    agency_code       VARCHAR(10)    NOT NULL,
    control_code      CHAR(2)        NOT NULL,
    PRIMARY KEY (id_cuenta, bank_id, id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: bank_receipts 
--

CREATE TABLE bank_receipts(
    id_recibo         INT            AUTO_INCREMENT,
    id_cuenta         INT            NOT NULL,
    bank_id           INT            NOT NULL,
    id_persona        INT            NOT NULL,
    id_propietario    INT            NOT NULL,
    creation_date     DATE           NOT NULL,
    amount            FLOAT(8, 0)    NOT NULL,
    is_paid           BIT(1)         NOT NULL,
    PRIMARY KEY (id_recibo, id_cuenta, bank_id, id_persona, id_propietario)
)ENGINE=MYISAM
;



-- 
-- TABLE: banks 
--

CREATE TABLE banks(
    bank_id       INT            AUTO_INCREMENT,
    id_persona    INT            NOT NULL,
    bank_code     VARCHAR(10),
    bank_name     VARCHAR(60)    NOT NULL,
    PRIMARY KEY (bank_id, id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: bussiness_locals 
--

CREATE TABLE bussiness_locals(
    id_propiedad           INT              AUTO_INCREMENT,
    id_propietario         INT              NOT NULL,
    community_id           INT              NOT NULL,
    admin_id               INT              NOT NULL,
    id_cuenta              INT              NOT NULL,
    bank_id                INT              NOT NULL,
    id_persona             INT              NOT NULL,
    schedule               TEXT             NOT NULL,
    door_number            VARCHAR(10)      NOT NULL,
    bussiness_type         VARCHAR(40)      NOT NULL,
    floor_and_letter       VARCHAR(20)      NOT NULL,
    spends_percent         DECIMAL(5, 2)    NOT NULL,
    owners_bank_account    VARCHAR(20)      NOT NULL,
    PRIMARY KEY (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: communities 
--

CREATE TABLE communities(
    community_id      INT            AUTO_INCREMENT,
    admin_id          INT            NOT NULL,
    id_cuenta         INT            NOT NULL,
    bank_id           INT            NOT NULL,
    id_persona        INT            NOT NULL,
    id_presidente     INT            NOT NULL,
    community_name    VARCHAR(60)    NOT NULL,
    street            VARCHAR(5)     NOT NULL,
    population        INT            NOT NULL,
    zip_code          CHAR(5),
    PRIMARY KEY (community_id, admin_id, id_cuenta, bank_id, id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: community_admins 
--

CREATE TABLE community_admins(
    admin_id           INT            AUTO_INCREMENT,
    admin_full_name    VARCHAR(60)    NOT NULL,
    admin_dni          VARCHAR(18)    NOT NULL,
    college_number     VARCHAR(10)    NOT NULL,
    PRIMARY KEY (admin_id)
)ENGINE=MYISAM
;



-- 
-- TABLE: companies 
--

CREATE TABLE companies(
    id_empresa      INT             AUTO_INCREMENT,
    id_persona      INT             NOT NULL,
    nit             VARCHAR(18)     NOT NULL,
    company_name    VARCHAR(60)     NOT NULL,
    service         VARCHAR(60)     NOT NULL,
    phone_number    VARCHAR(15)     NOT NULL,
    address         VARCHAR(250)    NOT NULL,
    sector          VARCHAR(60)     NOT NULL,
    PRIMARY KEY (id_empresa, id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: contact_infos 
--

CREATE TABLE contact_infos(
    id_persona       INT            AUTO_INCREMENT,
    contact_name     VARCHAR(60)    NOT NULL,
    contact_phone    VARCHAR(15)    NOT NULL,
    PRIMARY KEY (id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: offices 
--

CREATE TABLE offices(
    id_propiedad           INT              AUTO_INCREMENT,
    id_propietario         INT              NOT NULL,
    community_id           INT              NOT NULL,
    admin_id               INT              NOT NULL,
    id_cuenta              INT              NOT NULL,
    bank_id                INT              NOT NULL,
    id_persona             INT              NOT NULL,
    owners_bank_account    VARCHAR(20)      NOT NULL,
    activity               VARCHAR(80)      NOT NULL,
    door_number            VARCHAR(10)      NOT NULL,
    floor_and_letter       VARCHAR(20)      NOT NULL,
    spends_percent         DECIMAL(5, 2)    NOT NULL,
    PRIMARY KEY (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
)ENGINE=MYISAM
;



-- 
-- TABLE: owners 
--

CREATE TABLE owners(
    id_propietario      INT             AUTO_INCREMENT,
    is_vocal            BIT(1)          NOT NULL,
    owners_firs_name    VARCHAR(60)     NOT NULL,
    owners_last_name    VARCHAR(60)     NOT NULL,
    owners_address      VARCHAR(250)    NOT NULL,
    owners_phone        VARCHAR(15)     NOT NULL,
    PRIMARY KEY (id_propietario)
)ENGINE=MYISAM
;



-- 
-- TABLE: spends 
--

CREATE TABLE spends(
    id_gasto          INT            AUTO_INCREMENT,
    community_id      INT            NOT NULL,
    admin_id          INT            NOT NULL,
    id_cuenta         INT            NOT NULL,
    bank_id           INT            NOT NULL,
    id_persona        INT            NOT NULL,
    id_empresa        INT            NOT NULL,
    amount            FLOAT(8, 0)    NOT NULL,
    receipt_date      DATE           NOT NULL,
    receipt_number    VARCHAR(10),
    PRIMARY KEY (id_gasto, community_id, admin_id, id_cuenta, bank_id, id_persona, id_empresa)
)ENGINE=MYISAM
;



-- 
-- TABLE: tentants 
--

CREATE TABLE tentants(
    id_inquilino          INT             AUTO_INCREMENT,
    tentant_first_name    VARCHAR(60)     NOT NULL,
    tentant_last_name     VARCHAR(60)     NOT NULL,
    tentant_address       VARCHAR(250)    NOT NULL,
    tentant_phone         VARCHAR(15)     NOT NULL,
    id_propiedad          INT,
    id_propietario        INT,
    community_id          INT,
    admin_id              INT,
    id_cuenta             INT,
    bank_id               INT,
    id_persona            INT,
    PRIMARY KEY (id_inquilino)
)ENGINE=MYISAM
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
    FOREIGN KEY (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
    REFERENCES bussiness_locals(id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
;


