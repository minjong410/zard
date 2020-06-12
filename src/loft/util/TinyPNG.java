package loft.util;

import java.io.IOException;

import com.tinify.*;

public class TinyPNG {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		
		// Set API-KEY
	    Tinify.setKey("VqRFVp89JQwKg7hpxJZGLl5NmX83PMfx");
	    
	    // Config
	    int i = 1;		// fix
	    int tot = 21;
	    
	    String cityId = "domestic";
	    String order = "3";
	    
	    // Root Path
	    String fromPath = "G:\\dev\\GIT\\watari\\watari\\WebContent\\base\\images\\travel\\" + cityId + "\\" + order + "\\";
	    String toPath = "G:\\dev\\ImageCompressing\\";
	    
	    //Tinify.setProxy("http://user:pass@192.168.0.1:8080");
	    
	    String fromFile = "";
	    String toFile = "";
	    
	    for( i=1 ; i<=tot ; i++ ){

	    	fromFile = fromPath + String.valueOf(i) + ".jpg";
	    	toFile = toPath + String.valueOf(i) + ".jpg";

		    Source source = Tinify.fromFile(fromFile);
		    source.toFile(toFile);
		    
	    }

	}

}
