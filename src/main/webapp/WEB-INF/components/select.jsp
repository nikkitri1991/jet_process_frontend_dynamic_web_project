
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
String jsonObj = request.getParameter("jsonObj");
JSONObject jsonData = new JSONObject(jsonObj);
JSONObject paramObj = null;
String name = (String) jsonData.get("name");
JSONObject data = (JSONObject) jsonData.get("provider");
String requestType = (String) data.get("type");
String url = (String) data.get("url");
String UrlValue = (String) data.get("value");
String fieldId = (String) data.get("id");
JSONArray params = (JSONArray) data.get("params");


%>
<select class="form-control" name="<%=name%>" id="<%=name%>">
	<option value=" 0">Select
		<%=name%></option>
	<%
	if (url.equals("")) {
		JSONArray optons = (JSONArray) jsonData.get("options");

		for (int i = 0; i < optons.length(); i++) {
			JSONObject optionObj = (JSONObject) optons.get(i);

			String label = (String) optionObj.get("label");
			String value1 = (String) optionObj.get("value");
	%>
	<option value="<%=value1%>"><%=label%></option>
	<%
	}
	%>

	<%
	}
	%>
</select>


<script>

var params =<%=params%>;


if(params.length==0){
load_master_data('<%=name%>',0);
}

if(params.length!=0){
for(var i=0 ;i< params.length; i++){
	 paramObj = params[i];
	 parentid =paramObj.name;
	
	$("#"+parentid).on('change', function(){
		alert("test");
		var childId = "<%=name%>";
		console.log("childId"+childId);
		 var parentValue = $(this).val();
		 if(parentValue != '')
		 {
			 console.log("ppppppp");
		  load_master_data(childId , parentValue);
		 }
		
		});	
}
}

	/* setTimeout(example, 5000, 'msg1', 'msg2' */
	
	function load_master_data(id1, parentid)
	{
		var url ="<%=url%>";
		console.log(url);

		console.log("parentid"+parentid);
	console.log(id1);
		var dataProvider =null;
	    
		var requestType = "<%=requestType%>";

		if (parentid != 0) {
			dataProvider = url + parentid;

		} else {
			dataProvider = url;
		}

		if (dataProvider.length !== 0) {
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

				});

			});

		}

	}
</script>






































<%-- 
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

 --%>