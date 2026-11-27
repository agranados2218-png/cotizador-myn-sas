const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
    host: process.env.DB_HOST || 'localhost',
    port: process.env.DB_PORT || 5433,
    database: process.env.DB_NAME || 'postgres',
    user: process.env.DB_USER || 'postgres',
    password: process.env.DB_PASSWORD
});

pool.connect()
    .then(() => console.log('✅ Conectado exitosamente a PostgreSQL en el puerto 5433'))
    .catch(err => console.error('❌ Error de conexión a PostgreSQL:', err.message));

module.exports = pool;