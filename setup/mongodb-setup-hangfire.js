db.createUser(
{
    user: "hangfire",
    pwd: "hang123",
    roles: [
      { role: "userAdmin", db: "Hangfire" },
	  { role: "readWrite", db: "Hangfire" }
    ]
})