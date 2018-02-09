package com.s2sbooks.account.rest;

import javax.ws.rs.Produces;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriInfo;

import org.jfree.util.Log;
import org.json.JSONException;
import org.json.JSONObject;

import com.s2sbooks.account.util.PasswordUtil;
import com.s2sbooks.tools.S2SBooksTools;
import com.s2sbooks.vo.BookSellingInfo;
import com.s2sbooks.vo.User;

@Path("/accountmanager")
public class AccountManagerRestService {
	
	private S2SBooksTools s2SBooksTools;
	@Context private HttpServletRequest request;

	@GET
	@Path("/signup")
    @Produces(MediaType.APPLICATION_JSON)
	public String signup(@Context UriInfo uriInfo) throws JSONException {
		JSONObject responseJson = new JSONObject();
		try {
			String parameters[] = uriInfo.getRequestUri().getQuery().split("&");
			String firstName = parameters[0];
			String lastName = parameters[1];
			String email = parameters[2];
			String password = PasswordUtil.encrypt(parameters[3]);
			String retypePassword = PasswordUtil.encrypt(parameters[4]);
			if(!password.equalsIgnoreCase(retypePassword)) {
				responseJson.put("code", "error");
				responseJson.put("message", "Passwords didn't match");
			}
			else {
				User user = new User(firstName, lastName, email, password);
				getS2SBooksTools().addItem(user);
				responseJson.put("code", "success");
				getRequest().getSession().setAttribute("user", user);
			}
		}catch (Exception e) {
			Log.error("Error while adding item to database : "+e.getMessage());
			responseJson.put("code", "error");
		}
		return responseJson.toString();
	}
	
	@GET
	@Path("/login")
    @Produces(MediaType.APPLICATION_JSON)
	public String login(@Context UriInfo uriInfo) throws JSONException {
		JSONObject responseJson = new JSONObject();
		String parameters[] = uriInfo.getRequestUri().getQuery().split("&");
		String email = parameters[0];
		String password = PasswordUtil.encrypt(parameters[1]);
		try {
			User user = getS2SBooksTools().login(email, password);
			if(user == null) {
				responseJson.put("code", "error");
				responseJson.put("message", "Your email or password did not match");
			} else {
				if(user.isTermsAgreed()) {
					responseJson.put("termsAgreed", "true");
				}
				responseJson.put("code", "success");
				System.out.println("Login successfull "+user.getEmail());
				getRequest().getSession().setAttribute("user", user);
			}
		} catch (Exception e) {
			Log.error("Exeception while checking login : "+e.getMessage());
		}
		
		return responseJson.toString();
	}
	
	@GET
	@Path("/logout")
    @Produces(MediaType.APPLICATION_JSON)
	public String logout(@Context UriInfo uriInfo) throws JSONException {
		JSONObject responseJson = new JSONObject();
		try {
			getRequest().getSession().setAttribute("user", null);
			responseJson.put("code","success");
		} catch (Exception e) {
			responseJson.put("code","failed");
			responseJson.put("message","Something went wrong!");
			Log.error("Exeception while checking logout : "+e.getMessage());
		}
		return responseJson.toString();
	}
	
	@GET
	@Path("/terms")
    @Produces(MediaType.APPLICATION_JSON)
	public String agreeTerms(@Context UriInfo uriInfo) throws JSONException {
		JSONObject responseJson = new JSONObject();
		String parameter = uriInfo.getRequestUri().getQuery();
		if(parameter != null) {
			boolean status = Boolean.valueOf(parameter);
			if(status) {
				try {
					if(getRequest() != null){
						User user = (User) getRequest().getSession().getAttribute("user");
						if(user != null){
							User userItem = (User) getS2SBooksTools().getItem(User.class, user.getId());
							userItem.setTermsAgreed(true);
							getS2SBooksTools().updateItem(userItem, true);
							responseJson.put("code", "success");
						} else{
							responseJson.put("code", "error");
							responseJson.put("message","Something went wrong!");
						}
					} else{
						Log.info("UserManagerRestService:: validateUserLogin:: request found empty.");
						responseJson.put("code", "error");
						responseJson.put("message","Something went wrong!");
					}
				} catch (Exception e) {
					responseJson.put("code","failed");
					responseJson.put("message","Something went wrong!");
					Log.error("Exeception while checking logout : "+e.getMessage());
				}
			}
			else {
				return logout(uriInfo);
			}
		}
		else {
			responseJson.put("code","failed");
			responseJson.put("message","Something went wrong!");
		}
		return responseJson.toString();
	}
	
	@GET
	@Path("/validatelogin")
    @Produces(MediaType.APPLICATION_JSON)
	public String validateLogin(@Context UriInfo uriInfo) throws JSONException {
		JSONObject responseJson = new JSONObject();
		if(getRequest() != null){
			User user = (User) getRequest().getSession().getAttribute("user");
			if(user != null){
				responseJson.put("code", "success");
			} else{
				responseJson.put("code", "error");
			}
		} else{
			Log.info("UserManagerRestService:: validateUserLogin:: request found empty.");
			responseJson.put("code", "error");
		}
		return responseJson.toString();
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
