const bycrypt=require('bcryptjs');

const db =require('../../models')
const Student = db.students


const studDisplay=async(req,res)=>{
   

   

        Student.findAll() 
        .then((student) => {
          if (!student) {
            return res.status(400).send({ 
              status:"102", 
              message: "company Not found." });
          }
          res.status(200).send({
            status:"VB100",
            student: student});
        })
        .catch((err) => {
          res.status(500).send({ message: err.message });
        });
    

    };



module.exports={studDisplay};