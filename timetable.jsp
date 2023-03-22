<%-- 
    Document   : timetable
    Created on : Mar 9, 2023, 8:29:04 AM
    Author     : sonnt
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" type="text/css" href="path/to/timetable.css">


    </head>
    <body>

        <table  border="1px" cellspacing="0" cellpadding="0"> 

            <div class="time-slot">
                Time Slot<br>
            </div>
            <tr >
                <td>
                    <c:forEach items="${requestScope.dates}" var="d"></td>
                    <td>${d}<br/><fmt:formatDate value="${d}" pattern="EEEE"/>
                    </td>
                </c:forEach>

            </tr>
            <c:forEach items="${requestScope.slots}" var="slot"> 
                <tr>
                    <td>${slot.name}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.s.groups}" var="g">
                                <c:forEach items="${g.sessions}" var="ses">
                                    <c:if test="${ses.date eq d and ses.slot.id eq slot.id}">
                                        ${g.name}(${g.course.name}) <br/>
                                        ${ses.lecturer.name}-${ses.room.name} <br/>
                                        <c:if test="${ses.status}">
                                            <p>Attended</p>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>

        </table>
    <td>
        <div class="info">
            Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL...<br>
            Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,..<br>
            Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...<br>
            Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.<br>
            Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,..<br>
            Little UK (LUK) thuộc tầng 5 tòa nhà Delta 
        </div> 


    </body>
</html>
