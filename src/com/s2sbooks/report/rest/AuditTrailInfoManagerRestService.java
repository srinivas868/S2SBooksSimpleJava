package com.s2sbooks.report.rest;

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

@Path("/auditTrailInfoManager")
public class AuditTrailInfoManagerRestService {
	
	private S2SBooksTools s2SBooksTools;
	@Context private HttpServletRequest request;

	@GET
	@Path("/search")
    @Produces(MediaType.APPLICATION_JSON)
	public String search(@Context UriInfo uriInfo) throws JSONException {
		JSONObject responseJson = new JSONObject();
		try {
			String parameters[] = uriInfo.getRequestUri().getQuery().split("&");
			String firstName = parameters[0];
			String lastName = parameters[1];
			String email = parameters[2];
			User user = getS2SBooksTools().searchUserItem(User.class, firstName, lastName,email);
			if(user != null) {
				List<AuditTrail> auditTrails = getS2SBooksTools().getAuditTrailItems(AuditTrail.class, user);
				if(auditTrails != null) {
					getRequest().getSession().setAttribute("auditTrailItems", auditTrails);
					responseJson.put("code", "success");
				}
				else {
					responseJson.put("code", "failed");
				}
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
