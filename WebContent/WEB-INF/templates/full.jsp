<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/base/common/taglibs.jsp"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><tiles:getAsString name="title"/></title>

	<meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="/base/css/normalize.min.css">
    <link rel="stylesheet" type="text/css" href="/base/css/main.css">

	<style type="text/css">
		.half h4, .third h4, .fourth h4, .twothird h4,
		article.page header h1,
		header#standard nav a.active,
		header.static nav a.active,
		ul.tags li a.active,
		.side-content a,
		.showmemore a:hover {
			color: #7ba7ba;
		}
         
		.index figure.text .block,
		#about-video,
		.more figure a:hover,
		#mailinglist,
		.side-layout a.text-block,
		.index figure:last-child .thumbnail-wrap a.thumbnail {
			background-color: #7ba7ba;
		}
	</style>
	
	<script type="text/javascript" src="/base/js/jquery/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/base/js/common/common.js"></script>

</head>

<body>

	<!-- body -->
	<tiles:insertAttribute name="body" />
      
</body>
</html>