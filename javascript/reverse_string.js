function reverseStr(a){
	b = a.split('');
	c = b.reverse();
	d = c.toString(); //because c is an object, sometimes you have to stingify json
	//console.log(d) //outputs e,k,i,m
	e = console.log(d.replace(/,/gi,''))
}
reverseStr('mike')