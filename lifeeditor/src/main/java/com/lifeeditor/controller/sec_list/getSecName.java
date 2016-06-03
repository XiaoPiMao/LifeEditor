package com.lifeeditor.controller.sec_list;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.lifeeditor.model.sec_list.SecListVO;
import com.lifeeditor.service.SecListService;


@WebServlet("/getSecName")
public class getSecName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public getSecName() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=LE01";

		String query = "select secID,secName from sec_list where typeID=?";
		String typeID = request.getParameter("typeID");

		try{
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			conn = DriverManager.getConnection(url, "sa", "password");
			//conn = DriverManager.getConnection(url, "sa", "P@ssw0rd");
			stmt = conn.prepareStatement(query);
			 stmt.setString(1,typeID);
			 rs = stmt.executeQuery();
			
			 
			 
			 List  l1 = new LinkedList();
			 while (rs.next()) {
				 Map m1 = new HashMap();       
				 m1.put("secID",rs.getInt(1));   
				 m1.put("secName", rs.getString(2)); 
				 l1.add(m1);
			 }
			 Gson gson = new Gson();
			 String jsonString = gson.toJson(l1);
			 out.println(jsonString);
		}catch (SQLException e) {
			out.println("Error:" + e.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		
	}

	

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}

}
