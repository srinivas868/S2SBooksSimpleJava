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
import com.s2sbooks.vo.User;

@Path("/surveyInfoManager")
public class SurveyInfoManagerRestService {
	
	private S2SBooksTools s2SBooksTools;
	@Context private HttpServletRequest request;

	@GET
	@Path("/write")
    @Produces(MediaType.APPLICATION_JSON)
	public String write(@Context UriInfo uriInfo) throws JSONException {
		JSONObject responseJson = new JSONObject();
		try {
			String parameters[] = uriInfo.getRequestUri().getQuery().split("&");
			if(checkEmpty(parameters)) {
				throw new Exception("Empty values");
			}
			String question1 = parameters[0];
			String question2 = parameters[1];
			String question3 = parameters[2];
			String question4 = parameters[3];
			String question5 = parameters[4];
			User user = S2SBooksTools.getCurrentUser(getRequest());
			user.setQuestion1(question1);
			user.setQuestion2(question2);
			user.setQuestion3(question3);
			user.setQuestion4(question4);
			user.setQuestion5(question5);
			user.setSurveyAnswered(true);
			getS2SBooksTools().updateItem(user, true);
			responseJson.put("code", "success");
		} catch (Exception e) {
			Log.error("Error while adding item to database : "+e);
			responseJson.put("code", "error");
			responseJson.put("data", "Something went wrong!");
		}
		return responseJson.toString();
	}
	
	private boolean checkEmpty(String[] parameters) {
		
		for(int i=0; i<parameters.length-1; i++) {
			if(parameters[i].isEmpty()) {
				return true;
			}
		}
		return false;
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
