<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/qna.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>99팔팔</title>
</head>
<script type="text/javascript">
$(function() {
    $("#qnaWrite").click(function() {
        $.ajax({
            url: 'qnaCreate',
            success: function(x) {
            	location.href = 'qnaCreate';
                console.log("qna글쓰기");
            }
        });
    });

    $(".title").click(function() {
    	var qnaId = $(this).find('.qnaId').text();
    	console.log(qnaId);
    	
        location.href = "qnaPost.jsp?qnaId="+qnaId;
    });
                
});
</script>

<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/default/header.jsp" flush="true">
				<jsp:param name="mode" value="1" />
			</jsp:include>
		</div>
		<div id="content_wrap">
			<div id="content">
				<div id="qna_wrap" style="width: 1000px">
					<div style="font-size: 24px; font-weight: bolder; margin-bottom: 20px;">질문있어요</div>
					<div id="search" style="display: flex; flex-direction: row-reverse; margin: 9px; margin-bottom: 20px;">
						<div id="search_wrap" style="position: relative;">
							<img alt="돋보기 아이콘" style="position: absolute; right: 8px; margin-top: 4px; width: 18px;top: 2px;"
								src="${pageContext.request.contextPath}/resources/img/Vector.png">
							<input type="text" placeholder="검색어를 입력하세요." style="height: 25px; width: 220px;"> </div>
						<select class="board_category" name="category">
							<option>카테고리</option>
							<option value="병원">병원</option>
							<option value="질병">질병</option>
							<option value="의약품">의약품</option>
							<option value="건강상식">건강상식</option>
						</select>
					</div>
					<div>
						<table>
							<tr>
								<th class="num">번호</th>
								<th>제목</th>
								<th class="writer" style="padding: 0 6px;">작성자</th>
								<th>작성일</th>
								<th class="views">조회 수</th>
							</tr>
							<c:forEach var="i" begin="1" end="${fn:length(qnaList)}" >
								<tr>
									<td class="num">${i}</td>
									<td class="title">
										<a> <span class="category" style="color: #717A84">[${qnaList[i-1].category}]</span>
												<span class="qnaContent">${qnaList[i-1].title}</span> 
												<span class="qnaId" style="display: none;">${qnaList[i-1].qnaId}</span> 
												<span class="reply" style="color: #FF0000; font-size: smaller;">[2]</span>
										</a></td>
									<td class="writer">홍홍홍홍</td>
									<td>${formattedDates[i-1]}</td>
									<td>${qnaList[i-1].view}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div id="qnaBottomWrap">
						<button id="qnaWrite">글쓰기</button>
						<div class="paging">
							<c:forEach var="i" begin="1" end="5">
								<button type="button" class="btn_paging">${i}</button>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>