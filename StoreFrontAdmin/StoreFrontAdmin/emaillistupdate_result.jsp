<%@ page import="javax.servlet.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.storefront.storefrontbeans.*" %>
<%@ page import="com.storefront.storefrontrepository.*" %>

<%
    DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

    UpdateEMailListResponse addEMailListResponse = null;
    try {
        EMailListBean emailListBean = new EMailListBean();
        UpdateEMailListRequest addEMailListRequest = new UpdateEMailListRequest();
        EMailList eMailList = new EMailList();
        eMailList.setid(Integer.parseInt(request.getParameter("id")));
        eMailList.setemail(request.getParameter("emailaddress"));
        if(request.getParameter("unsubscribed") != null && request.getParameter("unsubscribed").compareToIgnoreCase("on") == 0)
            eMailList.setoptout(true);
        addEMailListRequest.setemaillist(eMailList);
        addEMailListResponse = emailListBean.UpdateEMailList(addEMailListRequest);
    }
    catch (Exception ex) {
        ex.printStackTrace();
        throw new ServletException(ex.getMessage());
    }
%>


<HTML>
    <SCRIPT LANGUAGE="JavaScript">
    </SCRIPT>
    <HEAD>
        <LINK href="./storefront.css" rel="STYLESHEET"></LINK>
    </HEAD>
    <BODY leftMargin="0" topMargin="0" onload="" marginwidth="0" marginheight="0">
        <%@ include file="toppane.jsp" %>
        <table cellSpacing="0" cellPadding="0" border="0">
            <tr>
                <%@ include file="leftpane.jsp" %>
                <td vAlign="top" width="20">
                    <IMG src="./images/spacer.gif" border="0">
                </td>
                <td vAlign="top">
                    <table id="headingTable" border="0">
                        <tr>
                            <td><img src="./images/spacer.gif" width="5" height="5"></td>
                        </tr>
                        <tr>
                            <td class="producttitle">Update E-Mail Address Result</td>
                        </tr>
                    </table>
                    <br>
                    <TABLE cellSpacing="1" cellPadding="3" width="95%" border="0">
                    <tr>
                        <td noWrap><%=request.getParameter("emailaddress")%> was updated successfully.</td>
                    </tr>
                    </TABLE>
                    <br>
                </td>
            </tr>
        </table>
    </BODY>
</HTML>

