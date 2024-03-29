<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp" />


<div class="nav justify-content-center mb-5 mt-5">
    <h1>Join</h1>
</div>

<div class="nav justify-content-center">
    <form style="width: 25rem">
        <div class="form-floating mb-2">
            <input type="text" class="form-control" id="floatingId" placeholder="Id" />
            <label for="floatingId">Id</label>
        </div>
        <div class="nav justify-content-end mb-2">
            <%--기능 따로 만들기--%>
            <button type="button" class="btn btn-outline-secondary">중복 검사</button>
        </div>
        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">Password</label>
        </div>

        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingName" placeholder="name" />
            <label for="floatingName">Name</label>
        </div>
        <div class="form-floating mb-3">
            <input type="email" class="form-control" id="floatingEmail" placeholder="email" />
            <label for="floatingEmail">Email</label>
        </div>
        <div class="nav justify-content-end mb-2">
            <button
                    class="btn btn-outline-secondary"
                    type="button"
                    onclick="DaumPost()"
            >
                우편번호 찾기
            </button>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="zipcode" placeholder="zipcode" disabled/>
            <label for="zipcode">Zipcode</label>
        </div>

        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="address" placeholder="address" disabled />
            <label for="address">Address</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" class="form-control" id="addressDetail" placeholder="addressDetail" />
            <label for="addressDetail">AddressDetail</label>
        </div>

        <div class="nav justify-content-end mb-5">
            <button type="submit" class="btn btn-outline-success" style="width: 25rem">join</button>
        </div>
    </form>

</div>
<br/>
<br/>
<br/>
<jsp:include page="footer.jsp" /><jsp:include page="footer.jsp" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function DaumPost(){
        new daum.Postcode({
            oncomplete: function(data) {
                let fullAddress = data.address;
                let extraAddress = "";

                if (data.userSelectedType === "R") {
                    if (data.bname !== "") {
                        extraAddress += data.bname;
                    }
                    if (data.buildingName !== "") {
                        extraAddress +=
                            extraAddress !== ""
                                ? ", " + data.buildingName
                                : data.buildingName;
                    }
                    fullAddress += extraAddress !== ""
                        ? " (" + extraAddress + ")"
                        : "";
                }
                console.log(data);
                console.log(data.zonecode);
                console.log(fullAddress); // e.g. '서울 성동구 왕십리로2길 20 (성수동1가)'

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("address").value = fullAddress;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addressDetail").focus();
            }
        }).open();
    }

    new daum.Postcode({
        onclose: function(state) {
            //state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
            if(state === 'FORCE_CLOSE'){
                //사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.

            } else if(state === 'COMPLETE_CLOSE'){
                //사용자가 검색결과를 선택하여 팝업창이 닫혔을 경우, 실행될 코드를 작성하는 부분입니다.
                //oncomplete 콜백 함수가 실행 완료된 후에 실행됩니다.
            }
        }
    });
</script>