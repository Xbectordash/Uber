const { Server } = require("socket.io");
const userModel = require("./model/user.model");
const captainModel = require("./model/captain.model");

let io = null;

function initializeSocket(server) {
  io = new Server(server, {
    cors: {
      origin: "*",
      methods: ["GET", "POST"],
    },
  });

  io.on("connection", (socket) => {
    console.log("A user connected:", socket.id);
    socket.on("join", async (data) => {
      const { userID, userType } = data;
      if (userType === "user") {
        await userModel.findByIdAndUpdate(userID, { socketId: socket.id });
        console.log("User model updated:", userModel);
      } else if (userType === "captain") {
        await captainModel.findByIdAndUpdate(userID, { socketId: socket.id });
        console.log("Captain model updated:", captainModel);
      }
    });
    socket.on('update-location-captain',async(data)=>{
        const { userID, location } = data;
        socket.emit('update-location-captain from server received',location)
        if(!location || !location.ltd || !location.lng){
            return socket.emit('error','Invalid location data')
        }
      await captainModel.findByIdAndUpdate(userID, { location: { ltd: location.ltd, lng: location.lng } });
      console.log("Captain model updated:", captainModel);
    })  

    socket.on("disconnect", () => {
      console.log("User disconnected:", socket.id);
    });
  });
}

function sendMessageToSocket(socketId, event, messageObject) {
  if (io && io.sockets && io.sockets.sockets.get(socketId)) {
    io.sockets.sockets.get(socketId).emit(messageObject.event, messageObject.data);
  } else {
    console.warn("Socket not found or io not initialized");
  }
}

module.exports = {
  initializeSocket,
  sendMessageToSocket,
};
