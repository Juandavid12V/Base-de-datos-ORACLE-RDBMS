--Presentado por: Juan David Vega 230201021
--Crear usuario

CREATE USER DAVIDBD IDENTIFIED BY "12345";  --crear usuario con su respectiva contraseña

CONNECT DAVIDBD/12345@localhost:1521/freepdb1;


--crear tablas
CREATE TABLE review (
    id VARCHAR2(50),
    updated_at DATE,
    created_at DATE,
    user_id VARCHAR2(50),
    place_id VARCHAR2(50),
    text VARCHAR2(255)
);

CREATE TABLE User_RDB (
    id VARCHAR2(50),
    updated_at DATE,
    created_at DATE,
    email VARCHAR2(255),
    password VARCHAR2(255),
    first_name VARCHAR2(100),
    last_name VARCHAR2(100)
);

CREATE TABLE Amenity (
    id VARCHAR2(50),
    updated_at DATE,
    created_at DATE,
    name VARCHAR2(255)
);

CREATE TABLE PlaceAmenity (
    amenity_id VARCHAR2(50),
    place_id VARCHAR2(50)
);

CREATE TABLE State (
    id VARCHAR2(50),
    updated_at DATE,
    created_at DATE
);

CREATE TABLE City (
    id VARCHAR2(50),
    updated_at DATE,
    created_at DATE,
    state_id VARCHAR2(50),
    name VARCHAR2(255)
);

CREATE TABLE Place (
    id VARCHAR2(50),
    updated_at DATE,
    created_at DATE,
    user_id VARCHAR2(50),
    name VARCHAR2(255),
    city_id VARCHAR2(50),
    description VARCHAR2(1000),
    number_rooms INTEGER,
    number_bathrooms INTEGER,
    max_guest INTEGER,
    price_by_night NUMBER,
    latitude FLOAT,
    longitude FLOAT
);
--Crear Restricciones:
--Llaves Primarias
--USER
ALTER TABLE User_RDB
ADD CONSTRAINT pk_user PRIMARY KEY (id);

--PLACE
ALTER TABLE Place
ADD CONSTRAINT pk_place PRIMARY KEY (id);

--CITY
ALTER TABLE City
ADD CONSTRAINT pk_city PRIMARY KEY (id);

--AMENITY
ALTER TABLE Amenity
ADD CONSTRAINT pk_amenity PRIMARY KEY (id);

--STATE
ALTER TABLE State
ADD CONSTRAINT pk_state PRIMARY KEY (id);

--REVIEW
ALTER TABLE review
ADD CONSTRAINT pk_review PRIMARY KEY (id);


--Llaves Foraneas
ALTER TABLE Place
ADD CONSTRAINT fk_place_user FOREIGN KEY (user_id) REFERENCES User_RDB (id);
ALTER TABLE Place
ADD CONSTRAINT fk_place_city FOREIGN KEY (city_id) REFERENCES City (id);



ALTER TABLE review
ADD CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES User_RDB (id);
ALTER TABLE review
ADD CONSTRAINT fk_review_place FOREIGN KEY (place_id) REFERENCES Place (id);



ALTER TABLE PlaceAmenity
ADD CONSTRAINT fk_placeamenity_amenity FOREIGN KEY (amenity_id) REFERENCES Amenity (id);

ALTER TABLE PlaceAmenity
ADD CONSTRAINT fk_placeamenity_place FOREIGN KEY (place_id) REFERENCES Place (id);


ALTER TABLE City
ADD CONSTRAINT fk_city_state FOREIGN KEY (state_id) REFERENCES State (id);


