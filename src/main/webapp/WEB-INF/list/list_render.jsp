<%@page import="java.util.Set"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.JSONObject"%>

<div id="container" class="container-fluid">
<h2 class="text-center" >File Created List</h2>
<table id="table1" class="table table-striped table-hover table-bordered">
<caption>File Created List</caption>
	<thead>
	<tr>
<%
LinkedHashMap<String, String> formDefinition=(LinkedHashMap<String, String>) request.getAttribute("fieldList");
Set<String>Keys = formDefinition.keySet();
String url= null;
JSONObject jsonObj=null;
ArrayList<String> arr=new ArrayList<String>();
String elementType = null;
for (String key :Keys ) {
	String value=formDefinition.get(key);
	 jsonObj = new JSONObject(value);
	 elementType = (String) jsonObj.get("type");
	 String label=(String)jsonObj.get("label");
	 String listable=(String)jsonObj.get("listable");
	 String name=(String)jsonObj.get("name");
	 boolean listValue=Boolean.parseBoolean(listable);  
	
	if(listValue){
	%>
	<th id="tableheader" class="text-center thead-dark" scope="col"><%=label%></th>
<% 
  arr.add(name);
	}%>       
<%}%>
	</tr>
	</thead>
	 <%@ include file="../list/get.jsp" %> 
	</table>
	</div>


















