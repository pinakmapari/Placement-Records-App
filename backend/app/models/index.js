const Sequelize = require("sequelize");
const config = require("../config/db.config");

const sequelize = new Sequelize(config.DB, config.USER, config.PASSWORD, {
  host: config.HOST,
  dialect: config.dialect,
  operatorsAliases: false,

  pool: {
    max: config.pool.max,
    min: config.pool.min,
    acquire: config.pool.acquire,
    idle: config.pool.idle,
  },
});

// Connect all the models/tables in the database to a db object,
//so everything is accessible via one object
const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

//Models/tables
db.users = require("./users")(sequelize, Sequelize);
db.company=require("./company")(sequelize, Sequelize);
db.students=require("./students")(sequelize, Sequelize);
db.department=require("./department")(sequelize, Sequelize);


module.exports = db;
