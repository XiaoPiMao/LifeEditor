<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
		
	#content {
            font-size:20pt;
            
        }
        div#selects {
            margin-top:15vh;
            text-align:center;
            
        }
        select,option{
        	width:150px;
            font-size:20pt;
        }
        
       
</style>
<script>

var allSecs = JSON.parse('${secs}');


onload = function () {
	selects = document.querySelectorAll("select");
    selects[0].onchange = optSec;
    addOpt(null,"項目");
    
}



function optSec() {
	   while( selects[1].childNodes.length > 1)
		   selects[1].removeChild(selects[1].lastChild);
	   var secs = allSecs[this.value];
	   for(var i=0,max=secs.length;i<max;i++) {
		   addOpt(secs[i].secID,secs[i].secName);
	   }
	   

}



function addOpt(value,text) {
    var opt = document.createElement("option");
    opt.value = value;
    opt.innerText = text;
    selects[1].appendChild(opt);
}
</script>
</head>
<body>
	<div id="content" >
        <div id="selects">
           	<select id="selType" class="opt" >
           		<option value="">類別</option>
           			<c:forEach var="type" items="${types }">
           				<option value=${type.typeID }>${type.typeName }</option>
					</c:forEach>
           	</select>
            <select id="selSec" class="opt"></select>
        </div>
    </div>
</body>
</html>