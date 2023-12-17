/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Modelo logico.DM1
 *
 * Date Created : Saturday, December 16, 2023 22:52:02
 * Target DBMS : Microsoft SQL Server 2019
 */

IF OBJECT_ID('apartment') IS NOT NULL
BEGIN
    DROP TABLE apartment
    PRINT '<<< DROPPED TABLE apartment >>>'
END
go
IF OBJECT_ID('bank_accounts') IS NOT NULL
BEGIN
    DROP TABLE bank_accounts
    PRINT '<<< DROPPED TABLE bank_accounts >>>'
END
go
IF OBJECT_ID('bank_receipts') IS NOT NULL
BEGIN
    DROP TABLE bank_receipts
    PRINT '<<< DROPPED TABLE bank_receipts >>>'
END
go
IF OBJECT_ID('banks') IS NOT NULL
BEGIN
    DROP TABLE banks
    PRINT '<<< DROPPED TABLE banks >>>'
END
go
IF OBJECT_ID('bussiness_locals') IS NOT NULL
BEGIN
    DROP TABLE bussiness_locals
    PRINT '<<< DROPPED TABLE bussiness_locals >>>'
END
go
IF OBJECT_ID('communities') IS NOT NULL
BEGIN
    DROP TABLE communities
    PRINT '<<< DROPPED TABLE communities >>>'
END
go
IF OBJECT_ID('community_admins') IS NOT NULL
BEGIN
    DROP TABLE community_admins
    PRINT '<<< DROPPED TABLE community_admins >>>'
END
go
IF OBJECT_ID('companies') IS NOT NULL
BEGIN
    DROP TABLE companies
    PRINT '<<< DROPPED TABLE companies >>>'
END
go
IF OBJECT_ID('contact_infos') IS NOT NULL
BEGIN
    DROP TABLE contact_infos
    PRINT '<<< DROPPED TABLE contact_infos >>>'
END
go
IF OBJECT_ID('offices') IS NOT NULL
BEGIN
    DROP TABLE offices
    PRINT '<<< DROPPED TABLE offices >>>'
END
go
IF OBJECT_ID('owners') IS NOT NULL
BEGIN
    DROP TABLE owners
    PRINT '<<< DROPPED TABLE owners >>>'
END
go
IF OBJECT_ID('spends') IS NOT NULL
BEGIN
    DROP TABLE spends
    PRINT '<<< DROPPED TABLE spends >>>'
END
go
IF OBJECT_ID('tentants') IS NOT NULL
BEGIN
    DROP TABLE tentants
    PRINT '<<< DROPPED TABLE tentants >>>'
END
go
/* 
 * TABLE: apartment 
 */

CREATE TABLE apartment(
    id_propiedad            int              IDENTITY(1,1),
    id_propietario          int              NOT NULL,
    community_id            int              NOT NULL,
    admin_id                int              NOT NULL,
    id_cuenta               int              NOT NULL,
    bank_id                 int              NOT NULL,
    id_persona              int              NOT NULL,
    rooms_number            int              NOT NULL,
    owner_account_number    varchar(10)      NULL,
    door_number             varchar(10)      NOT NULL,
    floor_and_letter        varchar(20)      NOT NULL,
    spends_percent          decimal(5, 2)    NOT NULL,
    owners_bank_account     varchar(20)      NOT NULL,
    CONSTRAINT PK21_2 PRIMARY KEY NONCLUSTERED (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
)

go


IF OBJECT_ID('apartment') IS NOT NULL
    PRINT '<<< CREATED TABLE apartment >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE apartment >>>'
go

/* 
 * TABLE: bank_accounts 
 */

CREATE TABLE bank_accounts(
    id_cuenta         int            IDENTITY(1,1),
    bank_id           int            NOT NULL,
    id_persona        int            NOT NULL,
    balance           float          NOT NULL,
    account_number    varchar(10)    NULL,
    agency_code       varchar(10)    NOT NULL,
    control_code      char(2)        NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY NONCLUSTERED (id_cuenta, bank_id, id_persona)
)

go


IF OBJECT_ID('bank_accounts') IS NOT NULL
    PRINT '<<< CREATED TABLE bank_accounts >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE bank_accounts >>>'
go

/* 
 * TABLE: bank_receipts 
 */

CREATE TABLE bank_receipts(
    id_recibo         int      IDENTITY(1,1),
    id_cuenta         int      NOT NULL,
    bank_id           int      NOT NULL,
    id_persona        int      NOT NULL,
    id_propietario    int      NOT NULL,
    creation_date     date     NOT NULL,
    amount            float    NOT NULL,
    is_paid           bit      NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY NONCLUSTERED (id_recibo, id_cuenta, bank_id, id_persona, id_propietario)
)

go


IF OBJECT_ID('bank_receipts') IS NOT NULL
    PRINT '<<< CREATED TABLE bank_receipts >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE bank_receipts >>>'
go

/* 
 * TABLE: banks 
 */

CREATE TABLE banks(
    bank_id       int            IDENTITY(1,1),
    id_persona    int            NOT NULL,
    bank_code     varchar(10)    NULL,
    bank_name     varchar(60)    NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (bank_id, id_persona)
)

go


IF OBJECT_ID('banks') IS NOT NULL
    PRINT '<<< CREATED TABLE banks >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE banks >>>'
go

/* 
 * TABLE: bussiness_locals 
 */

CREATE TABLE bussiness_locals(
    id_propiedad           int              IDENTITY(1,1),
    id_propietario         int              NOT NULL,
    community_id           int              NOT NULL,
    admin_id               int              NOT NULL,
    id_cuenta              int              NOT NULL,
    bank_id                int              NOT NULL,
    id_persona             int              NOT NULL,
    schedule               text             NOT NULL,
    door_number            varchar(10)      NOT NULL,
    bussiness_type         varchar(40)      NOT NULL,
    floor_and_letter       varchar(20)      NOT NULL,
    spends_percent         decimal(5, 2)    NOT NULL,
    owners_bank_account    varchar(20)      NOT NULL,
    CONSTRAINT PK21_1 PRIMARY KEY NONCLUSTERED (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
)

go


IF OBJECT_ID('bussiness_locals') IS NOT NULL
    PRINT '<<< CREATED TABLE bussiness_locals >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE bussiness_locals >>>'
go

/* 
 * TABLE: communities 
 */

CREATE TABLE communities(
    community_id      int            IDENTITY(1,1),
    admin_id          int            NOT NULL,
    id_presidente     int            NOT NULL,
    id_cuenta         int            NOT NULL,
    bank_id           int            NOT NULL,
    id_persona        int            NOT NULL,
    community_name    varchar(60)    NOT NULL,
    street            varchar(5)     NOT NULL,
    population        int            NOT NULL,
    zip_code          char(5)        NULL,
    CONSTRAINT community_pk PRIMARY KEY NONCLUSTERED (community_id, admin_id, id_cuenta, bank_id, id_persona)
)

go


IF OBJECT_ID('communities') IS NOT NULL
    PRINT '<<< CREATED TABLE communities >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE communities >>>'
go

/* 
 * TABLE: community_admins 
 */

CREATE TABLE community_admins(
    admin_id           int            IDENTITY(1,1),
    admin_full_name    varchar(60)    NOT NULL,
    admin_dni          varchar(18)    NOT NULL,
    college_number     varchar(10)    NOT NULL,
    CONSTRAINT PK19 PRIMARY KEY NONCLUSTERED (admin_id)
)

go


IF OBJECT_ID('community_admins') IS NOT NULL
    PRINT '<<< CREATED TABLE community_admins >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE community_admins >>>'
go

/* 
 * TABLE: companies 
 */

CREATE TABLE companies(
    id_empresa      int             IDENTITY(1,1),
    id_persona      int             NOT NULL,
    nit             varchar(18)     NOT NULL,
    company_name    varchar(60)     NOT NULL,
    service         varchar(60)     NOT NULL,
    phone_number    varchar(15)     NOT NULL,
    address         varchar(250)    NOT NULL,
    sector          varchar(60)     NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY NONCLUSTERED (id_empresa, id_persona)
)

go


IF OBJECT_ID('companies') IS NOT NULL
    PRINT '<<< CREATED TABLE companies >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE companies >>>'
go

/* 
 * TABLE: contact_infos 
 */

CREATE TABLE contact_infos(
    id_persona       int            IDENTITY(1,1),
    contact_name     varchar(60)    NOT NULL,
    contact_phone    varchar(15)    NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (id_persona)
)

go


IF OBJECT_ID('contact_infos') IS NOT NULL
    PRINT '<<< CREATED TABLE contact_infos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE contact_infos >>>'
go

/* 
 * TABLE: offices 
 */

CREATE TABLE offices(
    id_propiedad           int              IDENTITY(1,1),
    id_propietario         int              NOT NULL,
    community_id           int              NOT NULL,
    admin_id               int              NOT NULL,
    id_cuenta              int              NOT NULL,
    bank_id                int              NOT NULL,
    id_persona             int              NOT NULL,
    owners_bank_account    varchar(20)      NOT NULL,
    activity               varchar(80)      NOT NULL,
    door_number            varchar(10)      NOT NULL,
    floor_and_letter       varchar(20)      NOT NULL,
    spends_percent         decimal(5, 2)    NOT NULL,
    CONSTRAINT PK21 PRIMARY KEY NONCLUSTERED (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
)

go


IF OBJECT_ID('offices') IS NOT NULL
    PRINT '<<< CREATED TABLE offices >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE offices >>>'
go

/* 
 * TABLE: owners 
 */

CREATE TABLE owners(
    id_propietario      int             IDENTITY(1,1),
    is_vocal            bit             NOT NULL,
    owners_firs_name    varchar(60)     NOT NULL,
    owners_last_name    varchar(60)     NOT NULL,
    owners_address      varchar(250)    NOT NULL,
    owners_phone        varchar(15)     NOT NULL,
    CONSTRAINT PK25 PRIMARY KEY NONCLUSTERED (id_propietario)
)

go


IF OBJECT_ID('owners') IS NOT NULL
    PRINT '<<< CREATED TABLE owners >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE owners >>>'
go

/* 
 * TABLE: spends 
 */

CREATE TABLE spends(
    id_gasto          int            IDENTITY(1,1),
    community_id      int            NOT NULL,
    admin_id          int            NOT NULL,
    id_cuenta         int            NOT NULL,
    bank_id           int            NOT NULL,
    id_persona        int            NOT NULL,
    id_empresa        int            NOT NULL,
    amount            float          NOT NULL,
    receipt_date      date           NOT NULL,
    receipt_number    varchar(10)    NULL,
    CONSTRAINT PK17 PRIMARY KEY NONCLUSTERED (id_gasto, community_id, admin_id, id_cuenta, bank_id, id_persona, id_empresa)
)

go


IF OBJECT_ID('spends') IS NOT NULL
    PRINT '<<< CREATED TABLE spends >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE spends >>>'
go

/* 
 * TABLE: tentants 
 */

CREATE TABLE tentants(
    id_inquilino          int             IDENTITY(1,1),
    tentant_first_name    varchar(60)     NOT NULL,
    tentant_last_name     varchar(60)     NOT NULL,
    tentant_address       varchar(250)    NOT NULL,
    tentant_phone         varchar(15)     NOT NULL,
    id_propiedad          int             NULL,
    id_propietario        int             NULL,
    community_id          int             NULL,
    admin_id              int             NULL,
    id_cuenta             int             NULL,
    bank_id               int             NULL,
    id_persona            int             NULL,
    CONSTRAINT PK26 PRIMARY KEY NONCLUSTERED (id_inquilino)
)

go


IF OBJECT_ID('tentants') IS NOT NULL
    PRINT '<<< CREATED TABLE tentants >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tentants >>>'
go

/* 
 * TABLE: apartment 
 */

ALTER TABLE apartment ADD CONSTRAINT Refcommunities33 
    FOREIGN KEY (community_id, admin_id, id_cuenta, bank_id, id_persona)
    REFERENCES communities(community_id, admin_id, id_cuenta, bank_id, id_persona)
go

ALTER TABLE apartment ADD CONSTRAINT Refowners20 
    FOREIGN KEY (id_propietario)
    REFERENCES owners(id_propietario)
go


/* 
 * TABLE: bank_accounts 
 */

ALTER TABLE bank_accounts ADD CONSTRAINT Refbanks3 
    FOREIGN KEY (bank_id, id_persona)
    REFERENCES banks(bank_id, id_persona)
go


/* 
 * TABLE: bank_receipts 
 */

ALTER TABLE bank_receipts ADD CONSTRAINT Refbank_accounts44 
    FOREIGN KEY (id_cuenta, bank_id, id_persona)
    REFERENCES bank_accounts(id_cuenta, bank_id, id_persona)
go

ALTER TABLE bank_receipts ADD CONSTRAINT Refowners49 
    FOREIGN KEY (id_propietario)
    REFERENCES owners(id_propietario)
go


/* 
 * TABLE: banks 
 */

ALTER TABLE banks ADD CONSTRAINT Refcontact_infos38 
    FOREIGN KEY (id_persona)
    REFERENCES contact_infos(id_persona)
go


/* 
 * TABLE: bussiness_locals 
 */

ALTER TABLE bussiness_locals ADD CONSTRAINT Refcommunities32 
    FOREIGN KEY (community_id, admin_id, id_cuenta, bank_id, id_persona)
    REFERENCES communities(community_id, admin_id, id_cuenta, bank_id, id_persona)
go

ALTER TABLE bussiness_locals ADD CONSTRAINT Refowners19 
    FOREIGN KEY (id_propietario)
    REFERENCES owners(id_propietario)
go


/* 
 * TABLE: communities 
 */

ALTER TABLE communities ADD CONSTRAINT Refowners30 
    FOREIGN KEY (id_presidente)
    REFERENCES owners(id_propietario)
go

ALTER TABLE communities ADD CONSTRAINT Refcommunity_admins42 
    FOREIGN KEY (admin_id)
    REFERENCES community_admins(admin_id)
go

ALTER TABLE communities ADD CONSTRAINT Refbank_accounts43 
    FOREIGN KEY (id_cuenta, bank_id, id_persona)
    REFERENCES bank_accounts(id_cuenta, bank_id, id_persona)
go


/* 
 * TABLE: companies 
 */

ALTER TABLE companies ADD CONSTRAINT Refcontact_infos40 
    FOREIGN KEY (id_persona)
    REFERENCES contact_infos(id_persona)
go


/* 
 * TABLE: offices 
 */

ALTER TABLE offices ADD CONSTRAINT Refcommunities31 
    FOREIGN KEY (community_id, admin_id, id_cuenta, bank_id, id_persona)
    REFERENCES communities(community_id, admin_id, id_cuenta, bank_id, id_persona)
go

ALTER TABLE offices ADD CONSTRAINT Refowners18 
    FOREIGN KEY (id_propietario)
    REFERENCES owners(id_propietario)
go


/* 
 * TABLE: spends 
 */

ALTER TABLE spends ADD CONSTRAINT Refcommunities36 
    FOREIGN KEY (community_id, admin_id, id_cuenta, bank_id, id_persona)
    REFERENCES communities(community_id, admin_id, id_cuenta, bank_id, id_persona)
go

ALTER TABLE spends ADD CONSTRAINT Refcompanies4 
    FOREIGN KEY (id_empresa, id_persona)
    REFERENCES companies(id_empresa, id_persona)
go


/* 
 * TABLE: tentants 
 */

ALTER TABLE tentants ADD CONSTRAINT Refapartment45 
    FOREIGN KEY (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
    REFERENCES apartment(id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
go

ALTER TABLE tentants ADD CONSTRAINT Refoffices46 
    FOREIGN KEY (id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
    REFERENCES offices(id_propiedad, id_propietario, community_id, admin_id, id_cuenta, bank_id, id_persona)
go

ALTER TABLE tentants ADD CONSTRAINT Refbussiness_locals47 
    FOREIGN KEY (id_propiedad, id_propietario, community_id, admin_id, bank_id, id_persona)
    REFERENCES bussiness_locals(id_propiedad, id_propietario, community_id, admin_id, bank_id, id_persona)
go


