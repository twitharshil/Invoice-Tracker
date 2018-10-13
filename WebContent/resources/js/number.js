function number(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
    catch (err) {
        alert(err.Description);
    }
}


function output(){
	var a = document.getElementById("a").value; 
    var b = document.getElementById("b").value;
    var myResult = a*b;
    document.getElementById('result').value = myResult;  
}
