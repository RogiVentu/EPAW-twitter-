
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="models.BeanUser"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


<!-- --------------------------------------------------------------------------------------------------------- -->
<!-- --------------------------------------------------------------------------------------------------------- -->

</head>
<body>
	<!-- FUNCTIONS -->


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

	<script type="text/javascript">
		$(document).ready(function() {
			$(".goLogin").click(function(event) {
				$('#content').load('ContentController', {
					content : $(this).attr('id')
				});
			});
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$(".goAsAnon").click(function(event) {
				$('#content').load('ContentController', {
					content : $(this).attr('id')
				});
			});
		});
	</script>
	<div id="contnotlog">
		<div id="formular">

			<%
				BeanUser user = null;
				if (request.getAttribute("user") != null) {
					user = (BeanUser) request.getAttribute("user");
				} else {
					user = new BeanUser();
				}
			%>

			<form id="registerForm" method="post">
				<fieldset>
					<div class="form-group">
						<label> Username </label> <input type="text" name="user" id="user"
							class="form-control" value="${user.user}" />
						<c:if test="${user.error[0] == 1}">
							<span class="error">Username already exists</span>
						</c:if>
					</div>

					<div class="form-group">
						<label> E-mail (Required, valid e-mail adress) </label> <input
							type="email" name="mail" class="form-control" id="mail"
							value="${user.mail}" />
						<c:if test="${user.error[1] == 1}">
							<span class="error">Email already exists</span>
						</c:if>
					</div>

					<div class="form-group">
						<label> Password </label> <input type="password" name="pass"
							class="form-control" id="pass" value="${user.pass}" />
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
						<label> Gender : </label> <label> Male </label> <input
							type="radio" id="r1" name="gender" value="Male"> <label>
							Female</label> <input type="radio" id="r2" name="gender" value="Female">
						<label> Other </label> <input type="radio" id="r3" name="gender"
							value="Other">
					</div>

					<div class="form-group">
						<label>Datebirth</label> <input class="form-control"
							id="datebirth" name="datebirth" placeholder="DD/MM/YYYY"
							type="text" value="${user.datebirth}" required
							onchange="hasDateFormat();" maxlength="10">
					</div>

					<input class="button button_submit_register" name="sumbit"
						type="submit" value="Enviar">
				</fieldset>
			</form>
		</div>
		<a id="LoginController" href=#
			class="goLogin button button_primary_register">Login</a> <br> <a
			href=# id="AnonymusController" class="goAsAnon button_anonymus">Go
			as anonymus</a>
	</div>
</body>
</html>