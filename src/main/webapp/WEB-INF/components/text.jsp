<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<% 
   String ob=request.getParameter("jsonObj");
	JSONObject jsonObj = new JSONObject(ob);
	String name =(String)jsonObj.get("name");
	
	String errorMessage = (String)jsonObj.get("errorMessage");
	JSONObject validation =(JSONObject)jsonObj.get("validation");
     String min = (String)validation.get("minLength");
   
     String max = (String)validation.get("minLength");
     boolean required = (boolean)validation.get("required");
     String value =(String)jsonObj.get("value");
     System.out.print("value" +value);
  %>

<% if (value.equals(" ")){
	%>

<input class="form-control" type="text" id="<%=name %>"
	name="<%=name %>" placeholder=" <%=name %>" required="<%=required %>"
	min=3 max=5>
<% } else {
		 
	 %>
<input class="form-control" type="text" id="<%=name %>"
	name="<%=name %>" placeholder=" <%=name %>" value="<%=value %>"
	required="<%=required %>" min=3 max=5>


<% }%>




<script>
  
 <%--  $(document).ready(function(){
	  

	    $("#submit").click(function(){
	        var user=$("#<%=name%>").val();
	        if(user==""){
	            $("#usercheck").html("<%=errorMessage%>");
	            $("#usercheck").focus();
	            $("#usercheck").css("color","red");
	            return false;
	        }
	        if((user.length<=2)|| (user.length>=26) ){
	            $("#usercheck").html("<%=errorMessage%>");
	            $("#usercheck").focus();
	            $("#usercheck").css("color","red");
	            return false;
	        }
	        else{
	            $("#usercheck").hide();
	            return true;
	        }
	    });
	});


 --%>
  
  
  
<%-- $(document).ready(function(){
	$("#usercheck").hide();
	var pass_error=true;
	
	$("#<%=name%>").keyup(function() {
		
		text_check();
	
	});
	
	function text_check(){
		
		var user_val= $("#<%=name%>").val();
		
		if(user_val== ''){
			$("#usercheck").show();
			$("#usercheck").html("<%=errorMessage%>");
			$("#usercheck").focus();
			$("#usercheck").css("color","red");
			pass_error=false;
			return false;
		}
		else if(user_val != ''){
			
			 let s = user_val;
			if(s.match(/[a-z]/g)){
				$("#usercheck").hide();
				return true;
			}
			
			else if(user_val == [0-9]){
				alert();
				$("#usercheck").html("<%=errorMessage%>");
				
			}
			else{
				$("#usercheck").hide();
			}
		}
	}
	
}); --%>
</script>


