<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

<script type="text/javascript">
$(document).ready(function() {
    $(".mlog").click(function(event) {
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
		<li><a   id="" href=""> Init </a></li>
		<li><a   id="" href=""> Your tweets </a></li>
		<li><a   id="" href=""> Profile </a></li>
		<li><a   id="" href=""> Next Events </a></li>
		<li><a   id="" href=""> About us </a></li>
		<li><a   class="mlog" id="LogoutController" > Logout </a></li>
	</ul>
</div>
	
	<p style="color: #ffffff"> You are logged as ${user}, there is the menu logged </p>

</body>
