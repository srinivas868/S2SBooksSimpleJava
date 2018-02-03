package com.s2sbooks.books.rest;

import javax.ws.rs.Produces;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriInfo;

import org.jfree.util.Log;
import org.json.JSONException;
import org.json.JSONObject;

import com.s2sbooks.tools.S2SBooksTools;
import com.s2sbooks.vo.BookSellingInfo;
import com.s2sbooks.vo.User;

@Path("/booksInfoManager")
public class BooksInfoManagerRestService {
	
	private S2SBooksTools s2SBooksTools;
	@Context private HttpServletRequest request;

	@GET
	@Path("/sell")
    @Produces(MediaType.APPLICATION_JSON)
	public String sell(@Context UriInfo uriInfo) throws JSONException {
		JSONObject responseJson = new JSONObject();
		try {
			String parameters[] = uriInfo.getRequestUri().getQuery().split("&");
			double isbn = Double.valueOf(parameters[0]);
			String title = parameters[1];
			String author = parameters[2];
			String edition = parameters[3];
			String condition = parameters[4];
			String status = parameters[5];
			String department = parameters[6];
			String subject = parameters[7];
			double price = Double.valueOf(parameters[8]);
			User user = getCurrentUser();
			BookSellingInfo bsInfo = new BookSellingInfo(isbn, title, author, edition, condition,
															status, department, subject, price, user);
			getS2SBooksTools().addItem(bsInfo);
			responseJson.put("code", "success");
		} catch (Exception e) {
			Log.error("Error while adding item to database : "+e);
			responseJson.put("code", "error");
		}
		return responseJson.toString();
	}
	
	@GET
	@Path("/search")
    @Produces(MediaType.APPLICATION_JSON)
	public String search(@Context UriInfo uriInfo) throws JSONException {
		JSONObject responseJson = new JSONObject();
		try {
			String parameters[] = uriInfo.getRequestUri().getQuery().split("&");
			double isbn = Double.valueOf(parameters[0]);
			String department = parameters[1];
			String subject = parameters[2];
			List bookInfoItems = getS2SBooksTools().searchBookItems(BookSellingInfo.class, isbn, department, subject, true);
			if(bookInfoItems != null) {
				getRequest().getSession().setAttribute("bookInfoItems", bookInfoItems);
				responseJson.put("code", "success");
			}
			else {
				responseJson.put("code", "failed");
				responseJson.put("message", "Did not match any record");
			}
		} catch (Exception e) {
			Log.error("Error while adding item to database : "+e);
			responseJson.put("code", "error");
			responseJson.put("message", "Something wrong!");
		}
		return responseJson.toString();
	}
	
	public User getCurrentUser() {
		User user = (User) getRequest().getSession().getAttribute("user");
		if(user != null) {
			return user;
		}
		return null;
	}

	public HttpServletRequest getRequest() {
		return request;
	}
	public S2SBooksTools getS2SBooksTools() {
		if(this.s2SBooksTools == null){
			this.s2SBooksTools = new S2SBooksTools();
		}
		return s2SBooksTools;
	}
}
