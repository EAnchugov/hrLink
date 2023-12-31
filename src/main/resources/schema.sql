DROP SCHEMA public CASCADE;
CREATE SCHEMA public;


create table if not exists driver (
    id bigint generated by default as identity primary key not null,
    first_name varchar(100) not null ,
    last_name varchar(100) not null ,
    driving_experience integer not null,
    birth_date date not null
);

create table if not exists car(
    id bigint generated by default as identity primary key not null,
    brand varchar(100) not null,
    manufactured varchar(100) not null,
    mileage integer not null
);

create table if not exists car_driver(
    id bigint generated by default as identity not null,
    car_id bigint not null,
    driver_id bigint not null,
    constraint car_driver_to_driver foreign key (driver_id) references driver(id),
    constraint car_driver_to_car foreign key (car_id) references car(id)
);

insert into driver (first_name, last_name, driving_experience, birth_date) VALUES
    ('Иван', 'Форд', 1, DATE '1999-01-08');
insert into driver (first_name, last_name, driving_experience, birth_date) VALUES
    ('Петр', 'Форд', 1, DATE '1999-01-08');
insert into driver (first_name, last_name, driving_experience, birth_date) VALUES
    ('Сидор', 'Форд', 1, DATE '1999-01-08');

insert into driver (first_name, last_name, driving_experience, birth_date) VALUES
    ('Иван', 'Тойота', 1, DATE '1999-01-08');
insert into driver (first_name, last_name, driving_experience, birth_date) VALUES
    ('Петр', 'Тойота', 1, DATE '1999-01-08');
insert into driver (first_name, last_name, driving_experience, birth_date) VALUES
    ('Сидор', 'Тойота2', 1, DATE '1999-01-08');
insert into driver (first_name, last_name, driving_experience, birth_date) VALUES
    ('Иван2', 'Тойота', 1, DATE '1999-01-08');

insert into car (brand, manufactured, mileage) VALUES
    ('Ford', 'default', 1000);
insert into car (brand, manufactured, mileage) VALUES
    ('Ford', 'default', 1000);
insert into car (brand, manufactured, mileage) VALUES
    ('Ford', 'default', 1000);
insert into car (brand, manufactured, mileage) VALUES
    ('Toyota', 'default', 1000);
insert into car (brand, manufactured, mileage) VALUES
    ('Toyota', 'default', 1000);
insert into car (brand, manufactured, mileage) VALUES
    ('Toyota', 'default', 1000);
insert into car (brand, manufactured, mileage) VALUES
    ('Toyota', 'default', 1000);

insert into car_driver (driver_id,car_id) values (1,1);
insert into car_driver (driver_id,car_id) values (1,2);
insert into car_driver (driver_id,car_id) values (2,1);
insert into car_driver (driver_id,car_id) values (3,3);
insert into car_driver (driver_id,car_id) values (4,4);
insert into car_driver (driver_id,car_id) values (5,5);
insert into car_driver (driver_id,car_id) values (6,5);
insert into car_driver (driver_id,car_id) values (6,6);


select last_name from driver
    join car_driver on driver.id = car_driver.driver_id
    join car on car.id = car_driver.car_id
    where brand = 'Toyota'
    group by driver.id
    having count(car_driver.car_id) > 1
;