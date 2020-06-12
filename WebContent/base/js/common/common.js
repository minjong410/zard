// jQuery alias setting
var $jq = jQuery.noConflict();


(function($){

	jQuery.fn.ajaxLoadStart = function(type) {
		var $target = this;
		
		if($target[0].tagName.toLowerCase() == "body") {
			var $loading = $('<div/>').appendTo($target)
				.addClass("ajax-body-loading");
		} else {
			var $loading = null;
			switch($target.css("position")) {
				case "relative" :
				case "absolute" :
					$loading = $('<div/>').appendTo($target);
					break;
				default :
					switch($target.parent().css("position")) {
						case "relative" :
						case "absolute" : break;
						default : $target.parent().css("position", "relative");
							
					}
					var position = $target.position();
					$loading = $('<div/>').appendTo($target.parent())
						.css({left:position.left, top:position.top});
			}
			$loading.css({width:$target.innerWidth(), height:$target.innerHeight()})
				.addClass(type == "button" ? "ajax-button-loading" : "ajax-container-loading");
		}
	};
	
	jQuery.fn.ajaxLoadComplete = function(isComplete) {
		$("div.ajax-body-loading, div.ajax-container-loading, div.ajax-button-loading", this).remove();
		if(!isComplete) this.siblings("div.ajax-container-loading, div.ajax-button-loading").remove();
	};
	
	adjustFeatureImageHeight = function(){
		if ( $(window).width() > 968 ){
			$("#feature-image").height($(window).height() - $("header.full-layout").outerHeight(true) );
		}else {
			$("#feature-image").height("");
		}
	}
	
	$(document).ready(function() {
		
		adjustFeatureImageHeight();
		
		//$("figure").fitVids();
		
		$(window).scroll(function() {
			$(".sticky").each(function(index){
				var offset = $(this).parents(".wrapper").offset();
				var stickyHeight = $(this).parents(".wrapper").height();
	    		var scrollPosition = $(window).scrollTop();
	    		var stickyTopOffset = offset.top;
				var stickyBottomOffset = offset.top + stickyHeight;
				
	    		if ((scrollPosition > stickyTopOffset) && (scrollPosition < stickyBottomOffset)){
	        		//Hot Area is Active
	        		$(this).addClass("stuck");
	    		}else{
	    			//Hot Area is inactive
	        		$(this).removeClass("stuck");
	    		}
	    		
	    		if(scrollPosition > stickyBottomOffset - $(this).outerHeight()) {
	    			//Sticky block has hit the bottom of it's parent
	    			$(this).removeClass("stuck");
	    			$(this).addClass("bottom-anchored");
	    		}
	    		
	    		if(scrollPosition < stickyBottomOffset - $(this).outerHeight()) {
	    			//Sticky block has not hit the bottom of it's parent
	    			$(this).removeClass("bottom-anchored");
	    		}
	    		
			});
			$(".stuck").removeClass("transition");
			
		});
		
		$(window).resize(function() {
			adjustFeatureImageHeight();
		});
	
	});

})(jQuery);