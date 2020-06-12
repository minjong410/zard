<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>Watari HouseKeeping &amp; Travel</title>
	<link rel="home" href="http://www.minjong410.cafe24.com/" />

	<meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="/base/css/main.css">
    <link rel="stylesheet" href="/base/css/normalize.min.css">

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
	<header class="static side-content">
		<h1><a href="http://minjong410.cafe24.com/">Watari HouseKeeping &amp; Travel</a></h1>
		<nav>
		    <a href="/about">About</a>
		    <a href="/travel">Travel</a>
		    <a href="/contact">Contact</a>
		</nav>
	</header>

	<div class="side-layout index">
		<figure class="whole">
			<div class="thumbnail-wrap">
				<a href="/travel/singapore" class="thumbnail">
					<span class="title">Singapore</span>
					<img src="/base/images/travel/main/main1.jpg" alt="" width="2304" height="1728">
				</a>
				<span class="tags">
					<a href="/tags/Singapore">#Singapore</a>
				</span>
			</div>
		</figure>
		<figure class="half">
			<div class="thumbnail-wrap">
				<a href="/travel/kul" class="thumbnail">
					<span class="title">Kuala Lumpur</span>
					<img src="/base/images/travel/main/main2.jpg" alt="" width="900" height="600">
				</a>
				<span class="tags">
					<a href="/tag/Malaysia">#Malaysia</a>
				</span>
			</div>
		</figure>
		<figure class="half">
			<div class="thumbnail-wrap">
				<a href="/travel/rome" class="thumbnail">
					<span class="title">Rome</span>
					<img src="/base/images/travel/main/main3.jpg" alt="" width="900" height="600">
				</a>
				<span class="tags">
					<a href="/tags/Italy">#Italy</a>
					<a href="/tags/HoneyMoon">#HoneyMoon</a>
				</span>
			</div>
		</figure>
		<div class="whole">
			<a class="text-block" href="/travel">
				<h2>Travel</h2>
				<p>A man travels the world over in search of what he needs and returns home to find it.</p>
			</a>
		</div>
		
		<%-- 
		<figure class="videoLayout">
			<iframe src="//player.vimeo.com/video/81148935" width="500" height="281" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="">
			</iframe>	
		</figure>
		--%>
		
		<figure class="third">
			<div class="thumbnail-wrap">
				<a href="/travel/paris" class="thumbnail">
					<span class="title">Paris</span>
					<img src="/base/images/travel/main/main4.jpg" alt="" width="600" height="750">
				</a>
				<span class="tags">
					<a href="/tags/France">#France</a>
					<a href="/tags/HoneyMoon">#HoneyMoon</a>
				</span>
			</div>
			<div class="thumbnail-wrap pt22">
				<a href="/travel/luzern" class="thumbnail">
					<span class="title">Luzern</span>
					<img src="/base/images/travel/main/main5.jpg" alt="" width="600" height="750">
				</a>
				<span class="tags">
					<a href="/tags/Swiss">#Swiss</a>
					<a href="/tags/HoneyMoon">#HoneyMoon</a>
				</span>
			</div>
		</figure>
		<figure class="twothird">
			<div class="thumbnail-wrap">
				<a href="/travel/sapporo" class="thumbnail">
					<span class="title">Sapporo</span>
					<img src="/base/images/travel/main/main6.jpg" alt="" width="1200" height="720">
				</a>
				<span class="tags">
					<a href="/tags/Japan">#Japan</a>
					<a href="/tags/Sapporo">#Sapporo</a>
				</span>
			</div>
		</figure>
	</div>

</body>
</html>
