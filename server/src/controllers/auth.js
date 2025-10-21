const jwt=require('jsonwebtoken');
const User=require('../models/user');
const {generateAccessToken}=require('../utils/jwt');

const login=async(req,res)=>{
  const {email,password}=req.body;
  console.log(email,password);

  const user=await User.findOne({
    where:{email,password},
  });

  if(!user)return res
    .status(401)
    .json({error:'email and password do not match'});

  const accessToken=generateAccessToken(user.id);

  res.json({accessToken});
};

const logout=async(req,res)=>{};

const refreshAccessToken=async(req,res)=>{};

const testAccessToken=async(req,res)=>{
  res.json('access token is valid and hasn\'t expired');
};

module.exports={
  login,
  logout,
  refreshAccessToken,
  testAccessToken,
};
