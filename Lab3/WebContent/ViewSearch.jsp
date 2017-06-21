<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session = "true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/structure.css" />
<title>Search page</title>

<form id = "serach_users">
	<input type = "text" placeholder="Search for username..." maxlength="30" class="search" name="s_user">
	<input type="submit" value="Search" class="submitsearch">
</form><br><br><br>

<div>

	<c:forEach  var="username" items="${userlist}">
		<div class="u_found">
  			<div class="username_s"><b>${username.user}</b></div>
  			<input id="" class="follow"type="submit" value="Follow">
		</div><br><br><br>
  	</c:forEach>
	
</div>

<script>
	$( "#follow" ).click(function() {
		alert( "Handler for .click() called." );
	});
</script>

<!-- Validate the form and send the serialize the searched userto use it after -->
<script>
	$(document).ready(
			function() {
				$("#serach_users").validate(
						{
							submitHandler : function(form) {
								$('#content').load('SearchController',
										$("#serach_users").serialize());
							}
						});
			});
</script>