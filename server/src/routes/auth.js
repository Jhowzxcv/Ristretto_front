const router=require('express').Router();
const authController=require('../controllers/auth');
const {requireAuth}=require('../middlewares/auth');

router.post('/login',authController.login);
router.post('/logout',authController.logout);
router.post('/refresh-access-token',authController.refreshAccessToken);

router.get('/test-access-token',requireAuth,authController.testAccessToken);

module.exports=router;
