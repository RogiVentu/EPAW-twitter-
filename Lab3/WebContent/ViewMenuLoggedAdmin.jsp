<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>


<div id="nav">
	<br>
	<div id="nav_wrapper">
		<br> <br> <img class="imglogomenu"
			src="css/images/logoinv.png">
		<ul>
			<li><a href=# class="searchb" id="ViewSearch.jsp">Users</a></li>
			<li><a href=# class="searchtw" id="ViewSearchTweets.jsp">Tweets</a></li>
			<li><a href=# class="mainpage" id="TweetsController">Main
					Page</a></li>
			<li><a href=# class="perspage" id="PersonalTweetsController">Personal
					Page</a></li>
			<!-- OBVIAMENTE HACE FALTA CONTROLLADOR DE PROFILE PARA PASAR LAS DADAS, PERO DE MIENTRAS -->
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

		$(".perspage").click(function(event) {
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
		
		$(".searchtw").click(function(event) {
			$('#content').load('ContentController', {
				content : $(this).attr('id')
			});
		});
	});
</script>