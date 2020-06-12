<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/base/common/taglibs.jsp"%>

<div class="wrapper">
	<div class="side-content">
		<div class="text-block sticky">
			<h2>${result.memo}</h2>
		</div>
	</div>
	<div class="side-layout">
		<div class="container gallery-container">
		    <div class="tz-gallery">
		        <div class="row">
		
					<c:set var="shuffle" value="${result.shuffle}" />
					<c:forEach var="i" begin="1" end="${shuffle.total}" step="1">
					
					<c:set var="type" value="N" />
					<c:forEach items="${fn:split(shuffle.vertical, ',') }" var="item">
						<c:if test="${item eq i}">
							<c:set var="type" value="V" />
						</c:if>
					</c:forEach>
					<c:forEach items="${fn:split(shuffle.wide, ',') }" var="item">
						<c:if test="${item eq i}">
							<c:set var="type" value="W" />
						</c:if>
					</c:forEach>
	
					<c:choose>
					    <c:when test="${type eq 'V'}">
					    	<c:set var="css" value="col-sm-6 col-md-4" />
					    </c:when>
					    <c:when test="${type eq 'W'}">
					    	<c:set var="css" value="col-sm-12 col-md-8" />
					    </c:when>
					    <c:otherwise>
					    	<c:set var="css" value="col-sm-6 col-md-4" />
					    </c:otherwise>
					</c:choose>
					
		            <div class="${css}">
		                <a class="lightbox" href="http://minjong410.cdn3.cafe24.com/${result.cityId}/${result.sort}/${i}.jpg">
		                    <img src="http://minjong410.cdn3.cafe24.com/${result.cityId}/${result.sort}/${i}.jpg" alt="">
		                </a>
		            </div>
		            </c:forEach>
		
		        </div>
		    </div>

		</div>
	</div>
</div>