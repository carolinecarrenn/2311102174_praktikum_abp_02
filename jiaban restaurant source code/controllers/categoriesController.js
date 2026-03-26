const db = require('../config/database');

const categoriesController = {
  getAll: async (req, res) => {
    try {
      const [rows] = await db.query('SELECT * FROM categories ORDER BY id ASC');
      res.json({ success: true, data: rows });
    } catch (err) {
      res.status(500).json({ success: false, message: err.message });
    }
  },

  create: async (req, res) => {
    try {
      const { nama_kategori } = req.body;
      if (!nama_kategori) return res.status(400).json({ success: false, message: 'Category name is required' });
      const [result] = await db.query('INSERT INTO categories (nama_kategori) VALUES (?)', [nama_kategori]);
      res.json({ success: true, message: 'Category created successfully', id: result.insertId });
    } catch (err) {
      res.status(500).json({ success: false, message: err.message });
    }
  },

  update: async (req, res) => {
    try {
      const { id } = req.params;
      const { nama_kategori } = req.body;
      if (!nama_kategori) return res.status(400).json({ success: false, message: 'Category name is required' });
      await db.query('UPDATE categories SET nama_kategori = ? WHERE id = ?', [nama_kategori, id]);
      res.json({ success: true, message: 'Category updated successfully' });
    } catch (err) {
      res.status(500).json({ success: false, message: err.message });
    }
  },

  delete: async (req, res) => {
    try {
      const { id } = req.params;
      const [menuCount] = await db.query('SELECT COUNT(*) as count FROM menu WHERE kategori_id = ?', [id]);
      if (menuCount[0].count > 0) {
        return res.status(400).json({ success: false, message: 'Cannot delete category with existing menu items' });
      }
      await db.query('DELETE FROM categories WHERE id = ?', [id]);
      res.json({ success: true, message: 'Category deleted successfully' });
    } catch (err) {
      res.status(500).json({ success: false, message: err.message });
    }
  }
};

module.exports = categoriesController;
