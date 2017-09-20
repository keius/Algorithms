const fs = require('fs');

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
