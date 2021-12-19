const bycrypt=require('bcryptjs');
const db =require('../../models')
const Company = db.company;


const co=async(req,res)=>{
   
    //let id=req.params.id;
    //console.log(id);

    try {
        const company = {
            
            //order_id: req.body.order_id,
            company_name: req.body.company_name, 
            cgpa_cutoff: req.body.cgpa_cutoff,
            hr_mail: req.body.hr_mail,
            ctc_offered:req.body.ctc_offered,
            role:req.body.role,
            domain:req.body.domain,
            year:req.body.year,
            location:req.body.location
            
            
        };


       return Company.create(company).then(function () {
        console.log("company saved to DB.")




        Company.findOne({
            
              order: [ [ 'createdAt', 'DESC' ]],
            
            
          }) 
          .then((company) => {
            if (!company) {
              return res.status(400).send({ 
                status:"102", 
                message: "company Not found." });
            }
            res.status(200).send({
            status:"VB100",
            message: "company saved Successfully ",
              company
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

  


module.exports={co};