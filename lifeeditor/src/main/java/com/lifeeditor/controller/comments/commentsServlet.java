package com.lifeeditor.controller.comments;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Hibernate;

import com.google.gson.Gson;
import com.lifeeditor.controller.user_spec.EmailUtils;
import com.lifeeditor.controller.user_spec.VerifyUtils;
import com.lifeeditor.model.comments.commentsVO;
import com.lifeeditor.model.genkiBar_list.genkiBar_listVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.commentsService;
import com.lifeeditor.service.genkiBar_listService;


@WebServlet("/commentsServlet")
public class commentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public commentsServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		Map<String, String> comments = new HashMap<String, String>();			
		req.setAttribute("comments", comments);
		req.setAttribute("commentsName", comments);
			
			Integer targetID = new Integer(req.getParameter("targetID"));
			System.out.println(targetID);
			user_specVO user_specVO = (user_specVO) req.getSession().getAttribute("LoginOK");
			
			Integer userID = new Integer(user_specVO.getUserID());
			
			String comment = req.getParameter("comment");
			
			commentsVO commentsVO = new commentsVO();
			commentsVO.setTargetID(targetID);
			commentsVO.setUser_specVO(user_specVO);
			commentsVO.setComment(comment);
			
			commentsService commentsService = new commentsService();
			
			commentsService.addComment(targetID, userID, comment);
			
			comments.put("commentsName", user_specVO.getLastName());
			comments.put("comments", comment);
			
			
			resp.setCharacterEncoding("UTF-8");
			PrintWriter os = resp.getWriter();
			Gson gson = new Gson();		
			System.out.println(gson.toJson(comments));
			os.write(gson.toJson(comments));
			
			
		
	}

}
