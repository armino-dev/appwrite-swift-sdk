/// Swift Appwrite SDK
/// Produced by Appwrite SDK Generator
///


var client: Client = Client()

client
    .setProject(value: "")
    .setEndpoint(endpoint: "http://localhost/v1")

var storage: Storage =  Storage(client: client);

var result = storage.getFileView(_fileId: "[FILE_ID]");
