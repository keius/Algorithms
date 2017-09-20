const fs = require('fs');
const http = require('http');
const qs = require('querystring');
const cache = {};

const selectAnimals = (animals, letter) => (
  animals.split('\n').filter(animal => animal.startsWith(letter)).join('\n')
);

const letter = process.argv[2].toUpperCase();

fs.readFile('./animals.txt', 'utf-8', (err, data) => {
  if (err) {
    console.log(err);
    return;
  }
  const animals = selectAnimals(data, letter);

  fs.writeFile(`./${letter}.txt`, animals, err => {
    if (err) {
      console.log(err);
    } else {
      console.log("wrote stuff");
    }
  });
});

const animalServer = http.createServer((req, res) => {
  const query = req.url.split('?')[1];
  if (query !== undefined) {
    const animalLetter = qs.parse(query).letter.toUpperCase();

    if (cache[animalLetter] !== undefined) {
      res.end(cache[animalLetter]);
    }

    if (animalLetter !== undefined) {
      fs.readFile('./animals.txt', 'utf-8', (err, data) => {
        if (err) {
          console.log(err);
          res.end('IT WENT POORLY');
          return;
        }
        const animals = selectAnimals(data, animalLetter);
        cache[animalLetter] = animals;
        res.end(animals);
      });
    }
  } else {
    if (cache['animals'] !== undefined) {
      res.end(cache['animals']);
    }
    fs.readFile('./animals.txt', 'utf-8', (err, data) => {
      if (err) {
        console.log(err);
        res.end('IT WENT POORLY');
        return;
      }
      cache['animals'] = data;
      res.end(data);
    });
  }
});

animalServer.listen(8000, () => console.log("I'm listening on port 8000"));
