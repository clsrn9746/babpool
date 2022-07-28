<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<% String user = String.valueOf(session.getAttribute("nick")); %>
	<% String img = String.valueOf(session.getAttribute("profile"));  %>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>웹소켓 채팅</title>
	<link href="<%=request.getContextPath() %>/resources/css/one.css" rel="stylesheet">
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
		
		var webSocket = {
			init: function(param) {
				this._url = param.url;
				this._initSocket();
			},
			sendChat: function() {
				// bang_id, cmd, msg, user, nick, profile, enter_session, msg_session
				this._sendMessage('${param.bang_id}', 'CMD_MSG_SEND', $('#message').val(), '${member.memId}', '${member.memNickname}', '${member.memProfile}', '${marketChat.marketNo}');
				$('#message').val('');
			},
			sendEnter: function() {
				this._sendMessage('${param.bang_id}', 'CMD_ENTER', $('#message').val(), '${member.memId}', '${member.memNickname}', '${member.memProfile}', '${marketChat.marketNo}');
				$('#message').val('');
			},
			receiveMessage: function(msgData) {

				// 정의된 CMD 코드에 따라서 분기 처리
				if(msgData.cmd == 'CMD_MSG_SEND') {					
					/* $('#divChatData').append('<div>' + msgData.msg + '</div>'); */
					var user_id = '<%=user %>';
					var user_img = 'profileimg/' + '<%=img %>';
					var te = '${path}';
					
					console.log("aa::", user_id);
					console.log("bb::", user_img);
					console.log("cc::", msgData.nick);
					
					if(msgData.msg == null || msgData.msg == "" || msgData.msg == 'null' || msgData.msg == " "){
						/* sendBlank(); */
					}else{
						if(msgData.user != '${calendar.calId}' && msgData.nick == '<%= user %>'){
							if('<%=img %>' == '프사'){
								$('#divChatData').append('<div id="myChat"><div class="talk-bubble tri-right round border right-top" style="clear: both;">' 
										+ '<div class="talktext"><p>'+ msgData.msg + '</p></div></div>' + msgData.nick +'&nbsp;&nbsp;&nbsp;<img id="userImg" src= "'+ te +'/resources/images/profile/profiledefault.png" ></div>' );
							}else{
								$('#divChatData').append('<div id="myChat"><div class="talk-bubble tri-right round border right-top" style="clear: both;">' 
										+ '<div class="talktext"><p>'+ msgData.msg + '</p></div></div>' + msgData.nick +'&nbsp;&nbsp;&nbsp;<img id="userImg" src= "profileimg/'+ msgData.profile + '" ></div>' );
							}
							
						// 상대방이 보내는 메세지
						}else if(msgData.user != '${calendar.calId}' && msgData.nick != '<%= user %>'){
							if('<%=img %>' == '프사'){
								$('#divChatData').append('<div id="userChat"><img id="userImg" src="'+ te +'/resources/images/profile/profiledefault.png">&nbsp;&nbsp;&nbsp;'+ msgData.nick
										+ '&nbsp;&nbsp;&nbsp;<div class="talk-bubble tri-right left-in" style="margin-top: 1px; border-radius: 10px;">'
										+ '<div class="talktext"><p>'+ msgData.msg +'</p></div></div></div>');								
							}else{
								$('#divChatData').append('<div id="userChat"><img id="userImg" src="profileimg/'+ msgData.profile +'">&nbsp;&nbsp;&nbsp;'+ msgData.nick
										+ '&nbsp;&nbsp;&nbsp;<div class="talk-bubble tri-right left-in" style="margin-top: 1px; border-radius: 10px;">'
										+ '<div class="talktext"><p>'+ msgData.msg +'</p></div></div></div>');
							}
						// 상대방인데 방장
						}else if(msgData.user == '${calendar.calId}' && msgData.nick != '<%= user %>'){
							if('<%=img %>' == '프사'){
								$('#divChatData').append('<div id="masterChat"><img id="userImg" src="'+ te +'/resources/images/profile/profiledefault.png"&nbsp;&nbsp;&nbsp;>'+ msgData.nick +'</div>' 
										+ '<div class="talk-bubble tri-right left-in" style="margin-top: 1px; border-radius: 10px; float: left;"><div class="talktext">'
										+ '<p><i class="fa-solid fa-crown"></i><br>'+ msgData.msg +'</p></div></div>');								
							}else{
								$('#divChatData').append('<div id="masterChat"><img id="userImg" src="profileimg/'+ msgData.profile +'"&nbsp;&nbsp;&nbsp; >'+ msgData.nick +'</div>' 
											+ '<div class="talk-bubble tri-right left-in" style="margin-top: 1px; border-radius: 10px; float: left;"><div class="talktext">'
											+ '<p><i class="fa-solid fa-crown"></i><br>'+ msgData.msg +'</p></div></div>');
								
							}
						// 자신이면서 방장
						}else if(msgData.user == '${calendar.calId}' && msgData.nick == '<%= user %>'){
							if('<%=img %>' == '프사'){
								$('#divChatData').append('<div id="myChat"><div class="talk-bubble tri-right round border right-top" style="clear: both;">'
										+ '<div class="talktext" style="text-align: center;"><p><i class="fa-solid fa-crown"></i><br>'+ msgData.msg +'</p></div></div>'
										+ '&nbsp;&nbsp;'+ msgData.nick +'&nbsp;&nbsp;&nbsp;<img id="userImg" src="profileimg/'+ msgData.profile +'" ></div>');
							}else{
								$('#divChatData').append('<div id="myChat"><div class="talk-bubble tri-right round border right-top" style="clear: both;">'
										+ '<div class="talktext" style="text-align: center;"><p><i class="fa-solid fa-crown"></i><br>'+ msgData.msg +'</p></div></div>'
										+ '&nbsp;&nbsp;'+ msgData.nick +'&nbsp;&nbsp;&nbsp;<img id="userImg" src="'+ te +'/resources/images/profile/profiledefault.png" ></div>');
							}
							
						}
					}
					
				}
				// 입장
				else if(msgData.cmd == 'CMD_ENTER') {
					$('#divChatData').append('<div id="sendEnter"><h2>[입장] ' + msgData.msg + '</h2></div>');
				}
				// 퇴장
				else if(msgData.cmd == 'CMD_EXIT') {					
					$('#divChatData').append('<div id="sendExit"><h2>[퇴장] ' + msgData.msg + '</h2></div>');
				}
				$("#scrollDiv").scrollTop($("#scrollDiv")[0].scrollHeight);
			},
			closeMessage: function(str) {
				$('#divChatData').append('<div>' + '연결 끊김 : ' + str + '</div>');
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
			_sendMessage: function(bang_id, cmd, msg, user, nick, profile, marketNo, enter_session, msg_session) {
				var msgData = {
						bang_id : bang_id,
						cmd : cmd,
						msg : msg,
						user : user,
						nick : nick,
						profile : profile,
						marketNo : marketNo,
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
			webSocket.init({ url: '<c:url value="/one" />' });	
		});
	</script>
</head>
<body>
	<div id="roominfo">
		<img src="${path}/marketImage.do?fileName=${marketChat.attaches.get(0).atchName}" width="200" height="200" style="float:left">
		<div id="masterInfo">
			<h2 id = "roomTitle">[${marketChat.marketCategory}]${marketChat.marketTitle }</h2> <!-- 방 생성때 이름 -->
			<h3 id = "roomPrice">${marketChat.marketPrice }원</h3>
			<h3 id = "roomMaster"><i class="fa-solid fa-crown"></i>&nbsp;${marketChat.marketNickname }</h3>
		</div>
	</div>
	<div id="scrollDiv" style="clear:both;">
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