const express = require('express');
const {Server} = require('ws');

const PORT = process.env.PORT || 3000;


const books = [
 {id: 1, title: 'Alice in Wonderland', author: 'Lewis Carrol'},
 {id: 2, title: 'Around the World in eighty days', author: 'Jules Verne'},
 {id: 3, title: 'Utopia', author: 'Sir Thomas Moor'},
]

const server = express().use((req, res) => {
//res.send('Hello World'))
res.json(books)
}).listen(PORT, () => console.log(`Listening on ${PORT}`));


const wss = new Server({server});

wss.on('connection', ws => {
  console.log('Client connected');
  ws.on('message', message => console.log(`Received: ${message}`));
  ws.on('close', () => console.log('Client disconnected'));
});

//const app = express()



//app.get('/', (req, res) => {
// res.json(books)
//})
//app.listen(port, () => {
// console.log(`Server running at http://localhost:${port}`)
//})


