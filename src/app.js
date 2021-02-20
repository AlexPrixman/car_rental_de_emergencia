const express = require('express');
const path = require('path');
const morgan = require('morgan');
const mysql = require('mysql');
const myConnection = require('express-myconnection');

const app = express();

//Let's handle the settings
app.set('port', process.env.PORT || 3000);
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

//Now let's handle the middlewares
app.use(morgan('dev'));
app.use(myConnection(mysql, {
    host: 'localhost',
    user: 'eventura',
    password: '0102',
    port: 3307,
    database: 'car_rental_exoneracion'
}, 'single'));

//Here are the routes

app.listen(app.get('port'), () => {
    console.log("El servidor esta funcionando en el puerto 3000.");
});

