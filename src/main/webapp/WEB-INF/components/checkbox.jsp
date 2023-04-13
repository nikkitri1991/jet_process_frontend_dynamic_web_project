<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
 <% String jsonObj=request.getParameter("jsonObj");
 	JSONObject jsonData = new JSONObject(jsonObj);
	String name =(String)jsonData.get("name");
 	JSONObject data = (JSONObject)jsonData.get("provider");
	String url=(String)data.get("url");	
	String urlValue=(String)data.get("value");	
	String id=(String)data.get("id");	

 %>
<% 
 if (url.equals("")){
	 //Options
	 JSONArray options =(JSONArray)jsonData.get("options");
	 for (int i = 0; i<options.length(); i++){
	 JSONObject optionObj = (JSONObject)options.get(i);
	 String label = (String)optionObj.get("label");
	 String optionsValue = (String) optionObj.get("value");
	 
 %>
 <input type="checkbox"  name="<%=name%>" id="<%=name%>" value="<%=optionsValue%>">
 <label for="<%=name%>"><%=label%></label>
 <%}%>
 <%}%>
<div id="container"></div>

<script>

$(document).ready(function() { 
	$('input[name=<%=name %>][value=Verified]').attr('checked', 'checked'); 
	var dataProvider ="<%=url%>";
	var providerValue="<%=urlValue%>";
	if(dataProvider.length!==0 ){
		$.ajax({	  
			 type: "GET",
			    url: dataProvider,
			    dataType: 'json',
			    cache : false,
			    processData: false,
		        contentType : 'application/json'
		}).done(function (data){
			 $.each(data,function(key,value){
				 $('#container')
			        .append('<input type="checkbox" id='+key+' name="<%=name%>" value='+value+'>')
			        .append('<label for="<%=name%>">'+key+'</label>')
			        .append(`<br>`);
			 })  
			 if(providerValue!=null){
			        loadAll(data,providerValue);
			}
		}).fail(function (data) {
		 console.log(data);
		});
   }
});

function loadAll(data,providerValue){
	$.each(data,function(key,value){
	  $(":checkbox").each(function(){
		if($(this).val()===providerValue){     
		    $(this).attr("checked","checked");
		    }
		});
	
	});  
}

</script>



