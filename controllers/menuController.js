const db = require('../config/database');

const menuController = {
  getAll: async (req, res) => {
    try {
      const [rows] = await db.query(`
        SELECT m.id, m.nama_menu, m.harga, m.kategori_id, m.created_at, c.nama_kategori
        FROM menu m
        JOIN categories c ON m.kategori_id = c.id
        ORDER BY m.id DESC
      `);
      res.json({ success: true, data: rows });
    } catch (err) {
      res.status(500).json({ success: false, message: err.message });
    }
  },

  getById: async (req, res) => {
    try {
      const [rows] = await db.query(`
        SELECT m.*, c.nama_kategori FROM menu m
        JOIN categories c ON m.kategori_id = c.id
        WHERE m.id = ?
      `, [req.params.id]);
      if (rows.length === 0) return res.status(404).json({ success: false, message: 'Menu not found' });
      res.json({ success: true, data: rows[0] });
    } catch (err) {
      res.status(500).json({ success: false, message: err.message });
    }
  },

  getByCategory: async (req, res) => {
    try {
      const [rows] = await db.query(`
        SELECT m.id, m.nama_menu, m.harga, m.kategori_id, c.nama_kategori
        FROM menu m
        JOIN categories c ON m.kategori_id = c.id
        WHERE m.kategori_id = ?
        ORDER BY m.id DESC
      `, [req.params.id]);
      res.json({ success: true, data: rows });
    } catch (err) {
      res.status(500).json({ success: false, message: err.message });
    }
  },

  getFood: async (req, res) => {
    try {
      const [rows] = await db.query(`
        SELECT m.id, m.nama_menu, m.harga, m.kategori_id, c.nama_kategori
        FROM menu m
        JOIN categories c ON m.kategori_id = c.id
        WHERE c.nama_kategori NOT IN ('Beverages / Drinks')
        ORDER BY c.id ASC, m.id DESC
      `);
      res.json({ success: true, data: rows });
    } catch (err) {
      res.status(500).json({ success: false, message: err.message });
    }
  },

  getDrinks: async (req, res) => {
    try {
      const [rows] = await db.query(`
        SELECT m.id, m.nama_menu, m.harga, m.kategori_id, c.nama_kategori
        FROM menu m
        JOIN categories c ON m.kategori_id = c.id
        WHERE c.nama_kategori = 'Beverages / Drinks'
        ORDER BY m.id DESC
      `);
      res.json({ success: true, data: rows });
    } catch (err) {
      res.status(500).json({ success: false, message: err.message });
    }
  },

  getDashboardStats: async (req, res) => {
    try {
      const [[totalMenu]] = await db.query('SELECT COUNT(*) as total FROM menu');
      const [[totalCategories]] = await db.query('SELECT COUNT(*) as total FROM categories');
      const [[totalFood]] = await db.query(`SELECT COUNT(*) as total FROM menu m JOIN categories c ON m.kategori_id = c.id WHERE c.nama_kategori != 'Beverages / Drinks'`);
      const [[totalDrinks]] = await db.query(`SELECT COUNT(*) as total FROM menu m JOIN categories c ON m.kategori_id = c.id WHERE c.nama_kategori = 'Beverages / Drinks'`);
      const [perCategory] = await db.query(`
        SELECT c.nama_kategori, COUNT(m.id) as total
        FROM categories c
        LEFT JOIN menu m ON c.id = m.kategori_id
        GROUP BY c.id, c.nama_kategori
        ORDER BY c.id ASC
      `);
      res.json({
        success: true,
        data: {
          totalMenu: totalMenu.total,
          totalCategories: totalCategories.total,
          totalFood: totalFood.total,
          totalDrinks: totalDrinks.total,
          perCategory
        }
      });
    } catch (err) {
      res.status(500).json({ success: false, message: err.message });
    }
  },

  create: async (req, res) => {
    try {
      const { nama_menu, harga, kategori_id } = req.body;
      if (!nama_menu || !harga || !kategori_id) {
        return res.status(400).json({ success: false, message: 'All fields are required' });
      }
      const [result] = await db.query(
        'INSERT INTO menu (nama_menu, harga, kategori_id) VALUES (?, ?, ?)',
        [nama_menu, harga, kategori_id]
      );
      res.json({ success: true, message: 'Menu item created successfully', id: result.insertId });
    } catch (err) {
      res.status(500).json({ success: false, message: err.message });
    }
  },

  update: async (req, res) => {
    try {
      const { nama_menu, harga, kategori_id } = req.body;
      if (!nama_menu || !harga || !kategori_id) {
        return res.status(400).json({ success: false, message: 'All fields are required' });
      }
      await db.query(
        'UPDATE menu SET nama_menu = ?, harga = ?, kategori_id = ? WHERE id = ?',
        [nama_menu, harga, kategori_id, req.params.id]
      );
      res.json({ success: true, message: 'Menu item updated successfully' });
    } catch (err) {
      res.status(500).json({ success: false, message: err.message });
    }
  },

  delete: async (req, res) => {
    try {
      await db.query('DELETE FROM menu WHERE id = ?', [req.params.id]);
      res.json({ success: true, message: 'Menu item deleted successfully' });
    } catch (err) {
      res.status(500).json({ success: false, message: err.message });
    }
  }
};

module.exports = menuController;
