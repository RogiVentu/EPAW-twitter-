<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Template Register Form (Validation HTML5) </title>
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
<label> Name  </label>
<input type="text" name="name" id="name" value="<%=user.getName() %>" required minlength="2" required maxlength="15"/>
</p>
<p>
<label> Surnames  </label>
<input type="text" name="surnames" id="surnames" value="<%=user.getSurnames() %>" required minlength="2" required maxlength="31"/>
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
<p>
<label> E-mail (Required, valid e-mail adress) </label>
<input type="email" name="mail" id="mail" value="<%=user.getMail() %>" required email/>
</p>
<input type="submit" value="Enviar"> 
</fieldset>
</form>
</body>
</html>