# To get the alive ip list
- curl -X POST localhost:3000 -H 'Content-Type: application/json' -d '{"list": ["192.168.1.231", "192.168.1.191"]}'