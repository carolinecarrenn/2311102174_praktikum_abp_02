-- ============================================================
-- 加班 | JIABAN — Premium Cafe Management System
-- Database Schema & Seed Data
-- ============================================================

CREATE DATABASE IF NOT EXISTS jiaban_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE jiaban_db;

-- ============================================================
-- TABLE: categories
-- ============================================================
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nama_kategori VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- TABLE: menu
-- ============================================================
CREATE TABLE menu (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nama_menu VARCHAR(150) NOT NULL,
  harga INT NOT NULL,
  kategori_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (kategori_id) REFERENCES categories(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- SEED: categories
-- ============================================================
INSERT INTO categories (nama_kategori) VALUES
('Appetizer / Starters'),
('Snacks / Sides'),
('Main Course'),
('Kids Menu'),
('Beverages / Drinks'),
('Dessert'),
('Soup');

-- ============================================================
-- SEED: menu — Appetizer / Starters (id=1) — 15 items
-- ============================================================
INSERT INTO menu (nama_menu, harga, kategori_id) VALUES
('Velvet Lotus Prawn Toast', 135000, 1),
('Charred Gochujang Wagyu Skewer', 285000, 1),
('Black Sesame Tuna Tartare', 195000, 1),
('Osmanthus Pickled Radish with Caviar Foam', 165000, 1),
('Crispy Silken Tofu with Yuzu Ponzu', 115000, 1),
('Imperial Scallop Ceviche with Chrysanthemum Oil', 245000, 1),
('Smoked Duck Gyoza with Truffle Soy', 175000, 1),
('Kimchi Lobster Roll on Brioche', 320000, 1),
('Cold Soba with Sichuan Sesame & Tobiko', 145000, 1),
('Crispy Pork Belly Bao with Plum Hoisin', 155000, 1),
('Torched Wagyu Tataki with Black Garlic Aioli', 275000, 1),
('Edamame Hummus with Nori Crackers', 105000, 1),
('Golden Century Egg with Aged Tofu & Chili Oil', 125000, 1),
('Seared Foie Gras on Scallion Pancake', 385000, 1),
('Miso-Cured Salmon Gravlax with Dill Cream', 215000, 1);

-- ============================================================
-- SEED: menu — Snacks / Sides (id=2) — 15 items
-- ============================================================
INSERT INTO menu (nama_menu, harga, kategori_id) VALUES
('Truffle Parmesan Edamame', 85000, 2),
('Black Garlic Blistered Shishito Peppers', 95000, 2),
('Soy-Glazed Crispy Brussels with Gochugaru', 105000, 2),
('Kimchi Fried Rice Arancini', 125000, 2),
('Wok-Tossed Garlic Butter Asparagus', 115000, 2),
('Charcoal Bao with Hoisin Pulled Duck', 145000, 2),
('Crispy Silkworm & Salt Caramel Popcorn', 75000, 2),
('Five-Spice Sweet Potato Fries with Gochujang Mayo', 95000, 2),
('Steamed Pork & Chive Siu Mai', 135000, 2),
('Sichuan Dry-Rubbed Chicken Wings', 155000, 2),
('Sesame Glazed Baby Corn with Miso Butter', 85000, 2),
('Tempura Green Tea Soba Noodles', 115000, 2),
('Smoked Prawn Crackers with Caviar Cream', 185000, 2),
('Yuzu Kosho Chicken Karaage', 145000, 2),
('Pan-Seared Gyoza with Chili Butter Broth', 125000, 2);

-- ============================================================
-- SEED: menu — Main Course (id=3) — 20 items
-- ============================================================
INSERT INTO menu (nama_menu, harga, kategori_id) VALUES
('Truffle Jajang Cream Noodles', 245000, 3),
('Imperial Scallion Rice Bowl with A5 Wagyu', 485000, 3),
('Black Garlic Soy Butter Roasted Chicken', 265000, 3),
('Gochujang Braised Short Rib with Lotus Root', 385000, 3),
('Silken Tofu Mapo with Iberico Pork', 215000, 3),
('Osmanthus Honey Peking Duck Quarter', 345000, 3),
('Charred Barramundi with Soy Beurre Blanc', 295000, 3),
('Sizzling Bibimbap in Stone Bowl with Wagyu', 325000, 3),
('Wok-Smoked Lobster with Aged Soy & Ginger', 645000, 3),
('Slow-Cooked Doenjang Lamb Rack', 425000, 3),
('Jasmine Rice with Pan-Seared Scallops & Chorizo', 335000, 3),
('Midnight Black Ramen with Squid Ink Broth', 195000, 3),
('Crispy Whole Sea Bass with Sichuan Bean Sauce', 375000, 3),
('Galbi-Glazed Pork Collar with Perilla Salad', 285000, 3),
('Golden Dashi Risotto with Uni & Crispy Shallots', 415000, 3),
('Miso Butter Poached King Crab with Roe', 785000, 3),
('Braised Oxtail with Black Bean Jus & Taro', 345000, 3),
('Charcoal-Grilled Tiger Prawn with XO Sauce', 395000, 3),
('Eight Treasure Duck Confit with Plum Wine Jus', 455000, 3),
('Soy-Lacquered Iberico Pork Belly on Scallion Congee', 365000, 3);

-- ============================================================
-- SEED: menu — Kids Menu (id=4) — 15 items
-- ============================================================
INSERT INTO menu (nama_menu, harga, kategori_id) VALUES
('Mini Wagyu Slider with Secret Sauce', 115000, 4),
('Golden Sesame Chicken Strips with Honey Dip', 95000, 4),
('Panda Rice Bowl with Teriyaki Chicken', 105000, 4),
('Mini Cheese Gyoza with Tomato Yuzu Dip', 85000, 4),
('Crispy Fish Tempura with Tartar Cream', 125000, 4),
('Steamed Pork Dumpling Trio for Little Ones', 95000, 4),
('Soy Glazed Chicken Drumette with Rice', 105000, 4),
('Mini Truffle Mac & Cheese Bites', 115000, 4),
('Sweet Soy Yakitori Skewer Set', 95000, 4),
('Junior Wonton Soup with Baby Bok Choy', 85000, 4),
('Crispy Tofu Nuggets with Miso Caramel Dip', 85000, 4),
('Kids Garlic Butter Noodles with Egg', 75000, 4),
('Mini Bibimbap Bowl with Soft Egg', 105000, 4),
('Steamed Fish Fillet with Light Soy & Ginger', 115000, 4),
('Sweet Sesame Pancake with Red Bean Cream', 85000, 4);

-- ============================================================
-- SEED: menu — Beverages / Drinks (id=5) — 20 items
-- ============================================================
INSERT INTO menu (nama_menu, harga, kategori_id) VALUES
('Midnight Lychee Tonic', 75000, 5),
('Osmanthus Plum Sparkler', 85000, 5),
('Jasmine Dragon Pearl Cold Brew', 65000, 5),
('Black Sesame Milk Tea with Boba Pearl', 75000, 5),
('Yuzu Honey Ginger Fizz', 80000, 5),
('Mulberry Hibiscus Sangria Mocktail', 85000, 5),
('Aged Pu-Erh Smoked Lemonade', 90000, 5),
('Rose Lychee Chrysanthemum Soda', 75000, 5),
('Imperial Korean Barley Cold Brew', 65000, 5),
('Salted Caramel White Sesame Latte', 85000, 5),
('Hojicha Coconut Cream Froth', 80000, 5),
('Pandan Matcha Iced Latte', 85000, 5),
('Stargazer Elderflower Yuzu Spritz', 90000, 5),
('Dark Soy Milk with Osmanthus Sugar', 60000, 5),
('Burnt Sugar Korean Citrus Americano', 70000, 5),
('Five-Spice Spiced Rum Sipper (NA)', 95000, 5),
('Crimson Pomegranate Soju Soda (NA)', 95000, 5),
('Golden Turmeric Chrysanthemum Tonic', 80000, 5),
('Cold Brew Genmaicha with Cream Float', 75000, 5),
('Luxury Jasmine Sparkling Water Reserve', 55000, 5);

-- ============================================================
-- SEED: menu — Dessert (id=6) — 15 items
-- ============================================================
INSERT INTO menu (nama_menu, harga, kategori_id) VALUES
('Golden Sesame Custard', 95000, 6),
('Osmanthus Jelly with Lychee Pearls', 85000, 6),
('Black Sesame Lava Cake with Miso Ice Cream', 125000, 6),
('Yuzu Curd Tart with Burnt Meringue', 115000, 6),
('Matcha Mille-Feuille with Red Bean Cream', 135000, 6),
('Mango Pomelo Sago in Chilled Coconut Broth', 95000, 6),
('Toasted Rice Ice Cream with Caramel Soy', 85000, 6),
('Silken Panna Cotta with Osmanthus Syrup', 105000, 6),
('Charcoal Waffle with Earl Grey Ice Cream', 125000, 6),
('Egg Tart with Chrysanthemum Glaze', 75000, 6),
('Midnight Dark Chocolate Sphere with Gold Dust', 165000, 6),
('Lychee Rose Sorbet with Candied Lemon', 85000, 6),
('Steamed Lotus Paste Custard Bun', 95000, 6),
('Red Bean & Black Sesame Mochi Selection', 115000, 6),
('Iced Nian Gao with Coconut Caramel Sauce', 105000, 6);

-- ============================================================
-- SEED: menu — Soup (id=7) — 15 items
-- ============================================================
INSERT INTO menu (nama_menu, harga, kategori_id) VALUES
('Silk Tofu Chrysanthemum Broth', 95000, 7),
('Imperial Hot & Sour Seafood Bisque', 145000, 7),
('Black Garlic Truffle Tonkotsu', 165000, 7),
('Gochujang Prawn Bisque with Scallion Oil', 155000, 7),
('Aged Soy Bone Marrow Broth', 175000, 7),
('Miso Clam Chowder with Chili Butter', 145000, 7),
('Roasted Kimchi Dumpling Soup', 125000, 7),
('White Pepper Velvet Corn Chowder', 115000, 7),
('Cold Chrysanthemum Vichyssoise', 105000, 7),
('Double-Boiled Snow Fungus & Lotus Root Soup', 135000, 7),
('Braised Oxtail Broth with Goji & Ginger', 165000, 7),
('Spiced Lemongrass & Galangal Coconut Broth', 125000, 7),
('Century Egg & Silken Tofu Congee Broth', 115000, 7),
('Charred Corn & Doenjang Veloute', 125000, 7),
('Wonton in Superior Soy Ginger Broth', 135000, 7);
