const express= require('express');
const router=express.Router();      //express router
const coDisplayer=require('../../controllers/department/displaydepartment')


//register
router.get('/',coDisplayer.coDisplay);

module.exports=router;