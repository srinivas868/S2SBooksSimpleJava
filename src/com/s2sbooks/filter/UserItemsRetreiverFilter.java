package com.s2sbooks.filter;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.jfree.util.Log;

import com.s2sbooks.tools.S2SBooksTools;

public class UserItemsRetreiverFilter implements Filter{

	private S2SBooksTools s2SBooksTools;
	
	@Override
	public void destroy() {
		this.s2SBooksTools = null;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain pChain) throws IOException, ServletException {
		try {
			List userItems = getS2SBooksTools().getItems("User", true);
			request.setAttribute("userItems", userItems);
		} catch (Exception e) {
			//Log.error("Exception while fetching survey items "+e);
			e.printStackTrace();
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

