const Sequelize = require("sequelize");

//no of students placed
//creating company table with attributes

const company = (sequelize)=> {
return sequelize.define("company", {
 
  company_id: {
    type: Sequelize.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true,
  },
 
  company_name: { 
    type: Sequelize.STRING,
    allowNull: false, 
    
  },
  cgpa_cutoff: { 
    type: Sequelize.FLOAT,
     
    
  },

  location:{
    type:Sequelize.STRING,
  },

  hr_mail: { 
    type: Sequelize.STRING,
    allowNull: false, 
    
  },

  ctc_offered: { 
    type: Sequelize.FLOAT,
    allowNull: false, 
    
  },
  role: { 
    type: Sequelize.STRING,
    allowNull: false, 
    
  },
  domain: { 
    type: Sequelize.STRING,
    allowNull: false, 
    
  },

  year: { 
    type: Sequelize.STRING,
    allowNull: false, 
    //foreign key
  },
  
});



};

module.exports = company;