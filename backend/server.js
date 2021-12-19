const express = require("express");
const bodyParser = require("body-parser");
// const cors = require("cors");
const app = express();
const sequelize = require("sequelize");

app.use(bodyParser.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

//database
const db = require("./app/models");

db.sequelize.sync();
// app.use(express.json({extended:false}))

const PORT = process.env.PORT || 5001;

app.get("/", (req, res) => {
  res.json({ msg: "Welcome to Logistic Application NEWW." }); //send response to client after client makes a get request "/" through localhost5000 //send in json format ie. object
});

//define routes

app.use("/api/users/register", require("./app/routes/users/register"));
app.use("/api/users/login", require("./app/routes/users/login"));
app.use(
  "/api/company/company",
  require("./app/routes/company/company")
);
app.use(
  "/api/company/displaycompany",
  require("./app/routes/company/displaycompany")
);
app.use(
  "/api/company/deletecompany",
  require("./app/routes/company/deletecompany")
);
app.use(
  "/api/student/student",
  require("./app/routes/student/student")
);
app.use(
  "/api/company/sortbyctc",
  require("./app/routes/company/sortbyctc")
);
app.use(
  "/api/student/displaystudent",
  require("./app/routes/student/displaystudent")
);
app.use(
  "/api/department/department",
  require("./app/routes/department/department")
);
app.use(
  "/api/company/displaybyfilter",
  require("./app/routes/company/displaybyfilter")
);
app.use(
  "/api/company/ctcabove10",
  require("./app/routes/company/ctcabove10")
);
app.use(
  "/api/company/ctcbelow10",
  require("./app/routes/company/ctcbelow10")
);



app.listen(PORT, () => console.log(`Server started on port ${PORT}`));
