CREATE DATABASE vehicle_rentals;

-- Customer
-- Vehicle
-- Location
-- Service Department
-- Employee
-- Reservation
-- Transaction
-- Maintenance History

CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE vehicle (
    vin VARCHAR(30) PRIMARY KEY,
    make VARCHAR(30),
    model VARCHAR(30),
    color VARCHAR(30),
    location_id INTEGER REFERENCES location(id)
);

CREATE TABLE customer (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30)
);

CREATE TABLE service_department (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    service_department_id INTEGER REFERENCES service_department(id)
);

INSERT INTO employee (first_name, last_name, service_department_id) VALUES ('Jeff', 'Bezos', 1),
                                                                           ('Bob', 'Bobberson', 2),
                                                                           ('Karen', 'MeanLady', 3),
                                                                           ('Tony', 'Stank', 3),
                                                                           ('Hawk', 'Eye', 1),
                                                                           ('Ben', '10', 2),
                                                                           ('Peter', 'Griffin', 1),
                                                                           ('Bob', 'Minion', 2),
                                                                           ('The', 'Hulk', 4);

CREATE TABLE reservation (
    id SERIAL PRIMARY KEY,
    vehicle_id VARCHAR(30) REFERENCES vehicle(vin),
    customer_id INTEGER REFERENCES customer(id),
    start_date DATE,
    end_date DATE
);

CREATE TABLE transaction (
    id SERIAL PRIMARY KEY,
    reservation_id INTEGER REFERENCES reservation(id),
    amount FLOAT,
    type VARCHAR(30)
);

CREATE TABLE maintenance_history (
    id SERIAL PRIMARY KEY,
    vehicle_id VARCHAR(30) REFERENCES vehicle(vin),
    service_department_id INTEGER REFERENCES service_department(id),
    maintenance_date DATE
);

CREATE TABLE employee_maintenance(
    employee_id INTEGER REFERENCES employee(id),
    maintenance_history_id INTEGER REFERENCES maintenance_history(id),
    PRIMARY KEY (employee_id, maintenance_history_id)
);
CREATE TABLE transaction (
    id SERIAL PRIMARY KEY,
    reservation_id INTEGER REFERENCES reservation(id),
    amount FLOAT,
    type VARCHAR(30)
);
INSERT INTO reservation (vehicle_id, customer_id, start_date, end_date) VALUES ('71adg7632b', 1, '10-22-21', '11-22-21'),
                                                                               ('23bb385ned', 2, '11-15-22', '11-25-22'),
                                                                               ('23bb385ned', 3, '11-20-22', '11-23-22'),
                                                                               ('23bb385ned', 1, '12-01-22', '12-03-22'),
                                                                               ('2g34b73bff', 1, '05-09-19', '06-09-19');

INSERT INTO transaction (reservation_id, amount, type) VALUES (1, 99999999.99, 'Charge'),
                                                              (1, -550.50, 'Refund'),
                                                              (2, 15000, 'Charge'),
                                                              (3, 1999.99, 'Charge'),
                                                              (3, -10.50, 'Refund'),
                                                              (3, 20.30, 'Charge');