const Sequelize = require("sequelize");

const departments = (sequelize)=> {
return sequelize.define("departments", {
 
  department_id: {
    type: Sequelize.INTEGER,

    autoIncrement: true,

    
    allowNull: false,

    
    primaryKey: true,
  },

  department_name: { 
    type: Sequelize.STRING,
    allowNull: false, 
    
  },
  
  
});



};

module.exports = departments;