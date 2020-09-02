const express = require("express");
const app = express();
const port = 80;

app.get("/", (req, res) => {
  res.send("Hello World! This is front end!");
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
