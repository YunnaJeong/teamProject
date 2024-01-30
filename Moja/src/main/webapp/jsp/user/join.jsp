<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>

		
$(function(){
	
	

	var idCheck = false //중복검사 진행여부
	var check = false //아이디 중복여부
	
	$("#idcheck").click(function(){

		var id = "userID="+$("#id").val();
		
		idCheck = true
	    if (!$("#id").val()) {
	        alert("아이디를 입력해주세요!");
	    } else {
	        var url = 'idCheck.do?id=' + $("#id").val();
	        open(url, 'confirm', 'menubar=no, statusbar=no, scrollbar=no, width=400, height=400');
	    }
		$.ajax({
			type:"POST",
			url:"idValidate.jsp",
			data :id,
			success : function(result){
				if($.trim(result)=='YES'){
					check=true;
					
				}else{
					check=false;
				}
				
			}
		})
		
	})

	
	
	$("#btnSub").click(function(event){
		console.log(check)
		var id = $("#id").val()
		var pw =$("#pwd").val()
		var pwCheck = $("#pwd2").val()
		var name = $("#name").val();
		var addr1 = $("#sample4_postcode").val();
		var addr2 = $("#sample4_roadAddress").val();
		var addr3 = $("#sample4_detailAddress").val();
		var phone1 = $("#HPhone1").val();
		var phone2 = $("#HPhone2").val();
		
		if(!id){
			event.preventDefault()
			alert("아이디를 입력해주세요")
			$("#id").focus()
			
		}
		else if(check == false){
			event.preventDefault();
			alert("아이디가 중복됩니다!")
			
		}
		else if(idCheck==false){
			event.preventDefault()
			alert("아이디 중복체크를 진행해주세요")
		}
		else if(!pw){
			event.preventDefault()
			alert("비밀번호를 입력해주세요")
			$("#pwd").focus()
		}
		else if(!pwCheck){
			event.preventDefault()
			alert("비밀번호 확인을 입력해주세요")
			$("#pwd2").focus()
		}
		else if(!name){
			event.preventDefault()
			alert("이름을 입력해주세요")
			$("#name").focus()
		}
		else if(!addr1){
			event.preventDefault()
			alert("주소를 입력해주세요")
			$("#sample4_postcode").focus()
		}
		else if(!addr2){
			event.preventDefault()
			alert("주소를 입력해주세요")
			$("#sample4_roadAddress").focus()
		}
		else if(!addr3){
			event.preventDefault()
			alert("주소를 입력해주세요")
			$("#sample4_jibunAddress").focus()
		}
		else if(!phone1){
			event.preventDefault()
			alert("전화번호를 입력해주세요")
			$("#HPhone1").focus()
		}
		else if(!phone2){
			event.preventDefault()
			alert("전화번호를 입력해주세요")
			$("#HPhone2").focus()
		}
		else if(pw !== pwCheck){
			event.preventDefault()
			alert("비밀번호가 일치하지 않습니다")
			$("#pwd").focus()
		}
		
	})
	
	$.each(${list},function(){
		var option = $("<option></option>").html(this);
		$(option).attr("select",this);
		$("#interest").append(option);
	})
	


	 $("#id").bind('focusin keyup', function(){
         var check = /^[a-zA-Z0-9]*$/;
         if(!check.test(this.value)){
             this.value="";
             alert('영어와 숫자만 입력하세요');
         }
     });
	$("#name").bind('focusin keyup', function(){
	    var check = /^[ㄱ-ㅎ|가-힣]+$/;
	    if(this.value !== "" && !check.test(this.value)){
	        this.value="";
	        alert("한글만 입력하세요");
	    }
	});
	 
	$("#HPhone1").bind('focusin keyup', function(){
        var check_p = /^[0-9]*$/;
        if(!check_p.test(this.value)){
            this.value="";
            alert('숫자만 입력하세요');
        }
    });
	
	$("#HPhone2").bind('focusin keyup', function(){
        var check_p = /^[0-9]*$/;
        if(!check_p.test(this.value)){
            this.value="";
            alert('숫자만 입력하세요');
        }
    });
	
		 
})




</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모두의자격증</title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&family=Poppins:wght@400;600&display=swap"
	rel="stylesheet">
<!--구글폰트-->
<script src="https://kit.fontawesome.com/e72539902e.js"
	crossorigin="anonymous"></script>
<!--아이콘 사용-->
<style>
@font-face {
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix')
		format('embedded-opentype'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff')
		format('woff'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf')
		format('truetype');
}

.login-form {
	width: 500px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 50px;
	padding: 20px;
	text-align: center;
	border: none;
}

.i_d {
	float: left;
	font-weight: bold;
}

.id {
	float: center;
	text-align: left;
	font-size: 14px;
	padding: 10px;
	border: none;
	border-bottom: 1px solid gray;
	width: 200px;
	margin-bottom: 10px;
}

.idcheck {
	width: 65px;
	height: 32px;
	background-color: white;
	border-radius: 25px;
	border-color: gray;
	cursor: pointer;
}

.passwd {
	float: left;
	font-weight: bold;
}

.passwdche {
	float: left;
	font-weight: bold;
}

.pwd {
	text-align: left;
	float: center;
	font-size: 14px;
	padding: 10px;
	border: none;
	border-bottom: 1px solid gray;
	width: 260px;
	margin-bottom: 10px;
	margin-left: -50px;
}

.pwdCheck {
	font-size: 14px;
	float: center;
	padding: 10px;
	border: none;
	border-bottom: 1px solid gray;
	width: 260px;
	margin-bottom: 10px;
	margin-left: -80px;
}

.Na {
	float: left;
	font-weight: bold;
}

.name {
	float: center;
	font-size: 14px;
	padding: 10px;
	border: none;
	border-bottom: 1px solid gray;
	width: 260px;
	margin-bottom: 10px;
	margin-left: -30px;
}

.adr {
	float: left;
	font-weight: bold;
}

.addresscheck {
	background-color: white;
	border-radius: 25px;
	border-color: gray;
	cursor: pointer;
}

#sample4_postcode {
	font-size: 14px;
	padding: 10px;
	border: none;
	border-bottom: 1px solid gray;
	width: 220px;
	margin-bottom: 10px;
}

#sample4_roadAddress {
	font-size: 14px;
	padding: 10px;
	border: none;
	border-bottom: 1px solid gray;
	width: 260px;
	margin-bottom: 10px;
}

#sample4_jibunAddress {
	font-size: 14px;
	padding: 10px;
	border: none;
	border-bottom: 1px solid gray;
	width: 260px;
	margin-bottom: 10px;
}

#sample4_detailAddress {
	font-size: 14px;
	padding: 10px;
	border: none;
	border-bottom: 1px solid gray;
	width: 260px;
	margin-bottom: 10px;
}

.join {
	font-size: 14px;
	border: 3px solid gray;
	padding: 10px;
	width: 260px;
	background-color: white;
	margin-bottom: 30px;
	color: black;
	cursor: pointer;
}

.Administrator_Login {
	background-color: white;
	font-size: 15px;
	border: none;
}

.title {
	color: gray;
}

.dat {
	float: left;
	font-weight: bold;
}

.date {
	float: left;
	font-weight: bold;
	font-size: 14px;
	color: gray;
}

.gen {
	float: left;
	font-weight: bold;
}

.col-tit {
	float: left;
	font-weight: bold;
	padding-top: 20px;
}

.col-content {
	font-size: 14px;
	padding: 10px;
	border: none;
	width: 400px;
	margin-bottom: 10px;
}

#HPhone1 {
	text-align: left;
	font-size: 14px;
	padding: 10px;
	border: none;
	border-bottom: 1px solid gray;
	width: 50px;
	margin-bottom: 10px;
}

#HPhone2 {
	text-align: left;
	font-size: 14px;
	padding: 10px;
	border: none;
	border-bottom: 1px solid gray;
	width: 50px;
	margin-bottom: 10px;
}

.inpTxt {
	text-align: left;
	font-size: 14px;
	padding: 10px;
	border: none;
	border-bottom: 1px solid gray;
	width: 80px;
	margin-bottom: 10px;
}

.select_email {
	text-align: center;
	width: 85px;
	height: 32px;
	line-height: 32px;
}

.MS_select {
	text-align: center;
	width: 60px;
	height: 32px;
	line-height: 32px;
}

.col_select {
	text-align: center;
	width: 50px;
	height: 32px;
	line-height: 32px;
}
</style>
</head>

<body>

	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress;
                var extraRoadAddr = '';

                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }

                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                document.getElementById("sample4_engAddress").value = data.addressEnglish;

                if (roadAddr !== '') {
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");

                if (data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }                
            }
        }).open();
    }
    function openZipSearch() {
  new  daum.Postcode( {
    oncomplete: function(data) {
      $('[name=zip]').val(data.zonecod);
      $('[name=addr1]').val(data.address);
      $('[name=addr2]').val(data.buildingName);
    }
  }).open();
}

  
  </script>

	<div class="login-form">
		<h2 align="center">Join</h2>
		<form action="joinOK.do" method="post">
			<a class="i_d">아이디</a> <input type="text" class="id" name="id"
				id="id"> <input type="button" class="idcheck"
				name="username" id="idcheck" value="중복확인" >&nbsp;<br>
			<input type="hidden" value="idUncheck" id="idDuplicate"
				name="idDuplicate"> <a class="passwd">비밀번호</a> <input
				type="password" class="pwd" id="pwd" name="pwd"><br> <a
				class="passwdche">비밀번호확인</a> <input type="password" class="pwdCheck"
				id="pwd2" name="pwdCheck"><br> <a class="Na">이름</a> <input
				type="text" class="name" name="name" id="name"
				placeholder="한글만 입력 가능합니다"><br> <a class="adr">주소</a> <input
				type="text" id="sample4_postcode" name="address1" placeholder="우편번호">
			<input type="button" class="addresscheck"
				onclick="sample4_execDaumPostcode()" value="찾기"><br> <input
				type="text" id="sample4_roadAddress" name="address2"
				placeholder="도로명주소" size="60"><br> <input
				type="hidden" id="sample4_jibunAddress" name="address3"
				placeholder="지번주소" size="60"> <span id="guide"
				style="color: #999; display: none"></span> <input type="text"
				id="sample4_detailAddress" name="address4" placeholder="상세주소"
				size="60"><br> <input type="hidden"
				id="sample4_extraAddress" placeholder="참고항목" size="60"> <input
				type="hidden" id="sample4_engAddress" placeholder="영문주소" size="60"><br>
			<br>
			<div class="birth">
				<a class="dat">생년월일</a> <input type="hidden" class="date"
					name="date"> <select name="year"
					class="MS_select MS_birthday">
					<option value="">생년</option>
					<option value="1950">1950</option>
					<option value="1951">1951</option>
					<option value="1952">1952</option>
					<option value="1953">1953</option>
					<option value="1954">1954</option>
					<option value="1955">1955</option>
					<option value="1956">1956</option>
					<option value="1957">1957</option>
					<option value="1958">1958</option>
					<option value="1959">1959</option>
					<option value="1960">1960</option>
					<option value="1961">1961</option>
					<option value="1962">1962</option>
					<option value="1963">1963</option>
					<option value="1964">1964</option>
					<option value="1965">1965</option>
					<option value="1966">1966</option>
					<option value="1967">1967</option>
					<option value="1968">1968</option>
					<option value="1969">1969</option>
					<option value="1970">1970</option>
					<option value="1971">1971</option>
					<option value="1972">1972</option>
					<option value="1973">1973</option>
					<option value="1974">1974</option>
					<option value="1975">1975</option>
					<option value="1976">1976</option>
					<option value="1977">1977</option>
					<option value="1978">1978</option>
					<option value="1979">1979</option>
					<option value="1980">1980</option>
					<option value="1981">1981</option>
					<option value="1982">1982</option>
					<option value="1983">1983</option>
					<option value="1984">1984</option>
					<option value="1985">1985</option>
					<option value="1986">1986</option>
					<option value="1987">1987</option>
					<option value="1988">1988</option>
					<option value="1989">1989</option>
					<option value="1990">1990</option>
					<option value="1991">1991</option>
					<option value="1992">1992</option>
					<option value="1993">1993</option>
					<option value="1994">1994</option>
					<option value="1995">1995</option>
					<option value="1996">1996</option>
					<option value="1997">1997</option>
					<option value="1998">1998</option>
					<option value="1999">1999</option>
					<option value="2000">2000</option>
					<option value="2001">2001</option>
					<option value="2002">2002</option>
					<option value="2003">2003</option>
					<option value="2004">2004</option>
					<option value="2005">2005</option>
					<option value="2006">2006</option>
					<option value="2007">2007</option>
					<option value="2008">2008</option>
					<option value="2009">2009</option>
					<option value="2010">2010</option>
					<option value="2011">2011</option>
					<option value="2012">2012</option>
					<option value="2013">2013</option>
					<option value="2014">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
					<option value="2019">2019</option>
					<option value="2020">2020</option>
					<option value="2021">2021</option>
					<option value="2021">2022</option>
					<option value="2021">2023</option>
				</select> 년 <select name="month" class="MS_select MS_birthday">
					<option value="">월</option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select> 월 <select name="day" class="MS_select MS_birthday">
					<option value="">일</option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select> 일
			</div>
			<br> <span class="interest">관심목록</span> <select name="interest"
				id="interest">

			</select> <br>
			<div class="col-tit">&nbsp;&nbsp;&nbsp;&nbsp;휴대폰</div>
			<div class="col-content">
				<select class="col_select" name="phone1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
				</select> - <input type="text" id="HPhone1" class="inpTxt" name="phone2"
					maxlength="4"> - <input type="text" id="HPhone2"
					class="inpTxt" name="phone3" maxlength="4">
			</div>


			<input type="submit" class="join" value="가입하기" id="btnSub">

		</form>
	</div>


</body>

</html>