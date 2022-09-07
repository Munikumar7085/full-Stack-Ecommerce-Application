const http = require("http");
const app = require("./app");
const server = http.createServer(app);

const mongoose = require("mongoose");
const PORT = 4444;
const DATABASE_URI =
  "mongodb+srv://nasa_api:0iH9p6JsOuR4yauW@amazonclone.srrk4hd.mongodb.net/?retryWrites=true&w=majority";



async function connectDatabase() {
  await mongoose.connect(DATABASE_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  }, () => {
      console.log("connected database");
  });
}
connectDatabase();
server.listen(PORT, "0.0.0.0", () => {
  console.log(`Server listening on port ${PORT}`);
});
