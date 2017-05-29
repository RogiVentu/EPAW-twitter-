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

$(function() {
	$("#datebirth").datepicker();
});

/*function hasNumbers(id) {

	var message = document.getElementById('hasNum' + id);

	if (/\d/.test(document.getElementById(id).value)) {
		message.innerHTML = "Can't have numbers ";
	} else {
		message.innerHTML = " ";
	}
}*/

function hasDateFormat() {

	var message = document.getElementById('hasDate');

	if (document.getElementById("datebirth").value.length != 10) {
		message.innerHTML = "The date need to be in the format dd/mm/yyyy ";

	} else {
		message.innerHTML = " ";
	}
}

function hasRates() {

	var g;
	var message = document.getElementById('ratemsg');
	if (document.getElementById('r1').checked)
		g = document.getElementById('r1').value;
	else if (document.getElementById('r2').checked)
		g = document.getElementById('r2').value;
	else if (document.getElementById('r3').checked)
		g = document.getElementById('r3').value;
	else {
		message.innerHTML = 'This field is required';
		return false;
	}

}

function hasGoodPassConf() {

	var message = document.getElementById("confirmMessage");
	var p = document.getElementById('pass');
	var pc = document.getElementById('passconf');

	if (p.value != pc.value) {
		message.innerHTML = 'The passwords need to be the same';
		return false;
	}

}

function validacion() {

	hasRates();
	hasGoodPassConf();

	return true;
}

$(function() {
	$("#registerForm").validate({
		rules : {
			name : {
				required : true,
				minlength : 2,
				maxlength : 25,
				lettersonly : true
			},
			surnames : {
				required : true,
				minlength : 2,
				maxlength : 35,
				lettersonly : true
			},
			user : {
				required : true,
				minlength : 2,
				maxlength : 25
			},
			pass : {
				required : true,
				minlength : 6
			},
			passconf : {
				required : true,
				minlength : 6,
				equalTo : "#pass"
			},
			mail : {
				required : true,
				email : true
			},
		},
		messages : {
			name : {
				required : "Please enter your name",
				lettersonly : "Can't have numbers"
			},
			surnames : {
				required : "Please enter your surname",
				lettersonly : "Can't have numbers"
			},
			username : {
				required : "Please enter your username"
			},
			password : {
				required : "Please provide a password"
			},
			passconf : {
				required : "Your username must consist at least 2 characters",
				equalTo : "Please enter the same password"
			},
			mail : {
				required : "Please enter an email adress",
				email : "Please enter a valid adress"
			}

		}
	});

});