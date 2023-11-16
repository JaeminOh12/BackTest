<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${cpath}/resources/css/style.css">
<script
   src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript">
   $(document).ready(()=>{
      // ~
   });
   function goMsg(){
      // alert("삭제된 게시물 입니다.") // modal 모달 창 띄우기
      $("#myModal").modal();
   }
</script>

</head>
<body>

   <div class="card">
      <div class="card-header">
         <div class="jumbotron jumbotron-fluid">
            <div class="container">
               <h1>Spring Framework~</h1>
               <p>Bootstrap is the most popular HTML, CSS...</p>
            </div>
         </div>
      </div>
      <div class="card-body">
         <div class="row">
            <div class="col-2">
               <jsp:include page="left.jsp"></jsp:include>
            </div>
            <div class="col-7">
               <table class="table table-hover">
                  <thead>
                     <tr>
                        <th>제목</th>
                        <th>번호</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${list}" var="vo">
                        <tr>
                           <td>${vo.idx}</td>
                           <td><c:if test="${vo.boardLevel>0}">
                                 <c:forEach begin="1" end="${vo.boardLevel}">
                                    <span style="padding-left: 10px"></span>
                                 </c:forEach>
                                 <i class="bi bi-caret-right"></i>
                              </c:if> <c:if test="${vo.boardAvailable==0}">
                                 <a href="${cpath}/get.do/${vo.idx}">${vo.title}</a>
                              </c:if> <c:if test="${vo.boardAvailable==1}">
                                 <a href="javascript:goMsg()">삭제된 게시물입니다.</a>
                              </c:if></td>
                           <td>${vo.writer}</td>
                           <td><fmt:formatDate value="${vo.indate}"
                                 pattern="yyyy-MM-dd" /></td>
                           <td>${vo.count}</td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
               <c:if test="${!empty m}">
                  <button class="btn btn-secondary btn-sm"
                     onclick="location.href='${cpath}/register.do'">글쓰기</button>
               </c:if>
            </div>
            <div class="col-3">
               <jsp:include page="right.jsp"></jsp:include>
            </div>
         </div>
      </div>
      <!-- modal -->
      <!-- The Modal -->
      <div class="modal" id="myModal">
         <div class="modal-dialog">
            <div class="modal-content">

               <!-- Modal Header -->
               <div class="modal-header">
                  <h4 class="modal-title">Message</h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>

               <!-- Modal body -->
               <div class="modal-body">삭제된 게시물입니다.</div>

               <!-- Modal footer -->
               <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
               </div>

            </div>
         </div>
      </div>


      <!-- modal end -->
      <div class="card-footer">test</div>
   </div>

</body>
</html>