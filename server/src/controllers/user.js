const User=require('../models/user');

const getAllUsers=async(req,res)=>{
  try{
    const users=await User.findAll();
    return res.json(users);
  }catch(err){
    res.status(500).json({error:err.message});
  }

};

const getUserById=async(req,res)=>{
  try{
    const user=await User.findByPk(req.params.id);
    if(!user)return res.status(404).json({error:'user not found'});
    return res.json(user);
  }catch(err){
    res.status(500).json({error:err.message});
  }
};

const createUser=async(req,res)=>{
  try{
    const {name,email,password}=req.body;
    const user=await User.create({name,email,password});
    res.status(201).json(user);
  }catch(err){
    res.status(500).json({error:err.message});
  }
};

module.exports={
  createUser,
  getAllUsers,
  getUserById,
};
