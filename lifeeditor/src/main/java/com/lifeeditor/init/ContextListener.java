package com.lifeeditor.init;

import java.sql.Blob;
import java.util.*;

import javax.servlet.ServletContextListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.lifeeditor.model.sec_list.SecListVO;
import com.lifeeditor.model.type_list.TypeListVO;
import com.lifeeditor.service.SecListService;
import com.lifeeditor.service.TypeListService;
import com.lifeeditor.utility.MyGson;



@WebListener
public class ContextListener implements ServletContextListener {
	public static ServletContext context;
	public static List<TypeListVO> types;
	public void contextInitialized(ServletContextEvent e) {
		System.out.println("系統初始化");
		context = e.getServletContext();
		
		//contextPath
		context.setAttribute("ctx", context.getContextPath());
		
		
		types = new TypeListService().getAll();
		context.setAttribute("types", types);//類別
		context.setAttribute("jTypes", MyGson.GSON.toJson(types));//類別Json
		context.setAttribute("secs", MyGson.GSON.toJson(getSecMap()));//項目
		
	}
	public void contextDestroyed(ServletContextEvent e) {
		context.log("系統正常關閉");
	}
	
	//項目轉成json
	public static Map<Integer,JsonArray> getSecMap() {
		SecListService secListSvc = new SecListService();
		Map<Integer,JsonArray> secMap = new LinkedHashMap<>();
		JsonParser jsonParser = new JsonParser();
		Gson gson = MyGson.GSON;
		for(TypeListVO type : types) {
			List<SecListVO> secs = secListSvc.getByTypeID( type.getTypeID() );
			secMap.put(type.getTypeID(),jsonParser.parse(gson.toJson(secs)).getAsJsonArray());
		}
		return secMap;
	}
}
