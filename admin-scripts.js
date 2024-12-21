body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    text-align: center;
    background-color: #f4f4f4;
}

header {
    background-color: #4CAF50;
    color: white;
    padding: 1em 0;
}

.admin-form {
    margin: 2em auto;
    width: 80%;
    max-width: 600px;
    text-align: left;
}

.admin-form h2 {
    text-align: center;
}

.admin-form label {
    display: block;
    margin-top: 1em;
}

.admin-form input {
    width: 100%;
    padding: 0.5em;
    margin-top: 0.5em;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.admin-form button {
    background: linear-gradient(to right, #4CAF50, #45a049);
    color: white;
    border: none;
    padding: 1em;
    margin-top: 1em;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1em;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: background 0.3s, transform 0.3s, box-shadow 0.3s;
}

.admin-form button:hover {
    background: linear-gradient(to right, #45a049, #4CAF50);
    transform: translateY(-2px);
    box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
}

.admin-form button:active {
    background: linear-gradient(to right, #388E3C, #4CAF50);
    transform: translateY(0);
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.product-list {
    margin: 2em auto;
    width: 80%;
    max-width: 600px;
    text-align: left;
}

.product-list h2 {
    text-align: center;
}

.product-item {
    border: 1px solid #ccc;
    padding: 1em;
    margin-top: 1em;
    border-radius: 4px;
    position: relative;
}

.product-item img {
    max-width: 100%;
    border-radius: 4px;
}

.product-item-name {
    font-size: 1.2em;
    margin-top: 0.5em;
}

.product-item-price {
    font-size: 1em;
    color: #4CAF50;
    margin-top: 0.5em;
}

.product-item-delete {
    position: absolute;
    top: 10px;
    right: 10px;
    background: linear-gradient(to right, #ff6347, #ff4500);
    color: white;
    border: none;
    padding: 0.5em;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1em;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: background 0.3s, transform 0.3s, box-shadow 0.3s;
}

.product-item-delete:hover {
    background: linear-gradient(to right, #ff4500, #ff6347);
    transform: translateY(-2px);
    box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
}

.product-item-delete:active {
    background: linear-gradient(to right, #e57373, #ff4500);
    transform: translateY(0);
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

