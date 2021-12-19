const express= require('express');
const router=express.Router();      //express router
const coDelete=require('../../controllers/company/deletecompany')


//register
router.post('/',coDelete.deleteCompany);



module.exports=router;