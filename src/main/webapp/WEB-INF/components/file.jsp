<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <% String ob=request.getParameter("jsonObj");
   JSONObject jsonObj = new JSONObject(ob);
   String name =(String)jsonObj.get("name");
   String value =(String)jsonObj.get("value");
   String placeholder =(String)jsonObj.get("placeholder");
   JSONObject validation =(JSONObject)jsonObj.get("validation");
   
   %>
<input type="file" class="form-control" id="<%=name %>" name="<%=name %>"  placeholder = "<%=name %> "/>

 <%
if(value.equals(" ")){
	%>
	
<input type="file" class="form-control" id="<%=name%>"
	name="<%=name%>" placeholder="<%=name%>"/>"
<%} else{ %>

<input type="file" class="form-control" id="<%=name%>"
	name="<%=name%>" placeholder="<%=name%>" value="<%=value%>" />
	<%} %>