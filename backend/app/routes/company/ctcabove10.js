const express= require('express');
const router=express.Router();      //express router
const companyController=require('../../controllers/company/ctcabove10')



//register
router.get('/',companyController.coDisplay);



module.exports=router;