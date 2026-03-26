
require('dotenv').config();
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

// Routes
app.use('/api/categories', require('./routes/categories'));
app.use('/api/menu', require('./routes/menu'));

// Serve frontend pages
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.get(['/menu', '/menu.html'], (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'menu.html'));
});

app.get(['/categories', '/categories.html'], (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'categories.html'));
});

app.get(['/insights', '/insights.html'], (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'insights.html'));
});

app.get(['/form-menu', '/form-menu.html'], (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'form-menu.html'));
});

app.get(['/about', '/about.html'], (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'about.html'));
});

app.listen(PORT, () => {
  console.log(`
  加班 | JIABAN — Premium Cafe Management System`);
  console.log(`  Server running at http://localhost:${PORT}
`);
});
