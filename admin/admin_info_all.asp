<!--#include file="conn.asp"-->

<%
if request.cookies("status")="" then
    Response.write"对不起，您还没有登陆，无此权限！"
	Response.end
end if
%>

<%
if session("admin_account")="" or session("user_group")="" then
Response.write"对不起，您还没有登陆，无此权限！"
Response.end
end if
%>

<%
dim admin_account
admin_account=session("admin_account")
%>

<%
set rs=server.createobject("adodb.recordset")
sql="select * from admin_info"
rs.open sql,conn,1,1
%>
<script language="javascript">
	function checkform()
	{
		if (document.form.admin_pwd.value=="")
		{
			alert("请输入密码！");
		}
		else if (document.form.admin_pwd1.value=="")
		{
			alert("请输入确认密码！");
		}
	    else
		{
			return true;
		}
		return false;
	}
</script>
<html>
<head>
<script language="javascript">
window.status="欢迎访问南京大学物理系研究生管理信息系统！"
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>研究生信息管理系统</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style10 {font-size: 12px;
	color: #004080;
}
-->
</style>
<style type="text/css">
<!--
.style12 {color: #006699;
	font-size: 12px;
}
-->
</style>
<style type="text/css">
<!--
.style14 {color: #FF6633;
	font-size: 12px;
}
.style15 {font-size: 11px}
-->
</style>
<style type="text/css">
<!--
.style16 {color: #FF6600}
-->
</style>
<!--#include file="top1.asp"-->
<table width="800"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="187" height="12"></td>
    <td></td>
  </tr>
  <tr>
    <td rowspan="3" valign="top"><table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="47" background="adminimages/adminlogin.gif">&nbsp;</td>
      </tr>
      <tr>
        <td><div align="center">
          <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="100"><div align="center">
                <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="../indeximages/loginbk.gif">
                  <tr>
                    <td width="20%"><div align="center">                      </div>
                         <div align="center"></div></td>
                    <td width="60%" class="style3"><%=admin_account%>：</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td ><div align="center">                      </div>
                         <div align="center"></div></td>
                    <td height="30" class="style2">您已经<span class="style2">登录成功</span>,可</td>
                         <td>&nbsp;</td>
                   </tr>
                  <tr>
                    <td><div align="center"></div></td>
                    <td height="30" class="style2">以正常维护网站!</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="10" colspan="2"><div align="center"></div></td>
                    <td width="20%">&nbsp;</td>
                  </tr>
                </table>
                </div></td>
            </tr>
            <tr>
              <td height="6" background="../indeximages/loginbk.gif"><div align="center"><img src="../indeximages/loginbar.gif" width="129" height="2"></div></td>
            </tr>
            <tr>
              <td height="60" valign="center" background="../indeximages/loginbk.gif"><div align="center"><a href="admin_logout.asp"><img src="../includeimages/logout.gif" width="60" height="24" border="0"></a></div></td>
            </tr>
          </table>
        </div></td>
      </tr>
      <tr>
        <td height="77" background="../indeximages/links.gif">&nbsp;</td>
      </tr>
      <tr>
        <td background="../indeximages/loginbk.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><div align="center">
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="25"><div align="center"></div></td>
                  </tr>
                  <script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
        </script>
                  <tr>
                    <td height="50"><div align="center">
                        <form name="links">
                          <select name="links" class="style2" onChange="window.open(this.value)">
                            <option value="javascript:void(null);" selected>----校内链接----</option>
                            <option value="http://www.nju.edu.cn/">南京大学</option>
                            <option value="http://lily.nju.edu.cn/">南大小百合</option>
                            <option value="http://grawww.nju.edu.cn/">研究生院</option>
                            <option value="http://physics.nju.edu.cn/">物理学系</option>
                            <option value="http://job.nju.edu.cn/">就业指导中心</option>
                          </select>
                        </form>
                    </div></td>
                  </tr>
                  <tr>
                    <td height="50"><div align="center">
                        <form name="links">
                          <select name="links" class="style2" onChange="window.open(this.value)">
                            <option value="javascript:void(null);" selected>---实验室链接---</option>
                            <option value="http://biophy.nju.edu.cn ">生物物理实验室</option>
                            <option value="http://pld.nju.edu.cn ">PLD实验室</option>
                            <option value="http://x.nju.edu.cn/">邢定钰小组</option>
                          </select>
                        </form>
                    </div></td>
                  </tr>
                  <tr>
                    <td height="50"><div align="center">
                        <form name="links">
                          <select name="links" class="style2" onChange="window.open(this.value)">
                            <option value="javascript:void(null);" selected>----校外链接----</option>
                            <option value="http://www.njbys.com/">南京毕业生就业网</option>
                            <option value="http://www.jsbys.com.cn/index.aspx">江苏毕业生就业网</option>
                            <option value="http://www.firstjob.com.cn/">上海毕业生就业网</option>
                          </select>
                        </form>
                    </div></td>
                  </tr>
                </table>
            </div></td>
          </tr>
          <tr>
            <td height="35"><div align="center"><a href="../links.asp" class="style3">&gt;&gt;&gt; More</a></div></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="34" background="../indeximages/loginbottom.gif">&nbsp;</td>
      </tr>
    </table></td>
    <td valign="top"><div align="right">
      <table width="603"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="406" height="10">&nbsp;</td>
            <td width="406" background="../indeximages/midLinkTop.gif">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3"><div align="center">
              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="54" background="adminimages/titlebk1.gif"><div align="center">
                      <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td><div align="center"><img src="adminimages/admininfo.gif" width="523" height="45"></div></td>
                          </tr>
                      </table>
                    </div></td>
                  </tr>
                  <tr>
                    <td height="86" background="adminimages/titlebk2.gif"><div align="center" class="style2"></div></td>
                  </tr>
                  <tr>
                    <td background="../user/userimages/titlebk.gif"><div align="center">
                      <table width="90%"  cellspacing="0" cellpadding="0">
                        <tr>
                          <td><div align="center">
                              </div></td>
                        </tr>
                        <tr>
                          <td><div align="center">
                              <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td height="25" colspan="6"><div align="center" class="style8 style9">管理员信息列表</div></td>
                                </tr>
                                <tr>
                                  <td colspan="6"><table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#000000" class="thin">
                                      <tr>
                                        <td width="100" height="24"><div align="center" class="style10">帐号</div></td>
                                        <td width="100" height="24"><div align="center" class="style10">密码</div></td>
                                        <td height="24"><div align="center" class="style10">权限级别</div></td>
                                        <td width="50" height="24"><div align="center" class="style10">修改</div></td>
                                        <td width="50" height="24"><div align="center" class="style10">删除</div></td>
                                      </tr>
                                      <%if Not(rs.bof and rs.eof) then
 	for i=1 to rs.RecordCount
%>
                                      <tr>
                                        <td width="100" height="24"><div align="left" class="style10">&nbsp;&nbsp;&nbsp;&nbsp;<%=rs("admin_account")%></div></td>
                                        <td width="100" height="24"><div align="left" class="style10">&nbsp;&nbsp;&nbsp;&nbsp;<%=rs("admin_pwd")%></div></td>
                                        <td height="24"><div align="center" class="style10"><%=rs("user_group")%></div></td>
                                        <td width="50" height="24"><div align="center"><a href=admin_mod.asp?admin_ID=<%=rs("admin_ID")%>><font color="#ff6633">修改</font></a></div></td>
                                        <td width="50" height="24"><div align="center"><a href=admin_del.asp?admin_ID=<%=rs("admin_ID")%>><font color="#ff6633">删除</font></a></div></td>
                                      </tr>
                                      <%rs.movenext
next
else
	response.write "<tr><td colspan=13 height='25'><marquee scrolldelay=120 behavior=alternate><font class='style5' color='#ff6633'>目前还没有添加管理员助手!!!</font></marquee></td></tr>"
end if	
rs.close
set rs=nothing
%>
                                      <tr bgcolor="#66CCFF"> </tr>
                                  </table></td>
                                </tr>
                                <tr>
                                  <td height="25" colspan="6"><div align="center"><a href="admin_add.asp" class="style6">添加新管理员</a></div></td>
                                </tr>
                              </table>
                          </div></td>
                        </tr>
                      </table>
                      </div></td>
                  </tr>
                  <tr>
                    <td height="40" background="adminimages/titlebk3.gif">&nbsp;</td>
                  </tr>
                  </table>
            </div></td>
            </tr>
          </table>
    </div></td>
  </tr>
  <tr>
    <td height="15" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">
      <div align="right">
        <!--#include file="server.asp"-->        

      </div></td>
  </tr>
  <tr>
    <td height="12"></td>
    <td></td>
  </tr>
</table>
<!--#include file="bottom1.asp"-->
</html>
