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
dim user_account
user_account=session("user_account")
set rs=server.createobject("adodb.recordset")
sql="select * from user_info where user_account='"&user_account&"'"
rs.open sql,conn,1,1
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
	function checkuser()
	{
		var msg = "";
		if(document.form.user_account.value.length < 6)
			{
				msg = msg + "     请输入用户名!\n\n";
			}
		if(document.form.user_pwd.value.length == "")
			{
				msg = msg + "   请输入6-12位密码!\n\n";
			}
		if(document.form.user_pwd.value != ""&&(document.form.user_pwd.value.length < 6 || document.form.user_pwd.value.length > 12))
			{
				msg = msg + "  密码长度要大于6小于12!\n\n";
			}
		if(document.form.user_pwd1.value == "")
			{
				msg = msg + "    请输入确认密码!\n\n";
			}
		if(document.form.user_pwd1.value != ""&&(document.form.user_pwd1.value.length < 6 || document.form.user_pwd1.value.length > 16))
			{
				msg = msg + "确认密码长度要大于6小于12!\n\n";
			}
		if(document.form.user_pwd.value != document.form.user_pwd1.value)
			{
				msg = msg + " 两次输入的密码不匹配!\n\n";
			}
		if(document.form.user_name.value < 2)
			{
				msg = msg + "    请正确输入姓名!\n\n";
			}
		if(document.form.user_number.value == "")
			{
				msg = msg + "      请输入学号!\n\n";
			}
		if(document.form.user_roomphone.value.length < 8||document.form.user_roomphone.value == "待添加")
			{
				msg = msg + "    请输入宿舍电话!\n\n";
			}
		if(!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(document.form.user_mail.value)||document.form.user_mail.value =="待添加")
			{
				msg = msg + "    请正确输入邮箱!\n\n";
			}
		if(document.form.user_tutor.value.length < 2||document.form.user_tutor.value == "待添加")
			{
				msg = msg + "    请输入导师姓名!\n\n";
			}
		if(document.form.user_address.value == ""||document.form.user_address.value == "待添加")
			{
				msg = msg + "      请输入地址!\n\n";
			}
		if(document.form.user_code.value.length != 6||document.form.user_code.value == "待添加")
			{
				msg = msg + "      请输入邮编!\n\n";
			}
		if(document.form.user_birth.value.length < 8||document.form.user_birth.value == "待添加")
			{
				msg = msg + "      请输入生日!\n\n";
			}
		if(msg !="") 
			{
				alert(msg);
				return false;
			}
		document.form.submit();
	}
</script>

<html>
<head>
<script language="javascript">
<!--

window.status="欢迎访问南京大学物理系研究生管理信息系统！"
//-->
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
.style13 {color: #FF0000}
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
        <td height="47" background="../indeximages/stulogin.gif">&nbsp;</td>
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
                    <td width="60%" class="style3"><%=rs("user_account")%>：</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td ><div align="center">                      </div>
                         <div align="center"></div></td>
                    <td height="30" class="style2">您已经<span class="style2">登录成功</span>,请</td>
                         <td>&nbsp;</td>
                   </tr>
                  <tr>
                    <td><div align="center"></div></td>
                    <td height="30" class="style2">选择您需要的服务!</td>
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
              <td height="60" valign="center" background="../indeximages/loginbk.gif"><div align="center"><a href="user_logout.asp"><img src="../includeimages/logout.gif" width="60" height="24" border="0"></a></div></td>
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
                    <td height="54" background="userimages/titlebk1.gif"><div align="center"><img src="userimages/stuinfo.gif" width="523" height="45"></div></td>
                  </tr>
                  <tr>
                    <td height="53" background="userimages/titlebk2.gif">&nbsp;</td>
                  </tr>
                  <tr>
                    <td background="userimages/titlebk.gif"><div align="center">
                      <form name="form" method="post" action="info_reg1.asp">
                        <div align="center">
                          <table width="90%" height="100%" border="0" cellpadding="0" cellspacing="0" class="thin">
                            <tr>
                              <td width="18%" height="24"><div align="right" class="style10">用户名：&nbsp;&nbsp;</div></td>
                              <td width="32%" class="style10"><input name="user_account" type="text" class="style3" value="<%=rs("user_account")%>" size="24">
                                  <span class="style13">*</span> </td>
                              <td width="50%" rowspan="9" valign="top" class="style10"><div align="center">
                                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td>
									    <div align="center">
									      <iframe src="denote.asp" name="denote" width="200" marginwidth="0" height="200" marginheight="0" align="middle" scrolling="yes" frameborder="1" allowtransparency="true" ></iframe>
          						      </div></td>
                                  </tr>
                                </table>
                              </div></td>
                            </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">密码：&nbsp;&nbsp;</div></td>
                              <td class="style10">
                                <input name="user_pwd" type="password" class="style3" size="26" >
                                  <span class="style13">*</span> </td>
                              </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">密码确认：&nbsp;&nbsp;</div></td>
                              <td class="style10"><input name="user_pwd1" type="password" class="style3"  size="26" >
                                  <span class="style13">*</span> </td>
                              </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">姓名：&nbsp;&nbsp;</div></td>
                              <td class="style10"><input name="user_name" type="text" class="style3" value="<%=rs("user_name")%>" size="24" >
                                  <span class="style13">*</span> </td>
                              </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">学号：&nbsp;&nbsp;</div></td>
                              <td class="style10">
                                  <input name="user_number" type="text" class="style3" value="<%=rs("user_number")%>" size="24" >
                                  <span class="style13">*</span> </td>
                              </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">专业：&nbsp;&nbsp;</div></td>
                              <td class="style10">
                                  <select name="user_major" class="style3" id="user_major">
                                    <option value="理论物理" selected>理论物理</option>
                                    <option value="光学">光学</option>
                                    <option value="生物物理">生物物理</option>
                                    <option value="光学工程">光学工程</option>
                                    <option value="粒子物理">粒子物理</option>
                                    <option value="凝聚态物理">凝聚态物理</option>
                                    <option value="制冷">制冷</option>
                                    <option value="微电子">微电子</option>
                                  </select>
                                  <span class="style13">*</span></td>
                              </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">年级：&nbsp;&nbsp;</div></td>
                              <td class="style10">
                                  <select name="user_grade" class="style3" id="user_grade">
                                    <option value="研一" selected>研一</option>
                                    <option value="研二">研二</option>
                                    <option value="研三">研三</option>
                                  </select>
                                  <span class="style13">*</span></td>
                              </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">E-mail：&nbsp;&nbsp;</div></td>
                              <td class="style10">
                                  <input name="user_mail" type="text" class="style3" value="<%=rs("user_mail")%>" size="24" >
                                  <span class="style13">*</span> </td>
                              </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">BBS帐号：&nbsp;&nbsp;</div></td>
                              <td class="style10">
                                  <input name="user_bbs" type="text" class="style3" id="user_bbs" value="<%=rs("user_bbs")%>" size="24" >                                  </td>
                              </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">宿舍电话：&nbsp;&nbsp;</div></td>
                              <td colspan="2" class="style10">
                                  <input name="user_roomphone" type="text" class="style3" value="<%=rs("user_roomphone")%>" size="24" >
                                  <span class="style13">*</span> （形式：025-83594521） </td>
                            </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">手机：&nbsp;&nbsp;</div></td>
                              <td colspan="2" class="style10">
                                  <input name="user_mobile" type="text" class="style3" value="<%=rs("user_mobile")%>" size="24" >
                              </td>
                            </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">导师：&nbsp;&nbsp;</div></td>
                              <td colspan="2" class="style10">
                                  <input name="user_tutor" type="text" class="style3" value="<%=rs("user_tutor")%>" size="24" >
                                  <span class="style13">*</span> </td>
                            </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">实验室电话：&nbsp;&nbsp;</div></td>
                              <td colspan="2" class="style10">
                                  <input name="user_labphone" type="text" class="style3" value="<%=rs("user_labphone")%>" size="24" >
&nbsp;&nbsp;（形式：025-83594521） </td>
                            </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">家庭电话：&nbsp;&nbsp;</div></td>
                              <td colspan="2" class="style10">
                                  <input name="user_homephone" type="text" class="style3" value="<%=rs("user_homephone")%>" size="24" >
                                  <span class="style13">*</span>&nbsp;&nbsp;（形式：025-83594521） </td>
                            </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">家庭地址：&nbsp;&nbsp;</div></td>
                              <td colspan="2" class="style10"><input name="user_address" type="text" class="style3" value="<%=rs("user_address")%>" size="24" >
                                <span class="style13">*</span>                              </td>
                            </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">邮编：&nbsp;&nbsp;</div></td>
                              <td colspan="2" class="style10">
                                  <input name="user_code" type="text" class="style3" value="<%=rs("user_code")%>" size="24" >
                                  <span class="style13">*</span>                              </td>
                            </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">性别：&nbsp;&nbsp;</div></td>
                              <td colspan="2" class="style10">
                                  <input name="user_sex" type="radio" class="style3" value="男" checked>
          男
          <input name="user_sex" type="radio" class="style3" value="女">
          女 <span class="style13">*</span> </td>
                            </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">生日：&nbsp;&nbsp;</div></td>
                              <td colspan="2" class="style10">
                                  <input name="user_birth" type="text" class="style3" value="<%=rs("user_birth")%>" size="24" >
&nbsp;&nbsp;（形式：1982-08-09） </td>
                            </tr>
                            <tr>
                              <td height="24"><div align="right" class="style10">备注：&nbsp;&nbsp;</div></td>
                              <td colspan="2" class="style10"><textarea name="user_info" cols="45" rows="10"><%=HTMLEncode(rs("user_info"))%></textarea>
                              </td>
                            </tr>
                            <tr>
                              <td height="35" colspan="3"><div align="center"><img src="userimages/editSub.gif" width="70" height="25" align="absmiddle" style="cursor:hand; " onclick="javascript:checkuser()">
                              </div></td>
                            </tr>
                          </table>
                        </div>
                      </form>
                    </div></td>
                  </tr>
                  <tr>
                    <td height="34" background="userimages/titlebk3.gif">&nbsp;</td>
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
