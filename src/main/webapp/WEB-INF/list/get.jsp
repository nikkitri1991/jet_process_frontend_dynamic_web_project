<%@page import="org.json.JSONObject"%>
<%@page import="java.util.LinkedHashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<% 

LinkedHashMap<String, String> actiononList = (LinkedHashMap<String, String>) request.getAttribute("acyionList");
 Set<String>getKeys = actiononList.keySet();
 String resultUrl = null;
for (String key1 :getKeys ) {
	String value1=actiononList.get(key1);
	JSONObject jsonNewObj = new JSONObject(value1);
	String elementType1 = (String) jsonNewObj.get("type");
	if(elementType1.equals("GET")){
		resultUrl=(String)jsonNewObj.get("url");	
	}
}	
%>
<script>
console.log($("#table1"));
    let names=[];
	$(document).ready(function(){ 
			<%
			for(String a:arr){
			%>
			names.push("<%=a%>");
			<%}%>
		let dataProvider ="<%=resultUrl%>";
	    		$.ajax({	  
	    			    type: "GET",
	    			    url: dataProvider,
	    			    dataType: 'json',
	    			    cache : false,
	    			    processData: false,
	    		        contentType : 'application/json'
	    		}).done(function (data){
	    			 $.each(data,function(key,value){
	    				 let row='<tr>';
	    				  $.each(names,function(key,head){
	    					   row+='<td class="text-center">'+ value[head] +'</td>'; 
	    				 });
	    				 row+='</tr>';
	    				$('#table1').append(row);
	    			 });
				}).fail(function(data) {
					console.log(data);
				});
	});
	</script> 


