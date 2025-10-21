const {DataTypes}=require('sequelize');
const database=require('../config/database');

const category=database.define('Category',{
  name:{
    type:DataTypes.STRING(30),
    allowNull:false,
  },
  color:{
    type:DataTypes.STRING(10),
    allowNull:false,
  },
});

module.exports=category;
