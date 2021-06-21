<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<body>
<!-- Header / <head> -->
<jsp:include page="/WEB-INF/views/include/header_new.jsp"/>
<!-- Close Header / <head> -->

<!-- Start Recent Work -->
<section class="py-5 mb-5">
    <div class="container">
        <div class="recent-work-header row text-center pb-5">
            <h2 class="col-md-6 m-auto h2 semi-bold-600 py-5">내 모임</h2>
        </div>
        <div class="row gy-5 g-lg-5 mb-4" id="container">
            <c:choose>
                <c:when test="${not empty adminGroup}">
                    <div class="col-md-4 mb-3">
                        <a href="#" class="recent-work card border-0 shadow-lg overflow-hidden">
                            <img class="recent-work-img card-img"
                                 src="${pageContext.request.contextPath}/upload/groupimg/${adminGroup.group_img}"
                                 alt="Card image">
                            <div class="recent-work-vertical card-img-overlay d-flex align-items-end">
                                <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                                    <h3 class="card-title light-300">${adminGroup.group_name}</h3>
                                    <p class="card-text">${adminGroup.content}</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="col-md-4 mb-3">
                        <a href="#" class="recent-work card border-0 shadow-lg overflow-hidden">
                            <img class="recent-work-img card-img"
                                 src="${pageContext.request.contextPath}/upload/defaultimg/make_group.jpg"
                                 alt="Card image">
                            <div class="recent-work-vertical card-img-overlay d-flex align-items-end">
                                <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                                    <h3 class="card-title light-300">모임장이 되어보세요!</h3>
                                    <p class="card-text">모임을 만들어 모임을 이끌어보세요</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>

            <c:forEach var="i" items="${groupList}">
                <c:choose>
                    <c:when test="${not empty i.group_name}">
                        <div class="col-md-4 mb-3">
                            <a href="#" class="recent-work card border-0 shadow-lg overflow-hidden">
                                <img class="recent-work-img card-img"
                                     src="${pageContext.request.contextPath}/upload/groupimg/${i.group_img}"
                                     alt="Card image">
                                <div class="recent-work-vertical card-img-overlay d-flex align-items-end">
                                    <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                                        <h3 class="card-title light-300">${i.group_name}</h3>
                                        <p class="card-text">${i.content}</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:when>
                </c:choose>
            </c:forEach>
        </div>
    </div>
</section>
<!-- End Recent Work -->

<!-- Start Footer / Script -->
<jsp:include page="/WEB-INF/views/include/footer_new.jsp"/>
<!-- End Footer / Script -->

</body>
<script>
    var length = ${length};
    var html = '<div class="col-md-4 mb-3">'
              +'<a href="#" class="recent-work card border-0 shadow-lg overflow-hidden">'
              +'<img class="recent-work-img card-img" src="./assets/img/recent-work-02.jpg" alt="Card image">'
              +'<div class="recent-work-vertical card-img-overlay d-flex align-items-end">'
              +'<div class="recent-work-content text-start mb-3 ml-3 text-dark">'
              +'<h3 class="card-title light-300">모임을 가입하세요</h3>'
              +'<p class="card-text">모임을 가입하신후 활동하실수 있습니다</p></div></div></a></div>';
    $(document).ready(function (){
        if(length == 1) {
            $('#container').append(
                html
            );
        } else if (length == 0) {
            $('#container').append(
                html + html
            );
        }
    });
</script>

</html>
