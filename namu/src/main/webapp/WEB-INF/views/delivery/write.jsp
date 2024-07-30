<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.fleamarket-cover {
    background-color: #E3F1C5;
    background-image: url('${pageContext.request.contextPath}/resources/images/bicycle.jpg');
    background-size: cover; /* 이미지를 커버 전체에 맞춤 */
    background-position: center; /* 이미지를 중앙에 위치시킴 */
    position: relative;
}

.htext {
    padding-top: 100px;
    padding-left: 100px;
    color: black; /* 배경 이미지와 대비되도록 텍스트를 흰색으로 설정 */
    position: relative;
    z-index: 1; /* 텍스트를 배경 위에 표시되도록 함 */
    
}

.cover-content {
    padding: 50px;
    position: relative;
    height: 100%;
    box-sizing: border-box;
    margin-left: 100px;
}

@media ( min-width : 768px) {
    .fleamarket-cover {
        height: 315px;
        padding: 0 16px 0 16px;
        margin-top: 60px;
        margin-bottom: 60px;
    }
    /*여기까지 초록 박스*/
    .body-title {
        margin: 40px 0;
        text-align: left;
    }
    .body-title h2 {
        font-size: 28px;
        font-weight: bold;
    }
    .write-form {
        width: 100%;
        border-collapse: collapse;
    }
    .write-form td {
        padding: 10px;
        border: 1px solid #ddd;
    }
    .write-form .bg-light {
        background-color: #f9f9f9;
    }
    .form-control {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
    }
    .form-control-plaintext {
        height: 40px;
        padding: 8px;
    }
    .table-borderless td {
        border: none;
    }
    .text-center {
        text-align: center;
    }
    .btn {
        padding: 10px 20px;
        font-size: 16px;
        margin: 5px;
    }
    .btn-dark {
        background-color: #333;
        color: #fff;
        border: none;
    }
    .btn-light {
        background-color: #f9f9f9;
        color: #333;
        border: 1px solid #ddd;
    }
}
</style>

<script type="text/javascript">
function ajaxFun(url, method, formData, dataType, fn, file = false) {
    const settings = {
        type: method,
        data: formData,
        dataType: dataType,
        success: function(data) {
            fn(data);
        },
        beforeSend: function(jqXHR) {
            jqXHR.setRequestHeader('AJAX', true);
        },
        complete: function() {},
        error: function(jqXHR) {
            if (jqXHR.status === 403) {
                login();
                return false;
            } else if (jqXHR.status === 400) {
                alert('요청 처리가 실패 했습니다.');
                return false;
            }

            console.log(jqXHR.responseText);
        }
    };

    if (file) {
        settings.processData = false; // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
        settings.contentType = false; // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
    }

    $.ajax(url, settings);
}

function check() {
    const f = document.deliveryForm;
    let str;

    str = f.point.value.trim();
    if (!str) {
        str = 0;
    }

    str = f.subject.value.trim();
    if (!str) {
        alert("제목을 입력하세요.");
        f.subject.focus();
        return false;
    }

    str = f.content.value.trim();
    if (!str || str === "<p><br></p>") {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }

    str = f.saddr.value.trim();
    if (!str) {
        alert("주소를 입력하세요. ");
        f.saddr.focus();
        return false;
    }

    str = f.saddr2.value.trim();
    if (!str) {
        alert("주소를 입력하세요. ");
        f.saddr2.focus();
        return false;
    }

    str = f.receive.value.trim();
    if (!str) {
        alert("주소를 입력하세요. ");
        f.receive.focus();
        return false;
    }

    str = f.receive2.value.trim();
    if (!str) {
        alert("주소를 입력하세요. ");
        f.receive2.focus();
        return false;
    }
    pointMinus();

    f.action = "${pageContext.request.contextPath}/delivery/${mode}";

    f.submit();
}

function isPoint() {
    var pointInput = document.querySelector('input[name="point"]');
    var pointValue = pointInput.value;

    let url = "${pageContext.request.contextPath}/delivery/pointCheck";
    let query = $.param({
        inputPoint: pointValue
    }); // 쿼리 문자열 생성

    const fn = function(data) {
        let state = data.state;
        if (state === "true") {
            alert("해당 나무머니를 사용가능 합니다.");
            return true;
        } else {
            alert("잔액을 확인해주세요.");
            return false;
        }
    };

    ajaxFun(url, "POST", query, "json", fn);
}

function pointMinus() {
    var pointInput = document.querySelector('input[name="point"]');
    var pointValue = pointInput.value;

    let url = "${pageContext.request.contextPath}/delivery/pointMinus";
    let query = $.param({
        inputPoint: pointValue
    }); // 쿼리 문자열 생성

    const fn = function(data) {
        let state = data.state;
        if (state === "true") {
            alert("결제가 성공했습니다.");
            return true;
        } else {
            alert("결제가 실패했습니다.");
        }
    };
    ajaxFun(url, "POST", query, "json", fn);
}
</script>

</head>

<body>
    <div class="container">
        <section class="fleamarket-cover">
            <h1 class="cover-title htext bd">
                둘러보는<br>우리 동네
            </h1>
            <span class="cover-description htext"></span><br> <span class="cover-description htext">심부름하고 포인트를 얻어가세요!</span>
            <!-- 이미지 요소는 더 이상 필요하지 않음 -->
        </section>

        <div class="body-title">
            <h2>글 등록</h2>
        </div>

        <form name="deliveryForm" method="post" enctype="multipart/form-data">
            <table class="table mt-5 write-form">
                <tr>
                    <td class="table-light col-sm-2">동네</td>
                    <td>
                        <div class="row">
                            <div class="col-6">
                                <select name="town" class="form-select">
                                    <option value="${sessionScope.member.town1}">${sessionScope.member.town1}</option>
                                    <c:if test="${sessionScope.member.town2 != null}">
                                        <option value="${sessionScope.member.town2}">${sessionScope.member.town2}</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="bg-light col-sm-2" scope="row">보상 포인트</td>
                    <td scope="row" style="display: flex;"><input type="number" name="point" class="form-control" style="width: 70%;" placeholder="입력하지 않으면 0원입니다." value="${dto.point != null ? dto.point : 1000}">
                        <button class="btn btn-primary" type="button" onclick="isPoint();" style="flex-shrink: 0;">포인트 검증</button></td>
                </tr>

                <tr>
                    <td class="bg-light col-sm-2" scope="row">닉네임</td>
                    <td>
                        <p class="form-control-plaintext">${sessionScope.member.nickName}</p>
                    </td>
                </tr>

                <tr>
                    <td class="bg-light col-sm-2" scope="row">제목</td>
                    <td><input type="text" name="subject" class="form-control" value="${dto.subject}"></td>
                </tr>

                <tr>
                    <td class="bg-light col-sm-2" scope="row">출발지</td>
                    <td scope="row">
                        <div style="display: flex; align-items: center;">
                            <input type="text" name="saddr" class="form-control" readonly value="${dto.saddr1}" id="saddr" style="width: 70%; margin-right: 5px;">
                            <button class="btn btn-primary" type="button" onclick="daumPostcode();" style="flex-shrink: 0;">주소 검색</button>
                        </div> <input type="text" class="form-control" id="saddr2" name="saddr2" value="${dto.saddr2}" placeholder="상세주소">
                    </td>
                </tr>

                <tr>
                    <td class="bg-light col-sm-2" scope="row">도착지</td>
                    <td scope="row">
                        <div style="display: flex; align-items: center;">
                            <input type="text" name="receive" class="form-control" readonly value="${dto.receive}" id="receive" style="width: 70%; margin-right: 5px;">
                            <button class="btn btn-primary" type="button" onclick="daumPostcode2();" style="flex-shrink: 0;">주소 검색</button>
                        </div> <input type="text" class="form-control" id="receive2" name="receive2" value="${dto.receive2}" placeholder="상세주소">
                    </td>
                </tr>

                <tr>
                    <td class="bg-light col-sm-2" scope="row">내용</td>
                    <td><textarea name="content" id="" class="form-control" style="height: 300px;">${dto.content}</textarea></td>
                </tr>
            </table>

            <table class="table table-borderless">
                <tr>
                    <td class="text-center">
                        <button type="button" class="btn btn-dark" onclick="check();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i>
                        </button>
                        <button type="reset" class="btn btn-light">다시입력</button>
                        <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/delivery/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i>
                        </button> <c:if test="${mode=='update'}">
                            <input type="hidden" name="num" value="${dto.num}">
                            <input type="hidden" name="page" value="${page}">
                        </c:if>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        function daumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = ''; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        fullAddr = data.roadAddress;

                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        fullAddr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                    if (data.userSelectedType === 'R') {
                        //법정동명이 있을 경우 추가한다.
                        if (data.bname !== '') {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if (data.buildingName !== '') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('saddr').value = fullAddr;

                }
            }).open();
        }
    </script>

    <script>
        function daumPostcode2() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = ''; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        fullAddr = data.roadAddress;

                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        fullAddr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                    if (data.userSelectedType === 'R') {
                        //법정동명이 있을 경우 추가한다.
                        if (data.bname !== '') {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if (data.buildingName !== '') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('receive').value = fullAddr;

                }
            }).open();
        }
    </script>

</body>

</html>
