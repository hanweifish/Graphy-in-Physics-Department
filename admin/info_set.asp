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
dim admin_account,user_id,NoncePage
NoncePage=trim(request("NoncePage"))
user_id=trim(request("user_ID"))
session("user_ID")=user_id
admin_account=session("admin_account")
set rs=server.createobject("adodb.recordset")
sql="select * from user_info where user_id="&user_id
rs.open sql,conn,1,1
%>

<html>
<head>
<script language="javascript">
window.status="��ӭ�����Ͼ���ѧ����ϵ�о���������Ϣϵͳ��"
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�о�����Ϣ����ϵͳ</title>
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
    <td width="187" height="3"></td>
    <td rowspan="2" valign="top"><div align="right">
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="5"><div align="right"></div></td>
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
                        <td height="54" background="adminimages/titlebk1.gif"><div align="center">
                            <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td><div align="center"><a href="ynumber_set.asp"><img src="adminimages/numextent.gif" width="134" height="24" border="0"></a></div></td>
                                <td><div align="center"><a href="info_search.asp"><img src="adminimages/stuquerry.gif" width="134" height="24" border="0"></a></div></td>
                                <td><div align="center"><a href="info_add.asp"><img src="adminimages/infoadd.gif" width="134" height="24" border="0"></a></div></td>
                              </tr>
                            </table>
                        </div></td>
                      </tr>
                      <tr>
                        <td height="86" background="adminimages/titlebk2.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="45"><div align="center"><img src="adminimages/stuinfo.gif" width="523" height="45"></div></td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td background="../user/userimages/titlebk.gif"><div align="center">
                            <table width="90%"  border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td colspan="6" valign="top"><div align="center">
                                    <form name="form" method="post" action="info_set1.asp?NoncePage=<%=NoncePage%>">
                                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="thin">
                                        <tr>
                                          <td width="32%" height="24"><div align="right" class="style10">�û�����&nbsp;&nbsp;</div></td>
                                          <td width="68%" class="style10">&nbsp;&nbsp;&nbsp;
                                              <input type="text" name="user_account" value="<%=rs("user_account")%>" size="24" class="style3">
                                              <span class="style13">*</span> </td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">���룺&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <input type="text" name="user_pwd" size="24" class="style3" value="<%=rs("user_pwd")%>">
                                              <span class="style13">*</span> </td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">������&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <input type="text" name="user_name" value="<%=rs("user_name")%>" size="24" class="style3">
                                              <span class="style13">*</span> </td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">ѧ�ţ�&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <input type="text" name="user_number" value="<%=rs("user_number")%>" size="24" class="style3">
                                              <span class="style13">*</span> </td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">���գ�&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <input type="text" name="user_birth" value="<%=rs("user_birth")%>" size="24" class="style3">
                                              <span class="style13">*</span>����ʽ��1982-08-09�� </td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">רҵ��&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <select name="user_major" class="style3" id="user_major">
                                                <%
if rs("user_major") = "��������" then
%>
                                                <option value="��������" selected>��������</option>
                                                <option value="��ѧ">��ѧ</option>
                                                <option value="��������">��������</option>
                                                <option value="��ѧ����">��ѧ����</option>
                                                <option value="��������">��������</option>
                                                <option value="����̬����">����̬����</option>
                                                <option value="����">����</option>
                                                <option value="΢����">΢����</option>
                                                <%
elseif rs("user_major") = "��ѧ" then
%>
                                                <option value="��������">��������</option>
                                                <option value="��ѧ" selected>��ѧ</option>
                                                <option value="��������">��������</option>
                                                <option value="��ѧ����">��ѧ����</option>
                                                <option value="��������">��������</option>
                                                <option value="����̬����">����̬����</option>
                                                <option value="����">����</option>
                                                <option value="΢����">΢����</option>
                                                <%
elseif rs("user_major") = "��������" then
%>
                                                <option value="��������">��������</option>
                                                <option value="��ѧ">��ѧ</option>
                                                <option value="��������" selected>��������</option>
                                                <option value="��ѧ����">��ѧ����</option>
                                                <option value="��������">��������</option>
                                                <option value="����̬����">����̬����</option>
                                                <option value="����">����</option>
                                                <option value="΢����">΢����</option>
                                                <%
elseif rs("user_major") = "��ѧ����" then
%>
                                                <option value="��������">��������</option>
                                                <option value="��ѧ">��ѧ</option>
                                                <option value="��������">��������</option>
                                                <option value="��ѧ����" selected>��ѧ����</option>
                                                <option value="��������">��������</option>
                                                <option value="����̬����">����̬����</option>
                                                <option value="����">����</option>
                                                <option value="΢����">΢����</option>
                                                <%
elseif rs("user_major") = "��������" then
%>
                                                <option value="��������">��������</option>
                                                <option value="��ѧ">��ѧ</option>
                                                <option value="��������">��������</option>
                                                <option value="��ѧ����">��ѧ����</option>
                                                <option value="��������" selected>��������</option>
                                                <option value="����̬����">����̬����</option>
                                                <option value="����">����</option>
                                                <option value="΢����">΢����</option>
                                                <%
elseif rs("user_major") = "����̬����" then
%>
                                                <option value="��������">��������</option>
                                                <option value="��ѧ">��ѧ</option>
                                                <option value="��������">��������</option>
                                                <option value="��ѧ����">��ѧ����</option>
                                                <option value="��������">��������</option>
                                                <option value="����̬����" selected>����̬����</option>
                                                <option value="����">����</option>
                                                <option value="΢����">΢����</option>
                                                <%
elseif rs("user_major") = "����" then
%>
                                                <option value="��������">��������</option>
                                                <option value="��ѧ">��ѧ</option>
                                                <option value="��������">��������</option>
                                                <option value="��ѧ����">��ѧ����</option>
                                                <option value="��������">��������</option>
                                                <option value="����̬����">����̬����</option>
                                                <option value="����" selected>����</option>
                                                <option value="΢����">΢����</option>
                                                <%
elseif rs("user_major") = "΢����" then
%>
                                                <option value="��������">��������</option>
                                                <option value="��ѧ">��ѧ</option>
                                                <option value="��������">��������</option>
                                                <option value="��ѧ����">��ѧ����</option>
                                                <option value="��������">��������</option>
                                                <option value="����̬����">����̬����</option>
                                                <option value="����">����</option>
                                                <option value="΢����" selected>΢����</option>
                                                <%
end if
%>
                                              </select>
                                              <span class="style13">*</span></td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">�꼶��&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <select name="user_grade" class="style3" id="user_grade">
                                                <%
if rs("user_grade") = "��һ" then
%>
                                                <option value="��һ" selected>��һ</option>
                                                <option value="�ж�">�ж�</option>
                                                <option value="����">����</option>
                                                <%
elseif rs("user_grade") = "�ж�" then
%>
                                                <option value="��һ">��һ</option>
                                                <option value="�ж�" selected>�ж�</option>
                                                <option value="����">����</option>
                                                <%
elseif rs("user_grade") = "����" then
%>
                                                <option value="��һ">��һ</option>
                                                <option value="�ж�">�ж�</option>
                                                <option value="����" selected>����</option>
                                                <%
end if
%>
                                              </select>
                                              <span class="style13">*</span></td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">E-mail��&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <input type="text" name="user_mail" value="<%=rs("user_mail")%>" size="24" class="style3">
                                              <span class="style13">*</span> </td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">BBS�ʺţ�&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <input name="user_bbs" type="text" class="style3" id="user_bbs" value="<%=rs("user_bbs")%>" size="24">
                                              <span class="style13">*</span> </td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">����绰��&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <input type="text" name="user_roomphone" value="<%=rs("user_roomphone")%>" size="24" class="style3">
                                              <span class="style13">*</span> ����ʽ��025-83594521�� </td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">�ֻ���&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <input type="text" name="user_mobile" value="<%=rs("user_mobile")%>" size="24" class="style3">
                                          </td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">��ʦ��&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <input type="text" name="user_tutor" value="<%=rs("user_tutor")%>" size="24" class="style3"></td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">ʵ���ҵ绰��&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <input type="text" name="user_labphone" value="<%=rs("user_labphone")%>" size="24" class="style3">
                                ����ʽ��025-83594521�� </td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">��ͥ�绰��&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <input type="text" name="user_homephone" value="<%=rs("user_homephone")%>" size="24" class="style3">
                                ����ʽ��025-83594521�� </td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">��ͥ��ַ��&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <input type="text" name="user_address" value="<%=rs("user_address")%>" size="24" class="style3">
                                          </td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">�ʱࣺ&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <input type="text" name="user_code" value="<%=rs("user_code")%>" size="24" class="style3">
                                          </td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">�Ա�&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <input name="user_sex" type="radio" value="��" checked>
                                ��
                                <input name="user_sex" type="radio" value="Ů">
                                Ů <span class="style13">*</span> </td>
                                        </tr>
                                        <tr>
                                          <td height="24"><div align="right" class="style10">��ע��&nbsp;&nbsp;</div></td>
                                          <td class="style10">&nbsp;&nbsp;&nbsp;
                                              <textarea name="user_info" cols="45" rows="10" class="style3"><%=rs("user_info")%></textarea>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td height="35" colspan="2"><div align="center"><img src="../user/userimages/editSub.gif" width="70" height="25" style="cursor:hand;" onMousedown="submit()"> </div></td>
                                        </tr>
                                      </table>
                                    </form>
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
          <td height="15" valign="top"><div align="right">
          </div></td>
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
    <td valign="top" background="../indeximages/loginbk.gif"><div align="center">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="47" background="adminimages/adminlogin.gif">&nbsp;</td>
          </tr>
          <tr>
            <td><table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="100"><div align="center">
                    <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="../indeximages/loginbk.gif">
                      <tr>
                        <td width="20%"><div align="center"> </div>
                            <div align="center"></div></td>
                        <td width="60%" class="style3"><%=admin_account%>��</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td ><div align="center"> </div>
                            <div align="center"></div></td>
                        <td height="30" class="style2">���Ѿ���¼�ɹ�,��</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td><div align="center"></div></td>
                        <td height="30" class="style2">������ά����վ!</td>
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
                                <option value="javascript:void(null);" selected>----У������----</option>
                                <option value="http://www.nju.edu.cn/">�Ͼ���ѧ</option>
                                <option value="http://lily.nju.edu.cn/">�ϴ�С�ٺ�</option>
                                <option value="http://grawww.nju.edu.cn/">�о���Ժ</option>
                                <option value="http://physics.nju.edu.cn/">����ѧϵ</option>
                                <option value="http://job.nju.edu.cn/">��ҵָ������</option>
                              </select>
                            </form>
                        </div></td>
                      </tr>
                      <tr>
                        <td height="50"><div align="center">
                            <form name="links">
                              <select name="links" class="style2" onChange="window.open(this.value)">
                                <option value="javascript:void(null);" selected>---ʵ��������---</option>
                                <option value="http://biophy.nju.edu.cn ">��������ʵ����</option>
                                <option value="http://pld.nju.edu.cn ">PLDʵ����</option>
                                <option value="http://x.nju.edu.cn/">�϶���С��</option>
                              </select>
                            </form>
                        </div></td>
                      </tr>
                      <tr>
                        <td height="50"><div align="center">
                            <form name="links">
                              <select name="links" class="style2" onChange="window.open(this.value)">
                                <option value="javascript:void(null);" selected>----У������----</option>
                                <option value="http://www.njbys.com/">�Ͼ���ҵ����ҵ��</option>
                                <option value="http://www.jsbys.com.cn/index.aspx">���ձ�ҵ����ҵ��</option>
                                <option value="http://www.firstjob.com.cn/">�Ϻ���ҵ����ҵ��</option>
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