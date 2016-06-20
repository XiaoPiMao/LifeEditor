package com.lifeeditor.utility;

import java.lang.reflect.Type;
import java.sql.Blob;
import java.sql.SQLException;

import com.google.gson.*;

public class MyGson {
	public static final Gson GSON = new GsonBuilder()
	.registerTypeHierarchyAdapter(Blob.class, new BlobToBase64TypeAdapter())
	.setDateFormat("yyyy-MM-dd").create();
			
			
	private static class BlobToBase64TypeAdapter implements JsonSerializer<Blob>,JsonDeserializer<Blob>{

		@Override
		public Blob deserialize(JsonElement json, Type type,
				JsonDeserializationContext context) throws JsonParseException {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public JsonElement serialize(Blob blob, Type type,
				JsonSerializationContext context) {
			// TODO Auto-generated method stub
			try {
				return new JsonPrimitive(DoBase64.encode(blob.getBytes(1, (int)blob.length() ) ) );
			}catch(SQLException e) {e.printStackTrace();}
			
			return null;
		}
		
		
		
	}
}
