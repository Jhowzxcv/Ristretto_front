const {DataTypes}=require('sequelize');
const database=require('../config/database');

const Todo=database.define('Todo',{
  title:{
    type:DataTypes.STRING,
    allowNull:false,
  },
  isComplete:{
    type:DataTypes.BOOLEAN,
    allowNull:false,
  },
});

module.exports=Todo;
