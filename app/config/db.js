require('dotenv').config();
const { Pool } = require('pg')
const pool = new Pool({
	user: process.env.PGUSER || "postgres",
	password: process.env.PGPASSWORD || "niniPGM271195",
	database: process.env.PGDATABASE || "SoigneMoi",
	host: process.env.PGHOST || "localhost",
	port: process.env.PGPORT || 5432,
	ssl: false
});

module.exports = {
    originalClient: pool,
    async query(...params) {
        return this.originalClient.query(...params);
    },
};