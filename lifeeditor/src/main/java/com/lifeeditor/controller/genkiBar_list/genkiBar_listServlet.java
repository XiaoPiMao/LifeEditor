package com.lifeeditor.controller.genkiBar_list;

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
import com.lifeeditor.model.genkiBar_list.genkiBar_listVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.genkiBar_listService;


@WebServlet("/genkiBar_listServlet")
public class genkiBar_listServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public genkiBar_listServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		Map<String, String> genkiMans = new HashMap<String, String>();			
		req.setAttribute("genkiMansName", genkiMans);
			
			
			Integer targetID = new Integer(req.getParameter("targetID"));
			
			user_specVO user_specVO = (user_specVO) req.getSession().getAttribute("LoginOK");
			
			Integer userID = new Integer(user_specVO.getUserID());
			
			genkiBar_listVO genkiBar_listVO = new genkiBar_listVO();
			genkiBar_listVO.setTargetID(targetID);
			genkiBar_listVO.setUser_specVO(user_specVO);
			
			genkiBar_listService genkiBar_listService = new genkiBar_listService();
			
			Integer userID1 = null;
			Integer genkiBarID = null;
			
			List<genkiBar_listVO> list = genkiBar_listService.getGenkiName(targetID);
			for(genkiBar_listVO VO1 : list){
				userID1 = VO1.getUser_specVO().getUserID();
				genkiBarID = VO1.getGenkiBarID();
			}
			if(!userID.equals(userID1)){
				genkiBar_listService.genki(targetID, userID);
				genkiMans.put("genkiMansName",user_specVO.getLastName());
			}else{
				genkiBar_listService.degenki(genkiBarID);
				genkiMans.put("genkiMansName","");
			}
			resp.setCharacterEncoding("UTF-8");
			PrintWriter os = resp.getWriter();
			Gson gson = new Gson();		
			System.out.println(gson.toJson(genkiMans));
			os.write(gson.toJson(genkiMans));
			
		
	}

}
