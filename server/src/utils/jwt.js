const jwt=require('jsonwebtoken');

const generateAccessToken=(userId)=>{
  console.log(123);
  
  const accessToken=jwt.sign(
    {userId},
    process.env.JWT_SECRET,
    {expiresIn:'40min'},
  );

  return accessToken;
};

module.exports={generateAccessToken};
