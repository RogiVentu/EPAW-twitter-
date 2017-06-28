<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>


<div id="nav">
	<br>
	<div id="nav_wrapper">
		<br> <br> <img class="imglogomenu"
			src="css/images/logoinv.png">
		<ul>
			<li><a href=# class="searchb" id="ViewSearch.jsp">Search</a></li>
			<li><a href=# class="mainpage" id="TweetsController">Main
					Page</a></li>
			<li><a href=# class="perspage" id="PersonalTweetsController">Personal
					Page</a></li>
			<li><a href="#"class="folpage" id = "FollowedController">Following</a></li>
			<li><a href=# class="profpage" id="ProfileController">${user}
					(profile page)</a></li>
			<li><a href=# class="logpage" id="LogoutController">Logout</a></li>
		</ul>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$(".logpage").click(function(event) {
			$('#content').load('ContentController', {
				content : $(this).attr('id')
			});
		});

		$(".profpage").click(function(event) {
			$('#content').load('ContentController', {
				content : $(this).attr('id')
			});
		});

		$(".perspage").click(function(event) {
			$('#content').load('ContentController', {
				content : $(this).attr('id')
			});
		});
		
		$(".folpage").click(function(event) {
			$('#content').load('ContentController', {
				content : $(this).attr('id')
			});
		});
		
		$(".mainpage").click(function(event) {
			$('#content').load('ContentController', {
				content : $(this).attr('id')
			});
		});

		$(".searchb").click(function(event) {
			$('#content').load('ContentController', {
				content : $(this).attr('id')
			});
		});
	});
</script>