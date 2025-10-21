const Category=require('../models/category');

// Get all Categories from all Users
const getAllCategories=async(req,res)=>{
  try{
    const categories=await Category.findAll();

    return res.json(categories);
  }catch(err){
    return res.status(500).json({err:err.message});
  }
};

// Get all Categories for Authenticated User
const getAllCategoriesByUser=async(req,res)=>{
  const userId=req.userId;

  try{
    const result=await Category.findAll({
      where:{
        'user_id':userId,
      },
    });

    return res.json(result);
  }catch(err){
    return res.status(500).json({error:err.message});
  }
};

// Create Category for Authenticated User
const createCategory=async(req,res)=>{
  const userId=req.userId;
  const {name,color}=req.body;

  console.log('POST /categories');
  console.log(name,color);

  try{
    const category=await Category.create({
      name,
      color,
      user_id:userId,
    });

    return res.json(category);
  }catch(err){
    console.log('not ok');
    return res.status(500).json({error:err.message});
  }
};

module.exports={
  getAllCategories,
  getAllCategoriesByUser,
  createCategory,
};
