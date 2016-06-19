<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  
	
    <script>
    var ws;
    var jUser = JSON.parse('${jUser}');
    

    function connect() {
        ws = new WebSocket("ws://" + document.location.host + "/lifeeditor/chat/" + jUser.userID);
		alert(connect);

        ws.onmessage = function(event) {
            console.log(event.data);
            var message = JSON.parse(event.data);
            console.log(message.msgSender + " : " + message.receiver + "content:" + message.content);
        };
    }
    
     function send(json) {
        var content = document.getElementById("msg").value;
        var to = document.getElementById("to").value;
        var json = JSON.stringify({
            "to":to,
            "content":content
        });

        ws.send(json);
        
    }

        $(function () {
        	connect();
        	haveFaces = false;
            chatNum = 0;
        	jFriends = '${jFriends}';
        	var friendsHtml = "";
        	if(jFriends.length != 0) {
        		jFriends = JSON.parse(jFriends);
        		$.each(jFriends,function(id,friend) {
        			if(friend.firstName.charAt(0).match('[A-z]') ) {
        				friendsHtml += 
        					'<div id="'+ id + '" class="friend">' +
        	            		'<img src="${ctx}/GetUserPicture?id=' + id + '" />' + 
        	            		'<label>' + friend.firstName + '&nbsp;' + friend.lastName + '</label>' + 
        	            		'<div class="online"></div>' +
        	        		'</div>';
        			}else {
        				friendsHtml +=
        					'<div id="' + id + '" class="friend">' +
	    	            		'<img src="${ctx}/GetUserPicture?id=' + id + '" />' + 
	    	            		'<label>' + friend.lastName + friend.firstName + '</label>' + 
	    	            		'<div class="online"></div>' +
	    	        		'</div>';
        			}
        			
        		})//end each
        		$('#friends').html(friendsHtml);
        	}
            $('body').on("keyup", ".textInput",function (e) {
                if (e.which == 13) {
                	var msgReceiver = $(this).parents('.chat').attr("id").substring(4); 
                	var json = JSON.stringify ({
                		type : "txt",
                		msgSender : jUser.userID,
                		msgReceiver : msgReceiver,
                		content : $(this).val()
                	})
                	$(this).val("");
                	ws.send(json);
                }
                   
            });
            $('#chatroom').click(function () {
                $('.chatroomOff').toggleClass('chatroomON');
                $('#friends').toggleClass('on');
            })
            
            var friends = document.querySelectorAll("div.friend");
            for (var i = 0; i < friends.length; i++)
                friends[i].onclick = newChat;
        });//end onReady
      
        function newChat() {
            //var chats = document.getElementById("chats");
            if (!document.getElementById("chat" + this.id)) {
                chats.innerHTML += "<div id='chat" + this.id + "' class='chat' style='right:" + (276 + chatNum * 270) + "px'>" +
                                      "<div class='chatTittle'>" + "<label>" + $(this).find('label').text() + "</label>" +
                                      "<div class='online'></div>" +
                                      "<img id='exit" + this.id + "' class='chatIcon' src='${ctx}/images/chatroom/X.png' /></div> " +
                                      "<div class='chatContent'></div>" +
                                      "<div class='chatInput'>" +
                                      "<input class='textInput' placeholder='輸入訊息......'></div>" +
                                      "<div class='div_chatMenu'><img class='chatMenu' src='${ctx}/images/chatroom/face.png'></div>" +
                                      "</div>"
                var exits = document.querySelectorAll("img.chatIcon");
                var textInputs = document.querySelectorAll("input.textInput");
                for (var i = 0; i < exits.length; i++) {
                    exits[i].onclick = delChat;
                }

                chatNum++;
            }
        }
        function delChat() {
            var chat = this.parentNode.parentNode;
            chat.parentNode.removeChild(chat);
            chatNum--;
            if (document.querySelectorAll("div.chat")) {
                var chats = document.querySelectorAll("div.chat");
                for (var i = 0; i < chats.length; i++)
                    chats[i].style.right = (276 + i * 270) + "px";
            }
        }

        function printFace(obj) {
            obj.className = "chatMenuON";
            var chatMenu = obj.parentNode;
            chatMenu.parentNode.style.zIndex = "200000";
            chatMenu.innerHTML += "<div id='faces'><img class='face' src='${ctx}/images/chatroom/smile.png' /><img class='face' src='${ctx}/images/chatroom/angry.png' /><img class='face' src='${ctx}/images/chatroom/scare.png' /></div>";

        }

        function delFace() {
            var div_faces = document.getElementById("faces");
            div_faces.parentNode.parentNode.style.zIndex = "100000";
            div_faces.parentNode.removeChild(div_faces);
            var imgChatMenu = document.querySelectorAll("img.chatMenuON")[0];
            imgChatMenu.className = "chatMenu"
        }

        document.onclick = function (nsevent) {
            var e = nsevent ? nsevent : event;
            if (e.target.className == "chatMenu") {
                if (haveFaces == false) {
                    printFace(e.target);
                    haveFaces = true;
                }
                else {
                    delFace();
                    printFace(e.target);
                }
            }

            else if (e.target.className == "chatMenuOn") {
                delFace();
                haveFaces = false;
            }
            else if (document.getElementById("faces")) {
                if (e.target.id != "faces") {
                    delFace();
                    haveFaces = false;
                }
            }
        }

    </script>
</head>
<body id="body">
    <div id="chatroom" class="chatroomOff"><label>聊天室</label></div>
   
     <div id="friends" class="off"></div>

    <div id="chats"></div>

</body>
</html>