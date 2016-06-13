package com.lifeeditor.controller.target_spec;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.lifeeditor.model.target_list.Target_ListVO;
import com.lifeeditor.model.target_spec.Target_specVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.TargetSpecService;
import com.lifeeditor.service.Target_List_Service;


@WebServlet("/GetJsonTarget_spec")
public class GetJsonTarget_spec extends HttpServlet {
	public class getTarget extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       



		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request,response);
		}


		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			TargetSpecService trgSpcSvc = new TargetSpecService();
			user_specVO user = (user_specVO)request.getSession().getAttribute("LoginOK");
			List<Target_specVO> list = trgSpcSvc.getByUser(user.getUserID());
			JsonArray jsonArray = new JsonArray();
			JsonObject jsonObj = new JsonObject();
			Gson gson = new Gson();
			for(Target_specVO targetSpec : list) {
				
//				jsonObj.add(targetSpec.getTargetVO().getTargetID(), value);
//				jsonArray.add(gson.toJsonTree(targeSpec.getTrgVO()));
			}
			
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(jsonArray.toString());
		}

	}


}
