const express= require('express');
const router=express.Router();      //express router
const deptController=require('../../controllers/department/department')



//register
router.post('/',deptController.co);



module.exports=router;