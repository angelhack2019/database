CREATE SCHEMA dough_you;

CREATE TABLE dough_you.users
(
    uuid            uuid            PRIMARY KEY,
    first_name      VARCHAR(32)     NOT NULL,
    last_name       VARCHAR(32)     NOT NULL,
    email           VARCHAR(32)     NOT NULL UNIQUE,
    password        VARCHAR(32)     NOT NULL,
    bio             TEXT,
    state           VARCHAR(32)     NOT NULL,
    city            VARCHAR(32)     NOT NULL,
    school          VARCHAR(32)     NOT NULL,
    sum_ratings     INTEGER,
    num_ratings     INTEGER         NOT NULL,
    pic_url         TEXT,
    phone_number    TEXT

);


CREATE TABLE dough_you.foods
(
    uuid            uuid            PRIMARY KEY,
    pic_url         TEXT            NOT NULL,
    exp_date        timestamptz     NOT NULL,
    create_date     timestamptz     NOT NULL
);

CREATE TABLE dough_you.tags
(
    uuid            uuid            PRIMARY KEY,
    name            VARCHAR         NOT NULL PRIMARY KEY

);

CREATE TABLE dough_you.foods_tags
(
    food_uuid       uuid            NOT NULL PRIMARY KEY REFERENCES dough_you.users (uuid) ON DELETE CASCADE,
    tag_uuid        uuid            NOT NULL PRIMARY KEY REFERENCES dough_you.tags (uuid) ON DELETE CASCADE,

);

CREATE TABLE dough_you.users_foods
(
    user_uuid       uuid            NOT NULL PRIMARY KEY REFERENCES dough_you.users (uuid) ON DELETE CASCADE,
    food_uuid       uuid            NOT NULL PRIMARY KEY REFERENCES dough_you.foods (uuid) ON DELETE CASCADE
);

CREATE UNIQUE INDEX users_email_pw_index ON dough_you.users (email, password);