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
function HTMLEncode(fString)
if not isnull(fString) then
    fString = replace(fString, ">", "&gt;")
    fString = replace(fString, "<", "&lt;")

    fString = Replace(fString, CHR(32), "&nbsp;")
    fString = Replace(fString, CHR(34), "&quot;")
    fString = Replace(fString, CHR(39), "&#39;")
    fString = Replace(fString, CHR(13), "")
    fString = Replace(fString, CHR(10) & CHR(10), "</P><P> ")
    fString = Replace(fString, CHR(10), "<BR> ")
    HTMLEncode = fString
end if
end function
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

<script language="javascript">
	function checkuser1()
	{
		if (document.form1.site_admin.value=="")
		{
			alert("请输入用户名！");
		}
		else if (document.form1.site_pwd.value=="")
		{
			alert("请输入密码！");
		}
		else if (document.form1.site_pwd1.value=="")
		{
			alert("请输入确认密码！");
		}
		else if (document.form1.site_name.value=="")
		{
			alert("请输入站名！");
		}
		else if (document.form1.site_url.value=="")
		{
			alert("请输入主页地址！");
		}
		else
		{
			return true;
		}
		return false;
	}
</script>

<script language="javascript">
function submitform(form1){
	if(checkuser1())
		form1.submit();
	else
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
.style13 {font-size: 24px}
-->
</style>
<style type="text/css">
<!--
.style10 {font-size: 12px;
	color: #004080;
}
.style12 {color: #FF0000}
-->
</style>
<!--#include file="top.asp"-->
<table width="800"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="187" height="12"></td>
    <td></td>
  </tr>
  <tr>
    <td rowspan="2" valign="top"><table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="47" background="indeximages/stulogin.gif">&nbsp;</td>
      </tr>
      <tr>
        <td><div align="center">
          <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="132"><div align="center">
                <form action="user/user_check.asp" method="post" name="form" id="form">
                  <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="indeximages/loginbk.gif">
                    <tr>
                      <td colspan="2"><div align="center">用户名:
                          <input name="user_account" type="text" class="style3" id="name" size="12">
                      </div>
                        <div align="left">                        </div></td>
                      </tr>
                    <tr>
                      <td height="38" colspan="2"><div align="center">密 &nbsp;码:
                          <input name="user_pwd" type="password" class="style3" id="pwd" size="12"> 
                        </div>
                        <div align="left">                        </div></td>
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
              <td height="120" valign="center" background="indeximages/loginbk.gif"><div align="center"><iframe src="denote.asp" name="denote" width="150" marginwidth="0" height="120" marginheight="0" align="middle" scrolling="yes" frameborder="0" allowtransparency="true" ></iframe>
              </div></td>
            </tr>
          </table>
        </div></td>
      </tr>
      <tr>
        <td height="77" background="indeximages/links.gif">&nbsp;</td>
      </tr>
      <tr>
        <td background="indeximages/loginbk.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
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
        <td height="34" background="indeximages/loginbottom.gif">&nbsp;</td>
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
                  <td height="54" background="user/userimages/titlebk1.gif"><div align="center"><img src="indeximages/siteReg.gif" width="523" height="45"></div></td>
                </tr>
                <tr>
                  <td height="53" background="user/userimages/titlebk2.gif">&nbsp;</td>
                </tr>
                <tr>
                  <td background="user/userimages/titlebk.gif"><div align="center" class="style13">
                    <table width="90%"  border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td><form action="siteRegCheck.asp" method="post" name="form1" id="form1">
                            <div align="center">
                              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td width="120" height="24"><div align="right" class="style10">用户名：&nbsp;&nbsp;</div></td>
                                  <td width="261" class="style10">&nbsp;&nbsp;&nbsp;
                                      <input name="site_admin" type="text" class="style3" id="site_admin" size="24">
                                      <span class="style12">*</span> </td>
                                  <td width="162" rowspan="6" class="style10"><div align="center">
                                      <marquee behavior="scroll" direction="up" width="150" height="150" loop="-1" scrollamount="1" scrolldelay="1">
                                      <table width="100%" height="100"  border="0" cellpadding="0" cellspacing="0">
                                        <tr>&nbsp;
                                            <td height="25" valign="top"><div align="center" class="style3">注册须知</div></td>
                                        </tr>
                                        <tr>
                                          <td valign="top"><li class="style2">注册时请提交自己的个人主页相关信息；</li>
                                              <br>
                                              <br>
                                              <br>
                                              <li class="style2">本站不提供空间和域名等相关服务。</li></td>
                                        </tr>
                                      </table>
                                      </marquee>
                                  </div></td>
                                </tr>
                                <tr>
                                  <td width="120" height="24"><div align="right" class="style10">密码：&nbsp;&nbsp;</div></td>
                                  <td class="style10">&nbsp;&nbsp;&nbsp;
                                      <input name="site_pwd" type="password" class="style3" id="site_pwd" size="24">
                                      <span class="style12">*</span> </td>
                                </tr>
                                <tr>
                                  <td width="120" height="24"><div align="right" class="style3" size="24">密码确认：&nbsp;&nbsp;</div></td>
                                  <td class="style10">&nbsp;&nbsp;&nbsp;
                                      <input name="site_pwd1" type="password" class="style3" id="site_pwd1" size="24">
                                      <span class="style12">*</span> </td>
                                </tr>
                                <tr>
                                  <td width="120" height="24"><div align="right" class="style10">站 名：&nbsp;&nbsp;</div></td>
                                  <td class="style10">&nbsp;&nbsp;&nbsp;
                                      <input name="site_name" type="text"class="style3" id="site_name" size="24">
                                      <span class="style12">*</span> </td>
                                </tr>
                                <tr>
                                  <td width="120" height="24"><div align="right" class="style10">地 址(url)：&nbsp;&nbsp;</div></td>
                                  <td class="style10">&nbsp;&nbsp;&nbsp;
                                      <input name="site_url" type="text" class="style3" id="site_url" size="24">
                                      <span class="style12">*</span> </td>
                                </tr>
                                <tr>
                                  <td width="120" height="24"><div align="right" class="style10">备注信息：&nbsp;&nbsp;</div></td>
                                  <td class="style10">&nbsp;&nbsp;&nbsp;
                                    <textarea name="site_info" cols="30" rows="4" id="site_info"></textarea></td>
                                </tr>
                                <tr>
                                  <td height="35" colspan="3"><div align="center"><img src="indeximages/register.gif" width="49" height="23" style="cursor:hand;" onMouseDown="submitform(form1);"></div></td>
                                </tr>
                              </table>
                            </div>
                            <table width="100%">
                              <tr>
                                <td>&nbsp;
                                </td>
                              </tr>
                            </table>
                        </form></td>
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
          <td height="10" colspan="3"></td>
        </tr>
        <tr>
          <td colspan="3">	<div align="right">
<!--#include file="server.asp"-->
	</div>
</td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td rowspan="2" valign="top">
	</td>
  </tr>
  <tr>
    <td height="12"></td>
    </tr>
</table>
<!--#include file="bottom.asp"-->
</html>
