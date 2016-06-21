package com.lifeeditor.controller.message;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lifeeditor.model.message.MessageVO;
import com.lifeeditor.service.MessageService;
import com.lifeeditor.utility.MyGson;


@WebServlet("/message")
public class GetMessages extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
	
		
		Integer msgSender = Integer.parseInt(request.getParameter("msgSender"));
		Integer msgReceiver = Integer.parseInt(request.getParameter("msgReceiver"));
		String messageID = request.getParameter("messageID");
		
		MessageService msgSvc = new MessageService();
		if(messageID == null) {
			List<MessageVO> msgs = msgSvc.getMessages(msgSender, msgReceiver);
			response.getWriter().write(MyGson.GSON.toJson(msgs));
			return;
		}
	}

}
