const express = require('express');
const redis = require('redis');
const process = require('process');

const app = express();
const client = redis.createClient({
    host: 'redis-server'
});
const VISITS = 'visits';
client.set(VISITS, 0);

app.get('/', (req, res) => {
    client.get(VISITS, (err, visits) => {
        visits = parseInt(visits);
        if (visits % 2 === 1) {
            process.exit(1);
        }
        res.send(`Number of visits is: ${visits}`);
        client.set(VISITS, visits + 1);
    });
});

const port = 8081;
app.listen(port, () => {
    console.log(`Listening on port ${port}`);
});
