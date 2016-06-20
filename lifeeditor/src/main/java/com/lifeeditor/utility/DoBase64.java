package com.lifeeditor.utility;

import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;

public class DoBase64 {
	public final static Base64.Encoder encoder = Base64.getEncoder();
	public final static Base64.Decoder decoder = Base64.getDecoder();
	
	
	public static String encode(String txt) {
		byte[] txtBytes = null;
		try {
			txtBytes = txt.getBytes("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return encoder.encodeToString(txtBytes);
	}
	
	public static byte[] decode(String encodeTxt) {
		
			return decoder.decode(encodeTxt);
	
	}
	
	public static String encode(byte[] bytes) {
		return encoder.encodeToString(bytes);
	}
	public static String encode(Blob blob) {
		try {
			return encode(blob.getBytes(1, (int)blob.length() ) );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
