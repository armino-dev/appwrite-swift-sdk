/// Swift Appwrite SDK
/// Produced by Appwrite SDK Generator
///


var client: Client = Client()

client
    .setProject(value: "")
    .setEndpoint(endpoint: "http://localhost/v1")

var account: Account =  Account(client: client);

var result = account.updateRecovery(_userId: "[USER_ID]", _secret: "[SECRET]", _password: "password", _passwordAgain: "password");
