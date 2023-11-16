<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>

<div class="card" style="min-height: 500px; max-height: 1000px;">
		
		<div class="row">
			<div class="col-12">
				<div class="card-body">
					<c:if test="${empty m}">
						<h4 class="card-title">GUEST</h4>
						<p class="card-text">회원님 Welcome!</p>
						<form action="${cpath}/login.do" method="post">
							<div class="form-group">
								<label for="memId">아이디:</label>
								<input type="text" class="form-control" name="memId" id="memId">
							</div>
							<div class="form-group">
								<label for="memPwd">패스워드:</label>
								<input type="text" class="form-control" name="memPwd" id="memPwd">
							</div>
							<button type="submit" class="btn btn-sm btn-info form-control">로그인</button>
						</form>
					</c:if>
					<c:if test="${!empty m}">
						<h4 class="card-title">${m.memName}</h4>
						<p class="card-text">회원님 Welcome!</p>
						<form action="${cpath}/logout.do" method="post">
							<button type="submit" class="btn btn-sm btn-info form-control">로그아웃</button>
						</form>
					</c:if>
				</div>
			</div>	
		</div>
		
		<div class="row">
			<div class="col-12">
				<div class="card-body">
					<h4 class="card-title">map view</h4>
					<p class="card-text">여기에 지도가 표시된다.</p>
				</div>
			</div>
		</div>
		
</div>