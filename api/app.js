const express = require("express");
const app = express();
const port = 3000;

app.get("/", (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.json({
    message: {
      text: "Hello world!",
    },
  });
});

app.listen(port, () => {
  console.log(`API running on port ${port}`);
});
