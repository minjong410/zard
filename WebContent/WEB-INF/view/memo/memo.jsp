<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/base/common/taglibs.jsp"%>

<c:set var="user" value="${sessionScope['user']}" />

<link rel="stylesheet" type="text/css" href="/base/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="/base/css/notepad/notepad.css" />

<script type="text/javascript" src="/base/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/base/js/jquery/jquery.tmpl.js"></script>
		
<script type="text/javascript">
(function($){

	$(document).ready(function() {

		// Load Data
		var url = "/memo/retrieveMemoList";
		$.post(url, "category=mart").success(function(result) {

			// Clear
			$("figure").remove();
			
			// Render
			$.each(result.data, function(i, v){
				//console.log("v : " + v.category);
				
				// Category Division
				if(v.category == 'mart'){
					$("div.mart").after($("#tmpl-item").tmpl(v).data('data', v));
				}
				
				if(v.category == 'life'){
					$("div.life").after($("#tmpl-item").tmpl(v).data('data', v));
				}

			});
			
		});
		
		// Save Data
		$("body").on("click", "span.close-notepad", function(){
			var data = $(this).parents("figure").data('data')
			var memo = $(this).parent().next().html();
			console.log(memo);
			
			var param = {'category': data.category,
						'sort': data.sort,
						'memo': memo};

			// Loading Start
			var box = $(this).parents(".notepad");
			$(box).ajaxLoadStart();
 			$.post("/memo/save", param).success(function(result) {
 				// Loading End
 				$(box).ajaxLoadComplete();
			});
			
		});

	});	
	
})(jQuery);
</script>

<script id="tmpl-item" type="text/x-jquery-tmpl">
	<figure class="fourth">
		<div class="notepad">
			<div class="notepad-header">
				<span class="notepad-status">\${name}</span>
				<span class="close-notepad">save</span>
			</div>
			<div contenteditable="true" class="notepad-content">{{html memo}}<div>
		</div>
	</figure>
</script>

<article class="page">
	<header class="full-layout">
		<hgroup class="whole">
			<h1>Memo</h1>
		</hgroup>
	</header>

	<div class="full-layout">
		<div class="whole mart">
			<div class="wrapper">
				<h2>Shopping Basket</h2>
			</div>
		</div>

		<div class="whole life">
			<div class="wrapper">
				<h2>Daily Life</h2>
			</div>
		</div>
	</div>
</article>