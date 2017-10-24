var fs = require('fs');
var http = require('http');
var qs = require('querystring');
var cache = {};

// fs.readFile('./animals.txt', 'utf-8', (err, data) => {
//   if (err) {
//     console.log(err);
//     return;
//   }
//   console.log(data);
// });

// fs.writeFile('./example.txt', 'I will be written to example.txt', err => {
//   if (err) {
//     console.log(err);
//   } else {
//     console.log("file successfully written!");
//   }
// });

// const letter = process.argv[2].toUpperCase();
//
// fs.readFile('./animals.txt', 'utf-8', (err, data) => {
//   if (err) {
//     console.log(err);
//     return;
//   }
//
//   const animals = selectAnimals(data, letter);
//
//   fs.writeFile(`./${letter}_animals.txt`, animals, err => {
//     if (err) {
//       console.log(err);
//     } else {
//       console.log("animals written!");
//     }
//   });
// });
//
function selectAnimals(animalString, animalLetter) {
  return animalString.split('\n').filter(animal => animal.startsWith(animalLetter)).join('\n');
}

var server = http.createServer((req, res) => {
  var query = req.url.split('?')[1];
  if (query !== undefined) {
    var letter = qs.parse(query).letter.toUpperCase();

    if (cache[letter] !== undefined) {
      res.end(cache[letter]);
    }

    if (letter !== undefined) {
      fs.readFile('./animals.txt', 'utf-8', (err, data) => {
        if (err) {
          console.log(err);
          res.end('failed');
          return;
        }
        var animals = selectAnimals(data, letter);
        cache[letter] = animals;
        res.end(animals);
      });
    }
  }
});

server.listen(8000, () => console.log("I'm listening on port 8000!"));
