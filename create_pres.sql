CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(200),
    address VARCHAR(150),
    city VARCHAR(150),
    customer_state VARCHAR(100),
    zip_code VARCHAR(50)
);

CREATE TABLE "order"(
    order_id SERIAL PRIMARY KEY,
    order_date DATE DEFAULT CURRENT_DATE,
    amount NUMERIC(5,2),
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE
);

INSERT INTO customer(
    first_name, 
    last_name,
    email,
    address,
    city,
    customer_state, 
    zip_code 
) VALUES (
        'George',
        'Washington',
        'gwash@usa.gov',
        '3200 Mt Vernon Hwy',
        'Mt Vernon',
        'VA',
        '22121'
    ),
    (
        'John',
        'Adams',
        'jadamas@usa.gov',
        '1200 Hancock Ave',
        'Quincy',
        'MA',
        '02169'
    ),
    (
        'Thomas',
        'Jefferson',
        'tjeff@usa.gov',
        '931 Thomas Jefferson Pkway',
        'Charlottesville',
        'VA',
        '02169'
    ),
    (
        'James',
        'Madison',
        'jmad@usa.gov',
        '11350 Conway',
        'Orange',
        'VA',
        '02169'
    ),
    (
        'James',
        'Monroe',
        'jmonroe@usa.gov',
        '2050 James Monroe Parkway',
        'Charlottesville',
        'VA',
        '02169'
    )

SELECT * FROM customer;

INSERT INTO "order"(amount,customer_id)
VALUES(234.56,1),
(78.50,3),
(124.00,2),
(65.50,3),
(55.50,NULL);

SELECT * FROM "order";