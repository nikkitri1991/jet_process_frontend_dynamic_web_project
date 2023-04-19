<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org.json.JSONObject"%>
 <% 
String ob=request.getParameter("jsonObj");
 System.out.println(ob);
JSONObject jsonObj = new JSONObject(ob);
String url =(String)jsonObj.get("url");
System.out.println(url);

%>
<div id="container">


</div>

<script>

$(document).ready(function() { 
	var container=$("#container");
	var table=$("<table>")
	var headerRowHTML='<tr>'
	var dataProvider ="<%=url%>";
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
	    				 type=value.type; 
	    				 headerRowHTML = headerRowHTML + '<th>' + 'type' + '</th>';
	    				 
					});
	    			 headerRowHTML +='</tr>'
				}).fail(function(data) {
				});
			
});

</script> 