const bycrypt=require('bcryptjs');

const db =require('../../models')
const Dept = db.department


const coDisplay=async(req,res)=>{
   

   

        Department.findAll() 
        .then((dept) => {
          if (!dept) {
            return res.status(400).send({ 
              status:"102", 
              message: "company Not found." });
          }
          res.status(200).send({
            status:"VB100",
            dept: dept});
        })
        .catch((err) => {
          res.status(500).send({ message: err.message });
        });
    

    };



module.exports={coDisplay};