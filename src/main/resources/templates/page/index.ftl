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
        <input placeholder = "请输入你要搜索的人名或者电话号码"/>
        <div>查询</div>
    </div>
    <div class="model">
        <div><span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span><input id = "inputName"/></div>
        <div><span>工作单位</span><input id = "inputWork"/></div>
        <div><span>电话号码</span><input id = "inputNum"/></div>
        <div><span>电子邮箱</span><input id = "inputEmail"/></div>
        <div class="divButton" id="save">保存</div>
        <div class="divButton" id="close" onclick="noDate(this)">清空</div>
    </div>
    <table border="1">
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
                    <div class="delete" onclick="delPeople(${data.id})">删除</div>
                    <div class="delete" onclick="getData(this,${data.id})">修改</div>
                </td>
            </tr>
        </#list>
    </table>
</body>
</html>
<script>
    function delPeople(id) {
        $.ajax({
            type:"POST",
            url:"http://10.10.10.32:8080/remove",
            data:{
                id: id
            },
            dataType:"jsonp",
            success:function (data) {
                alert(data);
            }
        })
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
</script>