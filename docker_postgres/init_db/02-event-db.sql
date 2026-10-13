\connect event_db

CREATE SCHEMA IF NOT EXISTS finance_cluster;

CREATE TABLE IF NOT EXISTS finance_cluster.event_log
(
    id BIGSERIAL PRIMARY KEY,
    event_time TIMESTAMP NOT NULL,
    type SMALLINT NOT NULL,
    severity SMALLINT NOT NULL,
    category SMALLINT NOT NULL,
    description TEXT NOT NULL
);

CREATE SCHEMA IF NOT EXISTS finance_web;

CREATE TABLE IF NOT EXISTS finance_web.event_log
(
    id BIGSERIAL PRIMARY KEY,
    event_time TIMESTAMP NOT NULL,
    type SMALLINT NOT NULL,
    severity SMALLINT NOT NULL,
    category SMALLINT NOT NULL,
    description TEXT NOT NULL
);