/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.42
 * Generated at: 2019-10-18 05:40:04 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.loss;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class createModal_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!-- The Modal -->\r\n");
      out.write("\t<div class=\"modal\" id=\"myModal\">\r\n");
      out.write("\t  <div class=\"modal-dialog\">\r\n");
      out.write("\t    <div class=\"modal-content\" align=\"center\">\r\n");
      out.write("\t\r\n");
      out.write("\t      <!-- Modal Header -->\r\n");
      out.write("\t      <div class=\"modal-header\">\r\n");
      out.write("\t        <h3 class=\"modal-title\">손실 추가</h3>\r\n");
      out.write("\t      </div>\r\n");
      out.write("\t\r\n");
      out.write("\t      <!-- Modal body -->\r\n");
      out.write("\t      <div class=\"modal-body\">\r\n");
      out.write("\t        <div class=\"card-body\">\r\n");
      out.write("\t\t\t\t<form class=\"forms-sample\" action=\"/loss/lossRegister\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t\t\t<label for=\"exampleInputEmail2\" class=\"col-sm-3 col-form-label\"><font\r\n");
      out.write("\t\t\t\t\t\t\tstyle=\"vertical-align: inherit;\"><font\r\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"vertical-align: inherit;\">손실/수익</font></font></label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-sm-9\">\r\n");
      out.write("\t\t\t\t\t\t\t<select class=\"form-control\" name=\"loss_category\">\r\n");
      out.write("\t\t\t\t\t\t\t  <option value=\"손실\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;손실</option>\r\n");
      out.write("\t\t\t\t\t\t\t  <option value=\"수익\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수익</option>\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t\t\t<label for=\"exampleInputPassword2\" class=\"col-sm-3 col-form-label\"><font\r\n");
      out.write("\t\t\t\t\t\t\tstyle=\"vertical-align: inherit;\"><font\r\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"vertical-align: inherit;\">수량</font></font></label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-sm-9\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"number\" class=\"form-control\" name=\"loss_qty\">\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t\t\t<label for=\"exampleInputMobile\" class=\"col-sm-3 col-form-label\"><font\r\n");
      out.write("\t\t\t\t\t\t\tstyle=\"vertical-align: inherit;\"><font\r\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"vertical-align: inherit;\">요금</font></font></label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-sm-9\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"number\" class=\"form-control\" name=\"loss_pay\" id=\"loss_createpay\" readonly=\"readonly\">\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t\t\t<label for=\"exampleInputMobile\" class=\"col-sm-3 col-form-label\"><font\r\n");
      out.write("\t\t\t\t\t\t\tstyle=\"vertical-align: inherit;\"><font\r\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"vertical-align: inherit;\">상품</font></font></label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-sm-9\">\r\n");
      out.write("\t\t\t\t\t\t\t<select class=\"form-control\" name=\"loss_product\" id=\"loss_createproduct\"></select>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t\t\t<label for=\"exampleInputMobile\" class=\"col-sm-3 col-form-label\"><font\r\n");
      out.write("\t\t\t\t\t\t\tstyle=\"vertical-align: inherit;\"><font\r\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"vertical-align: inherit;\">날짜</font></font></label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-sm-9\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"date\" class=\"form-control\" name=\"loss_date\" id=\"currentDate\">\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<button type=\"submit\" class=\"btn btn-primary mr-2\">\r\n");
      out.write("\t\t\t\t\t\t<font style=\"vertical-align: inherit;\"><font\r\n");
      out.write("\t\t\t\t\t\t\tstyle=\"vertical-align: inherit;\">등록</font></font>\r\n");
      out.write("\t\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" data-dismiss=\"modal\" id=\"createclose\" class=\"btn btn-success\">닫기</button>\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t      </div>\r\n");
      out.write("\t    </div>\r\n");
      out.write("\t  </div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- End Modal -->");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
