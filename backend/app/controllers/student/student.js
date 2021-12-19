const bycrypt=require('bcryptjs');
const db =require('../../models')
const Student = db.students;


const stud=async(req,res)=>{
   
    //let id=req.params.id;
    //console.log(id);

    try {
        const student = {
            
          
            student_name: req.body.student_name, 
            department: req.body.department,
            skillset: req.body.skillset,
            student_mail:req.body.student_mail,
            
            
            
        };


       return Student.create(student).then(function () {
        console.log("student saved to DB.")




        Student.findOne({
            //where: { student_id },
            order: [ [ 'createdAt', 'DESC' ]],
          }) 
          .then((student) => {
            if (!student) {
              return res.status(400).send({ 
                status:"102", 
                message: "student Not found." });
            }
            res.status(200).send({
            status:"VB100",
            message: "student saved Successfully ",
            student
            });
          })
    }); 
   
} catch (err) {
    console.error(err.message);
    res.json({
        status:"102",
        msg: err.message
    })
}


}

  


module.exports={stud};