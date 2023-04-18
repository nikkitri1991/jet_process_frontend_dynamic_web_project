<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONObject"%>


<%
		String jsonObj = request.getParameter("jsonObj");
		JSONObject jsonData = new JSONObject(jsonObj);
		JSONObject paramObj = null;
		String name = (String) jsonData.get("name");
		JSONObject data = (JSONObject) jsonData.get("provider");
		JSONObject validation = (JSONObject) jsonData.get("validation");
		boolean required = (boolean)validation.get("required");
		String requestType = (String) data.get("type");
		String url = (String) data.get("url");
		String UrlValue = (String) data.get("value");
		String fieldId = (String) data.get("id");
		JSONArray params = (JSONArray) data.get("params");

%>
<select class="form-control" name="<%=name%>" id="<%=name%>">
	<% 
		if (url.equals("")){
			//Options
		     JSONArray optons =(JSONArray)jsonData.get("options");
		     for (int i = 0; i<optons.length(); i++){
			 JSONObject optionObj = (JSONObject)optons.get(i);
		     String OptionsLabel = (String)optionObj.get("label");
		     String OptionsValue = (String) optionObj.get("value");
		%>
	<option selected value="<%=OptionsValue%>"><%=OptionsLabel%></option>
	<%}%>
	<%}%>

</select>

<script>
		// validation
		$("#forms").validate({
		    rules: {
		    	<%=name%>:{ required:<%=required%> }
		  
		    },
		    messages: {
		    	<%=name%>: "Please select from dropdown",
		    },
		    submitHandler: function(form) {
		      form.submit();
		    }
		  });		
		
		//data provider
		     $(document).ready(function() { 
		    	var dataProvider ="<%=url%>";
		     	if (dataProvider.length!== 0) { 
		    	var providerValue="<%=UrlValue%>";
		    	var params =<%=params%>;
		
		    	if(params.length==0){
		    	load_master_data('<%=name%>',0);
		    	}
		    	
		    	if(params.length!=0){
		    		for(var i=0; i< params.length; i++){
		    			 paramObj 	=params[i];
		    			 paramName 	=paramObj.name;
		    			 paramValue =paramObj.value;
		    			 console.log(paramValue);
		    			 load_dependent_master_data(paramName, paramValue);
		    			 if(paramName==''){
		    			load_master_data('<%=name%>',paramValue)
		    				 
		    			 }	
		    		}
		    	}
		    	
		    	function load_master_data(id1, parentid)
		    	{
		    		var url ="<%=url%>";
		    		console.log(url);	
		    		$("#" + id1).empty();
		    		$("#" + id1).append(new Option("Select", ""));
		    		console.log("parentid"+parentid);
		    		console.log(id1);
		    		var dataProvider =null;
		    		var requestType = "<%=requestType%>";
		    		if (parentid != 0) {
		    		dataProvider = url +"/"+parentid;
		    		console.log("ifdataProvider"+dataProvider);
		    		} else {
		    			
		    			dataProvider = url;
		    			console.log("elsedataProvider"+dataProvider);
		    		}
		    			$.ajax({
		    				type : requestType,
		    				url : dataProvider,
		    				dataType : 'json',
		    				cache : false,
		    				processData : false,
		    				contentType : 'application/json'
		    			}).done(function(data) {
		    				$.each(data, function(key, value) {
		    					name = value.name;
		    					id = value.id;
		    					$("#" + id1).append(new Option(name, id));
		    					 if(providerValue!=null && id==providerValue){
			    				 $("select option[value='"+id+"']").attr("selected","selected");
			    				  } 
		
		    				});
		    			});
		    		}
		    	}
		    	
		 function load_dependent_master_data(paramName, paramValue ){
    		   $("#"+paramName).on('change', function(){
    			var childId = "<%=name%>";
    			var parentValue = '';
    			if(paramValue=="#"){
    				console.log("if");
    				 var parentValue = $(this).val();
    				 if(parentValue!=''){
    		 		 load_master_data(childId , parentValue);
    						}
    					}
    			else{
    				load_master_data(childId , paramValue);
    					}
    						
    				});	
    			}	
	});
   			
	</script>





