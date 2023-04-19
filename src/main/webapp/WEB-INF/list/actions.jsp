
<%@page import="java.util.LinkedHashMap"%>






 <%
 
 
 
 LinkedHashMap<String, String> actionsList1 = new LinkedHashMap<>();		
 actionsList1.put("getAction",	  "{\n\"type\": \"GET\",  \n \"id\":  \"get\", \n\"name\": \"get\",\n  \"label\": \"Get\",\n  \"value\": \"Get\",\n        \"classes\":\"form-control\",\n     \"class\": \"btn btn-default\", \n  \"url\": \"http://localhost:9091/api/v1/docFile\",\n        \"suggestion\": \"\",\n            \"config\": {\n                \"disabled\": false,\n                \"readOnly\": false,\n                \"checked\": false,\n                \"hidden\": false\n            },\n        }");	 
 actionsList1.put("submitAction", "{\n\"type\": \"POST\", \n \"id\":  \"save\", \n\"name\": \"save\",\n  \"label\": \"hii\",\n  \"value\": \"Save\",\n        \"classes\":\"form-control\",\n     \"class\": \"btn btn-primary\", \n  \"url\": \"http://localhost:8081/api/v1/user\", \n           \"suggestion\": \"\",\n            \"config\": {\n                \"disabled\": false,\n                \"readOnly\": false,\n                \"checked\": false,\n                \"hidden\": false\n            },\n        }");	
 actionsList1.put("editAction",	  "{\n\"type\": \"PUT\",  \n \"id\":   \"edit\", \n\"name\": \"edit\",\n  \"label\": \"hello\",\n    \"value\": \"Edit\",\n      \"classes\":\"form-control\",\n     	\"class\": \"btn btn-primary\", \n   \"url\": \"\", \n    \"suggestion\": \"\",\n            \"config\": {\n                \"disabled\": false,\n                \"readOnly\": false,\n                \"checked\": false,\n                \"hidden\": false\n            },\n        }");	
 actionsList1.put("cancelAction",  "{\n\"type\": \"cancel\",\n \"id\":  \"cancel\",\n\"name\": \"cancel\",\n \"label\": \"verified\",\n  \"value\": \"Cancel\",\n        \"classes\":\"form-control\",\n     \"class\": \"btn btn-default\",\n        \"suggestion\": \"\",\n            \"config\": {\n                \"disabled\": false,\n                \"readOnly\": false,\n                \"checked\": false,\n                \"hidden\": false\n            },\n        }");	 

 request.setAttribute("p", "hellowwwwwww");
%>



<%@include file="../list/get.jsp" %>