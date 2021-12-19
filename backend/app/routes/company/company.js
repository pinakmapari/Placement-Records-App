const express= require('express');
const router=express.Router();      //express router
const companyController=require('../../controllers/company/company')



//register
router.post('/',companyController.co);



module.exports=router;