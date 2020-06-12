<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/base/common/taglibs.jsp"%>


<!DOCTYPE HTML>
<html>
	<head>
		<title>Lens by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/base/css/html5up/lens/main.css" />
		<noscript><link rel="stylesheet" href="/base/css/html5up/lens/noscript.css" /></noscript>
	</head>
	<body class="is-preload-0 is-preload-1 is-preload-2">

		<!-- Main -->
			<div id="main">

				<!-- Header -->
					<header id="header">
						<h1>Watari Travel</h1>
						<p>Just another fine responsive site template by <a href="http://html5up.net">HTML5 UP</a></p>
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
							<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
						</ul>
					</header>

				<!-- Thumbnail -->
					<section id="thumbnails">
					
						<c:forEach var="result" varStatus="varStatus" items="${itemList}">
							<article>
								<a class="thumbnail" href="/base/images/travel/${result.cityId}/${result.sort}.jpg" data-position="left center"><img src="/base/images/travel/${result.cityId}/${result.sort}.jpg" alt="" /></a>
								<h2>${result.sort}</h2>
								<p>${result.memo}</p>
							</article>
						</c:forEach>
						
					</section>

				<!-- Footer -->
					<footer id="footer">
						<ul class="copyright">
							<li>&copy; Untitled.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a>.</li>
						</ul>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="/base/js/html5up/jquery.min.js"></script>
			<script src="/base/js/html5up/browser.min.js"></script>
			<script src="/base/js/html5up/breakpoints.min.js"></script>
			<script src="/base/js/html5up/lens.js"></script>

	</body>
</html>