package com.lifeeditor.controller.event;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.lifeeditor.model.event.eventVO;
import com.lifeeditor.service.eventService;

/**
 * Servlet implementation class eventPicServlet
 */
@WebServlet("/eventPicServlet")
public class eventPicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public eventPicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

	

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
			
			
			
			    
				eventVO eventVO=new eventVO();
	
				eventService eventSvc = new eventService();
				res.setContentType("image/jpeg");
				Blob pic = eventSvc.getOneevent(eventVO.getEventID()).getEventPic();
				
				try{
					int len = 0;
					InputStream is = pic.getBinaryStream();
					OutputStream os = res.getOutputStream();
					byte[] bytes = new byte[1024];
					while( (len = is.read(bytes)) != -1) {
						os.write(bytes, 0, len);
					}
				 os.flush();
				 os.close();
		} catch (Exception e) {
			//出現錯誤後要跳轉的頁面
			errorMsgs.add(e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/manager/event/error.jsp");
			failureView.forward(req, res);
		}}
	
		
	

}
