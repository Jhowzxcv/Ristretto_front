const router=require('express').Router();
const userController=require('../controllers/user');

router.get('/',userController.getAllUsers);
router.get('/:id',userController.getUserById);
router.post('/',userController.createUser);

module.exports=router;
