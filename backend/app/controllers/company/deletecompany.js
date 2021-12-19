const db =require('../../models')
const Company = db.company
const { Op } = require("sequelize");



const deleteCompany=async(req,res)=>{
    
    try {
        const company = {
            //user_id: id,
            
            company_id: req.body.company_id,
            
            
            
         
            
        };
   
    
        

        Company.destroy({
           
           where:{
            company_id: req.body.company_id,
            //  order_status: {
            //         [Op.or]: ["Processing", "Scheduled"]
            //     },

           },
        })
        
        .then((company) => {
            
          if (!company) {
            return res.status(400).send({ 
              status:"102", 
              message: "company cannot be deleted." ,
               });
          }
          else{
              
        
          res.status(200).send({
            status:"VB100",
            message: "company successfully deleted.",
            company_id: req.body.company_id,
            
         });
        }
    })
        .catch((err) => {
          res.status(500).send({ message: err.message });
        });
    }catch (err) {
        console.error(err.message);
        res.json({
            status:"102",
            msg: err.message
        })
    }

    };





module.exports={deleteCompany};