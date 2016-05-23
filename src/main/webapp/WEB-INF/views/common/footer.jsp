<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--footer start-->
<footer class="site-footer">
    <div class="text-center">
        2016 BIDDING
        <a href="#" class="go-top">
            <i class="fa fa-angle-up"></i>
        </a>
    </div>
</footer>
<!--footer end-->
</section>
<!-- jquery -->
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/jquery/jquery-1.12.1.min.js" />"></script>

<!-- validation -->
<script type="text/javascript" src="<c:url value="/resources/javascript/form-validation/additional-methods.min.js" />"></script>
<script src="<c:url value="/resources/javascript/form-validation/jquery.validate.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/form-validation/messages_ko.min.js" />"></script>

<!-- js placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="<c:url value="/resources/javascript/select/select2.full.js" />"></script>
<!-- select2 -->

<script>
	$(document).ready(function() {
		/******** chatting setting ********/
		//웸소켓을 지정한 url로 연결한다.
		var webSocket = new WebSocket('ws://localhost:8080/chat');
		
		// 서버 통신 에러 났을 때
		webSocket.onerror = function(event) {
			onError(event);
		};
		
		// 데이터 통신하고 있는 세션 제거
		webSocket.onclose = function(event) {
			onClose(event);
		};
		
		// 초기 메인에서 세션 연결
		webSocket.onopen = function(event) {
			onOpen(event);
		};
		
		// 데이터가 나한테 전달되었을 때 자동으로 실행되는 function
		webSocket.onmessage = function(event) {
			onMessage(event);
		};
		/******* //chatting setting ******/
		
		/** 현재 시간 */
		function getTimeStamp() {
			var d = new Date();
	
			var s =
			leadingZeros(d.getFullYear(), 4) + '-' +
			leadingZeros(d.getMonth() + 1, 2) + '-' +
			leadingZeros(d.getDate(), 2) + ' ' +
	
			leadingZeros(d.getHours(), 2) + ':' +
			leadingZeros(d.getMinutes(), 2) + ':' +
			leadingZeros(d.getSeconds(), 2);
	
			return s;
		}

		function leadingZeros(n, digits) {
			var zero = '';
			n = n.toString();
	
			if (n.length < digits) {
				for (i = 0; i < digits - n.length; i++)
				zero += '0';
			}
			return zero + n;
		}
		/** // 현재시간 */
		
		$(".select2_single").select2({
			placeholder: "Select a state",
			allowClear: true
		});
		$(".select2_group").select2({});
		$(".select2_multiple").select2({
		maximumSelectionLength: 4,
		placeholder: "With Max Selection limit 4",
		allowClear: true
		});
      
		// tooltip
		$('[data-toggle="tooltip"]').tooltip(); 
      
		// chatting room open
		jQuery.fn.setChattingRoomPosition = function () {
	    this.css("position", "absolute");
	    this.css("top", "45px");
	    this.css("right", "20px");
	    this.css("z-index", "9999");
	    return this;
		}
		
		$('#goChattingRoom').click(function() {
			$('#chattingRoom').show();
			$('#chattingRoom').setChattingRoomPosition();
		});
		
		$('#hiddenChattingRoom').click(function() {
			$('#chattingRoom').attr('style', 'display: none;');
			$('#chatContent').empty();
		});
		
		function onMessage(event) {
			var data = event.data;
			$("#chatContent").append('<li class="left clearfix">'
							+ '<span class="chat-img pull-left">'
							+ '<img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />'
							+ '</span>'
							+ '<div class="chat-body clearfix">'
							+ '<div><strong class="primary-font">other</strong>'
							+ '<small class="pull-right text-muted">'
							+ '<span class="glyphicon glyphicon-time"></span>' + getTimeStamp() + '</small></div>'
							+ '<p>' + data + '</p></div></li>');
		}
		
		function onOpen(event) {
			$("#chatContent").append('채팅 서버에 접속 되었습니다.');
		}
		
		function onError(event) {
			alert(event.data);
		}
		
		$('#sendMessage').click(function() {
			var chatMessage = $('#chattingMessage').val();
			console.log('------ 채팅내용 전송 ------');
			console.log('채팅내용 : ' + chatMessage);
			console.log('----------------------');
			
			$('#chatContent').append('<li class="right clearfix">'
							+ '<span class="chat-img pull-right">'
							+ '<img src="http://placehold.it/50/FA6F57/fff&text=ME" alt="User Avatar" class="img-circle" />'
							+ '</span>'
							+ '<div class="chat-body clearfix">'
							+ '<div><small class=" text-muted">'
							+ '<span class="glyphicon glyphicon-time"></span>' + getTimeStamp() + '</small>'
							+ '<strong class="pull-right primary-font">Me</strong></div>'
							+ '<p>' + chatMessage + '</p></div></li>');
			
			// 소켓으로 메세지 전송
            webSocket.send($("#chattingMessage").val());

			// 입력한 내용 초기화
            $("#chattingMessage").val('');
			
		});
	});
	
</script>
<!-- /select2 -->
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/zabuto_calendar.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery-ui-1.9.2.custom.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.ui.touch-punch.min.js" />"></script>

    
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/gritter/js/jquery.gritter.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/gritter-conf.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/common-scripts.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/colorpicker/jquery.minicolors.min.js" />"></script>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/pace/pace.min.js" />"></script>
</body>
</html>