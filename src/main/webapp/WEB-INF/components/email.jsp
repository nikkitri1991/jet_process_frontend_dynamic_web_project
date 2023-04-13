<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<% 
   String ob=request.getParameter("jsonObj");
   JSONObject jsonObj = new JSONObject(ob);
   String name =(String)jsonObj.get("name");
   String value =(String)jsonObj.get("value");
   
   %>
<%
if(value.equals(" ")){
	%>
<input type="email" class="form-control" id="<%=name %>"
	name="<%=name %>" placeholder="<%=name %>" required />

<%} else{ %>

<input type="email" class="form-control" id="<%=name %>"
	name="<%=name %>" placeholder="<%=name %>" value="<%=value %> "
	required />
<%} %>