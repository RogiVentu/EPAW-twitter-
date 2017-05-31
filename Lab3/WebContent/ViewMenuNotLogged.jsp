<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    
<script type="text/javascript">
$(document).ready(function() {
    $(".menu").click(function(event) {
        $('#content').load('ContentController',{content: $(this).attr('id')});
        });
});
</script>

<div id="nav_wrapper">
	<ul>
		<li><a class="menu" id="RegisterController" href="RegisterController"> Registration </a></li>
		<li><a  class="menu" id="LoginController" href="MainController"> Login </a></li>
	</ul>
	
</div>
