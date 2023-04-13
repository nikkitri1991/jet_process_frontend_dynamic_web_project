
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
String jsonObj = request.getParameter("jsonObj");
JSONObject jsonData = new JSONObject(jsonObj);
String name = (String) jsonData.get("name");
JSONObject data = (JSONObject) jsonData.get("provider");
String url = (String) data.get("url");
String UrlValue = (String) data.get("value");

%>
<select class="form-control" name="<%=name%>" id="<%=name%>">

	<% 
 	if (url.equals("")){ 
	JSONArray optons =(JSONArray)jsonData.get("options");
	
	for (int i = 0; i<optons.length(); i++){
	JSONObject optionObj = (JSONObject)optons.get(i);
	
	String label = (String)optionObj.get("label"); 
	 String value1 = (String) optionObj.get("value"); 
	%>
	<option value="<%=value1 %>"><%=label %></option>
	<% }%>

	<% }%>

</select>


<script>
     $(document).ready(function() { 
    	var dataProvider ="<%=url%>";
    	var providerValue="<%=UrlValue%>";
    		 if(dataProvider.length!==0 ){
    			 
    	    		$.ajax({	  
    	    			    type: "GET",
    	    			    url: dataProvider,
    	    			    dataType: 'json',
    	    			    cache : false,
    	    			    processData: false,
    	    		        contentType : 'application/json'
    	    		}).done(function (data){
    	    			console.log(data);
    	    			 $.each(data,function(key,value){
    	    				 name = value.name;
    	    				 id = value.id;
    	    				  $("#<%=name%>").append(new Option(name,id));  
    	    				  if(providerValue!=null && id==providerValue){
    	    					  
    	    					  $("select option[value='"+id+"']").attr("selected","selected");
    	    				  }  
    					});
    				}).fail(function(data) {
    				});
    			} 
	});
</script>

