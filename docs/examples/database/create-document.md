/// Swift Appwrite SDK
/// Produced by Appwrite SDK Generator
///


var client: Client = Client()

client
    .setProject(value: "")
    .setEndpoint(endpoint: "http://localhost/v1")

var database: Database =  Database(client: client);

var result = database.createDocument(_collectionId: "[COLLECTION_ID]", _data: , _read: [], _write: []);
