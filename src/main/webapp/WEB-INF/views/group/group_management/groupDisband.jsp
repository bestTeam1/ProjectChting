<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<!-- Close Header / <head> -->

<!-- Start Feature Work -->
<section class="bg-light py-5">
    <div class="feature-work container my-4">
        <div class="row d-flex d-flex align-items-center">
            <div class="col-lg-5">
                <h1 class="feature-work-heading h2 py-3 semi-bold-600">모임을 해산하시겠습니까?</h1>
                <p class="feature-work-body text-muted light-300">
                    <br>모임 해산시 해당 정보는 되돌릴 수 없습니다!<br>
                    <br>1) 해당 모임의 활동기록은 사라지게 됩니다.<br>
                    <br>2) 모임에 속해있던 모임원들은 자동으로 모임에서 탈퇴됩니다.<br>
                    <br>3) 모임에서 작성한 게시글은 더이상 볼 수 없게됩니다.<br>
                    <br>4) 모임해산은 되돌릴 수 없습니다!

                </p>
            </div>

            <div class="col-lg-6 offset-lg-1 mb-lg-5 align-left">
                <div class="row">
                    <a class="col" data-type="image" data-fslightbox="gallery" >
                        <img class="img-fluid" src="${pageContext.request.contextPath}/upload/chting/disband.png">
                    </a>
                </div>
            </div>
            <!-- 공유하기 -->
            <div class="col-lg-8 col-12 m-lg-auto text-center">
                <input type="button" class="banner-button btn rounded-pill btn-danger text-white btn-lg px-4 mt-lg-5 " id="disband" value="모임 해산하기">
            </div>
        </div>
    </div>
</section>
<!-- End Feature Work -->

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- End Footer / Script -->
</body>
<script type="text/javascript">
    //로그인체크 (백단에서 못막았을 경우)
    $(function(){
        var check = '${sessionScope.get("userData").userid}';
        if( check == null || check =="" || check == undefined ) {
            Swal.fire({
                title: '오류',
                text : '로그인을 해주세요!!'
            }).then(() => {
                history.go(-1);
            })
        }
    });
    //모임 해산 클릭이벤트
    $(document).on("click", "#disband", function (e) {
        e.preventDefault();
        Swal.fire({
            title: '모임을 해산하시겠습니까??',
            text: "이 결정은 되돌릴 수 없습니다!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#e74a3b',
            cancelButtonColor: '#aaaaaa',
            confirmButtonText: '모임을 해산하겠습니다',
            cancelButtonText : '취소'
        }).then ((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '모임 해산',
                    text : '모임이 해산되었습니다!'
                }).then(() => {
                    console.log("hi")
                    $("#groupDisbandOk").submit();
                })
            }
        })
    });
</script>

</html>
