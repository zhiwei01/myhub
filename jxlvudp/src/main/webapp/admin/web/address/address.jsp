<%--
  Created by IntelliJ IDEA.
  User: heying
  Date: 2017/10/29
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/header/init_layui.jsp"%>
<html>
<head>
    <title>地址信息维护</title>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>/plugins/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>/plugins/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript"src="<%=basePath%>/static/js/html5media.min.js"></script>

</head>
<body style="padding-top: 10px">
<form class="layui-form" id="ff">
    <input type="hidden" name="oldId"/>
    <div class="layui-form-item">
        <label class="layui-form-label">编号：</label>
        <div class="layui-input-block">
            <input id="id" name="id" required style="width:500px;" lay-verify="required" autocomplete="off" placeholder="请输入地址的编号" class="layui-input" type="text" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收货人：</label>
        <div class="layui-input-block">
            <input name="name" required style="width:500px;" lay-verify="required" autocomplete="off" placeholder="请输入收货人名称" class="layui-input" type="text">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话：</label>
        <div class="layui-input-block">
            <input  name="tel" required style="width:500px;" lay-verify="required" autocomplete="off" placeholder="请输入收货人电话" class="layui-input" type="text" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮政：</label>
        <div class="layui-input-block">
            <input name="post" required style="width:500px;" lay-verify="required" autocomplete="off" placeholder="请输入快递邮政" class="layui-input" type="text" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址：</label>
        <div class="layui-input-block">
            <input  name="address" required style="width:500px;" lay-verify="required" autocomplete="off" placeholder="请输入收货人地址" class="layui-input" type="text" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">发货时间：</label>
        <div class="layui-input-block">
            <input  name="sendtime" required style="width:500px;" lay-verify="required" autocomplete="off" placeholder="请输入发货时间" class="layui-input" type="text" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否发送：</label>
        <div class="layui-input-block">
            <input  name="issend" required style="width:500px;" lay-verify="required" autocomplete="off" placeholder="请选择是否发送" class="layui-input" type="text" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否默认：</label>
        <div class="layui-input-block">
            <input  name="isdefault" required style="width:500px;" lay-verify="required" autocomplete="off" placeholder="请输入是否默认" class="layui-input" type="text" >
        </div>
    </div>

    <div class="layui-form-item" id="dButton">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>


<script>
    function closeParent() {
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
        parent.find(null);
    }
    var kb=new KBLayUI("address");
    var parentId=getURLParamValue("parentId");
    var type=getURLParamValue("type");//获取操作类型，0表示新增，其他表示修改
    if (parentId!=undefined)
    {
        $("#txtParentID").val(parentId);
        $("#txtParent").val(unescape(getURLParamValue("name")));
    }
    if (type==2)//表示浏览
    {
        $("#dButton").hide();
    }

    kb.doFormLayui("formDemo",function () {
        var obj=serializeArrayToObject("ff");

        if (type==0)
            kb.add(obj,function (returnBack) {
                if (returnBack.code>0)
                {
                    closeParent();
                }
            });
        else
            kb.edit(obj,function (returnBack) {
                if (returnBack.code>0)
                    closeParent();
            });
    });
    $(function () {
        /*完成站点加载，如果是不是新增，要实现数据选中*/
        doData("webSite/find",null,function (data) {
            if (data!=null && data.obj!=undefined && data.obj!=null)
                for(var i=0;i<data.obj.length;i++)
                {
                    $("#sltWeb").append("<option value='"+data.obj[i].id+"'>"+data.obj[i].name+"</option>");
                }
            if(type!=0)
                kb.getMe(getURLParamValue("id"),function (data) {
                    $('#ff').form('load', data);//导入修改的数据，并绑定在界面上
                    if (data.parent!=null)
                    {
                        $("#ckUse").attr("checked", true);
                        $("#txtParentID").val(data.parent.id);
                        $("#txtParent").val(data.parent.name);
                    }
                    else
                    {
                        $("#ckUse").attr("checked",false);
                        $("#txtParentID").val("");
                        $("#txtParent").val("");
                    }
                    $("#sltWeb").find("option[value='"+data.web.id+"']").attr("selected","selected");

                    layui.use(['form'],function () {
                        var form=layui.form;
                        form.render('select'); //刷新select选择框渲染
                    });
                });
            layui.use(['form'],function () {
                var form=layui.form;
                form.render('select'); //刷新select选择框渲染
            });
        });
    });
</script>
</body>
</html>
