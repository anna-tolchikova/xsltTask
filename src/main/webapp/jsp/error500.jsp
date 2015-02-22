<%@page isErrorPage="true" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Error</title>
</head>
<body>

	<h1>500 Internal server error</h1>
	<h2 style="color: red;">Sorry, some internal error occurs</h2>
	<br/>
	<a href="${pageContext.request.contextPath}">Home</a>
	<div>Error: ${pageContext.exception}</div>
	<div>
		<c:forEach var="trace" items="${pageContext.exception.stackTrace}">
			<p>${trace}</p>
		</c:forEach>
	</div>
</body>
</html>