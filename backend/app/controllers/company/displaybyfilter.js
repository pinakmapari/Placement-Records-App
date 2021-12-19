const bycrypt=require('bcryptjs');

const db =require('../../models')
const Company = db.company
const { Op } = require("sequelize");


const coDisplay=async(req,res)=>{
       //let location = req.body.location;
       //let year = req.body.year;
      // //let department = req.body.department;
      // let ctcFrom = req.body.ctcFrom;
      // let ctcTo=req.body.ctcTo;
      //let options = { where:  {} };
      let w={};
      if (req.body.location)
          w.location = req.body.location
      if (req.body.ctcFrom && req.body.ctcTo)
          w.ctc_offered = {[Op.between]: [req.body.ctcFrom, req.body.ctcTo] }
      if (req.body.year)
          w.year = req.body.year

   

        Company.findAll({
            // where:{
            //   //location:req.body.location,
            //   //   year:req.body.year
              
             
            // }
            where: w
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