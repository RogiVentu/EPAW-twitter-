<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

<script type="text/javascript">
$(document).ready(function() {
    $(".mlog").click(function(event) {
        $('#navigation').load('ContentController',{content: $(this).attr('id')});
        });
});
</script>


	<div id="nav">
		<br>
		<div id="nav_wrapper">
			<br> <br> <img class="imglogomenu"
				src="css/images/logoinv.png">
			<ul>
				<li><a href="#">Main Page</a></li>
				<li><a href="#">Your Tweets</a></li>
				<li><a href="#">New Songs</a></li>
				<li><a href="#">Next Shows</a></li>
				<li><a href="#">About Us</a></li>
				<li><a href="#">Logged as ${user}</a></li>
				<li><a href="LogoutController" class="mlog" id="LogoutController">Logout</a></li>
			</ul>
		</div>
	</div>
