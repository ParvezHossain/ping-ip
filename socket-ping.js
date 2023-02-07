const ping = require("ping");
const connection = require("./connection");
const express = require("express");
const cors = require("cors");
// require("dotenv").config({ path: ".env" });
require("dotenv").config({path:'.env'});
const app = express();
app.use(cors());
app.use(express.json());
const http = require("http");
const server = http.createServer(app);
const { Server } = require("socket.io");
const io = new Server(server, {
    cors: {
      origin: "*",
      methods: ["GET", "POST"]
    }
  });


let interval;

io.on("connection", (socket) => {
    console.log("a user connected");
    $sql = "SELECT bde_nr, ip_plc FROM `ip_table`";

    if (interval) {
        clearInterval(interval);
    }

    interval = setInterval(() => {
        connection
        .promise()
        .query($sql)
        .then(async ([rows, fields]) => {
            const machineList = [];
            for (let i = 0; i < rows.length; i++) {
                machineList.push(rows[i]["ip_plc"]);
            }
            let list = await getAliveList(machineList);
            socket.emit("active-ip-list", list);
            // socket.broadcast.emit("active-ip-list", list);
            console.log(list);
        })
        .catch(e => {
            console.log("Error from connection", e);
        })
    }, process.env.PING_SERVER_REFRESH_TIME);
    socket.on("disconnect", () => console.log("Client disconnected"));
});


const port = process.env.PING_SERVER_HTTP_PORT;

async function getAliveList(hosts) {
    let aliveList = [];
    for (let host of hosts) {
        let res = await ping.promise.probe(host, {
            timeout: 1,
        });
        if (res.alive) {
            aliveList.push(res.host);
        }
    }
    return aliveList;
}

app.get("/", (req, res) => {
    res.sendFile(__dirname + "/index.html");
});

server.listen(port, () => console.log(`listening on ${process.env.HOST_ORIGIN}:${port}`));
