<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session = "true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search page</title>

<form id = "serach_users">
	<input type = "text" placeholder="Search for username..." maxlength="30" class="search" name="s_user">
	<input type="submit" value="Search" class="submitsearch">
</form><br><br><br>

<div>

	<c:forEach  var="username" items="${userlist}">
    	<div><b><u>${username.user}</u></b></div><br><br><br><br/>
  	</c:forEach>
	
</div>

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