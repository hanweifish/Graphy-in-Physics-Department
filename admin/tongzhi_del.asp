<!--#include file="conn.asp"-->

<%
if request.cookies("status")="" then
    Response.write"�Բ�������û�е�½���޴�Ȩ�ޣ�"
	Response.end
end if
%>

<%
if session("admin_account")="" or session("user_group")="subadmin" then
Response.write"�Բ�������û�е�½�����޴�Ȩ�ޣ�"
Response.end
end if
%>
<%
dim admin_account
admin_account=session("admin_account")
%>

<%
dim tongzhi_ID
tongzhi_ID=trim(request("tongzhi_ID"))
set rst=server.createobject("adodb.recordset")
sql="select * from tongzhi where tongzhi_ID="&tongzhi_id
rst.open sql,conn,1,3
%>

<%
rst.delete
rst.close
set rst=nothing
response.redirect "tongzhi_set.asp"
%>