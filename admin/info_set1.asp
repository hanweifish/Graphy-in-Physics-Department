<!--#include file="conn.asp"-->
<%
if request.cookies("status")="" then
    Response.write"�Բ�������û�е�½���޴�Ȩ�ޣ�"
	Response.end
end if
%>
<%
if session("admin_account")="" or session("user_group")<>"admin" then
Response.write"�Բ����޴�Ȩ�ޣ�"
Response.end
end if
%>
<%
dim user_ID,NoncePage
dim user_account,user_name,user_pwd,user_number,user_major,user_grade,user_mail,user_roomphone,user_mobile,user_tutor,user_labphone,user_homephone,user_address,user_code,user_sex,user_birth,user_info
NoncePage=trim(request("NoncePage"))
user_ID=session("user_ID")
user_account=trim(request("user_account"))
user_pwd=trim(request("user_pwd"))
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
sql="select * from user_info where user_id="&user_ID
rs.open sql,conn,1,3
%>
<%
    rs("user_account")=user_account
	rs("user_pwd")=user_pwd
	rs("user_number")=user_number
	rs("user_name")=user_name
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
	rs("user_sex")=user_sex
	rs("user_birth")=user_birth
	rs("user_info")=user_info
	rs.update
	rs.close
	set rs=nothing
	response.redirect "admin_index.asp?page="&NoncePage
%>