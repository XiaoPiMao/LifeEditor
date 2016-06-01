package com.lifeeditor.controller.event;

import java.awt.image.BufferedImage;
import java.io.IOException;
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
		String action = req.getParameter("action");
		if ("display_for_all".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
			
			
			
			try{
				eventVO eventVO= new eventVO();
				eventService eventSvc = new eventService();
				 
				res.setContentType("image/jpeg");
			     Blob pic=eventVO.getEventPic();
			    int a =(int)pic.length();
				 OutputStream os=convert(pic);
				 os.write(pic.getBytes(0,  a), 0, a);
				 
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
		
		private  OutputStream convert(Blob blob)  {
		     BufferedImage image = null;
		    OutputStream outputStream = null;
		    
		        try {
					image = ImageIO.read(blob.getBinaryStream());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

		        try {
					outputStream = blob.setBinaryStream(0);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

		        try {
					ImageIO.write(image, "JPG", outputStream);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return outputStream;
		}
	

}
