CREATE TABLE account (
    id             BIGSERIAL PRIMARY KEY,
    account_number VARCHAR(20)   NOT NULL UNIQUE,
    customer_id    BIGINT        NOT NULL REFERENCES customer(id),
    type           VARCHAR(20)   NOT NULL,          -- SAVINGS, CURRENT
    currency       VARCHAR(3)    NOT NULL,          -- EGP, USD
    balance        NUMERIC(19,2) NOT NULL DEFAULT 0,
    status         VARCHAR(20)   NOT NULL DEFAULT 'ACTIVE',
    created_at     TIMESTAMPTZ   NOT NULL DEFAULT now()
);

CREATE INDEX idx_account_customer ON account(customer_id);