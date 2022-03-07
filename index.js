const a = {
  breakfast: "eggs",
  lunch: "tacos",
};

const b = {
  dinner: "pasta",
};

const c = {
  ...a,
  ...b,
};

console.log(c.breakfast); // eggs
console.log(c.lunch); //tacos
console.log(c.dinner); //pasta
