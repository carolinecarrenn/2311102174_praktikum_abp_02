# 加班 | JIABAN — Premium Cafe Menu Management System

> *Where Seoul's refined elegance meets Shanghai's midnight mystique.*

---

## Tech Stack

| Layer     | Technology                              |
|-----------|------------------------------------------|
| Backend   | Node.js + Express                        |
| Database  | MySQL                                    |
| Frontend  | Bootstrap (custom) · jQuery · DataTables |
| Libraries | SweetAlert2 · jQuery Validation          |
| Fonts     | Cormorant Garamond · Montserrat · Noto Serif SC |

---

## Prerequisites

- **Node.js** v16 or above
- **MySQL** v8.0 or above
- **npm** v7 or above

---

## Installation & Setup

### 1. Clone / Extract Project

```bash
cd jiaban
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Configure Environment

Edit the `.env` file in the root directory:

```env
DB_HOST=localhost
DB_USER=root
DB_PASS=your_mysql_password
DB_NAME=jiaban_db
PORT=3000
```

### 4. Import Database

Open your MySQL client (MySQL Workbench, TablePlus, or terminal) and import the SQL file:

```bash
mysql -u root -p < database/jiaban_db.sql
```

Or via MySQL terminal:

```sql
SOURCE /full/path/to/jiaban/database/jiaban_db.sql;
```

This will:
- Create the `jiaban_db` database
- Create `categories` and `menu` tables
- Seed **7 categories** and **105+ premium menu items**

### 5. Start the Server

```bash
npm start
```

Or with auto-reload (dev mode):

```bash
npm run dev
```

### 6. Open in Browser

```
http://localhost:3000
```

---

## Application Features

### 7 Navigation Tabs

| Tab         | Description                                                  |
|-------------|--------------------------------------------------------------|
| Dashboard   | Stats overview: total menu, categories, food vs drinks count |
| Menu List   | Full DataTables view with search, sort, pagination           |
| Add Menu    | Validated form to add new menu items                         |
| Food        | Filtered view of all non-beverage items                      |
| Drinks      | Filtered view of Beverages / Drinks only                     |
| Categories  | CRUD management for menu categories                          |
| Profile     | System/brand profile page                                    |

### API Endpoints

| Method | Endpoint                  | Description           |
|--------|---------------------------|-----------------------|
| GET    | /api/menu                 | All menu items (JSON) |
| GET    | /api/menu/:id             | Single menu item      |
| POST   | /api/menu                 | Create menu item      |
| PUT    | /api/menu/:id             | Update menu item      |
| DELETE | /api/menu/:id             | Delete menu item      |
| GET    | /api/menu/filter/food     | Food items only       |
| GET    | /api/menu/filter/drinks   | Drinks only           |
| GET    | /api/menu/category/:id    | Filter by category    |
| GET    | /api/menu/stats/dashboard | Dashboard stats       |
| GET    | /api/categories           | All categories        |
| POST   | /api/categories           | Create category       |
| PUT    | /api/categories/:id       | Update category       |
| DELETE | /api/categories/:id       | Delete category       |

---

## Menu Categories & Seed Count

| Category             | Items |
|----------------------|-------|
| Appetizer / Starters | 15    |
| Snacks / Sides       | 15    |
| Main Course          | 20    |
| Kids Menu            | 15    |
| Beverages / Drinks   | 20    |
| Dessert              | 15    |
| Soup                 | 15    |
| **Total**            | **115** |

---

## Project Structure

```
jiaban/
├── server.js               # Express entry point
├── package.json
├── .env                    # Environment config
├── config/
│   └── database.js         # MySQL pool connection
├── routes/
│   ├── menu.js             # Menu routes
│   └── categories.js       # Category routes
├── controllers/
│   ├── menuController.js   # Menu CRUD logic
│   └── categoriesController.js
├── database/
│   └── jiaban_db.sql       # Schema + 115 seed items
└── public/
    ├── index.html          # Single-page frontend
    ├── css/
    │   └── jiaban.css      # Custom dark luxury theme
    └── js/
        └── jiaban.js       # Frontend application logic
```

---

## Design Direction

**Aesthetic:** Dark Luxury — Old Money — Cinematic — Exclusive

**Color Palette:**
- Deep Black `#080808`
- Charcoal `#111111`
- Muted Gold `#b48c50`
- Wine Red `#6b1a24`
- Burgundy `#8b2535`
- Warm Cream `#ede8e0`

**Typography:**
- Display: Cormorant Garamond (serif, editorial)
- UI: Montserrat (sans, precise)
- Brand: Noto Serif SC (Chinese character rendering)

---

*加班 — Culinary Excellence. Designed with precision.*
