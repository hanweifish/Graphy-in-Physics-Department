<!--#include file="conn.asp"-->
<%
if request.cookies("status")="" then
    Response.write"对不起，您还没有登陆，无此权限！"
	Response.end
end if
%>

<%
if session("admin_account")="" or session("user_group")="subadmin" then
Response.write"对不起，您还没有登陆或者无此权限！"
Response.end
end if
dim admin_account
admin_account=session("admin_account")
%>


<%
dim user_account,user_name,user_pwd,user_pwd1,user_number,user_major,user_grade,user_mail,user_roomphone,user_mobile,user_tutor,user_labphone,user_homephone,user_address,user_code,user_sex,user_birth,user_info
user_account=trim(request("user_account"))
user_pwd=trim(request("user_pwd"))
user_pwd1=trim(request("user_pwd1"))
user_name=trim(request("user_name"))
user_number=trim(request("user_number"))
user_major=trim(request("user_major"))
user_grade=trim(request("user_grade"))
user_mail=trim(request("user_mail"))
user_mobile=trim(request("user_mobile"))
user_bbs=trim(request("user_bbs"))
user_roomphone=trim(request("user_roomphone"))
user_tutor=trim(request("user_tutor"))
user_labphone=trim(request("user_labphone"))
user_homephone=trim(request("user_homephone"))
user_address=trim(request("user_address"))
user_code=trim(request("user_code"))
user_sex=trim(request("user_sex"))
user_birth=trim(request("user_birth"))
user_info=trim(request("user_info"))
set rs=server.createobject("adodb.recordset")
sql="select * from user_info where user_account='"&user_account&"'"
rs.open sql,conn,1,3
%>
<%
if not rs.eof then
Response.Write "<script> alert('该用户已经存在！！');parent.window.history.go(-1);</script>"
Response.end
end if
if user_pwd<>user_pwd1 then
Response.Write"<script>alert('两次输入的密码不匹配！');parent.window.history.go(-1)</script>"
else
    rs.addnew
	rs("user_account")=user_account
	rs("user_pwd")=user_pwd
	rs("user_number")=user_number
	rs("user_name")=user_name
	rs("user_major")=user_major
	rs("user_grade")=user_grade
	rs("user_mail")=user_mail
	rs("user_mobile")=user_mobile
	rs("user_roomphone")=user_roomphone
	rs("user_tutor")=user_tutor
	rs("user_address")=user_address
	rs("user_code")=user_code
	rs("user_homephone")=user_homephone
	rs("user_labphone")=user_labphone
	rs("user_sex")=user_sex
	rs("user_birth")=user_birth
	rs("user_info")=user_info
	session("user_account")=user_account
	response.cookies("status")="statuson"
	rs.update
	rs.close
	set rs=nothing
	response.redirect "admin_index.asp"
end if
%>