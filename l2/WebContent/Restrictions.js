
function checkPass() {
		var p = document.getElementById('pass');
		var pc = document.getElementById('passconf');

		var message = document.getElementById('confirmMessage');

		if (p.value != pc.value)
			message.innerHTML = "Password doesn't match"
		else {
			message.innerHTML = " "
		}
	}

$( function() {
	$( "#datebirth" ).datepicker();
} );

	function hasNumbers(id){    
	    
		var message = document.getElementById('hasNum' + id);

	    if(/\d/.test(document.getElementById(id).value)){
	    	message.innerHTML = "Can't have numbers ";
	    }
	    else {
	    	message.innerHTML = " ";
	    }
	}

	function hasDateFormat(){    
	    
		var message = document.getElementById('hasDate');

	    if(document.getElementById("datebirth").value.length != 10){
	    	message.innerHTML = "The date need to be in the format dd/mm/yyyy ";
	    	
	    }
	    else {
	    	message.innerHTML = " ";
	    }
	}
	
	function hasRates(){
		
		var g;
		var message = document.getElementById('ratemsg');
		if(document.getElementById('r1').checked)
			g= document.getElementById('r1').value;
		else if(document.getElementById('r2').checked)
			g = document.getElementById('r2').value;
		else if(document.getElementById('r3').checked)
			g = document.getElementById('r3').value;
		else{
			message.innerHTML = 'This field is required';
			return false;
		}
		
	}

	function hasGoodPassConf(){
		
		var message = document.getElementById("confirmMessage");
		var p = document.getElementById('pass');
		var pc = document.getElementById('passconf');		
			  
		if(p.value != pc.value){
			message.innerHTML ='The passwords need to be the same';
			return false;
		}
		
		
	}		
			
	
	
	function validacion(){
		
		
		hasRates();
		hasGoodPassConf();
		
		return true;
	}