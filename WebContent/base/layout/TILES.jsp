<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/base/common/taglibs.jsp"%>

<div class="wrapper">
	<div class="side-content">
		<div class="text-block sticky">
			<h2>${result.memo}</h2>
		</div>
	</div>
	
	<c:if test="${result.shuffle.coverYn eq 'Y'}">
	<div class="side-layout">
		<figure class="whole">
			<img src="${path}/${result.cityId}/${result.sort}/cover.jpg" alt="" width="1800" height="1200">
		</figure>
	</div>
	</c:if>
	
	<div class="side-layout">
		<figure class="whole">
		<div id="gallery${result.sort}" class="gallery_container" style="display:none;">

			<c:set var="shuffle" value="${result.shuffle}" />
			<c:forEach var="i" begin="1" end="${shuffle.total}" step="1">

				<a>
				<img alt=""
				     src="${path}/${result.cityId}/${result.sort}/${i}.jpg"
				     data-image="${path}/${result.cityId}/${result.sort}/${i}.jpg"
				     data-description="${result.memo}"
				     style="display:none">
				</a>
			    
		    </c:forEach>
			
		</div>
		</figure>
	</div>
</div>