var i = 0, j = 0,
nums = 3000, isPrime = false, primes = [], start = window.performance.now();

function isInt(a){
  return a % 1 === 0;
}

for(i = 1; i < nums; i += 1){
  isPrime = true;
  for(j = i-1; j > 1; j -= 1){
    if(isInt(i / j)){
      isPrime = false;
    }
  }
  if(isPrime === true){primes.push(i)}
}
console.log(window.performance.now() - start + " ms");
console.log(primes);