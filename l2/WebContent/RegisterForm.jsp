<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="models.BeanUser" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Template Register Form (Validation JQuery)</title>

<link rel="stylesheet" type="text/css" href="register_style.css">

<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript"
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
		
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<script type="text/javascript"
	src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	
<script>
	$(document).ready(function() {
		$("#registerForm").validate();
	});
</script>



<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src=Restrictions.js></script>
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

<div id="formular">
	<form action="/Lab_2/FormController" method="post" id="registerForm" onsubmit="return validacion()">
		<fieldset>

			
			<div class="form-group">
				<label> Name </label> <input type="text" name="name" id="name" class="form-control"
					value="<%=user.getName()%>" pattern="[A-Za-z]" onchange="hasNumbers(id);" required minlength="2" maxlength="15" />
					<span id="hasNumname" class="hasNumname"></span>
					
			</div>
	
			<div class="form-group">
				<label> Surnames </label> <input type="text" name="surnames" id="surnames" class="form-control"
					value="<%=user.getSurnames()%>" pattern="[A-Za-z]" onchange="hasNumbers(id);" required minlength="4" maxlength="31" />
					<span id="hasNumsurnames" class="hasNumsurnames" ></span>
			<div>
	<br>
			<div class="form-inline">
					<label> Gender:		 </label> 
					<input type="radio" id="r1" name="gender" value="Male"> Male
  					<input type="radio" id="r2" name="gender" value="Female"> Female
  					<input type="radio" id="r3" name="gender" value="Other"> Other
  					<span id=ratemsg> </span>
			</div>
<br>
			<div class="form-group">
				<label> Date of birth </label> 
				<div class="input-group date">
				<input type="text" name="datebirth"  class="form-control"
					id="datebirth" value="<%=user.getDatebirth()%>" required
					maxlength="10"  placeholder="dd/mm/yyyy"/>
					<span class="input-group-addon">
					<i class="glyphicon glyphicon-calendar"></i></span>
				</div>
				
				
			</div>

			<div class="form-group">
				<label> Username </label>
				<div class="input-group">
				 <input
					type="text" name="user" id="user"  class="form-control" value="<%=user.getUser()%>"
					required minlength="5" maxlength="25" />
					<span class="input-group-addon">
					<i class="glyphicon glyphicon-user"></i></span>
				</div>
					<% 
					if ( user.getError()[0] == 1) {
						out.println("The username already exists in our DB!");
					}
					%>
			</div>

			<div class="form-group">
				<label > Password </label> 
				<div class="input-group">
				<input type="password" name="pass" id="pass"  class="form-control"
				value="<%=user.getPass()%>" required minlength="6" />
				<span class="input-group-addon">
				<i class="glyphicon glyphicon-lock"></i></span>
				</div>
			</div>

			<div class="form-group">
				<label > Confirm Password </label>
					<div class="input-group"> <input type="password" name="passconf" id="passconf" class="form-control"
					value="<%=user.getPassconf()%>" required onchange="checkPass();"/> 
					<span class="input-group-addon">
					<i class="glyphicon glyphicon-lock"></i></span>
					</div>
					<span id="confirmMessage"class="confirmMessage"  ></span>
			</div>

			<div class="form-group">
				<label> E-mail </label>
				<div class="input-group"> 
				 <input type="email" name="mail" id="mail" class="form-control" value="<%=user.getMail()%>"
					required />
					<span class="input-group-addon">
					<i class="glyphicon glyphicon-envelope"></i></span>
				</div>
					<% 
					if ( user.getError()[1] == 1) {
						out.println("This email already exists in our DB!");
					}
					%>
			</div>

			<input type="submit" value="Enviar">
		</fieldset>
	</form>
</div>
</body>
</html>