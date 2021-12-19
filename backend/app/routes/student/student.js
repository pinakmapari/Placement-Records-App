const express= require('express');
const router=express.Router();      //express router
const studController=require('../../controllers/student/student')



//register
router.post('/',studController.stud);



module.exports=router;