<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="gdu.mall.dao.*" %>
<%@ page import ="gdu.mall.vo.*" %>
<%
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager == null || manager.getManagerLevel() < 1){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>managerInsertForm</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
<meta name="author" content="Codedthemes" />
<!-- Favicon icon -->

<link rel="icon" href="<%=request.getContextPath() %>/assets/images/favicon.ico" type="image/x-icon">
<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/bootstrap/css/bootstrap.min.css">
<!-- waves.css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/icon/themify-icons/themify-icons.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/icon/icofont/css/icofont.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/icon/font-awesome/css/font-awesome.min.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/style.css">
</head>
<body themebg-pattern="theme1">>
<div class="theme-loader">
    <div class="loader-track">
        <div class="preloader-wrapper">
            <div class="spinner-layer spinner-blue">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            <div class="spinner-layer spinner-red">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>

            <div class="spinner-layer spinner-yellow">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>

            <div class="spinner-layer spinner-green">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Pre-loader end -->
<section class="login-block">
      <!-- Container-fluid starts -->
      <div class="container-fluid">
          <div class="row">
              <div class="col-sm-12">
                  <form action="<%=request.getContextPath()%>/category/insertCategoryAction.jsp" method="post" class="md-float-material form-material">
                      <div class="text-center">
                          <img src="<%=request.getContextPath() %>/assets/images/logo.png" alt="logo.png">
                      </div>
                      <div class="auth-box card">
                          <div class="card-block">
                              <div class="row m-b-20">
                                  <div class="col-md-12">
                                      <h3 class="text-center txt-primary">???????????? ??????</h3>
                                  </div>
                              </div>
                              
                              <div class="form-group form-primary">
                                  <input type="text" name="categoryName" class="form-control">
                                  <span class="form-bar"></span>
                                  <label class="float-label">?????? ??? ???????????? ??????</label>
                              </div>
                              
                              <div class="row m-t-30">
                                  <div class="col-md-12">
                                      <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">???????????? ??????</button>
                                  </div>
                              </div>
                              <hr/>
                              <div class="row">
                                  <div class="col-md-10">
                                      <p class="text-inverse text-left"><a href="<%=request.getContextPath()%>/category/categoryList.jsp"><b>[?????? ????????????]</b></a></p>
                                  </div>
                                  <div class="col-md-2">
                                      <img src="<%=request.getContextPath() %>/assets/images/auth/Logo-small-bottom.png" alt="small-logo.png">
                                  </div>
                              </div>
                          </div>
                      </div>
                  </form>
              </div>
              <!-- end of col-sm-12 -->
          </div>
          <!-- end of row -->
      </div>
      <!-- end of container-fluid -->
  </section>

<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery/jquery.min.js "></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery-ui/jquery-ui.min.js "></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/bootstrap/js/bootstrap.min.js "></script>
<!-- waves js -->
<script src="<%=request.getContextPath() %>/assets/pages/waves/js/waves.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/common-pages.js"></script>

</body>
</html>
