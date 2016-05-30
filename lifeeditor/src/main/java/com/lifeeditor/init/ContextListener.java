package com.lifeeditor.init;

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



@WebListener
public class ContextListener implements ServletContextListener {
	ServletContext context;
	public void contextInitialized(ServletContextEvent e) {
		System.out.println("系統初始化");
		context = e.getServletContext();
		
		//contextPath
		context.setAttribute("ctx", context.getContextPath());
		TypeListService typeListService = new TypeListService();
		
		//類別
		List<TypeListVO> types = typeListService.getAll();
		context.setAttribute("types", types);
		
		//項目轉成json
		SecListService secListSvc = new SecListService();
		Map<Integer,JsonArray> secMap = new LinkedHashMap<>();
		JsonParser jsonParser = new JsonParser();
		Gson gson = new Gson();
		for(TypeListVO type : types) {
			List<SecListVO> secs = secListSvc.getByTypeID( type.getTypeID() );
			secMap.put(type.getTypeID(),jsonParser.parse(gson.toJson(secs)).getAsJsonArray());
		}
		context.setAttribute("secs", gson.toJson(secMap));
		
	}
	public void contextDestroyed(ServletContextEvent e) {
		context.log("系統正常關閉");
	}
}
