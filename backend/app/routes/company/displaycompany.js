const express= require('express');
const router=express.Router();      //express router
const coDisplayer=require('../../controllers/company/displaycompany')


//register
router.get('/',coDisplayer.coDisplay);

module.exports=router;