String ob=request.getParameter("jsonObj");

<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 

String ob=request.getParameter("jsonObj");
JSONObject jsonObj = new JSONObject(ob);
String name =(String)jsonObj.get("name");
String placeholder =(String)jsonObj.get("placeholder");

JSONObject validation =(JSONObject)jsonObj.get("validation");

String minLength = (String)validation.get("minLength");
String maxLength = (String)validation.get("maxLength");
String min = (String)validation.get("min"); 
String max = (String)validation.get("max");
String errorMessage = (String)jsonObj.get("errorMessage");
boolean required = (boolean)validation.get("required");
String value =(String)jsonObj.get("value");
  %>

<input type="number" class="form-control" id="<%=name %>" name="<%=name%>" placeholder="<%=placeholder %>" required="<%=required%>" minLength="<%=minLength%>"  maxLength="<%=maxLength%>"/>
<h6 id="numbercheck"> </h6>

<%
if(value.equals(" ")){
	%>
	<input type="number" class="form-control" id="<%=name%>"
	name="<%=name%>" placeholder="<%=placeholder%>"
	required="<%=required%>" minLength="<%=minLength%>"
	maxLength="<%=maxLength%>"  />
<%} else{ %>

<input type="number" class="form-control" id="<%=name%>"
	name="<%=name%>" placeholder="<%=placeholder%>"
	required="<%=required%>" minLength="<%=minLength%>"
	maxLength="<%=maxLength%>" value="<%=value%>" />
<label id="numbercheck"> </label>
<%} %>

<script>
$(document).ready(function(){
	
	$("#numbercheck").hide();
	
	var pass_error=true;
	 $("#submit").click(function(){
		number_check();
	
	});
	function number_check(){
		var number_val=$('#<%=name%>').val();
		
		
		if(number_val.length!=10){
			
			$("#numbercheck").show();
			$("#numbercheck").html("<%=errorMessage%>");
			$("#numbercheck").focus();
			$("#numbercheck").css("color","red");
			pass_error=false;
			return false;
			
		}
		else{
			$("#numbercheck").hide();
			return true;
		}
		
	}
	
});
</script>