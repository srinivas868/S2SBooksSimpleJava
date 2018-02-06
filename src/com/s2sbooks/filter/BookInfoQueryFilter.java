package com.s2sbooks.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.jfree.util.Log;

import com.s2sbooks.tools.S2SBooksTools;

public class BookInfoQueryFilter implements Filter{

	private static final String TYPE = "type";
	private S2SBooksTools s2SBooksTools;
	
	@Override
	public void destroy() {
		this.s2SBooksTools = null;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain pChain) throws IOException, ServletException {
		try {
			List bookInfoItems = getS2SBooksTools().getBookItemByUser((HttpServletRequest)request);
			request.setAttribute("bookInfoItems", bookInfoItems);
		} catch (Exception e) {
			Log.debug("Exception while fetching survey items "+e);
		} finally{
			pChain.doFilter(request,response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		if(this.s2SBooksTools == null){
			this.s2SBooksTools = new S2SBooksTools();
		}
	}
	
	public S2SBooksTools getS2SBooksTools() {
		return s2SBooksTools;
	}

	public void setS2SBooksTools(S2SBooksTools s2sBooksTools) {
		s2SBooksTools = s2sBooksTools;
	}

}
