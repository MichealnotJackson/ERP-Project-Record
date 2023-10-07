<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<div align="center">
	<table>
		<tr>
			<th>국가명</th>
			<th>거래처명</th>
			<th>거래처종류</th>
			<th>사업자등록번호</th>
			<th>법인등록번호</th>
			<th>대표자명</th>
			<th>사업형태</th>
			<th>업종코드</th>
			<th>업태명</th>
			<th>중분류</th>
			<th>세세분류명</th>
			<th>사업장</th>
			<th>상세주소</th>
			<th>우편주소</th>
			<th>대표번호</th>
			<th>팩스번호</th>
			<th>세금계산서이메일</th>
			<th>담당자명</th>
			<th>담당자연락처</th>
		</tr>
		<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.country_name }</td>
			<td>${vo.client_name }</td>
			<td>${vo.clientsort_name }</td>
			<td>${vo.client_registeredno }</td>
			<td>${vo.client_corporatedno }</td>
			<td>${vo.client_representative }</td>
			<td>${vo.client_businesstype }</td>
			<td>${vo.businesstype_code }</td>
			<td>${vo.businesstype_name }</td>
			<td>${vo.businesstype_biotore }</td>
			<td>${vo.businesstype_subctgr }</td>
			<td>${vo.client_addr1 }</td>
			<td>${vo.client_addr2 }</td>
			<td>${vo.client_postal }</td>
			<td>${vo.client_directno }</td>
			<td>${vo.client_fax }</td>
			<td>${vo.client_email }</td>
			<td>${vo.client_manager }</td>
			<td>${vo.client_contact }</td>
			<td><input type="button" value="거래처삭제" onclick="location.href='${pageContext.request.contextPath }/internationalsales/bond/delete?client_no=${vo.client_no }'"></td>
			<td><input type="button" value="세부항목 관리" onclick="location.href='${pageContext.request.contextPath }/internationalsales/bond/typeinsertForm?client_no=${vo.client_no }'"></td>
		</tr>
		</c:forEach>
	</table>
	<input type="button" value="추가등록" onclick="location.href='${pageContext.request.contextPath }/internationalsales/bond/addForm'">
</div>
 --%>





<!-- wnnnnntjrrnwnjnjsadakjsdnaosndoasndokasndokasndksandosan -->





<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<%@include file="/WEB-INF/views/layout/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/httpRequest.js"></script>

<link href="/webdesign/assets/css/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/css/a/a_company.css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
.notosanskr * { 
 font-family: 'Noto Sans KR', sans-serif;
 font-size:10px;
}

.A31 input{
   width:
}

.divform1 {
   width: 100%;
   height: 20%;
}

.divform2 {
   float: left;
   margin-left: 5%; 
   width:35%;
}

.divform3 {
   float: left;
   margin-left: 5%; 
   width:45%;
}

.divform4 {
   float: left;
   margin-left: 5%;
}

.hr {
   height: 100vh;
   width: 0.1vw;
   border-width: 0;
   color: rgba(160, 160, 160, 0.3);
   background-color: rgba(160, 160, 160, 0.3);
   
}

input#search {
background:url(/image/search-glass.png);
background-repeat: no-repeat;
width:20px;
height:20px;
border: 0;
}
</style>
<script type="text/javascript" charset="UTF-8">

function surf(v, code){      // list ajax 함수 > A4Controller, a4.xml(investmentList select문)
   var type = document.getElementsByName("type")[0].value;
   var url = "${pageContext.request.contextPath}/internationalsales/bond/ajax";   // controller mapping
   if(v == ''){
      type = null;
      v = null;
   }
   console.log(v);
   var param = "comcode_code="+code+"&word="+v+"&type="+type;      // 넘길 데이터
   console.log(param);
   sendRequest(url,param,getlist,"POST");
}
function getlist(){
   if(xhr.readyState==4 && xhr.status==200) {   
      var data = xhr.response;
      let procode = document.getElementById("procode");    // list가 들어갈 테이블 id
      let newTr = document.createElement("tr");      // tr 만듦
      let newTd = document.createElement("td");      // td 만듦
      procode.innerHTML = '';                     // 일단 테이블 비워줌
      procode.innerHTML += '<tr><td>국가명</td><td>거래처명</td><td>거래처종류</td><td>대표자명</td><td>사업형태</td><td>업태명</td><td>대표번호</td><td>담당자연락처<td></tr>';
      if(data != ""){
         var data2 = JSON.parse(data);
         data2.forEach(function(map){      // 받아온 list 테이블에 입히기
            newTr = document.createElement("tr");
            newTr.setAttribute("onclick", "selectForm("+map.client_no+", "+map.bs3_no1+", "+map.bs3_no2+")");
            procode.appendChild(newTr);
            newTd = document.createElement("td");
            newTd.innerHTML = map.country_name;
            newTr.appendChild(newTd);
            newTd = document.createElement("td");
            newTd.innerHTML = map.client_name;
            newTr.appendChild(newTd);
            newTd = document.createElement("td");
            newTd.innerHTML = map.clientsort_name;
            newTr.appendChild(newTd);
            newTd = document.createElement("td");
            newTd.innerHTML = map.client_representative;
            newTr.appendChild(newTd);
            newTd = document.createElement("td");
            newTd.innerHTML = map.client_businesstype;
            newTr.appendChild(newTd);
            newTd = document.createElement("td");
            newTd.innerHTML = map.businesstype_name;
            newTr.appendChild(newTd);
            newTd = document.createElement("td");
            newTd.innerHTML = map.client_directno;
            newTr.appendChild(newTd);
            newTd = document.createElement("td");
            newTd.innerHTML = map.client_manager;
            newTd = document.createElement("td");
            newTd.innerHTML = map.client_contact;
            newTr.appendChild(newTd);
         });
      }else {
         procode.innerHTML += '<tr><td colspan="3">목록이 없습니다.</td></tr>';
      }
   }
}


//전체목록조회 > 새창으로
function searchim(){
   let openWin = window.open("${pageContext.request.contextPath}/a/a4/searchim", "_blank", "scrollbars=yes, top=150, left=300, width=300, height=300");
}
function searcht(){
   let openWin = window.open("${pageContext.request.contextPath}/a/a4/searcht", "_blank", "scrollbars=yes, top=150, left=300, width=300, height=300");
}
function acList(code, team){
   let openWin = window.open("${pageContext.request.contextPath}/a/a4/acList?comcode_code="+code+"&team_code="+team, "_blank", "scrollbars=yes, top=150, left=300, width=300, height=300");
}
function clList(code){
   let openWin = window.open("${pageContext.request.contextPath}/a/a4/clList?comcode_code="+code, "_blank", "scrollbars=yes, top=150, left=300, width=300, height=300");
}

//자동완성 > AJAX
function imkind(e, name){
   if(e.keyCode == 13){
      if(name == ""){      // 매개변수값이 비어있는 지 판단
         alert("종류를 입력해주세요.");
         document.getElementById("imkind_name").focus();
         return;   // 비어있으면 imkind_name에 포커싱되고 메소드 종료
      }
      var url = "${pageContext.request.contextPath}/a/a4/imkind";      // url 경로 지정 > controller 매핑
      var param = "imkind_name=" + encodeURIComponent(name);      // controller에 넘길 데이터 인코드해서 세팅
      
      sendRequest(url, param, investmentkind, "POST");   // httpRequest.js에 있는 sendRequest함수 실행 > (경로,넘길데이터,콜벡함수,방식);
   }
}
function investmentkind(){   // 콜벡함수
   if(xhr.readyState==4 && xhr.status==200) {      // 신호가 정상인 지 판단
      var data = xhr.response;   // 넘어온 데이터 세팅
      if(data != ""){         // 넘어온 데이터가 null인지 판단
         var data2 = JSON.parse(data);      // 넘어온 데이터 json으로 변형
         document.getElementById("imkind_name").value = data2.imkind_name;   // 넘어온 데이터 input태그에 세팅
         document.getElementById("imkind_no").value = data2.imkind_no;
      }else {
         document.getElementById("imkind_name").value = '';      // 데이터가 비어있으면 실행
         alert("조회된 종류가 없습니다. 조회 버튼을 클릭하여 목록에서 종류를 선택해주세요.");
      }
   }
}

function team(e, name){
   if(e.keyCode == 13){
      if(name == ""){
         alert("팀명을 입력해주세요.");
         document.getElementById("team_name").focus();
         return;
      }
      var url = "${pageContext.request.contextPath}/a/a4/team";
      var param = "team_name=" + encodeURIComponent(name);
      
      sendRequest(url, param, teamname, "POST");
   }
}
function teamname(){
   if(xhr.readyState==4 && xhr.status==200) {
      var data = xhr.response;
      if(data != ""){
         var data2 = JSON.parse(data);
         document.getElementById("team_name").value = data2.team_name;
         document.getElementById("team_no").value = data2.team_no;
      }else {
         document.getElementById("team_name").value = '';
         alert("중복된 팀 이름입니다. 조회 버튼을 클릭하여 목록에서 팀을 선택해주세요.");
      }
   }
}
</script>

   <div class="notosanskr">
      <div align="center">
         <h1 style="font-size: 20pt;">해와거래처 관리</h1>
      </div>
      <div class="divform2">
         <div>
            <table>
               <tr>
                  <td>
                     <select name="type">
                        <option value="all" ${param.type == 'all' ? 'selected' : '' }>전체</option>
                        <option value="country_name" ${param.type == 'country_name' ? 'selected' : '' }>국가명</option>
                        <option value="clientsort_name" ${param.type == 'clientsort_name' ? 'selected' : '' }>거래처종류</option>
                        <option value="businesstype_name" ${param.type == 'businesstype_name' ? 'selected' : '' }>업태명</option>
                     </select>
                  </td>
                  <td>
                     <input type="text" name="word" placeholder="검색어를 입력하세요" value="${param.word }" autocomplete="off" onkeyup="surf(this.value, '${comcode_code}')">
                     <input type="button" value="전체목록" onclick="surf('', '${comcode_code}')">
                  </td>
               </tr>
            </table>
         </div>
         
         <div style="overflow: scroll;">
            <table id="procode">
            	<c:if test="${list != null }">
               		<tr>
						<th>국가명</th>
						<th>거래처명</th>
						<th>거래처종류</th>
						<th>대표자명</th>
						<th>사업형태</th>
						<th>업태명</th>
						<th>대표번호</th>
						<th>담당자명</th>
						<th>담당자연락처</th>
					</tr>
               <c:forEach var="vo" items="${list }">
			     <tr onclick="selectForm(${vo.client_no})" class="filter" id="filter">
			   		<td>${vo.country_name }</td>
					<td>${vo.client_name }</td>
					<td>${vo.clientsort_name }</td>
					<td>${vo.client_representative }</td>
					<td>${vo.client_businesstype }</td>
					<td>${vo.businesstype_name }</td>
					<td>${vo.client_directno }</td>
					<td>${vo.client_manager }</td>
					<td>${vo.client_contact }</td>
				</tr>
				</c:forEach>
            </c:if>
            <c:if test="${list == null }">
               <tr><td>목록이 비어있습니다</td></tr>
            </c:if>
            </table>
         </div>
         <div>
		<input type="button" value="ADD" onclick="location.href='${pageContext.request.contextPath}/internationalsales/list?comcode_code=${comcode_code }'">
		</div>
<%--          <div align="right">
            <input type="button" onclick="location.href='${pageContext.request.contextPath }/a/a4/a41?comcode_code=${comcode_code }'" value="add">
         </div> --%>
   
   <!-- 리스트 클릭 시 url 데이터 숨기기 위한 form태그 -->   
         <form action="${pageContext.request.contextPath }/internationalsales/bond/updateForm" id="content" method="post">
            <input type="hidden" name="client_no">
            <input type="hidden" name="comcode_code" value="${comcode_code }">
         </form>
      
      </div>
      
      <div class="divform4">
         <hr class="hr">
      </div>
      
      <div id="add" class="divform3">
         <c:choose>
            <c:when test="${map != null }">
               <form action="${pageContext.request.contextPath }/internationsales/bond/update" method="POST" id="update">
                  <input type="hidden" name="comcode_code" value="${comcode_code }">
                  <input type="hidden" name="client_no" value="${map.client_no }">
                  <input type="hidden" name="businesstype_no" id="businesstype_no" value="${map.businesstype_no }">
                  <div class="warning_box">
                     <span class="red bigger">* 는 필수 입력란입니다.</span>
                     <div class="yellow_box"></div>
                     <span class="red"></span>
                  </div>
                     
                  <div>
                     <label>국가명 </label>
                     <select name="country_no">
			  		<option value="1" ${map.country_no == 1 ? 'selected' : '' }>대한민국</option>
			  		<option value="2" ${map.country_no == 2 ? 'selected' : '' }>UAE</option>
			  		<option value="3" ${map.country_no == 3 ? 'selected' : '' }>아르헨티나</option>
			  		<option value="4" ${map.country_no == 4 ? 'selected' : '' }>오스트레일리아</option>
			  		<option value="5" ${map.country_no == 5 ? 'selected' : '' }>방글라데시</option>
			  		<option value="6" ${map.country_no == 6 ? 'selected' : '' }>바레인</option>
			  		<option value="7" ${map.country_no == 7 ? 'selected' : '' }>브루나이</option>
			  		<option value="8" ${map.country_no == 8 ? 'selected' : '' }>브라질</option>
			  		<option value="9" ${map.country_no == 9 ? 'selected' : '' }>캐나다</option>
			  		<option value="10" ${map.country_no == 10 ? 'selected' : '' }>스위스</option>
			  		<option value="11" ${map.country_no == 11 ? 'selected' : '' }>칠레</option>
			  		<option value="12" ${map.country_no == 12 ? 'selected' : '' }>중국</option>
			  		<option value="13" ${map.country_no == 13 ? 'selected' : '' }>콜롬비아</option>
			  		<option value="14" ${map.country_no == 14 ? 'selected' : '' }>체코</option>
			  		<option value="15" ${map.country_no == 15 ? 'selected' : '' }>덴마크</option>
			  		<option value="16" ${map.country_no == 16 ? 'selected' : '' }>이집트</option>
			  		<option value="17" ${map.country_no == 17 ? 'selected' : '' }>유럽</option>
			  		<option value="18" ${map.country_no == 18 ? 'selected' : '' }>프랑스</option>
			  		<option value="19" ${map.country_no == 19 ? 'selected' : '' }>독일</option>
			  		<option value="20" ${map.country_no == 20 ? 'selected' : '' }>스페인</option>
			  		<option value="21" ${map.country_no == 21 ? 'selected' : '' }>이탈리아</option>
			  		<option value="22" ${map.country_no == 22 ? 'selected' : '' }>네덜란드</option>
			  		<option value="23" ${map.country_no == 23 ? 'selected' : '' }>벨기에</option>
			  		<option value="24" ${map.country_no == 24 ? 'selected' : '' }>포르투갈</option>
			  		<option value="25" ${map.country_no == 25 ? 'selected' : '' }>오스트리아</option>
			  		<option value="26" ${map.country_no == 26 ? 'selected' : '' }>그리스</option>
			  		<option value="27" ${map.country_no == 27 ? 'selected' : '' }>핀란드</option>
			  		<option value="28" ${map.country_no == 28 ? 'selected' : '' }>크로아티아</option>
			  		<option value="29" ${map.country_no == 29 ? 'selected' : '' }>슬로베니아</option>
			  		<option value="30" ${map.country_no == 30 ? 'selected' : '' }>아일랜드</option>
			  		<option value="31" ${map.country_no == 31 ? 'selected' : '' }>모나코</option>
			  		<option value="32" ${map.country_no == 32 ? 'selected' : '' }>피지</option>
			  		<option value="33" ${map.country_no == 33 ? 'selected' : '' }>영국</option>
			  		<option value="34" ${map.country_no == 34 ? 'selected' : '' }>홍콩</option>
			  		<option value="35" ${map.country_no == 35 ? 'selected' : '' }>헝가리</option>
			  		<option value="36" ${map.country_no == 36 ? 'selected' : '' }>인도네시아</option>
			  		<option value="37" ${map.country_no == 37 ? 'selected' : '' }>이스라엘</option>
			  		<option value="38" ${map.country_no == 38 ? 'selected' : '' }>인도</option>
			  		<option value="39" ${map.country_no == 39 ? 'selected' : '' }>요르단</option>
			  		<option value="40" ${map.country_no == 40 ? 'selected' : '' }>일본</option>
			  		<option value="41" ${map.country_no == 41 ? 'selected' : '' }>케냐</option>
			  		<option value="42" ${map.country_no == 42 ? 'selected' : '' }>캄보디아</option>
			  		<option value="43" ${map.country_no == 43 ? 'selected' : '' }>쿠웨이트</option>
			  		<option value="44" ${map.country_no == 44 ? 'selected' : '' }>카자흐스탄</option>
			  		<option value="45" ${map.country_no == 45 ? 'selected' : '' }>스리랑카</option>
			  		<option value="46" ${map.country_no == 46 ? 'selected' : '' }>리비아</option>
			  		<option value="47" ${map.country_no == 47 ? 'selected' : '' }>미얀마</option>
			  		<option value="48" ${map.country_no == 48 ? 'selected' : '' }>몽골</option>
			  		<option value="49" ${map.country_no == 49 ? 'selected' : '' }>마카오</option>
			  		<option value="50" ${map.country_no == 50 ? 'selected' : '' }>멕시코</option>
			  		<option value="51" ${map.country_no == 51 ? 'selected' : '' }>말레이시아</option>
			  		<option value="52" ${map.country_no == 52 ? 'selected' : '' }>노르웨이</option>
			  		<option value="53" ${map.country_no == 53 ? 'selected' : '' }>네팔</option>
			  		<option value="54" ${map.country_no == 54 ? 'selected' : '' }>뉴질랜드</option>
			  		<option value="55" ${map.country_no == 55 ? 'selected' : '' }>오만</option>
			  		<option value="56" ${map.country_no == 56 ? 'selected' : '' }>필리핀</option>
			  		<option value="57" ${map.country_no == 57 ? 'selected' : '' }>파키스탄</option>
			  		<option value="58" ${map.country_no == 58 ? 'selected' : '' }>폴란드</option>
			  		<option value="59" ${map.country_no == 59 ? 'selected' : '' }>카타르</option>
			  		<option value="60" ${map.country_no == 60 ? 'selected' : '' }>루마니아</option>
			  		<option value="61" ${map.country_no == 61 ? 'selected' : '' }>러시아</option>
			  		<option value="62" ${map.country_no == 62 ? 'selected' : '' }>사우디아라비아</option>
			  		<option value="63" ${map.country_no == 63 ? 'selected' : '' }>스웨덴</option>
			  		<option value="64" ${map.country_no == 64 ? 'selected' : '' }>싱가폴</option>
			  		<option value="65" ${map.country_no == 65 ? 'selected' : '' }>태국</option>
			  		<option value="66" ${map.country_no == 66 ? 'selected' : '' }>터키</option>
			  		<option value="67" ${map.country_no == 67 ? 'selected' : '' }>대만</option>
			  		<option value="68" ${map.country_no == 68 ? 'selected' : '' }>미국</option>
			  		<option value="69" ${map.country_no == 69 ? 'selected' : '' }>우즈베키스탄</option>
			  		<option value="70" ${map.country_no == 70 ? 'selected' : '' }>베트남</option>
			  		<option value="71" ${map.country_no == 71 ? 'selected' : '' }>남아프리카공화국</option>
			  		<option value="72" ${map.country_no == 72 ? 'selected' : '' }>에티오피아</option>
				</select>
                  </div>
                  
                  <div>
                     <label>* 거래처명 </label>
                     <input type="text" name="client_name" id="client_name" value="${map.client_name }" maxlength="30">
                  </div>
                  
                  <div>
                     <label>거래처종류 </label>
                     <c:if test="${map.clientsort_no == 2 }">
                     <select name="clientsort_no">
					<option value="2" selected>매출</option>
					<option value="1">매입</option>
				</select>
				</c:if>
                     <c:if test="${map.clientsort_no == 1 }">
                     <select name="clientsort_no">
					<option value="2">매출</option>
					<option value="1" selected>매입</option>
				</select>
				</c:if>
                  </div>
                  
                  <div>
                     <label>* 사업자등록번호 (-를 제외하고 적어주세요.)</label>
                    <input type="number" name="client_registeredno" id="client_registeredno" value="${map.client_registeredno }" maxlength="30">
                  </div>   
                     
                  <div>
                     <label>* 법인등록번호 (-를 제외하고 적어주세요.)</label>
                    <input type="number" name="client_corporatedno" id="client_corporatedno" value="${map.client_corporatedno }" maxlength="30">
                  </div> 
                    
                  <div>
                     <label>대표자명 </label>
                     <input type="text" name="client_representative" id="client_representative" value="${map.client_representative }" maxlength="30">
                  </div>   
                  <div>
                     <label>사업형태 </label>
                     <input type="text" name="client_businesstype" id="client_businesstype" value="${map.client_businesstype }" maxlength="30">
                  </div>   
                  <div>
                     <label>사업장 </label>
	                    <input type="text" name="client_postal" id="client_postal" value="${map.client_postal }" placeholder="우편번호">
	                    <input type="button" onclick="searchAddr()" value="우편번호 찾기"><br>
	                    <input type="text" name="client_addr1" id="client_addr1" value="${map.client_addr1 }" placeholder="주소"><br>
	                    <input type="text" name="client_addr2" id="client_addr2" value="${map.client_addr2 }" placeholder="상세주소">
	                    <input type="text" id="extraAddr" placeholder="참고항목">
                  </div>   
                  <div>
                     <label>대표번호 (-를 제외하고 적어주세요.)</label>
                    <input type="number" name="client_directno" id="client_directno" value="${map.client_directno }" maxlength="30">
                  </div>   
                  <div>
                     <label>팩스번호 (-를 제외하고 적어주세요.)</label>
                     <input type="number" name="client_fax" id="client_fax" value="${map.client_fax }" maxlength="30">
                  </div>   
                  <div>
                     <label>세금계산서이메일 </label>
                     <input type="text" name="client_email" id="client_email" value="${map.client_email }" maxlength="30">
                  </div>   
                  <div>
                     <label>담당자명 </label>
                     <input type="text" name="client_manager" id="client_manager" value="${map.client_manager }" maxlength="30">
                  </div>   
                  <div>
                     <label>담당자연락처 (-를 제외하고 적어주세요.)</label>
                     <input type="number" name="client_contact" id="client_contact" value="${map.client_contact }" maxlength="30">
                  </div>   
                                    
                  <div align="right">
                     <input type="button" value="update" onclick="submitt(this.form)">
                     <input type="button" value="delete" onclick="deletei('${map.client_no }', '${comcode_code }')">
                  </div>
               </form>
            </c:when>
            
            
            <c:otherwise>
               <form action="${pageContext.request.contextPath }/internationalsales/bond/insert" method="POST" id="create">
                  <input type="hidden" name="comcode_code" value="${comcode_code }">
                     <h3>거래처 등록 사항</h3>
                  <div>
                     <label>국가명 </label>
                     <select name="country_no">
			  		<option value="1" ${map.country_no == 1 ? 'selected' : '' }>대한민국</option>
			  		<option value="2" ${map.country_no == 2 ? 'selected' : '' }>UAE</option>
			  		<option value="3" ${map.country_no == 3 ? 'selected' : '' }>아르헨티나</option>
			  		<option value="4" ${map.country_no == 4 ? 'selected' : '' }>오스트레일리아</option>
			  		<option value="5" ${map.country_no == 5 ? 'selected' : '' }>방글라데시</option>
			  		<option value="6" ${map.country_no == 6 ? 'selected' : '' }>바레인</option>
			  		<option value="7" ${map.country_no == 7 ? 'selected' : '' }>브루나이</option>
			  		<option value="8" ${map.country_no == 8 ? 'selected' : '' }>브라질</option>
			  		<option value="9" ${map.country_no == 9 ? 'selected' : '' }>캐나다</option>
			  		<option value="10" ${map.country_no == 10 ? 'selected' : '' }>스위스</option>
			  		<option value="11" ${map.country_no == 11 ? 'selected' : '' }>칠레</option>
			  		<option value="12" ${map.country_no == 12 ? 'selected' : '' }>중국</option>
			  		<option value="13" ${map.country_no == 13 ? 'selected' : '' }>콜롬비아</option>
			  		<option value="14" ${map.country_no == 14 ? 'selected' : '' }>체코</option>
			  		<option value="15" ${map.country_no == 15 ? 'selected' : '' }>덴마크</option>
			  		<option value="16" ${map.country_no == 16 ? 'selected' : '' }>이집트</option>
			  		<option value="17" ${map.country_no == 17 ? 'selected' : '' }>유럽</option>
			  		<option value="18" ${map.country_no == 18 ? 'selected' : '' }>프랑스</option>
			  		<option value="19" ${map.country_no == 19 ? 'selected' : '' }>독일</option>
			  		<option value="20" ${map.country_no == 20 ? 'selected' : '' }>스페인</option>
			  		<option value="21" ${map.country_no == 21 ? 'selected' : '' }>이탈리아</option>
			  		<option value="22" ${map.country_no == 22 ? 'selected' : '' }>네덜란드</option>
			  		<option value="23" ${map.country_no == 23 ? 'selected' : '' }>벨기에</option>
			  		<option value="24" ${map.country_no == 24 ? 'selected' : '' }>포르투갈</option>
			  		<option value="25" ${map.country_no == 25 ? 'selected' : '' }>오스트리아</option>
			  		<option value="26" ${map.country_no == 26 ? 'selected' : '' }>그리스</option>
			  		<option value="27" ${map.country_no == 27 ? 'selected' : '' }>핀란드</option>
			  		<option value="28" ${map.country_no == 28 ? 'selected' : '' }>크로아티아</option>
			  		<option value="29" ${map.country_no == 29 ? 'selected' : '' }>슬로베니아</option>
			  		<option value="30" ${map.country_no == 30 ? 'selected' : '' }>아일랜드</option>
			  		<option value="31" ${map.country_no == 31 ? 'selected' : '' }>모나코</option>
			  		<option value="32" ${map.country_no == 32 ? 'selected' : '' }>피지</option>
			  		<option value="33" ${map.country_no == 33 ? 'selected' : '' }>영국</option>
			  		<option value="34" ${map.country_no == 34 ? 'selected' : '' }>홍콩</option>
			  		<option value="35" ${map.country_no == 35 ? 'selected' : '' }>헝가리</option>
			  		<option value="36" ${map.country_no == 36 ? 'selected' : '' }>인도네시아</option>
			  		<option value="37" ${map.country_no == 37 ? 'selected' : '' }>이스라엘</option>
			  		<option value="38" ${map.country_no == 38 ? 'selected' : '' }>인도</option>
			  		<option value="39" ${map.country_no == 39 ? 'selected' : '' }>요르단</option>
			  		<option value="40" ${map.country_no == 40 ? 'selected' : '' }>일본</option>
			  		<option value="41" ${map.country_no == 41 ? 'selected' : '' }>케냐</option>
			  		<option value="42" ${map.country_no == 42 ? 'selected' : '' }>캄보디아</option>
			  		<option value="43" ${map.country_no == 43 ? 'selected' : '' }>쿠웨이트</option>
			  		<option value="44" ${map.country_no == 44 ? 'selected' : '' }>카자흐스탄</option>
			  		<option value="45" ${map.country_no == 45 ? 'selected' : '' }>스리랑카</option>
			  		<option value="46" ${map.country_no == 46 ? 'selected' : '' }>리비아</option>
			  		<option value="47" ${map.country_no == 47 ? 'selected' : '' }>미얀마</option>
			  		<option value="48" ${map.country_no == 48 ? 'selected' : '' }>몽골</option>
			  		<option value="49" ${map.country_no == 49 ? 'selected' : '' }>마카오</option>
			  		<option value="50" ${map.country_no == 50 ? 'selected' : '' }>멕시코</option>
			  		<option value="51" ${map.country_no == 51 ? 'selected' : '' }>말레이시아</option>
			  		<option value="52" ${map.country_no == 52 ? 'selected' : '' }>노르웨이</option>
			  		<option value="53" ${map.country_no == 53 ? 'selected' : '' }>네팔</option>
			  		<option value="54" ${map.country_no == 54 ? 'selected' : '' }>뉴질랜드</option>
			  		<option value="55" ${map.country_no == 55 ? 'selected' : '' }>오만</option>
			  		<option value="56" ${map.country_no == 56 ? 'selected' : '' }>필리핀</option>
			  		<option value="57" ${map.country_no == 57 ? 'selected' : '' }>파키스탄</option>
			  		<option value="58" ${map.country_no == 58 ? 'selected' : '' }>폴란드</option>
			  		<option value="59" ${map.country_no == 59 ? 'selected' : '' }>카타르</option>
			  		<option value="60" ${map.country_no == 60 ? 'selected' : '' }>루마니아</option>
			  		<option value="61" ${map.country_no == 61 ? 'selected' : '' }>러시아</option>
			  		<option value="62" ${map.country_no == 62 ? 'selected' : '' }>사우디아라비아</option>
			  		<option value="63" ${map.country_no == 63 ? 'selected' : '' }>스웨덴</option>
			  		<option value="64" ${map.country_no == 64 ? 'selected' : '' }>싱가폴</option>
			  		<option value="65" ${map.country_no == 65 ? 'selected' : '' }>태국</option>
			  		<option value="66" ${map.country_no == 66 ? 'selected' : '' }>터키</option>
			  		<option value="67" ${map.country_no == 67 ? 'selected' : '' }>대만</option>
			  		<option value="68" ${map.country_no == 68 ? 'selected' : '' }>미국</option>
			  		<option value="69" ${map.country_no == 69 ? 'selected' : '' }>우즈베키스탄</option>
			  		<option value="70" ${map.country_no == 70 ? 'selected' : '' }>베트남</option>
			  		<option value="71" ${map.country_no == 71 ? 'selected' : '' }>남아프리카공화국</option>
			  		<option value="72" ${map.country_no == 72 ? 'selected' : '' }>에티오피아</option>
				</select>
                  </div>
                  
                  <div>
                     <label>* 거래처명 </label>
                     <input type="text" name="client_name" id="client_name" maxlength="30">
                  </div>
                  
                  <div>
                     <label>거래처종류 </label>
                     <select name="clientsort_no">
					<option value="2">매출</option>
					<option value="1">매입</option>
				</select>
                  </div>
                  
                  <div>
                     <label>* 사업자등록번호 (-를 제외하고 적어주세요.)</label>
                    <input type="number" name="client_registeredno" id="client_registeredno" maxlength="30">
                  </div>   
                     
                  <div>
                     <label>* 법인등록번호 (-를 제외하고 적어주세요.)</label>
                    <input type="number" name="client_corporatedno" id="client_corporatedno" maxlength="30">
                  </div> 
                    
                  <div>
                     <label>대표자명 </label>
                     <input type="text" name="client_representative" id="client_representative" maxlength="30">
                  </div>   
                  <div>
                     <label>사업형태 </label>
                     <input type="text" name="client_businesstype" id="client_businesstype" value="법인" maxlength="30">
                  </div>   
                  <div>
                     <label>사업장 </label>
	                    <input type="text" name="client_postal" id="client_postal" placeholder="우편번호">
	                    <input type="button" onclick="searchAddr()" value="우편번호 찾기"><br>
	                    <input type="text" name="client_addr1" id="client_addr1" placeholder="주소"><br>
	                    <input type="text" name="client_addr2" id="client_addr2" placeholder="상세주소">
	                    <input type="text" id="extraAddr" placeholder="참고항목">
	              </div>   
                  <div>
                     <label>대표번호 (-를 제외하고 적어주세요.)</label>
                    <input type="number" name="client_directno" id="client_directno" maxlength="30">
                  </div>   
                  <div>
                     <label>팩스번호 (-를 제외하고 적어주세요.)</label>
                     <input type="number" name="client_fax" id="client_fax" maxlength="30">
                  </div>   
                  <div>
                     <label>세금계산서이메일 </label>
                     <input type="text" name="client_email" id="client_email" maxlength="30">
                  </div>   
                  <div>
                     <label>담당자명 </label>
                     <input type="text" name="client_manager" id="client_manager" maxlength="30">
                  </div>   
                  <div>
                     <label>담당자연락처 (-를 제외하고 적어주세요.)</label>
                     <input type="number" name="client_contact" id="client_contact" maxlength="30">
                  </div>   
                  
                  
                  
                 
                  
                  <div>
                     <input type="button" id="register" value="save" onclick="submitt(this.form)">
                     <input type="reset" value="reset">
                  </div>
               </form>
            </c:otherwise>
         </c:choose>
         
      </div>
   
</div>
<script type="text/javascript">

//주소 API
function searchAddr() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddr").value = extraAddr;
            
            } else {
                document.getElementById("client_addr2").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('client_postal').value = data.zonecode;
            document.getElementById("client_addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("client_addr2").focus();
        }
    }).open();
        customInput.style.display = "none";
}

// 삭제버튼 경로 및 넘길 parameter 설정
function deletei(no, code){
   location.href='${pageContext.request.contextPath }/internationsales/delete?client_no='+no+'&comcode_code='+code;
}


// 코드 UNIQUE 검사 AJAX
function imcode(v){
   var url = "${pageContext.request.contextPath }/b/b6/imcode";   // controller mapping 지정
   var param = "salary_code="+encodeURIComponent(v);         // parameter로 넘길 데이터 인코드해서 설정
   
   sendRequest(url,param,imcodecheck,"POST");      // httpRequest.js파일에 있는 sendRequest메소드 실행 > (경로, 데이터, 콜벡함수, 방식)
}
function imcodecheck(){      // imcode의 sendRequest에서 지정한 콜벡함수
   if(xhr.readyState==4 && xhr.status==200) {      // 신호가 정상인지 판단
      var data = xhr.responseText;            // controller에서 넘어온 데이터
      if(data != ""){      // 데이터가 정상적으로 넘어왔는 지 판단
         if(data == "사용 가능한 코드입니다."){      // 데이터값 판단
            document.getElementById("imcodecheck").innerText = data;   // imcodecheck라는 id의 text에 넘어온 data 저장
            document.getElementById("imcodecheck").style.color = "blue";
            document.getElementById("register").disabled = false;      // register 라는 id의 태그 활성화 > 버튼 활성화
         }else {
            document.getElementById("imcodecheck").innerText = data;
            document.getElementById("register").disabled = true;      // 버튼 비활성화
            document.getElementById("investment_code").focus();         // investment_code에 커서 지정
         }
      }
   }
}


//   bs3_no 세팅
   function check1(){
      let t = document.getElementById("debtor_no");   // debtor_no 불러옴
      let arr = document.querySelectorAll("#debtor_no > option");   // debtor_no의 옵션 태그들 nodelist로 불러옴
      let bs3_no1 = document.getElementById("bs3_no1");   // bs3_no1 불러옴
      arr.forEach(function(e, i, array) {
         if(t.value == e.value){      // 위에서 선언한 debtor_no를 불러온 값과 option태그들의 value값을 for문으로 전부 검사
            bs3_no1.value = e.id;   // value가 같으면 해당 옵션태그의 id를 bs3_no1에 저장
         }               // check 메소드 전부 동일
      });
   }
   function check2(){
      let t = document.getElementById("creditor_no");
      let arr = document.querySelectorAll("#creditor_no > option");
      let bs3_no2 = document.getElementById("bs3_no2");
      arr.forEach(function(e, i, array) {
         if(t.value == e.value){
            bs3_no2.value = e.id;
         }
      });
   }
   
   function check12(){
      let t = document.getElementById("debtor_no");
      let arr = document.querySelectorAll("#debtor_no > option");
      let bs3_no1 = document.getElementById("bs3_no12");
      arr.forEach(function(e, i, array) {
         if(t.value == e.value){
            bs3_no1.value = e.id;
         }
      });
   }
   function check22(){
      let t = document.getElementById("creditor_no");
      let arr = document.querySelectorAll("#creditor_no > option");
      let bs3_no2 = document.getElementById("bs3_no22");
      arr.forEach(function(e, i, array) {
         if(t.value == e.value){
            bs3_no2.value = e.id;
         }
      });
   }

   function submitt(f) {
	   
	   var client_name = document.getElementById("client_name").value;
	   var client_registeredno = document.getElementById("client_registeredno").value;
	   var client_corporatedno = document.getElementById("client_corporatedno").value;
	   var client_representative = document.getElementById("client_representative").value;
	   var client_businesstype = document.getElementById("client_businesstype").value;
	   var client_addr1 = document.getElementById("client_addr1").value;
	   var client_addr2 = document.getElementById("client_addr2").value;
	   var client_postal = document.getElementById("client_postal").value;
	   var client_directno = document.getElementById("client_directno").value;
	   var client_fax = document.getElementById("client_fax").value;
	   var client_email = document.getElementById("client_email").value;
	   var client_manager = document.getElementById("client_manager").value;
	   var client_contact = document.getElementById("client_contact").value;
	   
	   console.log(client_name);
	   console.log(client_registeredno);
	   
	   if(client_name == ""){
		   alert('거래쳐명을 입력해 주세요');
		   document.getElementById('client_name').focus();
		   return false;
	   }else if (client_registeredno == "") {
	     alert("사업자등록번호를 입력해 주세요");
	     document.getElementById("client_registeredno").focus();
	     return false; // 폼 제출 방지
	   }else if(client_corporatedno == ""){
		  alert("법인등록번호를 입력해 주세요");
		  document.getElementById("client_corporatedno").focus();
		  return false;
	   }else if(client_representative == ""){
		   alert("대표자명을 입력해 주세요");
		   document.getElementById("client_representative").focus();
		   return false;
	   }else if(client_businesstype == ""){
		   alert("사업형태를 입력해 주세요");
		   document.getElementById("client_businesstype").focus();
		   return false;
	   }else if(client_addr1 == "" || client_addr2 == "" || client_postal == ""){
		   alert("사업장 및 주소를 입력해 주세요");
		   document.getElementById("client_addr1").focus();
		   return false;
	   }else if(client_directno == ""){
		   alert("대표번호를 입력해 주세요");
		   document.getElementById("client_directno").focus();
		   return false;
	   }else if(client_fax == ""){
		   alert("팩스번호를 입력해 주세요");
		   document.getElementById("client_fax").focus();
		   return false;
	   }else if(client_email == ""){
		   alert("이메일을 입력해 주세요");
		   document.getElementById("client_email").focus();
		   return false;
	   }else if(client_manager == ""){
		   alert("담당자명을 입력해 주세요");
		   document.getElementById("client_manager").focus();
		   return false;
	   }else if(client_contact == ""){
		   alert("담당자번호를 입력해 주세요");
		   document.getElementById("client_contact").focus();
		   return false;
	   }else {
		      var ch = confirm("등록하시겠습니까?");
		      if(ch){
		         f.submit();
		      }else {
		         return;
		      }
		   }

	   return true; // 폼 제출 허용
	 }



   

// 거래처 자동완성 AJAX
function searchcl(e, code){
   if(e.keyCode == 13){
      var clname = document.getElementById("client_name").value;
      if(clname == ""){
         alert("조회할 거래처명을 입력해주세요.");
         document.getElementById("client_name").focus();
         return;
      }
      var url = "${pageContext.request.contextPath}/a/a4/searchcl";
      var param = "comcode_code="+encodeURIComponent(code)+"&client_name="+encodeURIComponent(clname);
      
      sendRequest(url, param, clName, "POST");
   }
}
function clName(){
   if(xhr.readyState==4 && xhr.status==200) {
      var data = xhr.response;
      if(data != ""){
         var data2 = JSON.parse(data);   // ajax로 받아온 데이터를 json으로 변형
         document.getElementById("client_no").value = data2.client_no;
         document.getElementById("client_name").value = data2.client_name;
         document.getElementById("client_registeredno").value = data2.client_registeredno;
         document.getElementById("client_manager").value = data2.client_manager;
      }else {
         document.getElementById("client_name").value = '';
         document.getElementById("client_registeredno").value = '';
         document.getElementById("client_manager").value = '';
         alert("조회된 거래처가 없거나 중복된 이름입니다. 조회 버튼을 클릭하여 거래처를 선택해주세요.");
      }
   }
}


// 리스트에서 글 선택 시 넘어가는 form
function selectForm(no){
   document.getElementsByName("client_no")[0].value = no;
   document.getElementById("content").submit(); // content라는 id의 form태그 submit
}


</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>