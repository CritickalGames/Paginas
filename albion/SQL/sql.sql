-- Crear la tabla "img"
CREATE TABLE img (
  nombre VARCHAR(20) PRIMARY KEY,
  formato CHAR(3) CHECK (formato IN ('png', 'jpg'))
);

-- Crear la tabla "items"
CREATE TABLE items (
  identificador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(15) NOT NULL,
  sub_nombre VARCHAR(35),
  tier INT NOT NULL CHECK (tier >= 1 AND tier <= 8),
  lv INT CHECK (lv >= 0 AND lv <= 4),
  img_nombre VARCHAR(20),
  FOREIGN KEY (img_nombre) REFERENCES img(nombre)
);

-- Crear la tabla "precios"
CREATE TABLE precios (
  identificador INT,
  país ENUM ('pantano', 'montaña', 'bosque', 'desierto', 'pradera', 'medio'),
  lugar ENUM ('ciudad', 'pueblo'),
  precio INT,
  orden_tipo ENUM ('de venta', 'de compra'),
  PRIMARY KEY (identificador, país, lugar),
  FOREIGN KEY (identificador) REFERENCES items(identificador)
);
