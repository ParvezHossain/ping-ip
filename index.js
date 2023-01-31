const ping = require("ping");
const express = require("express");
const cors = require("cors");

require("dotenv").config({path:".env"});


const app = express();
app.use(cors());
app.use(express.json());
const port = process.env.PORT;

async function getAliveIPList (listOfIps){
    let aliveIpList = [];

    for (let ip of listOfIps) {
        let res = await ping.promise.probe(ip, {
            timeout: 1
        });

        
        if (res.alive){
            aliveIpList.push(res.host)
        }
    }
    return aliveIpList;
}

app.post("/", async(req, res) => {
    if (req.body.list) {
        let ipList = req.body.list;
        const uniqueList = [...new Set(ipList)];
        let aliveList = await getAliveIPList(uniqueList);
        res.json({
            aliveIpList: aliveList
        })
    }else{
        res.json({
            message: "Provide an ip list"
        })
    }
})

app.listen(port, () => console.log(`Server is listening on http://localhost:${port}`));