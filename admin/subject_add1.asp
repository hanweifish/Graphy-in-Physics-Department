<!--#include file="conn.asp"-->
<%
if request.cookies("status")="" then
    Response.write"对不起，您还没有登陆，无此权限！"
	Response.end
end if
%>
<%
if session("admin_account")="" then
    Response.write"对不起，您还没有登陆，无此权限！"
	Response.end
end if
%>
<%
dim course,tutor,credit,term,teachway
course=trim(request("course"))
tutor=trim(request("tutor"))
credit=trim(request("credit"))
term=trim(request("term"))
teachway=trim(request("teachway"))
set rs=server.createobject("adodb.recordset")
sql="select * from subject where tutor='"&tutor&"' and credit = '"&credit&"' and course='"&course&"'"
rs.open sql,conn,1,3
%>
<%
if not rs.eof then
Response.Write "<script> alert('该课程已经存在！！');parent.window.history.go(-1);</script>"
Response.end
else
    rs.addnew
    rs("course")=course
	rs("tutor")=tutor
	rs("credit")=credit
	rs("term")=term
	rs("teachway")=teachway
	rs.update
	rs.close
	set rs=nothing
	response.redirect "subject_set.asp"
end if
%>