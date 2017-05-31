
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="models.BeanUser"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Template Register Form (Validation JQuery)</title>

<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.js"></script>

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

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<!-- Email validator -->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.16.0/jquery.validate.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/additional-methods.min.js"></script>


<!-- CSS -->
<link rel="stylesheet" type="text/css" href="css/register_style.css">
<!-- --------------------------------------------------------------------------------------------------------- -->
<!-- --------------------------------------------------------------------------------------------------------- -->

</head>
<body>
	<!-- FUNCTIONS -->

	<script type="text/javascript" src="Restrictions.js"></script>

	<script>
		$(document).ready(
				function() {
					$("#registerForm").validate(
							{
								submitHandler : function(form) {
									$('#content').load('RegisterController',
											$("#registerForm").serialize());
								}
							});
				});
	</script>

	<script>
		$(document).ready(
				function() {
					var date_input = $('input[name="date"]'); //our date input has the name "date"
					var container = $('.bootstrap-iso form').length > 0 ? $(
							'.bootstrap-iso form').parent() : "body";
					var options = {
						format : 'dd/mm/yyyy',
						container : container,
						todayHighlight : true,
						autoclose : true,
					};
					date_input.datepicker(options);
				})
	</script>
	
	
		<jsp:include page="ViewMenuNotLogged.jsp" />
	
	<div id="formular">

		<%
			BeanUser user = null;
			if (request.getAttribute("user") != null) {
				user = (BeanUser) request.getAttribute("user");
			} else {
				user = new BeanUser();
			}
		%>

		<form action="/Lab3/RegisterController" method="post"
			id="registerForm" onsubmit="return validacion()">
			<fieldset>
				<div class="form-group">
					<label> Username </label>
					<div class="input-group">
						<input type="text" name="user" id="user" class="form-control"
							value="${user.user}" />
					</div>
					<%
						if (user.getError()[0] == 1) {
							out.println("The username already exists in our DB!");
						}
					%>
				</div>

				<div class="form-group">
					<label> E-mail (Required, valid e-mail adress) </label> <input
						type="email" name="mail" class="form-control" id="mail"
						value="${user.mail}" />
					<%
						if (user.getError()[1] == 1) {
							out.println("This email already exists in our DB!");
						}
					%>
				</div>

				<div class="form-group">
					<label> Password </label>
					<div class="input-group">
						<input type="password" name="pass" class="form-control" id="pass"
							value="${user.pass}" />
					</div>
				</div>

				<div class="form-group">
					<label> Confirm Password </label> <input type="password"
						name="passconf" class="form-control" value="${user.passconf}" />
					<span id="confirmMessage" class="confirmMessage"></span>
				</div>

				<div class="form-group">
					<label> Name </label> <input type="text" name="name"
						class="form-control" id="name" value="${user.name}"
						onchange="hasNumbers(id);" /> <span id="hasNumname"
						class="hasNumname"></span>
				</div>

				<div class="form-group">
					<label> Surnames </label> <input type="text" name="surnames"
						class="form-control" id="surnames" value="${user.surnames}"
						onchange="hasNumbers(id);" /> <span id="hasNumsurnames"
						class="hasNumsurnames"></span>
				</div>

				<div class="form-inline">
					<label> Gender </label> <label> Male </label> <input type="radio"
						id="r1" name="gender" value="Male"> <label> Female</label>
					<input type="radio" id="r2" name="gender" value="Female"> <label>
						Other </label> <input type="radio" id="r3" name="gender" value="Other">
				</div>

				<div class="form-group">
					<label>Datebirth</label>
					<div class="input-group date">
						<input class="form-control" id="datebirth" name="datebirth"
							placeholder="DD/MM/YYYY" type="text" value="${user.datebirth}"
							required onchange="hasDateFormat();" maxlength="10">
					</div>
				</div>

				<input name="sumbit" type="submit" class="btn" value="Enviar">
			</fieldset>
		</form>
	</div>
</body>
</html>