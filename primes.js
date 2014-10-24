var i = 0, j = 0,
nums = 30, isPrime = false;

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
  if(isPrime === true){console.log("i: "+i);}
}