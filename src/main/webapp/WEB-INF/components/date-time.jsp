<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <% String ob=request.getParameter("jsonObj");
   JSONObject jsonObj = new JSONObject(ob);
   String name =(String)jsonObj.get("name");
   String placeholder =(String)jsonObj.get("placeholder");
   JSONObject validation =(JSONObject)jsonObj.get("validation");
   String value = (String)jsonObj.get("value");
   
   %>
   
   <%
  if(value.equals(" ")){
  	%>
  	<input type="datetime-local" class="form-control" id="<%=name %>" name="<%=name %>"/>

  <%} else{ %>

  <input type="datetime-local" class="form-control" id="<%=name %>" name="<%=name %>"  value="<%=value %>"/>

  <%}%>