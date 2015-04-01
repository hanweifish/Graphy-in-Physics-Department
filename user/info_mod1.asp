<!--#include file="conn.asp"-->
<%
if request.cookies("status")="" then
    Response.write"对不起，您还没有登陆，无此权限！"
	Response.end
end if
%>

<%
if session("user_account")="" then
    Response.write"对不起，您还没有登陆，无此权限！"
	Response.end
end if
%>
<%
dim user_account,user_pwd,user_pwd1,user_major,user_grade,user_mail,user_roomphone,user_mobile,user_tutor,user_labphone,user_homephone,user_address,user_code,user_birth,user_info,user_sex
user_account=session("user_account")
user_pwd=trim(request("user_pwd"))
user_pwd1=trim(request("user_pwd1"))
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
user_birth=trim(request("user_birth"))
user_info=trim(request("user_info"))
user_sex=trim(request("user_sex"))
set rs=server.createobject("adodb.recordset")
sql="select * from user_info where user_account='"&user_account&"'"
rs.open sql,conn,1,3
%>
<%
if user_pwd<>user_pwd1 then
		response.write "<script>alert('两次输入的密码不匹配！');history.go(-1)</script>"
		response.end
	else
	rs("user_pwd")=user_pwd
	rs("user_major")=user_major
	rs("user_grade")=user_grade
	rs("user_mail")=user_mail
	rs("user_mobile")=user_mobile
	rs("user_bbs")=user_bbs
	rs("user_roomphone")=user_roomphone
	rs("user_tutor")=user_tutor
	rs("user_address")=user_address
	rs("user_code")=user_code
	rs("user_homephone")=user_homephone
	rs("user_labphone")=user_labphone
	rs("user_birth")=user_birth
	rs("user_info")=user_info
	rs("user_sex")=user_sex
	rs.update
	rs.close
	set rs=nothing
	response.redirect "user_index.asp"
end if
%>