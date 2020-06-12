<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/base/common/taglibs.jsp"%>

<c:set var="user" value="${sessionScope['user']}" />

<link rel="stylesheet" type="text/css" href="/base/css/fullcalendar/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="/base/css/jquery-ui.css" />
	
<script type="text/javascript" src="/base/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/base/js/moment/moment.js"></script>
<script type="text/javascript" src="/base/js/fullcalendar/fullcalendar.js"></script>
		
<script type="text/javascript">
(function($){
	
	setDialog = (function() {

		var dialog, param;
		
		function init(){
			dialog = $("#dialog").dialog({
				title : "일정",
				autoOpen: true,
				modal : true,
				resizable : false,
				width : 350,
				height : 200,
				open : function(){
					
				}
			});

	 		$("input[name=start], input[name=end]").datepicker({
	 			inline: true,
	 			dateFormat: 'yy-mm-dd'
			});
	 		
	 		$("#save").click(function(){
	 			save();
	 		});
		}
		
		function open() {
			if( dialog == null ){
				init();
			}
			dialog.dialog("open");
		}

		function save() {

			var data = {};
			$.each($("form[name=form]").serializeArray(), function() {
				data[this.name] = this.value;
			});

			if(data.title == ""){
				alert("제목을 입력하세요.");
				return;
			}
			
			if(confirm("등록 하시겠습니까?")){
				param = $("form[name=form]").serialize();
				$.post("/schedule/save", param).success(function(result) {
					
					var eventData = {};
					eventData.title = data.title;
					eventData.start = data.start;
					eventData.end = data.end;
					$('#calendar').fullCalendar('renderEvent', eventData, true);
					
					dialog.dialog("close");
				});
			}
			
			$('#calendar').fullCalendar('unselect');
		}
		
		return {
			open: open
		};
	})();
	
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			//defaultDate: '2016-01-12',
			defaultDate: moment().format("YYYY-MM-DD"),
			selectable: true,
			selectHelper: true,
			select: function(start, end) {
				
				setDialog.open();
				
				/*
				var title = prompt('Event Title:');
				var eventData;
				if (title) {
					eventData = {
						title: title,
						start: start,
						end: end
					};
					$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				}
				$('#calendar').fullCalendar('unselect');
				*/
			},
			editable: true,
			eventLimit: true, // allow "more" link when too many events

		    events: function(start, end, timezone, callback) {

 		        $.ajax({
		            url: '/schedule/retrieveScheduleList',
		            dataType: 'json',
		            data: {
		                // our hypothetical feed requires UNIX timestamps
		                start: start.unix(),
		                end: end.unix()
		            },
		            success: function(result) {
		            	console.log("result : " + JSON.stringify(result.data));
		                var events = [];
		                $.each(result.data, function(i, v){
		                    events.push({
		                        title: v.title,
		                        start: v.start,
		                        end: v.end
		                    });
		                });

		                /*
		                $(doc).find('event').each(function() {
		                    events.push({
		                        title: $(this).attr('title'),
		                        start: $(this).attr('start') // will be parsed
		                    });
		                });
		                */
		                callback(events);
		            }
		        });
		    }
			
		});
		
	});
	
})(jQuery);
</script>

<style>

	#calendar {
		margin: 0 auto;
		padding: 20px;
	}

</style>

<article class="page">
	<header class="full-layout">
		<hgroup class="whole">
			<h1>Schedule</h1>
		</hgroup>
	</header>

	<div class="full-layout">
		<!--  
		<div class="whole">
			<div class="wrapper">
				<h2>Schedule</h2>
			</div>
		</div>
		-->

		<div class="wrapper">

			<div id='calendar'></div>
			
			<div id="dialog" class="none">
				<div class="blockDetail" style="min-width:200px;">
					<form name="form">
					<table>
						<caption></caption>
						<colgroup>
							<col width="35%" />
							<col width="65%" />
						</colgroup>
						<tbody>
							<tr>
								<th>시작일</th>
								<td>
									<input class="inputbox" name="start" size="10" readOnly />
								</td>
							</tr>
							<tr>
								<th>종료일</th>
								<td>
									<input class="inputbox" name="end" size="10" readOnly />
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td>
									<input class="inputbox" name="title" size="10" />
								</td>
							</tr>
						</tbody>
					</table>
					</form>
				</div>
				<div class="blockButton"> 
					<ul>
						<li><a id="save" class="button" href="#a"><span>확인</span></a></li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</article>