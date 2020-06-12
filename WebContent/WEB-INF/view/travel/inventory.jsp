<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/base/common/taglibs.jsp"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<article class="page">		
	<header class="full-layout">
		<hgroup class="whole">
			<h1>Travel</h1>
		</hgroup>
	</header>
</article>

<div class="full-layout index alt">

	<c:forEach var="result" varStatus="varStatus" items="${cityList}">
	<figure class="third">
		<div class="thumbnail-wrap">
			<a href="/travel/${result.cityId}" class="thumbnail">
				<span class="title">${result.cityName}</span>							
				<img src="/base/images/travel/${result.cityId}/thumbnail.jpg" alt="" width="600" height="400">
			</a>
				
			<span class="tags">
				<c:forEach var="tag" varStatus="varStatus" items="${result.tagList}">
				<a href="/tags/${tag.keyword}">#${tag.keyword}</a>
				</c:forEach>
			</span>
		</div>
	</figure>
	</c:forEach>
	
</div>