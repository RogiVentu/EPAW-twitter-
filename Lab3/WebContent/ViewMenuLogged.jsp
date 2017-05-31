<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

<script type="text/javascript">
$(document).ready(function() {
    $(".menu").click(function(event) {
        $('#content').load('ContentController',{content: $(this).attr('id')});
        });
});
</script>

<head>
<link rel="stylesheet" type="text/css" href="css/structure.css" />
</head>
<body>

<div id="nav_wrapper">
	<ul>
		<li><a  class="menu" id="" href=""> Init </a></li>
		<li><a  class="menu" id="" href=""> Your tweets </a></li>
		<li><a  class="menu" id="" href=""> Profile </a></li>
		<li><a  class="menu" id="" href=""> Next Events </a></li>
		<li><a  class="menu" id="" href=""> About us </a></li>
		<li><a class="menu" id="LogoutController" href="LogoutController"> Logout </a></li>
	</ul>
	<p> ESTAS EN EK MENU CON LA SESSION INICIADA</p>
</div>

</body>
