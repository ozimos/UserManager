var mongoose = require('mongoose');
var options = {
    useMongoClient: true,
    autoIndex: false, // Don't build indexes
    reconnectTries: 20, // stop trying to reconnect after 20 tries
    reconnectInterval: 2000, // Reconnect every 2000ms
    poolSize: 10, // Maintain up to 10 socket connections
    // If not connected, return errors after waiting 2 reconnects
    bufferMaxEntries: 2
  };

const reconnectTimeout = 5000; // ms.

function connect() {
  mongoose.connect(process.env.DB_URL, options)
    .catch(() => {}); // Catch the warning, no further treatment is required
                      // because the Connection events are already doing this
                      // for us.
}

const dbConnection = mongoose.connection;

dbConnection.on('connecting', () => {
  console.info('Connecting to MongoDB...');
});

dbConnection.on('error', (error) => {
  console.error(`MongoDB connection error: ${error}`);
  mongoose.disconnect();
});

dbConnection.on('connected', () => {
  console.info('Connected to MongoDB!');
});

dbConnection.once('open', () => {
  console.info('MongoDB connection opened!');
});

dbConnection.on('reconnected', () => {
  console.info('MongoDB reconnected!');
});

dbConnection.on('disconnected', () => {
  console.error(`MongoDB disconnected! Reconnecting in ${reconnectTimeout / 1000}s...`);
  setTimeout(() => connect(), reconnectTimeout);
});

connect();