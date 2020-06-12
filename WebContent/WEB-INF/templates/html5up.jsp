<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/base/common/taglibs.jsp"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><tiles:getAsString name="title"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Styles -->
	<link rel="stylesheet" type="text/css" href="/base/css/main.css">
	<link rel="stylesheet" href="/base/css/html5up/<tiles:insertAttribute name="css" />/main.css" />
	<noscript><link rel="stylesheet" href="/base/css/html5up/<tiles:insertAttribute name="css" />/noscript.css" /></noscript>


	<!-- Scripts -->
	<script src="/base/js/html5up/jquery.min.js"></script>
	<script src="/base/js/html5up/jquery.poptrox.min.js"></script>
	<script src="/base/js/html5up/jquery.scrolly.min.js"></script>
	<script src="/base/js/html5up/jquery.scrollex.min.js"></script>
	<script src="/base/js/html5up/browser.min.js"></script>
	<script src="/base/js/html5up/breakpoints.min.js"></script>
	<script src="/base/js/html5up/util.js"></script>
	<script src="/base/js/html5up/<tiles:insertAttribute name="css" />.js"></script>

</head>

<body>
	
	<!-- header -->
	<tiles:insertAttribute name="header" />

	<!-- body -->
	<tiles:insertAttribute name="body" />
	
	<!-- footer -->
	<tiles:insertAttribute name="footer" />
      
</body>
</html>