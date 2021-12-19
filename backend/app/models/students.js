const Sequelize = require("sequelize");

//company placed in 
//year of passing


const students = (sequelize)=> {
return sequelize.define("students", {
 
  student_id: {
    type: Sequelize.INTEGER,

    autoIncrement: true,

    
    allowNull: false,

    
    primaryKey: true,
  },

  student_name: { 
    type: Sequelize.STRING,
    allowNull: false, 
    
  },
  department: { 
    type: Sequelize.STRING,
    allowNull: false, 
    
  },
  skillset: { 
    type: Sequelize.STRING,
    allowNull: false, 
    
  },
  student_mail: { 
    type: Sequelize.STRING,
    allowNull: false, 
    //foreign key
  },
  
});



};

module.exports = students;