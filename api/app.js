const express = require("express");
const app = express();
const port = 3000;

app.get("/api/hello", (req, res) => {
  res.json({
    message: {
      text: "Hello world!",
    },
  });
});

app.listen(port, () => {
  console.log(`API running on port ${port}`);
});
