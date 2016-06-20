$(function () {
            $('body').on("keyup", ".textInput",function (e) {
                if (e.which == 13) {
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