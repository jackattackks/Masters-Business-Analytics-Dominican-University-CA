CREATE TABLE transactions (
    transactionid varchar,
    timestampsec timestamp,
    customerid varchar,
    firstname varchar,
    surname varchar,
    shipping_state varchar,
    item varchar,
    description varchar,
    retail_price float(2),
    loyalty_discount float(2)
);

COPY transactions FROM '/Applications/PostgreSQL 15/MS5503/P9-OLTP.csv' DELIMITER ',' CSV HEADER;

select * from transactions