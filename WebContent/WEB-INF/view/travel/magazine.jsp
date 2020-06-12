<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/base/common/taglibs.jsp"%>

<div class="fullscreenCoverImage" id="feature-image" style="background-image: url(/base/images/travel/${travel.cityId}/header.jpg);"></div>
<article class="project">		
	<header class="full-layout">
		<hgroup class="whole">
			<h1>${travel.cityName}</h1>
			<span class="tags">
				<c:forEach var="tag" varStatus="varStatus" items="${tagList}">
				<a href="/tags/${tag.keyword}">#${tag.keyword}</a>
				</c:forEach>
			</span>
		</hgroup>
	</header>
	
	<div class="wrapper"></div>

	<c:choose>
	    <c:when test="${empty itemList}">
	    	<div class="wrapper">
				<div class="side-content">
					<div class="text-block">
						<h2>Coming Soon ...</h2>
					</div>
				</div>
	    	</div>
	    </c:when>
	    <c:otherwise>
	
			<c:forEach var="result" varStatus="varStatus" items="${itemList}">
				<c:set var="result" value="${result}" scope="request"></c:set>
				<c:set var="path" value="/base/images/travel" scope="request"></c:set>
				<c:if test="${result.imgPath eq 'CDN'}">
					<c:set var="path" value="http://minjong410.cdn3.cafe24.com" scope="request"></c:set>
				</c:if>
				<jsp:include page="/base/layout/${result.layout}.jsp"></jsp:include>
			</c:forEach>
	
		</c:otherwise>
	</c:choose>

</article>
	
<nav class="showmemore">
	<div class="wrapper">
		<div class="side-layout">
			<div class="whole-content-area">
				<c:if test="${nav.prevCityId ne null}">
				<a href="/travel/${nav.prevCityId}">
					<span class="next-intro">Prev</span>
					<span class="title traditional">${nav.prevCityName}</span>
				</a>
				</c:if>
				<c:if test="${nav.nextCityId ne null}">
				<a href="/travel/${nav.nextCityId}">
					<span class="next-intro">Next</span>
					<span class="title traditional">${nav.nextCityName}</span>
				</a>
				</c:if>
				<%--
				<a href="/travel" class="work-index"></a>
				--%>
			</div>
		</div>
	</div>
</nav>

<!-- Scripts -->
<script type='text/javascript' src="https://unpkg.com/shufflejs@5"></script>
<script type='text/javascript' src="/base/js/jquery.poptrox.min.js"></script>
<script type='text/javascript' src='/base/unitegallery/js/unitegallery.min.js'></script>	
<script type='text/javascript' src='/base/unitegallery/themes/tiles/ug-theme-tiles.js'></script>


<script type="text/javascript">
(function($){
	
	$(document).ready(function() {

		$(".video-play").click(function(){
			$("video").trigger('play');
			//$('video').trigger('pause');
			
			$(this).addClass("none");
		});

		$("video").each(function(){
			var vid = $(this).get(0);

			vid.onplay  = function() {
				$(".video-play").addClass("none");
			};
			
			vid.onpause = function() {
				$(".video-play").removeClass("none");
			};
			
			vid.onended = function() {
				$(".video-play").removeClass("none");
			};
			
			vid.onseeking = function() {
				$(".video-play").addClass("none");
			};
			
			vid.onseeked  = function() {
				$(".video-play").addClass("none");
			};

		});
		
		// 셔플 태그 존재시..
		if($(".my-shuffle").length > 0){

			$('.my-shuffle').poptrox({
				usePopupCaption: false,
				usePopupNav: true
			});
			
			var Shuffle = window.Shuffle;
			var myShuffle = new Shuffle(document.querySelector('.my-shuffle'), {
				itemSelector: '.js-item',
				sizer: '.my-sizer-element',
				buffer: 1
			});
			
		}
		
		// 갤러리 태그 존재시..
		if($(".gallery_container").length > 0){
			
			<c:forEach var="result" varStatus="varStatus" items="${itemList}">
				<c:if test="${result.layout eq 'TILES'}">
				$("#gallery${result.sort}").unitegallery({
					tiles_type:"${result.tilesType}",
					tiles_align:"left",
					lightbox_type: "wide",
					lightbox_show_textpanel:false
				});			
				</c:if>
			</c:forEach>

		}
		
	});	
	
})(jQuery);
</script>