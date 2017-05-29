<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
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

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="css/register_style.css">

</head>
<body>

<script>
	$(document).ready(
			function() {
				$("#loginForm").validate(
						{
							submitHandler : function(form) {
								$('#content').load('LoginController',
										$("#loginForm").serialize());
							}
						});
			});
</script>

	<form  action="/Lab3/LoginController" id="loginForm" method="post">
		<fieldset>
			<div class="form-group">
				<label> Username </label>
				<div class="input-group">
					<input type="text" name="user" id="user" class="form-control"
						value="${login.user}" />
				</div>
				<c:if test="${login.error[0] == 1}">
					<span class="error">Nonexistent username in our DB!</span>
				</c:if>
			</div>

			<div class="form-group">
				<label> Password </label>
				<div class="input-group">
					<input type="password" name="pass" class="form-control" id="pass"
						value="${user.pass}" />
				</div>
				<c:if test="${login.error[1] == 1}">
					<span class="error">Incorrect password!</span>
				</c:if>
			</div>

			<input name="sumbit" type="submit" value="Enviar">
		</fieldset>
	</form>
</body>