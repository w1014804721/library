<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html public "-/w3c/dtd html 4.01 transitional/en">
<html>
<head></head>
<body>
<script type="text/javascript">
    //更新用户
    function updateStudent() {
        //判断是否需要更新密码
        //校验其他输入项
        var r = $('#studentUpForm').form('validate');
        //更新
        $.post("student/updateStudent", $("#studentUpForm").serializeArray(), function (data) {
            closeWindow();
            $('#userTable').datagrid('reload');
            $.messager.alert('提示', data.mes, 'info');
        });
    }
    //关闭窗口
    function closeWindow(){
        $("#edit_box").dialog("destroy");
    }
</script>

<form id="studentUpForm" method="post" style="margin:0;text-align:center;">
    <table style="width:100%; font-size:12px;" cellpadding="0" cellspacing="0" class="bordertable">
        <tr style="display: none">
            <td width="30%" align="right">借阅证卡号：</td>
            <td width="70%" align="left">
                <input name="inde" style="width:150px;height:20px;" class="easyui-validatebox textbox" required="true" validType="length[2,16]">
            </td>
        </tr>
        <tr>
            <td width="30%" align="right">借阅证卡号：</td>
            <td width="70%" align="left">
                <input name="readCard" style="width:150px;height:20px;" class="easyui-validatebox textbox" required="true" validType="length[2,16]">
            </td>
        </tr>
        <tr>
            <td width="30%" align="right">姓名：</td>
            <td width="70%" align="left">
                <input id="name" name="name" style="width:150px;height:20px;" class="easyui-validatebox textbox"
                       required="true" validType="chkPwd[1,32]">
            </td>
        </tr>
        <tr>
            <td width="30%" align="right">身份证号：</td>
            <td width="70%" align="left">
                <input id="ID" name="ID" type="text" name="orgName" style="width:250px"><a style="color:red">*</a>
            </td>
        </tr>
        <tr>
            <td width="30%" align="right">性别：</td>
            <td width="70%" align="left">
                <input type="radio" name="gender" value="1" checked/>男
                <input type="radio" name="gender" value="0" />女
            </td>
        </tr>
        <tr>
            <td width="30%" align="right">会员卡类型：</td>
            <td width="70%" align="left">
                <input name="cardType" class="easyui-textbox"  readonly style="width:150px;height:20px;" maxlength="16">
            </td>
        </tr>
        <tr>
            <td width="30%" align="right">加入时间：</td>
            <td width="70%" align="left">
                <input name="addTime" class="easyui-textbox" style="width:150px;height:20px;" maxlength="32">
            </td>
        </tr>
        <tr>
            <td width="30%" align="right">会员状态：</td>
            <td width="70%" align="left">
                <input name="status" class="easyui-textbox" style="width:150px;height:20px;" maxlength="16">
            </td>
        </tr>
        <tr>
            <td width="30%" align="right">学号：</td>
            <td width="70%" align="left">
                <input name="stuID" class="easyui-textbox" style="width:150px;height:20px;" maxlength="16">
            </td>
        </tr>
        <tr>
            <td width="30%" align="right">借阅证有效期：</td>
            <td width="70%" align="left">
                <input name="deadLine" class="easyui-textbox" style="width:150px;height:20px;" maxlength="16">
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <a href="#" id="btn-back" onclick="closeWindow();" class="easyui-linkbutton"iconCls="icon-back">返回</a>
                <a href="#" id="btn-add" onclick="updateStudent();" class="easyui-linkbutton" iconCls="icon-save">保存</a>
            </td>
        </tr>
    </table>
</form>
<div id="upTreeContent" style="display:none; position: absolute; z-index:1; background: #ffffff; border: 1px solid #808080;
		height:200px; overflow-y:auto;">
    <ul id="upOrgTree" class="ztree" style="margin-left:5; margin-top:0; width:193px;"></ul>
</div>
</body>
</html>