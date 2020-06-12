<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/base/common/taglibs.jsp"%>

<div class="wrapper">
	<div class="side-content">
		<div class="text-block sticky">
			<h2>${result.memo}</h2>
		</div>
	</div>
	<div class="side-layout">
		<div class="container">
			<div class="js-grid my-shuffle">

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
				    	<c:set var="css1" value="aspect--9x80" />
				    	<c:set var="css2" value="row-span" />
				    </c:when>
				    <c:when test="${type eq 'W'}">
				    	<c:set var="css1" value="aspect--32x9" />
				    	<c:set var="css2" value="col-span" />
				    </c:when>
				    <c:otherwise>
				    	<c:set var="css1" value="aspect--16x9" />
				    	<c:set var="css2" value="" />
				    </c:otherwise>
				</c:choose>
					
			    <figure class="js-item column ${css2}">
					<div class="aspect ${css1}">
						<div class="aspect__inner">
							<a href="${path}/${shuffle.cityId}/shuffle/${i}.jpg"><img src="${path}/${shuffle.cityId}/shuffle/${i}.jpg" /></a>
						</div>
					</div>
			    </figure>
			    
		    </c:forEach>
			
			<div class="column my-sizer-element"></div>
			</div>
		</div>
	</div>
</div>