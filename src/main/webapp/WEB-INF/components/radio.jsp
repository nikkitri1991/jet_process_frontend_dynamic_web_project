<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


 <% String ob=request.getParameter("jsonObj"); 
 	JSONObject jsonObj = new JSONObject(ob);
	String name =(String)jsonObj.get("name");
	JSONObject radioDataProvider = (JSONObject) jsonObj.get("provider");
	String url = (String)radioDataProvider.get("url");
	String urlValue = (String)radioDataProvider.get("value");
 	
%>
 	<div id="container2"></div>
		  
<%  if (url.equals("")){
	//Options
     JSONArray optonsArray =(JSONArray)jsonObj.get("options");
 	 for (int i = 0; i<optonsArray.length(); i++){
 	 JSONObject optionObj = (JSONObject)optonsArray.get(i);
	 String optionsLabel = (String)optionObj.get("label");
	 String optionValue = (String) optionObj.get("value");		
%>
<input  type="radio" id="<%=name %>" name="<%=name%>" value="<%=optionValue%>"/>
<label  for="<%=name%>"><%=optionsLabel%></label>

<%}%>
<%}%>
<script>
$(document).ready(function(){
	$('input[name=<%=name %>][value=Female]').attr('checked', 'checked'); 
	var dataProvider ="<%=url%>";
	var providerValue="<%=urlValue%>";
	if(dataProvider.length!==0){
		$.ajax({	  
			 type: "GET",
			    url: dataProvider,
			    dataType: 'json',
			    cache : false,
			    processData: false,
		        contentType : 'application/json'
		}).done(function (data){
			 $.each(data,function(key,value){
				 $('#container2')
			        .append('<input type="radio" id='+key+' name="<%=name%>" value='+value+'>')
			        .append('<label for="<%=name%>">'+key+'</label>')
			        .append(`<br>`);
			 })
			        if(providerValue!=null){
	                 loadAllRadio(data,providerValue); 
			        }
		     }).fail(function (data) { 
		        console.log(data);
	      
		});
   }
});
function loadAllRadio(data,providerValue){
	$.each(data,function(key,value){
	  $(":radio").each(function(){
		if($(this).val()===providerValue) {     
		    $(this).attr("checked","checked");
		    }
		});
	})  
}
</script>
 	
 	
 	
 
 


