CREATE SCHEMA dough_you;

CREATE TABLE dough_you.users
(
    uuid         uuid PRIMARY KEY,
    first_name   VARCHAR(32) NOT NULL,
    last_name    VARCHAR(32) NOT NULL,
    email        VARCHAR(32) NOT NULL UNIQUE,
    password     VARCHAR(32) NOT NULL,
    bio          TEXT,
    state        VARCHAR(32) NOT NULL,
    city         VARCHAR(32) NOT NULL,
    school       VARCHAR(32) NOT NULL,
    sum_ratings  INTEGER,
    num_ratings  INTEGER     NOT NULL,
    pic_url      TEXT,
    phone_number TEXT

);


CREATE TABLE dough_you.foods
(
    uuid        uuid PRIMARY KEY,
    pic_url     TEXT        NOT NULL,
    exp_date    timestamptz NOT NULL,
    create_date timestamptz NOT NULL
);

CREATE TABLE dough_you.tags
(
    uuid uuid PRIMARY KEY,
    name VARCHAR NOT NULL

);

CREATE TABLE dough_you.foods_tags
(
    food_uuid uuid NOT NULL REFERENCES dough_you.users (uuid) ON DELETE CASCADE,
    tag_uuid  uuid NOT NULL REFERENCES dough_you.tags (uuid) ON DELETE CASCADE
);

CREATE TABLE dough_you.users_foods
(
    user_uuid uuid NOT NULL REFERENCES dough_you.users (uuid) ON DELETE CASCADE,
    food_uuid uuid NOT NULL REFERENCES dough_you.foods (uuid) ON DELETE CASCADE
);

CREATE UNIQUE INDEX users_email_pw_index ON dough_you.users (email, password);
CREATE UNIQUE INDEX users_foods_tags_index ON dough_you.foods_tags (food_uuid, tag_uuid);
CREATE UNIQUE INDEX users_users_foods_index ON dough_you.users_foods (user_uuid, food_uuid);

INSERT INTO dough_you.users(uuid, first_name, last_name, email,
                            password, bio, state, city, school,
                            sum_ratings, num_ratings, pic_url, phone_number)
VALUES ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'John', 'Doe', 'jdoe@uw.edu',
        'Unencrypted', 'I am generous', 'WA', 'Bothell', 'UW Bothell',
        48, 10, 'https://f4.bcbits.com/img/a0777435656_10.jpg', '2061234567');

INSERT INTO dough_you.users(uuid, first_name, last_name, email,
                            password, bio, state, city, school,
                            sum_ratings, num_ratings, pic_url, phone_number)
VALUES ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Sally', 'Fields', 'sfields@uw.edu',
        'NotSafe', 'I like food', 'WA', 'Bothell', 'UW Bothell',
        45, 10,
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Gidget_main_cast_1966_%28cropped%29.jpg/220px-Gidget_main_cast_1966_%28cropped%29.jpg',
        '2067654321');
