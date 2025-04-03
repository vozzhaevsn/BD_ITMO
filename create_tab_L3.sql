-- Таблица Company
CREATE TABLE company (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  company_type VARCHAR(30) CHECK (company_type IN ('Cargo Owner', 'Ship Owner', 'Logistics', 'Customs Broker')) NOT NULL
);

-- Таблица CargoType (тип груза)
CREATE TABLE cargo_type (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL
);

-- Таблица Cargo (груз)
CREATE TABLE cargo (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  requirements TEXT,
  total_weight NUMERIC(10,2) CHECK (total_weight > 0) NOT NULL,
  total_volume NUMERIC(10,2) CHECK (total_volume > 0) NOT NULL,
  sender_id INTEGER REFERENCES company(id) NOT NULL,
  receiver_id INTEGER REFERENCES company(id) NOT NULL,
  cargo_type_id INTEGER REFERENCES cargo_type(id) NOT NULL
);

-- Таблица Ship (судно)
CREATE TABLE ship (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  ship_type VARCHAR(20) CHECK (ship_type IN ('Container Ship', 'Tanker', 'Bulk Carrier')) NOT NULL,
  teu_capacity INTEGER CHECK (teu_capacity >= 0),
  deadweight NUMERIC(10,2) CHECK (deadweight > 0) NOT NULL,
  draft NUMERIC(5,2) CHECK (draft > 0) NOT NULL
);

-- Таблица Port (порт)
CREATE TABLE port (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  country VARCHAR(50) NOT NULL,
  depth NUMERIC(5,2) CHECK (depth > 0) NOT NULL
);

-- Таблица Route (маршрут)
CREATE TABLE route (
  id SERIAL PRIMARY KEY,
  departure_port_id INTEGER REFERENCES port(id) NOT NULL,
  destination_port_id INTEGER REFERENCES port(id) NOT NULL,
  distance NUMERIC(10,2) CHECK (distance > 0) NOT NULL
);

-- Таблица Document (документ)
CREATE TABLE document (
  id SERIAL PRIMARY KEY,
  number VARCHAR(50) UNIQUE NOT NULL,
  document_type VARCHAR(30) CHECK (document_type IN ('Bill of Lading', 'Invoice', 'Customs Declaration')) NOT NULL,
  issue_date DATE NOT NULL,
  cargo_id INTEGER REFERENCES cargo(id) NOT NULL
);

-- Таблица Ship_Route (связь многие-ко-многим)
CREATE TABLE ship_route (
  ship_id INTEGER REFERENCES ship(id) NOT NULL,
  route_id INTEGER REFERENCES route(id) NOT NULL,
  PRIMARY KEY (ship_id, route_id)
);