package com.lifeeditor.backstage.report;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;



public class DataToGson {

	public DataToGson(){
		
	}

	public String changeDataToGson(Object data){
		
	Gson gson = new GsonBuilder()
    .disableHtmlEscaping()
    .setFieldNamingPolicy(FieldNamingPolicy.UPPER_CAMEL_CASE)
    .setPrettyPrinting()
    .serializeNulls()
    .create();	
	
	return  gson.toJson(data);
	
	}
}
