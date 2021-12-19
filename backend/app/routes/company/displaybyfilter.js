const express= require('express');
const router=express.Router();      //express router
const companyController=require('../../controllers/company/displaybyfilter')



//register
router.post('/',companyController.coDisplay);



module.exports=router;