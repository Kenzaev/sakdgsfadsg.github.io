const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// MySQL connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root', // Замените на ваш пароль
    database: 'my_website_db'
});

db.connect(err => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
        throw err;
    }
    console.log('Connected to MySQL');
});

// Routes
app.get('/products', (req, res) => {
    db.query('SELECT * FROM products', (err, results) => {
        if (err) {
            console.error('Error fetching products:', err);
            return res.status(500).json({ error: err.message });
        }
        res.json(results);
    });
});

app.post('/products', (req, res) => {
    const { name, price, video, image, isRecommended } = req.body;

    console.log('Received data:', { name, price, video, image, isRecommended });

    if (!name || !price || !video || !image || isRecommended === undefined) {
        return res.status(400).json({ error: 'Missing required fields' });
    }

    db.query(
        'INSERT INTO products (name, price, video, image, isRecommended) VALUES (?, ?, ?, ?, ?)',
        [name, price, video, image, isRecommended],
        (err, result) => {
            if (err) {
                console.error('Error inserting product:', err);
                return res.status(500).json({ error: err.message });
            }
            res.json({ id: result.insertId, name, price, video, image, isRecommended });
        }
    );
});

app.delete('/products/:id', (req, res) => {
    const { id } = req.params;
    db.query('DELETE FROM products WHERE id = ?', [id], (err, result) => {
        if (err) {
            console.error('Error deleting product:', err);
            return res.status(500).json({ error: err.message });
        }
        res.json({ message: 'Product deleted' });
    });
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
