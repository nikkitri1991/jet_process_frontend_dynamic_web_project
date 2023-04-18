<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
String ob = request.getParameter("jsonObj");
JSONObject jsonObj = new JSONObject(ob);
String name = (String) jsonObj.get("name");
String errorMessage = (String) jsonObj.get("errorMessage");
String value = (String) jsonObj.get("value");
JSONObject validation = (JSONObject) jsonObj.get("validation");
String minLength = (String) validation.get("minLength");
String maxLength = (String) validation.get("maxLength");
boolean required = (boolean) validation.get("required");
%>


<%
if(value.equals(" ")){
	%>

<input type="password" class="form-control" id="<%=name%>"
	name="<%=name%>" placeholder="<%=name%>" required="<%=required%>" />
<%} else{ %>


<input type="password" class="form-control" id="<%=name%>"
	name="<%=name%>" placeholder="<%=name%>" required="<%=required%>"
	value="<%=value%>" minLength="<%=minLength%>"
	maxLength="<%=maxLength%>" />
<%} %>

<label id="passcheck"> </label>

<script>
$(document).ready(function(){
    $("#passcheck").hide();
    var pass_error=true;
    $("#submit").click(function(){
        pass_check();
    });
    function pass_check(){
        var pass_val=$("#<%=name%>").val();
        if(pass_val== ''){
            $("#passcheck").show();
            $("#passcheck").html("<%=errorMessage%>");
            $("#passcheck").focus();
            $("#passcheck").css("color","red");
            pass_error=false;
            return false;
        }
        else if(pass_val != ' '){
             let s =  pass_val;
            if(s.match(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/g)){
                $("#passcheck").hide();
                return true;
            }
            else{
                $("#passcheck").html("<%=errorMessage%>");
                $("#passcheck").css("color","red");
                $("#passcheck").focus();
                return false;
            }
        }
    }
});


</script>