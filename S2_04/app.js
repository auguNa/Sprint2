const { MongoClient } = require('mongodb');

// Connection URL
const url = 'mongodb://localhost:27017';
const client = new MongoClient(url);

// Database Name
const dbName = 'restaurants';

async function main() {
  // Use connect method to connect to the server
  await client.connect();
  console.log('Connected successfully to server');
  const db = client.db(dbName);
  const collection = db.collection('restaurants');

  // Query: Show all documents in the 'restaurants' collection
  const findResult = await collection.find({}).toArray();
  console.log('Found documents =>', findResult);

  // Close the connection
  await client.close();
}

main().catch(console.error);
