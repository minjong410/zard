<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/base/common/taglibs.jsp"%>

<c:set var="user" value="${sessionScope['user']}" />

<link rel="stylesheet" type="text/css" href="/base/css/jquery-ui.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="/base/css/bootstrap/bootstrap-boxautocomplete.css">

<script type="text/javascript" src="/base/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/base/js/jquery/jquery.tmpl.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/base/js/bootstrap/boxautocomplete.jquery.js"></script>	
<script type="text/javascript" src="/base/js/jquery/jquery.number.js"></script>

<script type="text/javascript">
(function($){

	getList = function(){

		var url = "/expense/retrieveExpenseList";
		var param = {userId : "${user.userId}"};
		
		$.post(url, param).success(function(result) {
			var render = $("#render");
			$(render).empty();
			
			$.each(result.data, function(i, o){
				if(o.status == "D"){
					o.status = "완료";	
				}else if(o.status == "R"){
					o.status = "반려";
				}else{
					o.status = "미결";
				}
				
				//o.price = String(o.price).split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');

			});
			
			$("#tmpl-item").tmpl(result.data).appendTo(render);
		});
	}
	
	save = function() {

		var data = {};
		$.each($("form[name=form]").serializeArray(), function() {
			data[this.name] = this.value;
		});

		if(data.product == ""){
			alert("사용내역을 입력하세요.");
			return;
		}

		if(data.place == ""){
			alert("사용처를 입력하세요.");
			return;
		}
		
		if(data.useDate == ""){
			alert("사용일을 입력하세요.");
			return;
		}
		
		if(data.price == ""){
			alert("금액을 입력하세요.");
			return;
		}
		
		if(confirm("등록 하시겠습니까?")){

			//param = $("form[name=form]").serialize();
			param = $("form[name=form]").serializeArray();

			var attendee = $("#attendee").val();
			var attendeeArray = $.parseJSON(attendee);

			attendee = "";
			$.each(attendeeArray, function(i, o){
				var delimiter = ",";
				if(i == 0){
					delimiter = "";
				}
				attendee = attendee + delimiter + o.name;
			});

			// Add Param
			param.push({"name":"attendee","value":attendee});
			
			$.post("/expense/save", param).success(function(result) {
				$(".ba-remove").click();
				$("form")[0].reset();  
				
				getList();
			});
			
		}

	}
	
	deposit = function(obj) {
		var data = $(obj).closest("figure").tmplItem().data;
		data.status = "D";
		//console.log("data1 : " + data);
		//console.log("data2 : " + JSON.stringify(data));

		if(confirm("입금 하시겠습니까?")){
			$.post("/expense/approve", data).success(function(result) {
				getList();
			});
		}
	}

	restore = function(obj) {
		var data = $(obj).closest("figure").tmplItem().data;
		data.status = "R";
		
		if(confirm("반려 하시겠습니까?")){
			$.post("/expense/approve", data).success(function(result) {
				getList();
			});
		}
	}
	
	$(document).ready(function($){
		
 		$("input[name=useDate]").datepicker({
 			inline: true,
 			dateFormat: 'yy-mm-dd'
		});
 		
		$('#attendee').boxautocomplete({
			data: [{'name': '조서방', 'value': '조서방'},
			       {'name': '김송이', 'value': '김송이'},
			       {'name': '선우원', 'value': '선우원'},
			       {'name': '심이규', 'value': '심이규'},
			       {'name': '이지선', 'value': '이지선'},
			       {'name': '정다희', 'value': '정다희'},
			       {'name': '정유리', 'value': '정유리'},
			       {'name': '기타', 'value': '기타'}
			       ],
			uniqueValue: false,
			hideInput: true,
			valueFormat: "json"
		});
		
 		$("#save").click(function(){
 			save();
 		});
		
		$(".number").number(true);
		
		$("#render").delegate("a.btn-primary", 'click', function(e) {
			deposit(this);	
		});
		
		$("#render").delegate("a.btn-danger", 'click', function(e) {
			restore(this);	
		});
 		
		getList();
	});

})(jQuery);
</script>

<script id="tmpl-item" type="text/x-jquery-tmpl">
	<figure class="fourth">
		<div class="list-group">
			<a href="#" class="list-group-item">
				<h5 class="list-group-item-heading" style="font-weight:800">\${product}</h5>
				<p class="list-group-item-text"><i class="fa fa-check-square-o" aria-hidden="true"></i> \${place} <cite title="date">(\${useDate})</cite></p>
				<p class="list-group-item-text"><i class="fa fa-check-square-o" aria-hidden="true"></i> \${attendee}</p>
				<p class="list-group-item-text"><i class="fa fa-check-square-o" aria-hidden="true"></i> <cite title="KRW">￦</cite> \${price}</p>
				<p class="list-group-item-text"><i class="fa fa-check-square-o" aria-hidden="true"></i> \${status}</p>
			</a>
			<a href="#" class="btn btn-primary btn-xs">Deposit</a>
			<a href="#" class="btn btn-danger btn-xs">Return</a>
		</div>
	</figure>
</script>

<article class="page">
	<header class="full-layout">
		<hgroup class="whole">
			<h1>HouseKeeping</h1>
		</hgroup>
	</header>
	
	<div class="full-layout">
		<div class="half">
			<div class="wrapper">
				<h2>Attendee</h2>
			</div>
			
			<input type="text" id="attendee" />
		</div>
		
		<div class="half">
			<div class="wrapper">
				<h2>Form</h2>
			</div>
			
			<form class="form-horizontal" name="form">
				<fieldset>
					<div class="form-group">
						<label for="inputPassword" class="col-lg-2 control-label">Memo</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" name="product" placeholder="Memo">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-lg-2 control-label">Place</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" name="place" placeholder="Place">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-lg-2 control-label">Date</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" name="useDate" placeholder="Date">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-lg-2 control-label">Price</label>
						<div class="col-lg-10">
							<input type="text" class="form-control number" name="price" placeholder="Price">
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-10 col-lg-offset-2">
							<a href="#a" class="btn btn-primary" id="save"><i class="fa fa-floppy-o"></i> Save</a>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</article>

<div class="full-layout index alt" id="render" />