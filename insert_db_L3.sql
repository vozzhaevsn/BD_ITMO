-- Компании
INSERT INTO company (name, company_type) VALUES
  ('Global Goods Inc', 'Cargo Owner'),
  ('Ocean Trans Ltd', 'Ship Owner'),
  ('Logistics Pro', 'Logistics');

-- Типы грузов
INSERT INTO cargo_type (name) VALUES
  ('20ft Container'),
  ('Tanker'),
  ('Bulk');

-- Порты
INSERT INTO port (name, country, depth) VALUES
  ('Shanghai Port', 'China', 15.5),
  ('Port of Rotterdam', 'Netherlands', 18.0),
  ('Port Klang', 'Malaysia', 16.5);

-- Маршруты
INSERT INTO route (departure_port_id, destination_port_id, distance) VALUES
  (1, 2, 10000.00), -- Шанхай → Роттердам
  (3, 1, 4500.00);  -- Port Klang → Шанхай

-- Грузы
INSERT INTO cargo (name, total_weight, total_volume, sender_id, receiver_id, cargo_type_id) VALUES
  ('Electronics from China', 15000.00, 25.3, 1, 1, 1),
  ('Crude Oil', 50000.00, 100.5, 1, 2, 2);

-- Суда
INSERT INTO ship (name, ship_type, teu_capacity, deadweight, draft) VALUES
  ('Sea Giant', 'Container Ship', 8000, 200000.00, 12.5),
  ('Deep Sea Voyager', 'Tanker', NULL, 300000.00, 15.0);

-- Документы
INSERT INTO document (number, document_type, issue_date, cargo_id) VALUES
  ('BL-2023-001', 'Bill of Lading', '2023-10-01', 1),
  ('INV-2023-002', 'Invoice', '2023-10-05', 2);

-- Связь судно-маршрут
INSERT INTO ship_route (ship_id, route_id) VALUES
  (1, 1), -- Sea Giant на маршрут Шанхай → Роттердам
  (2, 2); -- Deep Sea Voyager на маршрут Port Klang → Шанхай