<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <% String ob=request.getParameter("jsonObj");
   JSONObject jsonObj = new JSONObject(ob);
   String name =(String)jsonObj.get("name");
   String cssClass =(String)jsonObj.get("class");
 
   String value =(String)jsonObj.get("value");
   
   %>
<input type="reset" id="<%=name %>" name="<%=name %>" class = "<%= cssClass%>" value = "<%=value%>"/>
