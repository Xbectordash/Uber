const http = require("http");
const app = require("./app");
const port = process.env.PORT || 3000;
const server = http.createServer(app);
const { initializeSocket } = require("./socket");

initializeSocket(server);

server
  .listen(port, () => {
    console.log(`Server running on port ${port}`);
  })
  .on("error", (err) => {
    if (err.code === "EADDRINUSE") {
      console.error(`Port ${port} is already in use.`);
    } else {
      console.error("Server error:", err);
    }
  });
