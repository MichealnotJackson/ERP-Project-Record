<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP_Account List</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/httpRequest.js"></script>
</head>
<body>
<div>
	<select name="type">
		<option value="account_bank" ${param.type == 'account_bank' ? 'selected' : '' }>코드</option>
		<option value="account_num" ${param.type == 'account_num' ? 'selected' : '' }>이름</option>
	</select>
	<input type="text" name="word" id="word" onkeyup="bnajax(this.value, '${comcode_code}')" onblur="bnajax(this.value, '${comcode_code}')">
	<input type="button" onclick="bnajax('', '${comcode_code}')" value="전체목록">
	
	<table id="procode">
		<tr>
			<td>은행</td>
			<td>계좌번호</td>
			<td>타입</td>
		</tr>
		<c:if test="${list == null }">
			<tr>
				<td colspan="3">정보가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="vo" items="${list }">
			<tr onclick="setParentText(${vo.account_no }, '${vo.account_bank }', '${vo.account_num }')">
				<td>${vo.account_bank}</td>
				<td>${vo.account_num}</td>
				<td>${vo.account_type}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<script type="text/javascript">
	function setParentText(no, name, num){
    	opener.document.getElementById("account_no").value = no;
    	opener.document.getElementById("account_bank").value = name;
    	opener.document.getElementById("account_num").value = num;
    	window.close();
    }
	
	function bnajax(v, code){
		var type = document.getElementsByName("type")[0].value;
		if(v == ''){
			type = null;
			v = null;
		}
		var url = "${pageContext.request.contextPath}/a/a4/acListAjax";
		var param = "word="+v+"&type="+type+"&comcode_code="+code;
		
		sendRequest(url,param,getlist,"POST");
	}
	function getlist(){
		if(xhr.readyState==4 && xhr.status==200) {	
			var data = xhr.response;
			let procode = document.getElementById("procode");
			let newTr = document.createElement("tr");
			let newTd = document.createElement("td");
			procode.innerHTML = '';
			procode.innerHTML += '<tr><td>은행</td><td>계좌번호</td><td>타입</td><tr>';
			if(data != ""){
				var data2 = JSON.parse(data);
				data2.forEach(function(map){
					newTr = document.createElement("tr");
					newTr.setAttribute("onclick", "setParentText("+map.account_no+",'"+map.account_bank+"','"+map.account_num+"')");
					procode.appendChild(newTr);
					newTd = document.createElement("td");
					newTd.innerHTML = map.account_bank;
					newTr.appendChild(newTd);
					newTd = document.createElement("td");
					newTd.innerHTML = map.account_num;
					newTr.appendChild(newTd);
					newTd = document.createElement("td");
					newTd.innerHTML = map.account_type;
					newTr.appendChild(newTd);
				});
			}else {
				procode.innerHTML += '<tr><td colspan="3">목록이 없습니다.</td></tr>';
			}
		}
	}
</script>
</body>
</html>