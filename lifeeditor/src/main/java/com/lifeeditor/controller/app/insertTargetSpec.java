package com.lifeeditor.controller.app;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Blob;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;

import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.target_list.Target_ListVO;
import com.lifeeditor.model.target_spec.Target_specVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.TargetSpecService;
import com.lifeeditor.service.Target_List_Service;
import com.lifeeditor.utility.DoBase64;

import Decoder.BASE64Decoder;


@WebServlet("/insertTargetSpec")
public class insertTargetSpec extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public insertTargetSpec() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	request.setCharacterEncoding("utf-8");  
		 	response.setCharacterEncoding("utf-8");  
		     response.setContentType("text/html;charset=UTF-8");  
		     
		      try {
		    	  String photo=request.getParameter("photo");  
				     String note=request.getParameter("note");
				     String targetID=request.getParameter("targetID");
				     Integer tagID = Integer.parseInt(targetID);
				   
				   
				     System.out.println(photo);  
				   
				     
				     byte [] photos = Base64.getMimeDecoder().decode(photo.getBytes(StandardCharsets.UTF_8));

				      for (int i=0;i<photos.length;i++){  
				          if(photos[i]<0){  
				              photos[i]+=256;  
				          }  
				      }
				    Target_List_Service targetListSvc = new Target_List_Service();
				    Target_ListVO trgListVO = targetListSvc.findByTargetID(tagID);
						
					user_specVO user = trgListVO.getUserVO();
		  		
		  			Target_specVO TargetspecVO=new Target_specVO();

		  			TargetVO TargetVO=new TargetVO();

		  		    TargetSpecService Target_specSvc = new TargetSpecService();
		  		    

		  		   
		  		   long time=System.currentTimeMillis();
		  		    
		  			Integer UserID = user.getUserID();
		  				
		  			
		  			
		  	        String trgPicPath="/images/trgSpecs/"+UserID.toString()+targetID+time+".jpg";
		  	        
		  	        String Path=request.getServletContext().getRealPath(trgPicPath);
		  	       
		  	        
		  	        File file1=new File(Path);
		  	        @SuppressWarnings("resource")
					FileOutputStream fos1 = new FileOutputStream(file1);
		  	        
		  	 				
		  	 				Blob Pic = new SerialBlob(photos);
		  	 				Pic.getBytes(1, (int) Pic.length());
		  	 				fos1.write(Pic.getBytes(1, (int) Pic.length()),0,(int) Pic.length());
		  	 		trgPicPath = "/lifeeditor" + trgPicPath;
		  	 		Target_specSvc.addTargetSpec(UserID,tagID,note,trgPicPath);
		 
		  		} catch (Exception e) {
		  			e.getStackTrace();
		  			
		  		}
		     
		    }  
	}


