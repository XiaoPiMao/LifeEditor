package com.lifeeditor.controller.app;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		     response.setContentType("text/html");  
		     String photo=request.getParameter("photo");  
		     String name=request.getParameter("name");  
		     System.out.println(photo);  
		    //对发送来的Base64数据进行解码。生成字节数组  
		      byte [] photos = new BASE64Decoder().decodeBuffer(photo);  
		      for (int i=0;i<photos.length;i++){  
		          if(photos[i]<0){  
		              photos[i]+=256;  
		          }  
		      }  
		      //F  
		      File file=new File("d:","decode.png");  
		      File filename=new File("d:\\name.txt");  
		      if(!file.exists()){file.createNewFile();}if(!filename.exists()){filename.createNewFile();}  
		      FileOutputStream out=new FileOutputStream(file);  
		      FileOutputStream out1=new FileOutputStream(filename);  
		      out.write(photos);out.flush();out.close();  
		    }  
	}


