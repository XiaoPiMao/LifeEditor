package com.lifeeditor.chatroom;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.logging.Logger;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.lifeeditor.service.MessageService;


@ServerEndpoint(
        value="/chat/{userID}",
        decoders = MessageDecoder.class,
        encoders = MessageEncoder.class
)
public class ChatEndpoint {
    private final Logger log = Logger.getLogger(getClass().getName());
    
    private Integer userID;

    public static Map<Integer,HashSet<Session>> onlinePool = new HashMap<Integer,HashSet<Session>>();

    @OnOpen
    public void onOpen(Session session, @PathParam("userID") Integer userID) throws IOException, EncodeException {
        log.info(userID + " connected!");
        this.userID = userID;
        onlinePool.get(userID).add(session);
    }

    @OnMessage
    public void onMessage(Session session, Message message) throws IOException, EncodeException {
        log.info(message.toString());
        sendMessage(message);
        MessageService msgSvc = new MessageService();
		msgSvc.insertMessage(message.getMsgSender(), message.getMsgReceiver(), message.getContent());
    }

    @OnClose
    public void onClose(Session session) throws IOException, EncodeException {
        log.info(session.getId() + " disconnected!");
       if(onlinePool.get(userID) != null) {
    	   if(onlinePool.get(userID).contains(session))
    		   onlinePool.get(userID).remove(session);
       }
        onlinePool.get(userID).remove(session);
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        log.warning(throwable.toString());
    }


    private static void sendMessage(Message message){
        Integer msgReceiver = message.getMsgReceiver();
        Integer msgSender = message.getMsgSender();
        send(onlinePool.get(msgReceiver),message);
        send(onlinePool.get(msgSender),message);
        
    }
    
    private static void send(Set<Session> sessionSet,Message message) {
    	if(sessionSet != null) {
    		
			for(Session s : sessionSet) {
				try {
					System.out.println("send");
					s.getBasicRemote().sendObject(message);
					
				}catch(Exception e) {
	    			System.out.println("傳訊息錯誤");
	    		}
			}

			
    	}
    }

}