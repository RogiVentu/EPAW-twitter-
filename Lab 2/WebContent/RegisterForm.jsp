<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Template Register Form (Validation JQuery) </title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script>
$(document).ready(function(){
    $("#registerForm").validate();
  });
</script>
<script type="text/javascript">
function checkPass(){
	var p1 = document.getElementById.pass	
	var p2 = document.getElementById.passconf
	
	var message = document.getElementById("confirmMessage");
	
	if(p1!=p2)
		message.innerHTML = "NOT THE SAME PASS"
}
</script>
</head>
<body>

<% 
BeanUser user = null;
if (request.getAttribute("user")!=null) {
	user = (BeanUser)request.getAttribute("user");
}
else {
	user = new BeanUser();
}
%>

<form action="/Lab_2/FormController" method="post" id="registerForm">
<fieldset>
<p>
<label> Name </label>
<input type="text" name="name" id="name" value="<%=user.getName() %>" required minlength="2" required maxlength="15"/>
</p>
<p>
<label> Surnames  </label>
<input type="text" name="surnames" id="surnames" value="<%=user.getSurnames() %>" required minlength="2" required maxlength="31"/>
</p>
<p>
<label> Gender  </label>
<input type="text" name="gender" id="gender" value="<%=user.getGender() %>" required maxlength="31"/>
</p>
<p>
<label> Date of birth  </label>
<input type="text" name="datebirth" id="datebirth" value="<%=user.getDatebirth() %>" required maxlength="15"/>
</p>
<p>
<label> User id (Required, minimum 5 characters) </label>
<input type="text" name="user" id="user" value="<%=user.getUser() %>" required minlength="5"/>
<% 	
	if ( user.getError()[0] == 1) {
		out.println("The username already exists in our DB!");
	}
%>
</p>
<label> Password (Required, minimum 6 characters) </label>
<input type="password" name="pass" id="pass" value="<%=user.getPass() %>" required minlength="6"/>
</p>
<label for="pas1"> Confirm Password (Required, minimum 6 characters) </label>
<input type="password" name="passconf" id="passconf" value="<%=user.getPassconf() %>" onkeyup="checkPass(); return false;"/>
<span id="confirmMessage" class="confirmMessage"></span>
</p>
<p>
<label for="pas2"> E-mail (Required, valid e-mail adress) </label>
<input type="email" name="mail" id="mail" value="<%=user.getMail() %>" required email/>
</p>
<input type="submit" value="Enviar" > 
</fieldset>
</form>
</body>
</html>