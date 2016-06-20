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

import com.google.gson.FieldNamingPolicy;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.Gson;
import com.lifeeditor.backstage.report.DataToGson;
import com.lifeeditor.model.event.eventVO;
import com.lifeeditor.model.target.TargetVO;
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
		doPost(request,response);
	}



	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/json");
		
		Integer id= new Integer(req.getParameter("id"));
		
		Map<String, String> eventData = new HashMap<String, String>();			
		req.setAttribute("eventData", eventData);
		List<String> errorMsgs = new LinkedList<String>();
		
		req.setAttribute("errorMsgs", errorMsgs);
		
		try {
			
			eventVO eventVO=new eventVO();
			
			eventService eventSvc=new eventService();
			
		    eventVO=eventSvc.getOneevent(id);
			String date=eventVO.getEventTime().toString().substring(0, 10); 
			
	
			
			eventData.put("eventName", eventVO.getEventName());
			eventData.put("eventDesc", eventVO.getEventDesc());
			eventData.put("orgAddr", eventVO.getOrgAddr());
			eventData.put("orgName", eventVO.getOrgName());
			eventData.put("eventTime", date);
			
		    
			
			PrintWriter os = res.getWriter();
			Gson gson = new Gson();		
			System.out.println(gson.toJson(eventData));
			os.write(gson.toJson(eventData).toString());

//			os.write("yayayaa");
			
			
			
			
				
			
		} catch (Exception e) {
			errorMsgs.add("顯示錯誤資訊" + e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/manager/event/error.jsp");
			failureView.forward(req, res);
		}
	}
	}


