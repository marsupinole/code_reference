function reverseStr(row1,row2){
  a = row1.indexOf(0);
  b = row2.indexOf(0);
  c = (row1.length)
  d = row2.length
  josh = []
  for (i=0;i<=(c-1);i++){
    josh[i] = '0'
  }  
  mike = function(){
  }
  if (a != -1){
  row1.splice(0,c,josh)
  row2.splice(a,1, '0')
  }
  alert(row1);
  document.write(row2);
  }
