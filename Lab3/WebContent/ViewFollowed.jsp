<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/structure.css" />
<title>Insert title here</title>

<div>

	<c:forEach var="username" items="${followedlist}">
		<div class="u_found">
			<!--  <div class="username_s"><b>${username.user}</b></div>-->
			<c:if test="${not empty isGuest}">
				<p><b>Sorry, you have to be registered!</b></p>
			</c:if>
			<c:if test="${empty isGuest}">
				<input class="username_s" type="submit" name="user_f_pp" onclick="go_ppage(this)" value="${username.user}">
				<input id="${username.user}" class="follow" type="submit" onclick="follow(this)" name="user_f" value="${username.following}">
			</c:if>
		</div>
		<br>
		<br>
		<br>
	</c:forEach>

</div>

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