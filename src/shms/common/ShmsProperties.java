/*
 * ShmsProperties.java 1.0, 2009. 7. 24.
 * 
 * Copyright (c) 2009 by LSware Inc. All rights reserved.
 */
package shms.common; 

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletContext;

import org.apache.struts2.util.ServletContextAware;

import com.lsware.utils.PropertiesExt;


public class ShmsProperties implements ServletContextAware {
	
	private static ShmsProperties instance = null; 
	
	HashMap<String,String> shmsPropertiesMap = null;
	
	ServletContext serlvetContext = null;
	
	public boolean isLoaded(){		
		if(shmsPropertiesMap == null){
			return false;
		}else{
			return true;
		}	
	}
	
    public void readShmsProperties(String propertiesPath) {  
    	
    	if(shmsPropertiesMap == null){
    		synchronized (ShmsProperties.class) {// Lock
    			shmsPropertiesMap = new HashMap();
    			Properties props = new PropertiesExt();
    			try {
    				
    				//InputStream in = FileUtils.getInputStreamFromFileByNative2Ascii(propertiesPath);
    				//props.load(in);
    				
    				props.load(new FileInputStream(new File(propertiesPath)));
                        
    				Set keySet = props.keySet();
    				Iterator iter = keySet.iterator();
    				
    				do{
    					String key = (String)iter.next();
    					
    					String value = (String)props.get(key);
    					
    					shmsPropertiesMap.put(key,value);
    					
    				}while(iter.hasNext());
    				
    				System.out.println(shmsPropertiesMap);
    				
    				
    			} catch (FileNotFoundException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			} catch (IOException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}    		
    		}
    	}		
    }
    
    public static String get(String key){
    	synchronized (ShmsProperties.class) {// Lock
    		String value = null;
    		
    		HashMap map = getInstance().shmsPropertiesMap;
    		
    		if(map != null)
    			value = (String) map.get(key);
    		
    		return value;
    	}
    }
    
    public static Map list(){
    	synchronized (ShmsProperties.class) {// Lock
    		return getInstance().shmsPropertiesMap;
    	}
    }    

    public static ShmsProperties getInstance() {
        // ShmsProperties
        if (instance == null) { // 
            synchronized (ShmsProperties.class) {// Lock 
                if (instance == null) {// ShmsProperties         
                    instance = new ShmsProperties();// ShmsProperties Instance
                }
            }
        }

        return instance;
    }

	public void setServletContext(ServletContext serlvetContext) {
		this.serlvetContext = serlvetContext;
		
	}
	
	public ServletContext getServletContext() {
		return this.serlvetContext;
	}
	
}
