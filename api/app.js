const express = require("express");
const app = express();
const port = 3000;

app.get("/", (req, res) => {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.json({
    message: {
      text: "Hello world!",
    },
  });
});

app.post("/", (req, res) => {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.json({
    message: {
      text: "Hello world!",
    },
  });
});

app.options("/", (req, res) => {
  // Preflight responses must include these headers
  // Simply echo values from the original request
  res.setHeader("Access-Control-Allow-Origin", req.headers["origin"]);
  res.setHeader(
    "Access-Control-Allow-Methods",
    req.headers["access-control-request-method"]
  );
  res.setHeader(
    "Access-Control-Allow-Headers",
    req.headers["access-control-request-headers"]
  );

  res.send();
});

app.listen(port, () => {
  console.log(`API running on port ${port}`);
});
