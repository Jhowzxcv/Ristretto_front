const User=require('./user');
const Category=require('./category');

User.hasMany(Category,{foreignKey:'user_id'});
Category.belongsTo(User,{foreignKey:'user_id'});
