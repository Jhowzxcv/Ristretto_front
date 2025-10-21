const router=require('express').Router();

const categoryController=require('../controllers/category');
const {requireAuth}=require('../middlewares/auth');

router.get('/damn',categoryController.getAllCategories);
router.get('/',requireAuth,categoryController.getAllCategoriesByUser);
router.post('/',requireAuth,categoryController.createCategory);

module.exports=router;
