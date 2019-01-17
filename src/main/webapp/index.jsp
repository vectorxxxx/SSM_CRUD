<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<!-- Modal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Add New Employee</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="emp_name_input" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input type="email" name="empName" class="form-control" id="emp_name_input"
                                   placeholder="张三">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="emp_email_input" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="password" name="email" class="form-control" id="emp_email_input"
                                   placeholder="zhangsan@funnyboy.xyz">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="male_radio" value="男" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="female_radio" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="deptId"> </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">Save</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM_CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_btn">New</button>
            <button class="btn btn-danger" id="emp_del_btn">Delete</button>
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
    var totalRecord;
    var success = "success";
    var error = "error";

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
        totalRecord = pageInfo.total;
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
        } else {
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
        } else {
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
            } else {
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

    $("#emp_add_btn").click(function () {
        $("#empAddModal form")[0].reset();
        $("#emp_save_btn").removeAttr("status1").removeAttr("status2");
        getDepts();
        $("#empAddModal").modal({
            backdrop: "static"
        });
    });

    function getDepts() {
        $.ajax({
            url: "${APP_PATH}/depts",
            type: "GET",
            success: function (result) {
                $.each(result.extend.depts, function () {
                    var $option = $("<option></option>").attr("value", this.deptId).append(this.deptName);
                    $("#empAddModal select").append($option);
                });
            }
        });
    }

    $("#emp_name_input").change(function () {
        var $emp_name_input = $("#emp_name_input");
        var empName = $emp_name_input.val();
        var regName = /(^[a-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (empName == "") {
            show_validate($emp_name_input, error, "员工名不能为空");
            $("#emp_save_btn").attr("status1", "error");
        } else if (!regName.test(empName)) {
            show_validate($emp_name_input, error, "员工格式不正确");
            $("#emp_save_btn").attr("status1", "error");
        } else {
            $.ajax({
                url: "${APP_PATH}/validateuser",
                type: "POST",
                data: "empName=" + empName,
                success: function (result) {
                    if (result.code == 200) {
                        show_validate($emp_name_input, error, "员工名已存在");
                        $("#emp_save_btn").attr("status1", "error");
                    } else if (result.code == 100) {
                        show_validate($emp_name_input, success, "");
                        $("#emp_save_btn").removeAttr("status1");
                    }
                }
            });
        }

    });
    $("#emp_email_input").change(function () {
        var $emp_email_input = $("#emp_email_input");
        var email = $emp_email_input.val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (email == "") {
            show_validate($emp_email_input, error, "邮箱不能为空");
            $("#emp_save_btn").attr("status2", "error");
        } else if (!regEmail.test(email)) {
            show_validate($emp_email_input, error, "邮箱格式不正确");
            $("#emp_save_btn").attr("status2", "error");
        } else {
            show_validate($emp_email_input, success, "");
            $("#emp_save_btn").removeAttr("status2");
        }
    });

    $("#emp_save_btn").click(function () {
        if (!validate_add_form()) {
            return false;
        }
        if ($(this).attr("status1")=="error"||$(this).attr("status2")=="error") {
            return false;
        }
        saveEmp();
    });

    function validate_add_form() {
        var $emp_name_input = $("#emp_name_input");
        var empName = $emp_name_input.val();
        var $emp_email_input = $("#emp_email_input");
        var email = $emp_email_input.val();
        if (empName == "") {
            show_validate($emp_name_input, error, "员工名不能为空");
            return false;
        } else if (email == "") {
            show_validate($emp_email_input, error, "邮箱不能为空");
            return false;
        }
        return true;
    }

    function show_validate(ele, status, msg) {
        emptyInfo(ele);
        if (error == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").append(msg);
        } else if (success == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").append(msg);
        }
    }

    function emptyInfo(ele) {
        $(ele).parent().removeClass("has-error has-success");
        $(ele).next("span").empty();
    }

    function saveEmp() {
        $.ajax({
            url: "${APP_PATH}/emps",
            type: "POST",
            data: $(".form-horizontal").serialize(),
            success: function (result) {
                $("#empAddModal").modal("hide");
                to_page(totalRecord);
            }
        });
    }
</script>
</body>
</html>
