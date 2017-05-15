<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="models.BeanUser"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Template Register Form (Validation JQuery)</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script>
	$(document).ready(function() {
		$("#registerForm").validate();
	});
</script>
<script type="text/javascript">
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
		
		if(document.getElementById('r1').checked)
			user.getGender() = document.getElementById('r1').value;
		else if(document.getElementById('r2').checked)
			user.getGender() = document.getElementById('r2').value;
		else if(document.getElementById('r3').checked)
			user.getGender() = document.getElementById('r3').value;
		else{
			alert ('You need to choose one gender');
			return false;
		}
	}
	
	function hasGoodPassConf(){
		
		var p = document.getElementById('pass').value;
		var pc = document.getElementById('passconf').value;		
			  
		if(p != pc){
			alert('The passwords need to be the same');
			return false;
		}
	}
	
	function hasDateAlert(){
		
		var date = document.getElementById('datebirth').value;
		if(date.length != 10){
			alert('The date need to be in the format dd/mm/yyyy');
			return false;
		}
			
			
	}
	
	function validacion(){
		
		hasDateAlert();
		hasRates();
		hasGoodPassConf();
		
		return true;
	}
	
</script>
</head>
<body>

	<%
		BeanUser user = null;
		if (request.getAttribute("user") != null) {
			user = (BeanUser) request.getAttribute("user");
		} else {
			user = new BeanUser();
		}
	%>

	<form action="/Lab_2/FormController" method="post" id="registerForm" onsubmit="return validacion()">
		<fieldset>

			
			<p>
				<label> Name </label> <input type="text" name="name" id="name"
					value="<%=user.getName()%>" pattern="[A-Za-z]" onchange="hasNumbers(id);" required minlength="2" maxlength="15" />
					<span id="hasNumname" class="hasNumname"></span>
					
			</p>
	
			<p>
				<label> Surnames </label> <input type="text" name="surnames" id="surnames"
					value="<%=user.getSurnames()%>" pattern="[A-Za-z]" onchange="hasNumbers(id);" required minlength="4" maxlength="31" />
					<span id="hasNumsurnames" class="hasNumsurnames" ></span>
			</p>

			<p>
					<label> Gender </label> 
					<input type="radio" id="r1" name="gender" value="Male"> Male
  					<input type="radio" id="r2" name="gender" value="Female"> Female
  					<input type="radio" id="r3" name="gender" value="Other"> Other
			</p>

			<p>
				<label> Date of birth </label> <input type="text" name="datebirth"
					id="datebirth" value="<%=user.getDatebirth()%>" required onchange="hasDateFormat();"
					maxlength="10"  placeholder="dd/mm/yyyy"/>
					<span id="hasDate"class="hasDate" ></span>
			</p>

			<p>
				<label> Username (Required, minimum 5 characters) </label> <input
					type="text" name="user" id="user" value="<%=user.getUser()%>"
					required minlength="5" maxlength="25" />
					

			</p>

			<p>
				<label > Password (Required, minimum 6 characters)
				</label> <input type="password" name="pass" id="pass"
					value="<%=user.getPass()%>" required minlength="6" />
			</p>

			<p>
				<label > Confirm Password (Required, minimum 6
					characters) </label> <input type="password" name="passconf" id="passconf"
					value="<%=user.getPassconf()%>" required onchange="checkPass();"/> 
					<span id="confirmMessage"class="confirmMessage"  ></span>
			</p>

			<p>
				<label> E-mail (Required, valid e-mail adress) </label> <input
					type="email" name="mail" id="mail" value="<%=user.getMail()%>"
					required />
			</p>

			<input type="submit" value="Enviar">
		</fieldset>
	</form>
</body>
</html>