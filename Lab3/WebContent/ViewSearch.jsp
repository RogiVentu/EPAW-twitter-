<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/structure.css" />
<title>Search page</title>

<form id="serach_users">
	<input type="text" placeholder="Search for username..." maxlength="30"
		class="search" name="s_user"> <input type="submit"
		value="Search" class="submitsearch">
</form>
<br>
<br>
<br>

<div>

	<c:forEach var="username" items="${userlist}">
		<div class="u_found">
			<!--  <div class="username_s"><b>${username.user}</b></div>-->
			<c:if test="${not empty isGuest}">
				<input id="${username.user}" class="username_s" type="submit" name="user_f_pp"
				onclick="go_opage(this)" value="${username.user}">
			</c:if>
			<c:if test="${empty isGuest}">
				<input class="username_s" type="submit" name="user_f_pp" onclick="go_ppage(this)" value="${username.user}">
				<c:if test="${empty isAdmin}">
  					<input id="${username.user}" class="follow" type="submit" onclick="follow(this)" name="user_f" value="Follow">
  				</c:if>
  				<c:if test="${isAdmin eq 1}">
  					<input id="${username.user}" class="delete_u" type="submit" onclick="drop(this)" name="user_d" value="Delete">
  				</c:if>
			</c:if>
		</div>
		<br>
		<br>
		<br>
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
</script>

<script>
	function go_ppage(element) {
		var siblings = element.parentNode.children,	//here we take the id of the user from the sibling
	        sibling_id = null;
	    for(var i = siblings.length; i--;) {
	        if(siblings[i].id) {
	            sibling_id = siblings[i].id;
	            break;
	        }
	    }
	    $('#content').load('PersonalTweetsController', {
			user_page : sibling_id
		});
	    
	};
</script>

<script>
function go_opage(element) {
	var id = element.id;
    $('#content').load('PersonalTweetsController', {
		user_page : id
	});
    
};	
</script>



<script>
	function follow(that) {
		//en esta función dependiendo de si el elem.value es
		//Follow o Unfollow redirigimos la llamada ajax a un
		//controller distinto para realizar acciones distintas
		var x = that.id;
		if (that.value == "Follow") {
			$.ajax({
				type : "POST",
				url : 'FollowController',
				data : {
					usertofollow : x
				},
				success : successFunc,
				error : errorFunc
			});

			function successFunc(data, status) {
				//aqui es donde se cambia el boton follow por unfollow
				that.value = "Unfollow";
				console.log("Correct follow execution");
			}

			function errorFunc() {
				console.log("Bad follow execution");
			}

		} else if (that.value == "Unfollow") {
			$.ajax({
				type : "POST",
				url : 'UnfollowController',
				data : {
					usertofollow : x
				},
				success : successFunc,
				error : errorFunc
			});

			function successFunc(data, status) {
				//aqui es donde se cambia el boton follow por unfollow
				console.log("Correct unfollow execution");
				that.value = "Follow";

			}

			function errorFunc() {
				console.log("Bad unfollow execution");
			}

		}
		console.log(that.value);

	}
</script>


<script>
	//en esta función haremos la llamada ajax para ver si ya lo sigues
	//si ya lo sigues cambiar valor del boton por Unfollow
	function test(that) {

		var value = that.value;
		if (that.value == "Follow")
			that.value = "Unfollow"
		else
			that.value = "Follow";

	}
</script>
<script>
	function drop(that){
		var x = that.id;
	    if (that.value=="Delete") {
			$.ajax({ 
		        type: "POST",
		        url: 'DeleteUserController',
		        data: {usertodelete: x},
		        success: successFunc,
		        error: errorFunc
		    });
	
		    function successFunc(data, status) {
		    	$(document).ready(function() {
		            $('#content').load('SearchController');   
		    	});
		    	console.log("Correct delete execution");
		    }
	
		    function errorFunc() {
		    	console.log("Bad delete execution");
		    }		
	    }
	    console.log(that.value);
	}
</script>