/// Swift Appwrite SDK
/// Produced by Appwrite SDK Generator
///


var client: Client = Client()

client
    .setProject(value: "")
    .setEndpoint(endpoint: "http://localhost/v1")

var teams: Teams =  Teams(client: client);

var result = teams.createMembership(_teamId: "[TEAM_ID]", _email: "email@example.com", _roles: [], _url: "https://example.com");
