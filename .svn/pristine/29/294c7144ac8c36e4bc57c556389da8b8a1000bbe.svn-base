<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<% String user = String.valueOf(session.getAttribute("nick")); %>
	<% String img = String.valueOf(session.getAttribute("profile"));  %>
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/favicon.ico" type="image/x-icon">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 방생성자의 이름 또는 닉네임이 들어가면 된다. -->
	<title>${calendar.calTitle }</title>
	<link href="<%=request.getContextPath() %>/resources/css/chat.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/94aab5b4e0.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gamja+Flower&family=Jua&display=swap" rel="stylesheet">
	<script type="text/javascript">

	var messageara = $("#scrollDiv");
	var imgPath = "profileimg/${member.memProfile }";
	
		 
		 function getImgPath(){
				return imgPath;
			}
		
		// 전체적으로 Handler에서 고쳐야함 webSocket session -> 로그인된 유저의 session
		var webSocket = {
			init: function(param) {
				this._url = param.url;
				this._initSocket();
				
			},
			sendChat: function() {
				this._sendMessage('${param.bang_id}', 'CMD_MSG_SEND', $('#message').val(), '${member.memId}', '${member.memNickname}', '${member.memProfile}', '${calendar.calNo}', '${calendar.calNo}');
				console.log(this._session);
				console.log(this);
				$('#message').val('');
			},
			sendEnter: function() {
				this._sendMessage('${param.bang_id}', 'CMD_ENTER', $('#message').val(), '${member.memId}', '${member.memNickname}', '${member.memProfile}', '${calendar.calNo}', '${calendar.calNo}');
				$('#message').val('');
				
			},
			receiveMessage: function(msgData) {
				// 정의된 CMD 코드에 따라서 분기 처리
				//src='profileimg/${member.memProfile }'
				if(msgData.cmd == 'CMD_MSG_SEND') {	
					// 이미지 경로
					var user_id = '<%= user %>';
					console.log(":::", user_id);
					//profileimg/37743cf0_lwt8.png
					var user_img = 'profileimg/'+'<%= img %>';
					console.log("asdasd", user_img);
				// 내가 보내는 메세지
				if(msgData.profile != '프사'){ // '프사' 가 아닐 경우
					if(msgData.msg == null || msgData.msg == "" || msgData.msg == 'null' || msgData.msg == " "){
						/* sendBlank(); */
					}else{
						if(msgData.user != '${calendar.calId}' && msgData.nick == '<%= user %>'){
							$('#divChatData').append('<div id="myChat"><div class="talk-bubble tri-right round border right-top" style="clear: both;">' 
									+ '<div class="talktext"><p>'+ msgData.msg + '</p></div></div>' + msgData.nick +'&nbsp;&nbsp;&nbsp;<img id="userImg" src= "profileimg/'+ msgData.profile + '" ></div>' );
						// 상대방이 보내는 메세지
						}else if(msgData.user != '${calendar.calId}' && msgData.nick != '<%= user %>'){
							$('#divChatData').append('<div id="userChat"><img id="userImg" src="profileimg/'+ msgData.profile +'"&nbsp;&nbsp;&nbsp;>'+ msgData.nick
									+ '&nbsp;&nbsp;&nbsp;<div class="talk-bubble tri-right left-in" style="margin-top: 1px; border-radius: 10px;">'
									+ '<div class="talktext"><p>'+ msgData.msg +'</p></div></div></div>');
						// 상대방인데 방장
						}else if(msgData.user == '${calendar.calId}' && msgData.nick != '<%= user %>'){
							$('#divChatData').append('<div id="masterChat"><img id="userImg" src="profileimg/'+ msgData.profile +'" >&nbsp;&nbsp;&nbsp;'+ msgData.nick +'</div>' 
										+ '<div class="talk-bubble tri-right left-in" style="margin-top: 1px; border-radius: 10px; float: left;"><div class="talktext">'
										+ '<p><i class="fa-solid fa-crown"></i><br>'+ msgData.msg +'</p></div></div>');
						// 자신이면서 방장
						}else if(msgData.user == '${calendar.calId}' && msgData.nick == '<%= user %>'){
							$('#divChatData').append('<div id="myChat"><div class="talk-bubble tri-right round border right-top" style="clear: both;">'
							+ '<div class="talktext" style="text-align: center;"><p><i class="fa-solid fa-crown"></i><br>'+ msgData.msg +'</p></div></div>'
							+ '&nbsp;&nbsp;'+ msgData.nick +'&nbsp;&nbsp;&nbsp;<img id="userImg" src="profileimg/'+ msgData.profile +'" ></div>');
							console.log(getImgPath());
						}
					}
				}else{ // '프사' 일 경우
					var te = '${path}';
					if(msgData.msg == null || msgData.msg == "" || msgData.msg == 'null' || msgData.msg == " "){
						/* sendBlank(); */
					}else{
						if(msgData.user != '${calendar.calId}' && msgData.nick == '<%= user %>'){
							$('#divChatData').append('<div id="myChat"><div class="talk-bubble tri-right round border right-top" style="clear: both;">' 
									+ '<div class="talktext"><p>'+ msgData.msg + '</p></div></div>' + msgData.nick +'&nbsp;&nbsp;&nbsp;<img id="userImg" src="' + te + '/resources/images/profile/profiledefault.png"></div>' );
						// 상대방이 보내는 메세지
						}else if(msgData.user != '${calendar.calId}' && msgData.nick != '<%= user %>'){
							$('#divChatData').append('<div id="userChat"><img id="userImg" src="' + te + '/resources/images/profile/profiledefault.png"&nbsp;&nbsp;&nbsp;>'+ msgData.nick
									+ '&nbsp;&nbsp;&nbsp;<div class="talk-bubble tri-right left-in" style="margin-top: 1px; border-radius: 10px;">'
									+ '<div class="talktext"><p>'+ msgData.msg +'</p></div></div></div>');
						// 상대방인데 방장
						}else if(msgData.user == '${calendar.calId}' && msgData.nick != '<%= user %>'){
							$('#divChatData').append('<div id="masterChat"><img id="userImg" src="' + te + '/resources/images/profile/profiledefault.png" >&nbsp;&nbsp;&nbsp;'+ msgData.nick +'</div>' 
										+ '<div class="talk-bubble tri-right left-in" style="margin-top: 1px; border-radius: 10px; float: left;"><div class="talktext">'
										+ '<p><i class="fa-solid fa-crown"></i><br>'+ msgData.msg +'</p></div></div>');
						// 자신이면서 방장
						}else if(msgData.user == '${calendar.calId}' && msgData.nick == '<%= user %>'){
							$('#divChatData').append('<div id="myChat"><div class="talk-bubble tri-right round border right-top" style="clear: both;">'
							+ '<div class="talktext" style="text-align: center;"><p><i class="fa-solid fa-crown"></i><br>'+ msgData.msg +'</p></div></div>'
							+ '&nbsp;&nbsp;'+ msgData.nick +'&nbsp;&nbsp;&nbsp;<img id="userImg" src="' + te + '/resources/images/profile/profiledefault.png" ></div>');
							console.log(getImgPath());
						}
					}
					
				}
					
				}
				// 입장
				else if(msgData.cmd == 'CMD_ENTER') {
					// 여기다가 하면 들어오는 클라이언트따라 이름이 바뀜
					$('#divChatData').append('<div id="sendEnter"><h2>[입장] ' + msgData.msg + '</h2></div>');
				}
				// 퇴장
				else if(msgData.cmd == 'CMD_EXIT') {					
					$('#divChatData').append('<div id="sendExit"><h2>[퇴장] ' + msgData.msg + '</h2></div>');
				}
				$("#scrollDiv").scrollTop($("#scrollDiv")[0].scrollHeight);
			},
			closeMessage: function(str) {
				$('#divChatData').append('<div id="sendError">' + '연결 끊김 : ' + str + '</div>');

			},
			disconnect: function() {
				this._socket.close();
			},
			_initSocket: function() {
				this._socket = new SockJS(this._url);
				
				this._socket.onopen = function(evt) {
					
					webSocket.sendEnter();
				};
				this._socket.onmessage = function(evt) {
					webSocket.receiveMessage(JSON.parse(evt.data));
				};	
				this._socket.onclose = function(evt) {
					webSocket.closeMessage(JSON.parse(evt.data));
				}
			},
			_sendMessage: function(bang_id, cmd, msg, user, nick, profile, param, calNo, enter_session, msg_session) {
				var msgData = {
						bang_id : bang_id,
						cmd : cmd,
						user : user,
						msg : msg,
						nick : nick,
						profile : profile,
						param : param,
						calNo : calNo,
						enter_session : enter_session,
						msg_session : msg_session
				};
				var jsonData = JSON.stringify(msgData);
				this._socket.send(jsonData);
			}
		};
	</script>	
	<script type="text/javascript">
        $(window).on('load', function () {
			webSocket.init({ url: '<c:url value="/chat" />' });
			$.ajax({
				url: '<c:url value="/chata.do" />'
				,data : {"param" : "${calendar.calNo}"}
				,success : function(data){
					
				},error : function(data){
					
				}
		
			});

		});
        
        function exit(){
    		var exitConfirm = confirm("대화창을 끝내시겠습니까?");
    		if(exitConfirm == true){
    		var value = ${calendar.calNo};
    		 var data = {"calNo" : value};
    			
    		 $.ajax({
    			 type : "GET",
    			 url : "deleteCalendar.do",
    			 data: data,
    			 error : function(error){
    				 console.log("error");
    			 },
    			 success : function(data){
           			 alert("삭제 되었습니다.");
     					 opener.parent.location.replace("main.do")
     					 window.close(); // 팝업창
    			 }
    	 	});		
    			
    		}else{
    			return false;
    		}
    	}
        
        
	</script>
</head>
<body>
	<div id="roominfo">
		<h2 id = "roomTitle">${calendar.calTitle }</h2> <!-- 방 생성때 이름 -->
		<h3 id = "roomMaster"><i class="fa-solid fa-crown"></i>&nbsp;방 주최자 : ${calendar.calNick }</h3>
		<c:if test="${calendar.calId eq member.memId }">
		<button class="exit" onclick="exit()" style="float: right;padding: 10px;border-radius: 20px;">끝내기</button>
		</c:if>
	</div>
	<div id="scrollDiv">
		<div id="divChatData">
			<div id="chatHr">
			</div>
		</div>
	</div>
	<div id="chat_div">
		<input type="text" id="message" style="padding-left: 5px;" placeholder="공백을 입력하지 마세요." required="required" size="30" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
     <button class="learn-more" style="width: 150px; height: 30px;" onclick="webSocket.sendChat()">채팅 전송</button>
	</div>

</body>
</html>