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

<!--#include file="regfirst.asp"--> 

<%
dim notice_ID
notice_ID=trim(request("notice_ID"))
set rsn=server.createobject("adodb.recordset")
sql="select * from notice where notice_ID="&notice_ID
rsn.open sql,conn,1,3
set rsv=server.createobject("adodb.recordset")
sql="select * from notice_viewed where user_account='"&session("user_account")&"' and notice_ID="&notice_ID 
rsv.open sql,conn,1,3
%>
<%
rsn("notice_click")=rsn("notice_click")+1
rsn.update
%>
<%
if not rsv.eof then
rsv("viewed_time")=rsv("viewed_time")+1
rsv.update
rsv.close
set rsv=nothing
else
rsv.addnew
rsv("user_account")=user_account
rsv("notice_ID")=notice_ID
rsv("viewed_time")=rsv("viewed_time")+1
rsv.update
rsv.close
set rsv=nothing
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
<style type="text/css">
<!--
.style14 {color: #006699;
	font-size: 12px;
}
.style14 {color: #006699;
	font-size: 13px;
	font-weight: bold;
}
-->
</style>
<style type="text/css">
<!--
.style9 {font-size: 12px}
-->
</style>
<style type="text/css">
<!--
.style15 {font-size: 12px}
.style15 {color: #FFFF00}
-->
</style>
<!--#include file="top1.asp"-->
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
                            <td height="54" background="userimages/titlebk1.gif"><div align="center"><img src="userimages/notice.gif" width="523" height="45"></div></td>
                          </tr>
                          <tr>
                            <td height="53" background="userimages/titlebk2.gif">&nbsp;</td>
                          </tr>
                          <tr>
                            <td background="userimages/titlebk.gif"><div align="center">
                                <table width="80%"  border="0" cellpadding="0" cellspacing="0" class="thin">
                                  <tr>
                                    <td><table width="100%"  border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                          <td height="25" bgcolor="#CFDBEF"><div align="center" class="style3"><%=rsn("notice_title")%></div></td>
                                        </tr>
                                        <tr>
                                          <td><div align="center">
                                              <table width="80%"  border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                  <td width="39%" height="20" class="style10">发布人：<%=rsn("notice_author")%></td>
                                                  <td width="17%" class="style15"><div align="right"></div></td>
                                                  <td width="44%" class="style15"><div align="right"><span class="style10">发布时间：<%=rsn("notice_time")%></span>&nbsp;&nbsp;</div></td>
                                                </tr>
                                                <tr>
                                                  <td height="20" colspan="3"><div align="left"></div></td>
                                                </tr>
                                                <tr>
                                                  <td colspan="3"><br>
                                                      <span class="style2"><%=HTMLEncode(rsn("notice_content"))%></span><br>
&nbsp;</td>
                                                </tr>
                                              </table>
                                          </div></td>
                                        </tr>
                                    </table></td>
                                  </tr>
                                </table>
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
            <td height="15" valign="top"><div align="right"> </div></td>
          </tr>
          <tr>
            <td valign="top"><div align="right">
                <!--#include file="server.asp"-->
            </div></td>
          </tr>
        </table>
    </div></td>
  </tr>
  <tr>
    <td valign="top" background="../indeximages/loginbk.gif"><div align="center"> </div>
        <div align="center">
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="47" background="../indeximages/stulogin.gif">&nbsp;</td>
            </tr>
            <tr>
              <td><table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="100"><div align="center">
                        <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="../indeximages/loginbk.gif">
                          <tr>
                            <td width="20%"><div align="center"> </div>
                                <div align="center"></div></td>
                            <td width="60%" class="style3"><%=rs("user_account")%>：</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td ><div align="center"> </div>
                                <div align="center"></div></td>
                            <td height="30" class="style2">您已经登录成功,请</td>
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
              </table></td>
            </tr>
            <tr>
              <td height="77" background="../indeximages/links.gif">&nbsp;</td>
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
                    <td height="35"><div align="center"><a href="../links.asp" class="style3">&gt;&gt;&gt; More</a></div></td>
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
    <td height="34" background="../indeximages/loginbottom.gif">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<!--#include file="bottom1.asp"-->
</html>
