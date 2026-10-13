CREATE TABLE IF NOT EXISTS event_log
(
    id BIGSERIAL PRIMARY KEY,
    event_time TIMESTAMP NOT NULL,
    type SMALLINT NOT NULL,
    severity SMALLINT NOT NULL,
    category SMALLINT NOT NULL,
    description TEXT NOT NULL
);