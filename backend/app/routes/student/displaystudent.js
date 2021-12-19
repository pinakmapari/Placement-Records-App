const express= require('express');
const router=express.Router();      //express router
const stDisplayer=require('../../controllers/student/displaystudent')


//register
router.get('/',stDisplayer.studDisplay);

module.exports=router;