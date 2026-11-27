# Cotizador Dinámico de Manufactura - Laboratorios MyN SAS

Plataforma web para la automatización del costeo de lotes de maquila cosmética, gestión de tarifas anuales (SMLMV/IPC), autorización comercial con emisión de PDF y trazabilidad de estados.

## Stack Tecnológico
- **Frontend:** HTML5, Tailwind CSS, JavaScript (ES6+), html2pdf.js
- **Backend:** Node.js, Express.js (Arquitectura API REST en capas)
- **Base de Datos:** PostgreSQL 19 (Puerto `5433`)

## Estructura del Repositorio
- `/frontend`: Interfaz web SPA (Login, Dashboard, Cotizador Maquila, Autorización/PDF y Módulo de Tarifas).
- `/backend`: Servidor API REST, controladores y conexión a PostgreSQL.
- `/database`: Scripts SQL de creación de tablas (`DDL`), datos reales (`DML`) y consultas de auditoría.
- `/docs`: Diagramas arquitectónicos C4, Modelo Relacional (`.drawio`) y documentación de requisitos.