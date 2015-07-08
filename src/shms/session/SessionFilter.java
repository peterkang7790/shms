/*
 * Snippet.java 1.0, 2008. 10. 3.
 * 
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.session;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import shms.common.ShmsProperties;
import shms.dao.common.CommonDao;

public class SessionFilter implements Filter{
	private Log log = LogFactory.getLog(getClass());
	private CommonDao commonDao;
	Map loginUserMap;
	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}
	
    String defaultErrorURL = "/shms/error.jsp";
    String defaultLoginURL = "/shms/login.jsp";
    String defaultLoginPDAURL = "/shms/pda/login_pda.jsp";
    static ArrayList<String> generalUserURIPrefixList = null;
    static ArrayList<String> commonURIPrefixList = null;
    static ArrayList<String> userURIPrefixBlockList = null;
    static ArrayList<String> externalInterfaceURIPrefixList = null;
	
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
	     throws IOException, ServletException{
	    /*	
	    HttpServletRequest request = (HttpServletRequest) req;
	    HttpServletResponse response = (HttpServletResponse) res;
	    
	    String baseURL = request.getContextPath();
	    
	    String serivletPath = request.getServletPath();
	    

	    if(!serivletPath.equals("/login.jsp")){
	    	if(request.getParameter("USER_ID") == null && request.getParameter("PDA_TYPE") != null){
		    	response.sendRedirect(baseURL + "/pda/login_pda.jsp");
		    } else if(request.getSession().getAttribute("USER_ID") == null){
		    	System.out.println("serivletPath : " + serivletPath);
		    	response.sendRedirect(baseURL + "/login.jsp");	
		    } else {
		    	response.sendRedirect(baseURL + "/error.jsp");
		    }	    	
	    }
		*/
	    
	    HttpServletRequest request = (HttpServletRequest) req;
	    HttpServletResponse response = (HttpServletResponse) res;
	    
//	    if(!ShmsProperties.getInstance().isLoaded()){
//	    	String ShmsPropertiesPath = request.getSession().getServletContext().getRealPath("shms.props");
//	    	ShmsProperties.getInstance().readShmsProperties(ShmsPropertiesPath);
//	    }
	    
	    String baseURL = request.getContextPath();
	    
        setUpURLACLRule();
        
 //       String pdaTyp = request.getParameter("pdaTyp")==null?null:request.getParameter("pdaTyp").toString();
        
        
        
       
        
//        if( "pda".equals(pdaTyp) )
//        {
//        	if(request.getSession().getAttribute("USER_ID") == null){
//            	
//            	response.sendRedirect("/shms/common/inter_Pda.do?pdaTyp="+pdaTyp);
//            	
//            }
//            else{
//            	response.sendRedirect(baseURL + defaultLoginPDAURL);
//            }
//        	
//        }
//        else
//        {
        if(isAllowURL(request)){        	
        	chain.doFilter(req, res);
        }
        else if(request.getSession().getAttribute("USER_ID") == null){
            	
            	response.sendRedirect("/shms/common/loginUser.do");
            }
            else{
            	response.sendRedirect(baseURL + defaultLoginURL);
            }
//        }
        
        

	}

	private boolean isAllowURL(HttpServletRequest request) throws IOException {
		
		String serivletPath = request.getServletPath();
		
		boolean bAllowURI = false;
		boolean bAllowURIUser = true; 
		
	    if(serivletPath.equals("/") 
	    	|| serivletPath.equals("/login.jsp")
	    	|| serivletPath.equals("/error.jsp")
	    	){
	    	bAllowURI = true;
	    }
	    
	    if(!bAllowURI)
	    for(int i=0; i < commonURIPrefixList.size() ; i++){
	    	if(serivletPath.startsWith(commonURIPrefixList.get(i))){
	    		bAllowURI = true;
	    		break;
	    	}
	    }

	    String userLogin = (String)request.getSession().getAttribute("USER_ID"); 
	    String admin_yn = (String)request.getSession().getAttribute("USED_CLASS_CD");
	  
	    if(!bAllowURI)
	    if ((userLogin != null && !"".equals(userLogin)) && "2".equals(admin_yn) )
	    for(int i=0; i < userURIPrefixBlockList.size() ; i++){
	    	if(serivletPath.startsWith(userURIPrefixBlockList.get(i))){
	    		bAllowURI = false;
	    		bAllowURIUser = false;
	    		break;
	    	}
	    }
	    
	  
	    if(bAllowURIUser)
	    if(!bAllowURI)
    	if (userLogin != null && !"".equals(userLogin))  {
    		bAllowURI = true;
    	}

		return bAllowURI;
	}

	private synchronized void setUpURLACLRule() {
		
		if(commonURIPrefixList != null
			|| userURIPrefixBlockList != null){
			return;
		}
// 모두 허용 
	    commonURIPrefixList = new ArrayList<String>();
	    commonURIPrefixList.add("/css/");
	    commonURIPrefixList.add("/script/");
	    commonURIPrefixList.add("/images/");
	    commonURIPrefixList.add("/pda/login_pda.do");
	    commonURIPrefixList.add("/common/loginUser.do");
	    commonURIPrefixList.add("/common/inter_Pda.do");
	    commonURIPrefixList.add("/common/loginUser.do");
	    

// 일반 차단	    
	    userURIPrefixBlockList = new ArrayList<String>();	    
	    userURIPrefixBlockList.add("/admin/listUser.do");
	    userURIPrefixBlockList.add("/baseInfo/detailStruct.do"); 
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}



