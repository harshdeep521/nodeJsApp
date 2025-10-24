const express = require('express');
const { getData } = require('../controllers/getController');
console.log('getData:', getData);
const router = express.Router();
router.get('/data', getData);
 module.exports = router;