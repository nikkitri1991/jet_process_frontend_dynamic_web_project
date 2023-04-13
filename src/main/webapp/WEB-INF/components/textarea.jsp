<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% String ob=request.getParameter("jsonObj");
    	 JSONObject jsonObj = new JSONObject(ob);
    	 String name = (String)jsonObj.get("name");
    	String rows = (String)jsonObj.get("rows");
    	 String cols = (String)jsonObj.get("cols");
    	 String value = (String)jsonObj.get("value");
    	 JSONObject validation =(JSONObject)jsonObj.get("validation");

    	 boolean required = (Boolean)validation.get("required");
    %>
	<%
if(value.equals(" ")){
	%>
	
<textarea class="form-control"  name="<%=name%>" placeholder="<%=name%>"  rows="<%=rows%>"  cols="<%=cols%>" id="<%=name%>"></textarea>
<%} else{ %>


<textarea class="form-control"  name="<%=name%>" placeholder="<%=name%>"  rows="<%=rows%>"  cols="<%=cols%>" id="<%=name%>" value="<%=value%>">
	</textarea>
	<%} %>
	