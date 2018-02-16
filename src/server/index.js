const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');


const root = './';
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(root, 'public')));
app.get('*', (req, res) => {
  res.sendFile('public/index.html', {root: root});
});

const port = process.env.PORT || '3001';
app.listen(port, () => console.log(`API running on localhost:${port}`));