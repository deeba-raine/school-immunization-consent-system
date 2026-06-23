const express = require("express")
const app = express()
const PORT = 3000

app.get("/", (req,res)=> {
    res.write('You are connected to network')
    res.end()
})

app.listen(PORT, ()=> {
    console.log("You are connected to port 3000")
})