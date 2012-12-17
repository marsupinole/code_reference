Array.prototype.binarySearch = function(value){
    var items = this;
    console.log(items.length);
    var startIndex  = 0;
    var stopIndex = items.length - 1;
    var middle = Math.floor((stopIndex + startIndex)/2);

    while(items[middle] != value && startIndex < stopIndex){

        //adjust search area
        if (value < items[middle]){
            stopIndex = middle - 1;
        } 
        if (value > items[middle]){
            startIndex = middle + 1;
        }

        //recalculate middle
        middle = Math.floor((stopIndex + startIndex)/2);
    }

    //make sure it's the right value
    return (items[middle] != value) ? console.log(-1) : console.log(middle);
}

sam = [6,7,8,5,3, 4, 2,9,1]
sam.binarySearch(7);