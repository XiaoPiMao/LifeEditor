<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        * {
            margin:0;
        }
        .chatroomOff {
            position : fixed;
            bottom : 0px;
            right: 8px;
            height: 27px;
            width: 250px;
            background-color : #F1F2F3;
            border : 1px solid #CCCCCC;
            cursor : pointer;
            z-index:100000;
        }
        
        .chatroomOff label {
            color:black;
            font-family : 新細明體;
            font-size : 10.5pt;
            font-weight : bolder;
            position : relative;
            left : 20px;
            top : 2px;
        }
        .chatroomON {
           background-color : #425F9C;
           bottom : 75vh;
        }
        .chatroomON label {
            color:white;
        }
        

        #friends {
            position:fixed;
            bottom:0px;
            right:8px;
            height:75vh;
            width:250px;
            background-color:#F1F2F3;
            border : 1px solid #CCCCCC;
        }
        
        div.friend {
            height:46px;
            padding-left : 8px;
            cursor : pointer;
            position:relative;
        }

        .friend:hover {
            background-color : #DDDDDD;
        }
        
        .friend label {
            position:absolute;
            line-height:46px;
            padding-left:12px;
            font-size:10pt;
            cursor : pointer;
        }
        .friend img {
            width:32px;
            height:32px;
            margin-top:7px;
        }
        .online {
            width:8px;
            height:8px;
            border-radius:99em;
            background-color:#009E1D
        }
        .friend .online {
            position:absolute;
            right:20px;
            top:19px;
        }
        .chat .online {
            float:left;
            position:relative;
            top:8.5px;
            margin-right:8px
        }
        div.chat {
            position : fixed;
            bottom : 0;
            width : 250px;
            height: 330px;
            border-left : 1px solid #CCCCCC;
            border-right : 1px solid #CCCCCC;
            z-index : 100000;
        }
        div.chatTittle {
            
            background-color : #4267B2;
            font-size : 10.5pt;
            color : white;
            height : 25px;
            font-weight : bolder;
            padding-left : 10px;
            border : 1px solid #CCCCCC;
        }
        .chatTittle label {
             line-height : 25px;
        }
        div.chatContent {
           
            height : 245px;
            background-color : #E9EAED;
            border-bottom : 1px solid #CCCCCC;
        }
        div.chatInput {
            
            height : 33px;
        }
        .div_chatMenu {
            
            padding-left : 10px;
            padding-bottom : 5px;
            height : 20px;
        }

        div#faces {
            display : table-cell;
            vertical-align : middle;
            position : relative;
            top : -110px;
            left : -100px;
            border: 2px solid #CCCCCC;
            height : 80px;
            width : 200px;
            text-align : center;
            background-color : white;
            
        }

        
  
        img.chatIcon {
            position:relative;
            float : right;
            top : calc(50% - 6px);
            right : 10px;
            height : 12px;
            width : 12px;
            cursor : pointer;
        }
        img.chatMenu {
            height : 12px;
            -webkit-filter: grayscale(100%); /* Chrome, Safari, Opera */
            filter: grayscale(100%);
            cursor: pointer;
        }
        img.chatMenuON {
            height : 12px;
            cursor: pointer;
        }
        img.face {
            margin : 5px;
        }
        input {
            display : block;
            padding : 10px;
            width : calc(100% - 20px);
            outline : none;
            border : none;
        }
        .off {
            display:none;
        }
        .on {
            display : block;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script>
        var haveFaces = false;
        var chatNum = 0;

        $(function () {
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
                }
                   
            });
            $('#chatroom').click(function () {
                $('.chatroomOff').toggleClass('chatroomON');
                $('#friends').toggleClass('on');
            })
            
        });//end onReady
        window.onload = function () {
            var friends = document.querySelectorAll("div.friend");
            for (var i = 0; i < friends.length; i++)
                friends[i].onclick = newChat;
        }
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
   
     <div id="friends" class="off">
<!--         <div id="1" class="friend"> -->
<!--             <img src="#"/> -->
<!--             <label>小明</label> -->
<!--             <div class="online"></div> -->
<!--         </div> -->

<!--         <div id="2" class="friend"> -->
<!--             <img src="#"/> -->
<!--             <label>阿華</label> -->
<!--             <div class="online"></div> -->
<!--         </div> -->

<!--         <div id="3" class="friend"> -->
<!--             <img src="#"/> -->
<!--             <label>胖虎</label> -->
<!--             <div class="online"></div> -->
<!--         </div> -->

<!--         <div id="4" class="friend"> -->
<!--             <img src="#"/> -->
<!--             <label>哆啦A夢</label> -->
<!--             <div class="online"></div> -->
<!--         </div> -->

<!--         <div id="5" class="friend"> -->
<!--             <img src="#"/> -->
<!--             <label>Stephen Curry</label> -->
<!--             <div class="online"></div> -->
<!--         </div> -->

<!--         <div id="6" class="friend"> -->
<!--             <img src="#"/> -->
<!--             <label>泰山</label> -->
<!--             <div class="online"></div> -->
<!--         </div> -->
    </div>

    <div id="chats"></div>

</body>
</html>