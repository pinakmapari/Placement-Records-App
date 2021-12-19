const bycrypt=require('bcryptjs');
const db =require('../../models')
const Department = db.department;


const co=async(req,res)=>{
   
    //let id=req.params.id;
    //console.log(id);

    try {
        const department = {
            
            //order_id: req.body.order_id,
            department_name: req.body.department_name, 
            
            
        };


       return Department.create(department).then(function () {
        console.log("dept saved to DB.")



     Department.findOne({
            
              order: [ [ 'createdAt', 'DESC' ]],
            
            
          }) 
          .then((department) => {
            if (!department) {
              return res.status(400).send({ 
                status:"102", 
                message: "dept Not found." });
            }
            res.status(200).send({
            status:"VB100",
            message: "dept saved Successfully ",
              department
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