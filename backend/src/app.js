const express = require('express');
const cors = require('cors');
require('dotenv').config();
const pool = require('./config/db');

const app = express();
app.use(cors());
app.use(express.json());

// Endpoint de consulta multitabla (JOIN) de cotizaciones
app.get('/api/cotizaciones', async (req, res) => {
    try {
        const result = await pool.query(`
            SELECT c.id_cotizacion, c.cliente_nombre, c.producto_nombre, 
                   dc.unidades_producir, c.total_general, c.estado
            FROM cotizacion c
            INNER JOIN detalle_cotizacion dc ON c.id_cotizacion = dc.id_cotizacion
            ORDER BY c.id_cotizacion DESC
        `);
        res.json(result.rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Endpoint para reajuste salarial anual (SMLMV / IPC)
app.put('/api/tarifas/reajuste', async (req, res) => {
    const { porcentaje } = req.body;
    const factor = 1 + (parseFloat(porcentaje) / 100);
    try {
        await pool.query('UPDATE usuario SET valor_hora = ROUND(valor_hora * $1, 2) WHERE id_rol IN (2, 3)', [factor]);
        res.json({ mensaje: `Reajuste anual del ${porcentaje}% aplicado correctamente en PostgreSQL.` });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`🚀 Servidor Backend M&N Laboratories corriendo en http://localhost:${PORT}`);
});