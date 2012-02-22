function compareStr(a,b){
c = a.split('');
d = b.split('');
e = c.sort();
f = d.sort();
g = e.toString()
h = f.toString()

if (g === h){
  document.write('perm');
  }
  else
  {
  document.write('not perm');
 }
}
