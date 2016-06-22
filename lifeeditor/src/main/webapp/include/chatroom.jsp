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
    connect();

    function connect() {
        ws = new WebSocket("ws://" + document.location.host + "/lifeeditor/chat/" + jUser.userID);

        ws.onmessage = function(event) {
            
            var message = JSON.parse(event.data);
            console.log(message);
            
            
           	if(message.msgSender == jUser.userID) {
           		var str = "";
           		if (message.type == 'img') {
           			str += '<div class="LEmsg">' +
           	   		'<div class="LEMsgReceiver"><img src="' + message.content + '" /></div>' +
    				'<div style="clear:both;" ></div>'+
    			'</div>';
           			
           			
           		}else {
           			str += rightMsg(message.content);
           		}
           		
           	
           		
           		$('#chat' + message.msgReceiver + ' .chatContent').append(str);
           		$('div.chatContent').scrollTop('100000');
           	}else {
           		if(document.getElementById("chat" + message.msgSender)) {
           			var str = "";
           			
           			if (message.type == 'img') {
               			str += '<div class="LEmsg">' +
               			'<img class="LEMsgPhoto" src="${ctx}/GetUserPicture?id=' + message.msgSender + '" />' +
               	   		'<div class="LEMsgSender"><img src="' + message.content + '" /></div>' +
        			'</div>';
               			
               			
               		}else {
           			
           			   str += leftMsg(message.msgSender,message.content);
               		}
           			
           			
           			
           			
           			$('#chat' + message.msgSender + ' .chatContent').append(str);
           			$('div.chatContent').scrollTop('100000');
           		
           		
           		
           		}else {
					var str = "";
           			
           			if (message.type == 'img') {
               			str += '<div class="LEmsg">' +
               			'<img class="LEMsgPhoto" src="${ctx}/GetUserPicture?id=' + message.msgSender + '" />' +
               	   		'<div class="LEMsgSender"><img src="' + message.content + '" /></div>' +
        			'</div>';
               			
               			
               		}else {
           			
           			   str += leftMsg(message.msgSender,message.content);
               		}
           			
           			newChat(message.msgSender,str);
           			
           		}
           		
           	}
        };
    }
    
    
    function leftMsg(senderID,content) {
   	 var str = 
   	'<div class="LEmsg">' +
			'<img class="LEMsgPhoto" src="${ctx}/GetUserPicture?id=' + senderID + '" />' +
			'<div class="LEMsgSender">'+ content +'</div>'+
		'</div>';
		return str
    }
    
    function rightMsg(content) {
   	 var str =
   	'<div class="LEmsg">' +
   		'<div class="LEMsgReceiver">' + content + '</div>' +
				'<div style="clear:both;" ></div>'+
			'</div>';
   	 return str
    }
  
     
        $(function () {
        	
        	$('body').on("click",".face",function() {
        		var msgReceiver = $(this).parents('.chat').attr("id").substring(4); 
            	var json = JSON.stringify ({
            		type : "img",
            		msgSender : jUser.userID,
            		msgReceiver : msgReceiver,
            		content : $(this).attr("src")
            	});
            	ws.send(json);
        	});
        	
        	 $('body').on("click","img.chatIcon",delChat);
        	
        	haveFaces = false;
            chatNum = 0;
        	jFriends = '${jFriends}';
        	var friendsHtml = "";
        	if(jFriends.length != 0) {
        		jFriends = JSON.parse(jFriends);
        		$.each(jFriends,function(id,friend) {
        			friendsHtml += 
	        			'<div id="'+ id + '" class="friend">' +
	            			'<img src="${ctx}/GetUserPicture?id=' + id + '" />' + 
	            			'<label>' + getName(id) + '</label>' + 
	            			'<div class="online"></div>' +
	        			'</div>';
        		})//end each
        		$('#friends').html(friendsHtml);
        	}
        	
        	//送出聊天資訊
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
                friends[i].onclick = function(){newChat(this.id)};
        });//end onReady
      
        function newChat(id , appendMsg) {
            //var chats = document.getElementById("chats");
            var str = "";
            if (!document.getElementById("chat" + id)) {
            	
            	$.getJSON("${ctx}/message",{msgSender:jUser.userID,msgReceiver:id},function(msgs) {
            		console.log(msgs);
            		str += 
                        "<div id='chat" + id + "' class='chat' style='right:" + (276 + chatNum * 270) + "px'>" +
                         	"<div class='chatTittle'>" + "<label>" + getName(id) + "</label>" +
                         		"<div class='online'></div>" +
                         		"<img id='exit" + id + "' class='chatIcon' src='${ctx}/images/chatroom/X.png' /></div>"+
                         		"<div class='chatContent'>";
                     
                     $.each(msgs,function(i,msg) {
                    	if(i == 0) 
                    		str += '<div class="minMsgID" name="' + msg.messageID + '" style="display:none;"></div>'
                    	
                    	if(msg.msgSender == jUser.userID) 
                    		if(msg.content.substr(-4) == '.png') {
                    			str += '<div class="LEmsg">' +
                       	   		'<div class="LEMsgReceiver"><img src="' + msg.content + '" /></div>' +
                				'<div style="clear:both;" ></div>'+
                				'</div>';
                    		}
                    		else {
                    			str += rightMsg(msg.content);
                    		}
                    		
                    	else {
                    		if(msg.content.substr(-4) == '.png') {
                    			str += '<div class="LEmsg">' +
                       			'<img class="LEMsgPhoto" src="${ctx}/GetUserPicture?id=' + msg.msgSender + '" />' +
                       	   		'<div class="LEMsgSender"><img src="' + msg.content + '" /></div>' +
                				'</div>';
                    		}
                    		else {
                    			str += leftMsg(msg.msgSender,msg.content);
                    		}
                    	}
                    		
                    	
                    		
                    	
                    	
                     })// each
                      if(appendMsg) {
                     	str += appendMsg;
                      }
                     str += "</div>" +
              		"<div class='chatInput'>" +
          				"<input class='textInput' placeholder='輸入訊息......'></div>" +
          			"<div class='div_chatMenu'><img class='chatMenu' src='${ctx}/images/chatroom/face.png'></div>" +
          			"</div>"
          			chatNum++;
                     $('#chats').append(str);
          			 $('div.chatContent').scrollTop('10000000');
                     
            	})
                
                
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

        function getName(id) {
        	firstName = jFriends[id].firstName;
        	lastName = jFriends[id].lastName;
        	if(firstName.charAt(0).match('[A-z]')) {
        		return firstName + '&nbsp;' + lastName;
        	}else {
        		return lastName + firstName;
        	}
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