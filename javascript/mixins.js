

var RoundButton = function(radius, label, action) {
    this.radius = radius;
    this.label = label;
    this.action = action;
};

asButton.call(RoundButton.prototype);
asCircle.call(RoundButton.prototype);

var button1 = new RoundButton(4, 'yes!', function() {return 'you said yes!'});
a = button1.fire();



