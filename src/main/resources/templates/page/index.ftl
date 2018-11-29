<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
    .head{
        font-size: 50px;
        width: 500px;
    }
    tr{
        width: auto;
    }
    .delete:hover{
        color: blue;
    }
    .search{
        width: 400px;
    }
    .search input{
        width: 80%;
    }
    .search div{
        position: absolute;
        left: 370px;
        margin-top: -23px;
    }
    .search div:hover{
        color: blue;
    }
    .model{
        border: 1px solid #000;
        width: 250px;
        position: absolute;
        left: 700px;
    }
    .model+div{
        width: 100%;
    }
    .model div div{
        border: 1px solid #000000;
        width: 50px;
    }
    #close{
        position: absolute;
        margin-top: -21px;
        left: 200px;
    }
</style>
<body>
    <div class="head">
        通讯录管理系统
    </div>
    <div class="search">
        <input id = "searchInput" placeholder = "请输入你要搜索的人名或者电话号码"/>
        <div onclick="list()">查询</div>
    </div>
    <div class="model">
        <div><span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span><input id = "inputName"/></div>
        <div><span>工作单位</span><input id = "inputWork"/></div>
        <div><span>电话号码</span><input id = "inputNum"/></div>
        <div><span>电子邮箱</span><input id = "inputEmail"/></div>
        <div class="divButton" id="save" onclick="save()">保存</div>
        <div class="divButton" id="close" onclick="noDate(this)">清空</div>
    </div>
    <table id="mainData"border="1">
        <tr>
            <th>姓名</th>
            <th>工作单位</th>
            <th>电话号码</th>
            <th>电子邮箱</th>
            <th>操作</th>
        </tr>
        <#list list as data>
            <tr>
                <td id = "dataName">${data.name}</td>
                <td id = "dataWork">${data.workUnit}</td>
                <td id = "dataNum">${data.phoneNum}</td>
                <td id = "dataEamil">${data.email}</td>
                <td>
                    <div class="delete" onclick="delPeople(this,${data.id})">删除</div>
                    <div class="delete" onclick="getData(this,${data.id})">修改</div>
                </td>
            </tr>
        </#list>
    </table>
</body>
</html>
<script>
    function delPeople(e,id) {
        var params = {
            "id":id
        }
        $.ajax({
            url: "http://localhost:8080/remove",
            type:"POST",//请求方式POST
            data:JSON.stringify(params),
            dataType:"json", //预期从服务器中接受的数据类型
            contentType: 'application/json; charset=UTF-8',
            success:function(data){
                alert("success");
            }
        });
        $(e).parent().parent().remove();
    }
    function getData(e,id) {
        var data = $(e).parent().parent();
        $("#inputName").val(data.find("#dataName").html());
        $("#inputWork").val(data.find("#dataWork").html());
        $("#inputNum").val(data.find("#dataNum").html());
        $("#inputEmail").val(data.find("#dataEamil").html());
        $(".model").attr("value",id);
    }
    function noDate(e) {
        var model = $(e).parent();
        model.removeAttr("value");
        $("#inputName").val("");
        $("#inputWork").val("");
        $("#inputNum").val("");
        $("#inputEmail").val("");
    }
    function save() {
        var id = $(".model").attr("value");
        var params = {
            "id":id,
            "name":$("#inputName").val(),
            "workUnit":$("#inputWork").val(),
            "phoneNum":$("#inputNum").val(),
            "email":$("#inputEmail").val(),
        }
        if(typeof(id)=="undefined"){
                $.ajax({
                    url: "http://localhost:8080/save",
                    type:"POST",//请求方式POST
                    data:JSON.stringify(params),
                    dataType:"json", //预期从服务器中接受的数据类型
                    contentType: 'application/json; charset=UTF-8',
                    success:function(data){
                        alert("success");
                    }
                });
        }else{
            $.ajax({
                url: "http://localhost:8080/update",
                type:"POST",//请求方式POST
                data:JSON.stringify(params),
                dataType:"json", //预期从服务器中接受的数据类型
                contentType: 'application/json; charset=UTF-8',
                success:function(data){
                    alert("success");
                }
            });
        }
        alert("操作成功");
        location.reload();
    }
    function list() {
        var keyword = $("#searchInput").val();
        var params = {
            "keyword":keyword
        }
        $.ajax({
            url: "http://localhost:8080/list",
            type:"POST",//请求方式POST
            data:JSON.stringify(params),
            dataType:"json", //预期从服务器中接受的数据类型
            contentType: 'application/json; charset=UTF-8',
            success:function(data){
                var html = "        <tr>" +
                        "            <th>姓名</th>" +
                        "            <th>工作单位</th>" +
                        "            <th>电话号码</th>" +
                        "            <th>电子邮箱</th>" +
                        "            <th>操作</th>" +
                        "        </tr>";
                for(var i=0;i<data.length;i++){
                    var datahtml = "<tr>" +
                            "                <td id='dataName'>"+data[i].name+"</td>" +
                            "                <td id='dataWork'>"+data[i].workUnit+"</td>" +
                            "                <td id='dataNum'>"+data[i].phoneNum+"</td>" +
                            "                <td id='dataEamil'>"+data[i].email+"</td>" +
                            "                <td>" +
                            "                    <div class='delete' onclick='delPeople("+data[i].id+")'>删除</div>" +
                            "                    <div class='delete' onclick='getData(this,"+data[i].id+")'>修改</div>" +
                            "                </td>" +
                            "            </tr>"
                    html = html +datahtml;
                }
                $("#mainData").html(html);
            }
        });
    }
</script>