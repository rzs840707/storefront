<%@ page import="javax.servlet.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.storefront.storefrontbeans.*" %>
<%@ page import="com.storefront.storefrontrepository.*" %>

<%
    Theme theme = null;
    Company company = null;
    try {
        CompanyBean companyBean = new CompanyBean();
        GetThemeRequest getThemeRequest = new GetThemeRequest();
        getThemeRequest.setname("corporate");
        GetThemeResponse getThemeResponse = companyBean.GetTheme(request, getThemeRequest);
        theme = getThemeResponse.gettheme();

        GetCompanyResponse getCompanyResponse = companyBean.GetCompany(request, new GetCompanyRequest());
        company = getCompanyResponse.getcompany();
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
        <%@ include file="titlemetadata.jsp" %>
        <LINK href="<%=company.getbaseurl()%>storefront.css" rel="STYLESHEET"></LINK>
    </HEAD>
    <BODY leftMargin="0" topMargin="0" onload="" marginwidth="0" marginheight="0">
        <%@ include file="toppane.jsp" %>
        <table cellSpacing="0" cellPadding="0" border="0">
            <tr>
                <td vAlign="top" width="20">
                    <IMG src="<%=theme.getimagebaseurl()%>spacer.gif" border="0">
                </td>
                <td vAlign="top">
                    <table id="headingTable" border="0">
                        <tr>
                            <td><img src="<%=theme.getimagebaseurl()%>spacer.gif" width="5" height="20"></td>
                        </tr>
                    </table>
                    <table cellSpacing="1" cellPadding="1" width="550" border="0">
                        <tr bgcolor="<%=theme.getcolor2()%>">
                            <td colspan="5" nowrap class="producttitle">Change billing/shipping information</td>
                        </tr>
                        <tr>
                            <td colspan="2"><img src="<%=theme.getimagebaseurl()%>spacer.gif" width="1" height="4" /></td>
                        </tr>
                        <tr>
                            <td nowrap>Your billing/shipping information has been changed successfully</td>
                        </tr>
                        <tr>
                            <td><br></td>
                        </tr>
                        <tr>
                            <td><a href="<%=StoreFrontUrls.getsecureurl(request, company, "youraccount")%>"><img alt="continue" border="0" src="<%=theme.getimagebaseurl()%>continue_button.gif"/></a></td>
                        </tr>
                    </table>
                    </form>
                </td>
            </tr>
        </table>
        <%@ include file="bottompane.jsp" %>
    </BODY>
</HTML>

