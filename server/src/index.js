// Configure .env
const path=require('path');
const dotenvPath=path.join(
  __dirname,
  '.env.development',
);
require('dotenv').config({path:dotenvPath});

// Create App
const express=require('express');
const app=express();
app.use(express.json());

// Configure Router
const router=require('./routes/');
app.use(router);

// Check Database Connection
const sequelize=require('./config/database');
sequelize.authenticate()
  .then(async()=>{
    console.log('database successfully connected')
    require('./models/index');
    // await sequelize.sync({force:true,alter:true});
    await sequelize.sync();
  })
  .catch((err)=>console.log('unable to connect to database: '+err));

// Run App
const PORT=process.env.PORT;
app.listen(PORT,()=>{
  console.log('App Running :)');
});
