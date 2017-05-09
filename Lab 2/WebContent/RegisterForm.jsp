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
		var p1 = document.getElementById('pas1');
		var p2 = document.getElementById('pas2');

		var message = document.getElementById('confirmMessage');

		if (p1.value != p2.value)
			message.innerHTML = "Password doesn't match"
		else {
			message.innerHTML = " "
		}

	}
</script>
<script>
	function hasNumbers(){    
	    
		var message = document.getElementById('hasNum');

	    if(/\d/.test(document.getElementById("name").value)){
	    	message.innerHTML = "Can't have numbers";
	    }
	    else {
	    	message.innerHTML = " ";
	    }
	       
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

	<form action="/Lab_2/FormController" method="post" id="registerForm">
		<fieldset>

			<p>
				<label> Name </label> <input type="text" name="name" id="name"
					value="<%=user.getName()%>" pattern="[A-Za-z]{3}" onchange="hasNumbers();" required minlength="2" maxlength="15" />
					<span id="hasNum" class="hasNum" value="num"></span>
					
			</p>

			<p>
				<label> Surnames </label> <input type="text" name="surnames"
					id="surnames" value="<%=user.getSurnames()%>" required
					minlength="2" maxlength="31" />
			</p>

			<p>
				<label> Gender </label> <input type="text" name="gender" id="gender"
					value="<%=user.getGender()%>" required maxlength="31" />
			</p>

			<p>
				<label> Date of birth </label> <input type="text" name="datebirth"
					id="datebirth" value="<%=user.getDatebirth()%>" required
					maxlength="15" />
			</p>

			<p>
				<label> User id (Required, minimum 5 characters) </label> <input
					type="text" name="user" id="user" value="<%=user.getUser()%>"
					required minlength="5" />
				<%
					if (user.getError()[0] == 1) {
						out.println("The username already exists in our DB!");
					}
				%>
			</p>

			<p>
				<label for="pas1"> Password (Required, minimum 6 characters)
				</label> <input type="password" name="pas1" id="pas1"
					value="<%=user.getPass()%>" required minlength="6" />
			</p>

			<p>
				<label for="pas2"> Confirm Password (Required, minimum 6
					characters) </label> <input type="password" name="pas2" id="pas2"
					value="<%=user.getPassconf()%>"
					onchange="checkPass(); return false;" /> <span id="confirmMessage"
					class="confirmMessage" value="werf"></span>
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