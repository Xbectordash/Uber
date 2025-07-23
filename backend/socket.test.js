const { io } = require("socket.io-client");

const socket = io("http://localhost:4000"); // Replace with your server URL/port

const captainId = "68554ac1aa7230db336e701d"; // Replace with your actual captain user ID

socket.on("connect", () => {
  console.log("✅ Connected:", socket.id);

  // 1. Emit join event as captain
  socket.emit("join", {
    userID: captainId,
    userType: "captain",
  });

  // 2. Start sending simulated live location updates
  let ltd = 19.0632517; ; // starting lat
  let lng = 72.9988553; // starting lng

  setInterval(() => {
    // ltd += Math.random() * 0.0005; // simulate slight movement
    // lng += Math.random() * 0.0005;

    const location = {
      ltd: ltd,
      lng: lng,
    };

    socket.emit("update-location-captain", {
      userID: captainId,
      location,
    });

    console.log("📍 Sent location update:", location);
  }, 3000); // every 3 seconds
});

socket.on("error", (message) => {
  console.error("❌ Server error:", message);
});

socket.on("disconnect", () => {
  console.log("🚫 Disconnected");
});
