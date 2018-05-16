package com.s2sbooks.books.rest;

import javax.ws.rs.Produces;

import java.util.Collections;
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
import com.s2sbooks.vo.AuditTrail;
import com.s2sbooks.vo.BookSellingInfo;
import com.s2sbooks.vo.User;
import com.s2sbooks.vo.enumtypes.BookStatus;

@Path("/booksInfoManager")
public class BooksInfoManagerRestService {
	
	private static final String EMPTY = "empty";
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
			String status = BookStatus.Available.toString();
			//String department = checkEmpty(parameters[6]);
			//String subject = checkEmpty(parameters[7]);
			double price = Double.valueOf(parameters[6]);
			User user = S2SBooksTools.getCurrentUser(getRequest());
			BookSellingInfo bsInfo = new BookSellingInfo(isbn, title, author, edition, condition,
															status, price, user);
			getS2SBooksTools().addItem(bsInfo);
			updateAuditTrailInfo(user,isbn);
			responseJson.put("code", "success");
		} catch (Exception e) {
			Log.error("Error while adding item to database : "+e);
			responseJson.put("code", "error");
		}
		return responseJson.toString();
	}
	
	public void updateAuditTrailInfo(User user, double isbn) throws Exception {
		List<AuditTrail> auditTrails = getS2SBooksTools().getAuditTrailItems(AuditTrail.class, user);
		if(auditTrails != null && auditTrails.size() >0) {
			Collections.sort(auditTrails);
			AuditTrail itemToUpdate = auditTrails.get(auditTrails.size()-1);
			itemToUpdate.setIsbn(isbn);
			getS2SBooksTools().updateItem(itemToUpdate, true);
		}
	}

	@GET
	@Path("/search")
    @Produces(MediaType.APPLICATION_JSON)
	public String search(@Context UriInfo uriInfo) throws JSONException {
		JSONObject responseJson = new JSONObject();
		try {
			String parameters[] = uriInfo.getRequestUri().getQuery().split("&");
			double isbn = Double.valueOf(parameters[0]);
			//String department = checkEmpty(parameters[1]);
			//String subject = checkEmpty(parameters[2]);
			List bookInfoItems = getS2SBooksTools().searchBookItems(BookSellingInfo.class, isbn);
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
	
	@GET
	@Path("/searchwithedit")
    @Produces(MediaType.APPLICATION_JSON)
	public String searchwithedit(@Context UriInfo uriInfo) throws JSONException {
		JSONObject responseJson = new JSONObject();
		try {
			String parameter = uriInfo.getRequestUri().getQuery();
			double isbn = Double.valueOf(parameter);
			List bookInfoEditItems = getS2SBooksTools().searchBookItemsWithISBN(BookSellingInfo.class, isbn, request);
			if(bookInfoEditItems != null) {
				getRequest().getSession().setAttribute("bookInfoEditItems", bookInfoEditItems);
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
	
	@GET
	@Path("/update")
    @Produces(MediaType.APPLICATION_JSON)
	public String update(@Context UriInfo uriInfo) throws JSONException {
		JSONObject responseJson = new JSONObject();
		try {
			String parameters[] = uriInfo.getRequestUri().getQuery().split("&");
			double isbn = Double.valueOf(parameters[0]);
			String title = parameters[1];
			String author = parameters[2];
			String edition = parameters[3];
			String condition = parameters[4];
			String status = parameters[5];
			//String department = checkEmpty(parameters[6]);
			//String subject = checkEmpty(parameters[7]);
			double price = Double.valueOf(parameters[6]);
			int id = Integer.valueOf(parameters[7]);
			BookSellingInfo bsInfo = (BookSellingInfo) getS2SBooksTools().getItem(BookSellingInfo.class, id);
			bsInfo.updateAll(isbn, title, author, edition, condition,
								status, price);
			getS2SBooksTools().updateItem(bsInfo, true);
			responseJson.put("code", "success");
		} catch (Exception e) {
			Log.error("Error while adding item to database : "+e);
			responseJson.put("code", "error");
			responseJson.put("message", "Something wrong!");
		}
		return responseJson.toString();
	}
	
	private String checkEmpty(String attribute) {
		if(attribute.isEmpty()) {
			attribute = EMPTY;
		}
		return attribute;
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
