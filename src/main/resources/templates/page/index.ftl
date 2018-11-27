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
    }
    tr{
        width: auto;
    }
</style>
<body>
    <div class="head">
        通讯录管理系统
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
                <td>${data.name}</td>
                <td>${data.workUnit}</td>
                <td>${data.phoneNum}</td>
                <td>${data.email}</td>
                <td>
                    <div class="delete" onclick="delPeople(${data.id})">删除</div>
                </td>
            </tr>
        </#list>
    </table>
</body>
</html>
<script>
    function delPeople(id) {

    }
</script>