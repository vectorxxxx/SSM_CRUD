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
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>
<script>
    $(function () {
        to_page(1);
    });

    function to_page(pg) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pg=" + pg,
            type: "GET",
            success: function (result) {
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        });
    }

    function build_emps_table(result) {
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var $empIdTd = $("<td></td>").append(item.empId);
            var $empNameTd = $("<td></td>").append(item.empName);
            var $emailTd = $("<td></td>").append(item.email);
            var $genderTd = $("<td></td>").append(item.gender);
            var $deptNameTd = $("<td></td>").append(item.department.deptName);
            var $editBtn = $("<button></button>").addClass("btn btn-primary btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("Edit");
            var $delBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("Delete");
            var $btnTd = $("<td></td>").append($editBtn).append(" ").append($delBtn);
            $("<tr></tr>").append($empIdTd)
                .append($empNameTd)
                .append($emailTd)
                .append($genderTd)
                .append($deptNameTd)
                .append($btnTd)
                .appendTo("#emps_table tbody");
        });
    }

    function build_page_info(result) {
        $("#page_info_area").empty();
        var pageInfo = result.extend.pageInfo;
        $("<p></p>").append("Current page:" + pageInfo.pageNum + ", All pages: " + pageInfo.pages + ", All records: " + pageInfo.total)
            .appendTo("#page_info_area");
    }

    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var pageInfo = result.extend.pageInfo;
        var $nav = $("<nav></nav>").attr("aria-label", "Page navigation");
        var $ul = $("<ul></ul>").addClass("pagination");
        $nav.append($ul);
        var $firstLi = $("<li></li>").append($("<a></a>").append("First"));
        var $previousLi = $("<li></li>").append($("<a></a>").attr("aria-label", "Previous")
            .append($("<span></span>").attr("aria-hidden", "true").append("&laquo;")));
        var $nextLi = $("<li></li>").append($("<a></a>").attr("aria-label", "Next")
            .append($("<span></span>").attr("aria-hidden", "true").append("&raquo;")));
        var $lastLi = $("<li></li>").append($("<a></a>").append("Last"));
        if (pageInfo.hasPreviousPage == false) {
            $firstLi.addClass("disabled");
            $previousLi.addClass("disabled");
        }else{
            $firstLi.click(function () {
                to_page(1);
            });
            $previousLi.click(function () {
                to_page(pageInfo.prePage);
            });
        }
        if (pageInfo.hasNextPage == false) {
            $nextLi.addClass("disabled");
            $lastLi.addClass("disabled");
        }else{
            $nextLi.click(function () {
                to_page(pageInfo.nextPage);
            });
            $lastLi.click(function () {
                to_page(pageInfo.pages);
            });
        }
        $ul.append($firstLi);
        $ul.append($previousLi);
        $.each(pageInfo.navigatepageNums, function (index, item) {
            var $numLi = $("<li></li>").append($("<a></a>").append(item));
            if (item == pageInfo.pageNum) {
                $numLi.addClass("active");
            }else {
                $numLi.click(function () {
                    to_page(item);
                });
            }
            $ul.append($numLi);
        });
        $ul.append($nextLi);
        $ul.append($lastLi);
        $nav.appendTo("#page_nav_area");
    }
</script>
</body>
</html>
