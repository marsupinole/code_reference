function uniqueChars(str){
  a = str.split('');
  b = a.sort();
  var check_unique = [];
  for (i = 0; i<b.length - 1; b++){
    
    if (b[i + 1] === b[i]){
      check_unique.push(b[i]);
     }
      alert(check_unique)
 }
};
