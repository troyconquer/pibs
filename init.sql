CREATE TABLE IF NOT EXISTS tokens (
    userId           BIGSERIAL,
    externalUserId   TEXT,
    token            TEXT NOT NULL UNIQUE,
    created          TIMESTAMP DEFAULT now()
  );

CREATE TABLE IF NOT EXISTS wallet (
    userId       BIGINT,
    offerId      BIGINT
  );

CREATE TABLE IF NOT EXISTS wishlist (
    userId       BIGINT,
    productId    BIGINT
  );

CREATE TABLE IF NOT EXISTS picture (
    id           BIGSERIAL,
    userId       BIGINT,
    url          TEXT,
    publishDate  timestamp default current_timestamp
  );



CREATE SCHEMA IF NOT EXISTS salesforce;

CREATE TABLE IF NOT EXISTS salesforce.contact (
    id              BIGSERIAL,
    firstName       TEXT,
    lastName        TEXT,
    email           TEXT,
    mobilePhone     TEXT,
    leadsource      TEXT,
    accountid       TEXT,
    pictureURL__c   TEXT,
    preference__c   TEXT,
    size__c         TEXT,
    loyaltyid__c    TEXT,
    password__c     TEXT,
    createddate     timestamp
  );

CREATE TABLE IF NOT EXISTS salesforce.interaction__c (
    id                      BIGSERIAL,
    contact__loyaltyid__c   TEXT,
    campaign__c             TEXT,
    product__c              TEXT,
    type__c                 TEXT,
    name__c                 TEXT,
    picture__c              TEXT,
    points__c               double precision,
    createddate             timestamp
  );

DROP TABLE IF EXISTS salesforce.campaign;
CREATE TABLE IF NOT EXISTS salesforce.campaign (
    id              BIGSERIAL PRIMARY KEY,
    sfId            TEXT,
    name            TEXT,
    startdate       DATE,
    enddate         DATE,
    description     TEXT,
    image__c        TEXT,
    campaignpage__c TEXT,
    publishdate__c  DATE,
    type            TEXT,
    status          TEXT
  );

DROP TABLE IF EXISTS salesforce.product2;
CREATE TABLE IF NOT EXISTS salesforce.product2 (
    id              BIGSERIAL PRIMARY KEY,
    name            TEXT,
    description     TEXT,
    image__c        TEXT,
    productpage__c  TEXT,
    publishdate__c  DATE
  );

DROP TABLE IF EXISTS salesforce.store__c;
CREATE TABLE IF NOT EXISTS salesforce.store__c (
    id                      BIGSERIAL PRIMARY KEY,
    name                    TEXT,
    location__latitude__s   TEXT,
    location__longitude__s  TEXT
  );

INSERT INTO salesforce.campaign (id, name, description, image__c, type, status) VALUES
    (1, '$10 the Data', 'Get $10.00 off your cloud data, that is sure to leave you satisfied.', 'https://s3-us-west-2.amazonaws.com/sfdc-nibs-demo/chocolate_camarao.jpg', 'Offer', 'In Progress'),
    (2, '10% off Micro-services', 'Take 10% off the road to testability, while shrinking your monolith!', 'http://s3-us-west-1.amazonaws.com/sfdc-demo/nibs/truffles.jpg', 'Offer', 'In Progress');

INSERT INTO salesforce.product2 (id, name, description, image__c) VALUES
    (1, 'Data Product 1', 'Data is all the things. Save your data in our modern product 1 architecture.', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/nibs/feve1.jpg'),
    (2, 'Micro-service Product 2', 'Micro-services can take control of your monolith! Keep investing in your product and team!', 'https://s3-us-west-2.amazonaws.com/sfdc-nibs-demo/chocolate_camarao.jpg');

INSERT INTO salesforce.store__c (id, name, location__latitude__s, location__longitude__s) VALUES
    (1, 'Golden Gate', 37.782568, -122.411148),
    (2, 'Central Market', 37.782568, -122.411148),
    (3, 'SOMA', 37.787145, -122.399073);
