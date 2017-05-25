<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
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

<form action="" id=registerForm method="POST">
	<table>
		<tr>
			<td>User id</td>
			<td><input type="text" name="user" value="${user.user}"
				id="user" class="required" minlength="5" /></td>
			<c:if test="${user.error[0] == 1}">
				<td class="error">The username already exists in our DB!</td>
			</c:if>
		</tr>
		<tr>
			<td>Mail</td>
			<td><input type="text" name="mail" value="${user.mail}"
				id="mail" class="required email" /></td>
			<c:if test="${user.error[1] == 1}">
				<td class="error">The email already exists in our DB!</td>
			</c:if>
		</tr>
		<td>Password</td>
		<td><input type="password" name="pass" value="${user.pass}"
			id="pass" class="required" /></td>
		</tr>
		
		<td>Confirm Password</td>
		<td><input type="password" name="passconf" value="${user.passconf}"
			id="passconf" class="required" /></td>
		</tr>
		
		<td>Name</td>
		<td><input type="text" name="name" value="${user.name}"
			id="name" class="required" /></td>
		</tr>
		
		<td>Surnames</td>
		<td><input type="text" name="surnames" value="${user.surnames}"
			id="surnames" class="required" /></td>
		</tr>
	
		<tr>
		<td>Gender</td>
		<td>
			<input type="radio" id="r1" name="gender" value="Male"> Male <br>
  			<input type="radio" id="r2" name="gender" value="Female"> Female<br>
  			<input type="radio" id="r3" name="gender" value="Other"> Other
  		</td>
  		</tr>
  		
  		<tr>
  		<td>Datebirth</td>
		<td><input type="text" name="datebirth" value="${user.datebirth}"
			id="datebirth" class="required" /></td>
		</tr>
		
		<tr>
			<td><input name="sumbit" type="submit" value="Enviar"></td>
		</tr>
	</table>
</form>
</body>
</html>