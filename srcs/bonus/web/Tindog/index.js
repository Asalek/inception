const express = require('express');
const app = express();

app.use(express.static("public"));

app.get('/', function(req, res)
{
    res.sendFile(__dirname + "/index.html");
})

app.listen(1337, function(req, res){
    console.log("Server running on port : 1337");
});