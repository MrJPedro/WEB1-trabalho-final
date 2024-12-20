const express = require('express');
const app = express();
const port = 3000;
const db = require('./models/dbConnect');
const routes = require("./routes");


db.testConnection().catch((err) => {
    console.error(
        "Couldn't connect to DataBase. Killing the API."
    );
    process.exit(1);
})

app.use(express.json());

app.set("view engine", "ejs");

app.use(routes);

app.listen(port, () => {
    console.log(`Server running on port: ${port}`)
});
