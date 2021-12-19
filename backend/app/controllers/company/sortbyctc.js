const bycrypt=require('bcryptjs');

const db =require('../../models')
const Company = db.company


const coDisplay=async(req,res)=>{
   

   

        Company.findAll ({
            order: [ [ 'ctc_offered', 'DESC' ]],
        })

        
        .then((company) => {
          if (!company) {
            return res.status(400).send({ 
              status:"102", 
              message: "company Not found." });
          }
          res.status(200).send({
            status:"VB100",
            company: company});
        })
        .catch((err) => {
          res.status(500).send({ message: err.message });
        });
    

    };



module.exports={coDisplay};