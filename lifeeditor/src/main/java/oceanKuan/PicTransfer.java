package oceanKuan;

import java.io.*;
import java.sql.Blob;
import java.sql.SQLException;

public class PicTransfer {

	public static OutputStream readBlob(Blob b) throws SQLException,IOException {
            
		
        OutputStream os=null;
       
      InputStream is=b.getBinaryStream();
        int	length = (int) b.length();
					
					
         byte[] array = new byte[1024];
      int num;
        
         while(   (num=is.read(array))!=-1   ){
          os.write(array, 0, num);
         }
        
                 
					os.write(array, 0, length);
				
					// TODO Auto-generated catch block
				                     
                    return os;
                    
	
	
}

	private static Object getBinaryStream(Blob b) {
		// TODO Auto-generated method stub
		return null;
	}}
