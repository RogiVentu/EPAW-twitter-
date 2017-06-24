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
  			<!--  <div class="username_s"><b>${username.user}</b></div>-->
  			<input class="username_s" type="submit" name="user_f_pp" value="${username.user}">
  			<c:if test="${empty isGuest}">
  				<input id="${username.user}" class="follow" type="submit" onclick="follow(this)" name="user_f" value="Follow">
  			</c:if>
		</div><br><br><br>
  	</c:forEach>
	
</div>



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
	
	function follow(that){
	    var x = that.id;
		console.log(x);
		$.ajax({ 
	        type: "POST",
	        url: 'FollowController',
	        data: {usertofollow: x},
	        success: successFunc,
	        error: errorFunc
	    });

	    function successFunc(data, status) {
	    	//aqui es donde se cambia el boton follow por unfollow
	        console.log("okey");
	    }

	    function errorFunc() {
	    	console.log("mal");
	    }
		//recoger id cliced
		//mi id
		//llamada ajax al controller
		//dentro del controller
	}
</script>