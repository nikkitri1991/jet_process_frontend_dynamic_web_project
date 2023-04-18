
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
		String errorMessage = (String)jsonObj.get("errorMessage");
		boolean isRequired = (boolean)validation.get("required");
		String value =(String)jsonObj.get("value");
		JSONObject configuration =(JSONObject)jsonObj.get("config");
		boolean isHidden= (boolean)configuration.get("hidden");
		boolean isDisabled= (boolean)configuration.get("disabled");
		System.out.print(isDisabled);
		
		  %>

		<%
		if(value.equals(" ")){
			%>
			<input type="number" class="form-control" id="<%=name%>"
			name="<%=name%>" placeholder="<%=placeholder%>"
			required="<%=isRequired%>" min="<%=minLength%>"
			max="<%=maxLength%>"  />
		<%} else{ %>
		
		<input type="number" class="form-control" id="<%=name%>"
			name="<%=name%>" placeholder="<%=placeholder%>"
			required="<%=isRequired%>" min="<%=minLength%>"
			max="<%=maxLength%>" value="<%=value%>" />
		
		<%} %>

	<script>
	$(document).ready(function(){
		
		//disabled 
		var isDisabled= <%=isDisabled%>;
		var isHidden = <%= isHidden%>;
		var elementId = "<%=name%>";
		if(isDisabled){
			
			$("#"+elementId).attr('disabled', 'disabled');
		}
		if(isHidden){
			
			$("#"+elementId).hide();
			
		}
		
		
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