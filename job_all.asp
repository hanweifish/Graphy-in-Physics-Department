<!--#include file="conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sql="select top 15 * from job order by job_time desc"
rs.open sql,conn,1,1
%>

<script language="javascript">
window.status="欢迎访问南京大学物理系研究生管理信息系统！"
</script>

<script language="javascript">
	function checkuser(form)
	{
		if (document.form.user_account.value=="")
		{
			alert("请输入用户名！！");
		}
		else if (document.form.user_pwd.value=="")
		{
			alert("请输入密码！!");
		}
		else
		{
			form.submit();
		}
		return false;
	}
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>研究生信息管理系统</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style10 {font-size: 12px;
	color: #004080;
}
-->
</style>
<style type="text/css">
<!--
.style12 {color: #FF0000}
-->
</style>
<!--#include file="top.asp"-->
<table width="800"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="187" height="10"></td>
    <td rowspan="2" valign="top"><div align="right">
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="22"><div align="right"></div></td>
        </tr>
        <tr>
          <td valign="top"><div align="right">
            <table width="603"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="54" background="user/userimages/titlebk1.gif"><div align="center"><img src="indeximages/job.gif" width="523" height="45"></div></td>
              </tr>
              <tr>
                <td height="53" background="user/userimages/titlebk2.gif">&nbsp;</td>
              </tr>
              <tr>
                <td background="user/userimages/titlebk.gif"><div align="center">
                    <table width="90%" height="100%"  border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="top" background="images/bk_marquee.jpg" style="background-repeat: repeat;"><div align="center">
<table width="90%" border="0" cellpadding="0" cellspacing="0" bordercolor="#A8BAFF">
                                    <TBODY>
                                      <tr>
                                        <td colspan="3" height="40"><div align="center"><font class="style3"> ---- 招 聘 信 息 ----</font></div></td>
                                      </tr>
                                      <tr>
                                        <td height="20" colspan="2"><div align="center"></div></td>
                                        <td width="64" height="20"><div align="center">点击数</div></td>
                                      </tr>
                                      <%
if not (rs.eof and rs.bof) then
for i=1 to rs.recordcount
if i mod 2 = 0 then
%>
                                      <tr>
                                        <td width="43" height="20"><img src="indeximages/arrow.gif" width="14" height="12" align="absmiddle"></td>
                                        <td width="382" height="20"><div align="left"><font class="style3"><a href=job_detail.asp?job_ID=<%=rs("job_ID")%>><%=rs("job_title")%></a></font></div></td>
                                        <td width="64" height="20"><div align="center"><%=rs("job_click")%></div></td>
                                      </tr>
<%
else
%>
                                      <tr>
                                        <td width="43" height="20" bgcolor="#FFFFFF"><img src="indeximages/arrow.gif" width="14" height="12" align="absmiddle"></td>
                                        <td height="20" bgcolor="#FFFFFF"><div align="left"><font class="style3"><a href=job_detail.asp?job_ID=<%=rs("job_ID")%>><%=rs("job_title")%></a></font></div></td>
                                        <td width="64" height="20" bgcolor="#FFFFFF"><div align="center"><%=rs("job_click")%></div></td>
                                      </tr>
<%
end if
%>
<%								  
rs.movenext
next
%>
<%
else
%>
                                      <tr>
                                        <td colspan="3"><div align="center"><font class="style3" >暂时没有新的招聘信息发布！</font></div></td>
                                      </tr>
                                      <%
end if
%>
                                    </TBODY>
                                  </TABLE>                        
                        </div></td>
                      </tr>
                    </table>
                </div></td>
              </tr>
              <tr>
                <td height="34" background="user/userimages/titlebk3.gif">&nbsp;</td>
              </tr>
            </table>
          </div></td>
        </tr>
        <tr>
          <td height="15" valign="top"><div align="right">
          </div></td>
        </tr>
        <tr>
          <td valign="top"><div align="right">
        	<!--#include file="server1.asp"-->
		  </div></td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td valign="top" background="indeximages/loginbk.gif"><div align="center">
      </div>      <div align="center">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="47" background="indeximages/stulogin.gif">&nbsp;</td>
          </tr>
          <tr>
            <td><table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="132"><div align="center">
                    <form action="user/user_check.asp" method="post" name="form" id="form">
                      <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="indeximages/loginbk.gif">
                        <tr>
                          <td colspan="2"><div align="center">用户名:
                                  <input name="user_account" type="text" class="style3" id="name" size="12">
                            </div>
                              <div align="left"> </div></td>
                        </tr>
                        <tr>
                          <td height="38" colspan="2"><div align="center">密 &nbsp;码:
                                  <input name="user_pwd" type="password" class="style3" id="pwd" size="12">
                            </div>
                              <div align="left"> </div></td>
                        </tr>
                        <tr>
                          <td width="50%"><div align="right"><img src="indeximages/login.gif" width="49" height="23" border="0" style='cursor:hand' onMouseDown="checkuser(form)">&nbsp;</div></td>
                          <td width="50%"><div align="left">&nbsp;<a href="javascript:void(null)"><img src="indeximages/register.gif" width="49" height="23" border="0"></a></div></td>
                        </tr>
                        <tr>
                          <td height="10"><div align="center"></div></td>
                          <td>&nbsp;</td>
                        </tr>
                      </table>
                    </form>
                </div></td>
              </tr>
              <tr>
                <td height="6" background="indeximages/loginbk.gif"><div align="center"><img src="indeximages/loginbar.gif" width="129" height="2"></div></td>
              </tr>
              <tr>
                <td height="120" valign="center" background="indeximages/loginbk.gif"><div align="center">
                    <iframe src="denote.asp" name="denote" width="140" marginwidth="0" height="110" marginheight="0" align="middle" scrolling="yes" frameborder="0" allowtransparency="true" ></iframe>
                </div></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="77" background="indeximages/links.gif">&nbsp;</td>
          </tr>
          <tr>
            <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
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
                <td height="35"><div align="center"><a href="links.asp" class="style3">&gt;&gt;&gt; More</a></div></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
      </div></td>
    </tr>
  <tr>
    <td height="34" background="indeximages/loginbottom.gif">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<!--#include file="bottom.asp"-->
</html>
