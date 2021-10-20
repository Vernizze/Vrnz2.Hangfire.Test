db.createUser(
{
    user: "admin",
    pwd: "root123",
    roles: [
      { role: "userAdminAnyDatabase", db: "admin" },
      { role: "readWrite", db: "admin" }
    ]
});