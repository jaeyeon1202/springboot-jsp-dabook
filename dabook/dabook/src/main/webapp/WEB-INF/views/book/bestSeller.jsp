<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> 베스트 셀러 </title>
</head>
<script>

</script>
<link rel="stylesheet" href="/css/book/bestSeller.css" />
<body>
<jsp:include page="../main/header.jsp" />
<h3>BEST SELLER</h3>
<div class="wholeSpace">
    <div class="bookSpace">
        <div class="row">
            <c:forEach var="books" items="${books}" varStatus="rowStatus">
                <c:if test="${rowStatus.index % 6 ==0}">
                <div class="oneBookLine">
                 </c:if>
                <div class="oneBookSpace">
                    <button type="submit" onclick="location.href=`/dabook/book?no=${books.no}`">
                        <img src="/images/bookImage/book${books.no}.jpg" alt="${books.bookName}"></button>
                    <div id="bookTitle">
                        <button type="submit" onclick="location.href=`/dabook/book?no=${books.no}`"> ${books.bookName}</button>
                    </div>
                    <div id="author">
                            ${books.author}
                    </div>
                </div>
                <c:if test="${rowStatus.index % 6 == 5 or rowStatus.last}">
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>
<jsp:include page="../main/footer.jsp" />
</body>
</html>