package com.lifeeditor.controller.event;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.lifeeditor.model.event.eventVO;
import com.lifeeditor.service.eventService;

/**
 * Servlet implementation class eventShowServlet
 */
@WebServlet("/eventShowServlet.do")
public class eventShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public eventShowServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("UTF-8");
		req.getParameter("picture");
		Integer id= new Integer(req.getParameter("picture"));
		List<String> errorMsgs = new LinkedList<String>();
		
		req.setAttribute("errorMsgs", errorMsgs);

		try {
			if(id!=19){
			eventVO eventVO=new eventVO();
			
			eventService eventSvc=new eventService();
			
			eventVO=eventSvc.getOneevent(id);

			 req.setAttribute("eventgetData", eventVO);
			String url = "/show_event_on_client.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			
			
			successView.forward(req, res);
			}else{
				eventVO eventVO=new eventVO();
				
				eventService eventSvc=new eventService();
				
				eventVO=eventSvc.getOneevent(19);

				 req.setAttribute("eventgetData", eventVO);
				String url = "/show_event_on_client.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				
				
				successView.forward(req, res);
				
				
				
			}
		} catch (Exception e) {
			errorMsgs.add("顯示錯誤資訊" + e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/manager/event/error.jsp");
			failureView.forward(req, res);
		}
	}
	}


