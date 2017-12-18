var mongoose = require('mongoose');
var options = {
    useMongoClient: true,
    autoIndex: false, // Don't build indexes
    reconnectTries: Number.MAX_VALUE, // Never stop trying to reconnect
    reconnectInterval: 500, // Reconnect every 500ms
    poolSize: 10, // Maintain up to 10 socket connections
    // If not connected, return errors immediately rather than waiting for reconnect
    bufferMaxEntries: 0
  };
mongoose.connect(process.env.DB_URL, options);

var dbConnection = mongoose.connection;

dbConnection.on("error", console.error.bind(console, "Database Connection error:"));
dbConnection.once("open", function(callback){
    console.log("Database Connection Succeeded."); 
 });