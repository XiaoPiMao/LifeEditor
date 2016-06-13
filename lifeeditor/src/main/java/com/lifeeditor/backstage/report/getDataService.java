package com.lifeeditor.backstage.report;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.lifeeditor.utility.GlobalValues;





@WebServlet("/_report/getDataService.do")
public class getDataService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds = null;
	
    public getDataService() throws NamingException {
        Context ctx = new InitialContext();
        ds = (DataSource) ctx.lookup(GlobalValues.DS_LOOKUP);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		reportDAO rd1 = new reportDAO();
		
		try {
			
		 	reportSexVO rsv =  rd1.getSexData(); 
		 	reportAgeVO rav = rd1.getAgeData();
		 	reportVO rVO = new reportVO(rsv,rav);
		 	
		 	String getGson = new DataToGson().changeDataToGson(rVO);
		 	
		 	out.write(getGson);
		 	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
