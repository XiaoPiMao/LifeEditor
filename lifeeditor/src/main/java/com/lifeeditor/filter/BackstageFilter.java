package com.lifeeditor.filter;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class BackstageFilter implements Filter {

	private FilterConfig config;

	public void init(FilterConfig config) {
		this.config = config;
	}

	public void destroy() {
		config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws ServletException, IOException {

		
		request.setCharacterEncoding("UTF-8");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 【取得 session】
		HttpSession session = req.getSession();
		// 【從 session 判斷此user是否登入過】
		Object account = session.getAttribute("backVO");
		String path = req.getServletPath();
		int start = path.lastIndexOf('.')+1;
		if(start == 0) {
			chain.doFilter(request,response);
			return;
		}
		String type = path.substring(start, path.length());
		if (account == null  && type.equals("jsp") && !path.equals("/manager/Backstage.jsp")) {
			//	
			session.setAttribute("location", req.getRequestURI());
			res.sendRedirect(req.getContextPath() + "/manager/Backstage.jsp");
			return;
		} else {
			chain.doFilter(request, response);
		}
	}
}