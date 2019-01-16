<%--
  Created by IntelliJ IDEA.
  User: 14027
  Date: 2019/1/14
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("APP_PATH", request.getContextPath());%></>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee</title>
    <style>
        * {
            maring: 0;
            padding: 0;
        }

        .container {
            width: auto;
            height: auto;
            margin: 100px auto;
        }

        .row {
            margin-top: 10px;
        }

        #emps_table th, #emps_table td {
            text-align: center;
        }
    </style>
    <script src="${APP_PATH}/js/jquery-3.3.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM_CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">New</button>
            <button class="btn btn-danger">Delete</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>last name</th>
                    <th>email</th>
                    <th>gender</th>
                    <th>dept name</th>
                    <th>Operate</th>
                </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" id="page_info_area"></div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">

                </ul>
            </nav>
        </div>
    </div>
</div>
<script>
    $(function () {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pg=5",
            type: "GET",
            success: function (result) {
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        });
    });

    function build_emps_table(result) {
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var emailTd = $("<td></td>").append(item.email);
            var genderTd = $("<td></td>").append(item.gender);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            <%--<button class="btn btn-primary btn-sm">--%>
            <%--<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>--%>
            <%--Edit--%>
            <%--</button>--%>
            <%--<button class="btn btn-danger btn-sm">--%>
            <%--<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>--%>
            <%--Delete--%>
            <%--</button>--%>
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil")
                .append("Edit");
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
                .append("<span></span>").addClass("glyphicon glyphicon-trash")
                .append("Delete");
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(empIdTd)
                .append(empNameTd)
                .append(emailTd)
                .append(genderTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }

    function build_page_info(result) {
        var pageInfo = result.extend.pageInfo;
        $("<p></p>").append("Current page:" + pageInfo.pageNum + ", All pages: " + pageInfo.pages + ", All records: " + pageInfo.total)
            .appendTo("#page_info_area");
    }
    function build_page_nav(result) {
        <%--<li><a href="${APP_PATH}/emps?pg=1">First</a></li>--%>
        <%--<c:if test="${pageInfo.hasPreviousPage}">--%>
        <%--<li>--%>
        <%--<a href="${APP_PATH}/emps?pg=${pageInfo.pageNum-1}" aria-label="Previous">--%>
            <%--<span aria-hidden="true">&laquo;</span>--%>
        <%--</a>--%>
        <%--</li>--%>
        <%--</c:if>--%>
        <%--<c:forEach items="${pageInfo.navigatepageNums}" var="navNum">--%>
        <%--<c:if test="${navNum == pageInfo.pageNum}">--%>
        <%--<li class="active"><a href="#">${navNum}</a></li>--%>
        <%--</c:if>--%>
        <%--<c:if test="${navNum != pageInfo.pageNum}">--%>
        <%--<li><a href="${APP_PATH}/emps?pg=${navNum}">${navNum}</a></li>--%>
        <%--</c:if>--%>
        <%--</c:forEach>--%>
        <%--<c:if test="${pageInfo.hasNextPage}">--%>
        <%--<li>--%>
        <%--<a href="${APP_PATH}/emps?pg=${pageInfo.pageNum+1}" aria-label="Next">--%>
            <%--<span aria-hidden="true">&raquo;</span>--%>
        <%--</a>--%>
        <%--</li>--%>
        <%--</c:if>--%>
        <%--<li><a href="${APP_PATH}/emps?pg=${pageInfo.pages}">Last</a></li>--%>

    }
</script>
</body>
</html>
