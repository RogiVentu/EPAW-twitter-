<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    
<script type="text/javascript">
$(document).ready(function() {
    $(".menu").click(function(event) {
        $('#content').load('ContentController',{content: $(this).attr('id')});
        });
});
</script>
<link rel="stylesheet" type="text/css" href="css/structure.css" />

<div id="nav_wrapper">
	<ul>
		<li><a class="menu" id="RegisterController" href="ViewRegisterForm.jsp"> Registration </a></li>
		<li><a  class="menu" id="LoginController" href="ViewLoginForm.jsp"> Login </a></li>
	</ul>
	
</div>
