<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="gdu.mall.vo.*" %>
<%@ page import ="gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>ebookOne</title>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="keywords" content="flat ui, admin Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    
    <!-- Favicon icon -->
    <link rel="icon" href="<%=request.getContextPath() %>/assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/bootstrap/css/bootstrap.min.css">
    <!-- waves.css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/icon/themify-icons/themify-icons.css">
    <!-- feather icon -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/icon/feather/css/feather.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/icon/font-awesome/css/font-awesome.min.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/jquery.mCustomScrollbar.css">
</head>

<body>
    <!-- Pre-loader start -->
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
    
<%
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager == null || manager.getManagerLevel() < 1) {
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
%>

<div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">
            <nav class="navbar header-navbar pcoded-header">
                <div class="navbar-wrapper">
                    <div class="navbar-logo">
                        <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
                            <i class="ti-menu"></i>
                        </a>
                        <div class="mobile-search waves-effect waves-light">
                            <div class="header-search">
                                <div class="main-search morphsearch-search">
                                    <div class="input-group">
                                        <span class="input-group-prepend search-close"><i class="ti-close input-group-text"></i></span>
                                        <input type="text" class="form-control" placeholder="Enter Keyword">
                                        <span class="input-group-append search-btn"><i class="ti-search input-group-text"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="<%=request.getContextPath()%>/adminIndex.jsp">
                            <img class="img-fluid" src="<%=request.getContextPath() %>/assets/images/logo.png" alt="Theme-Logo" />
                        </a>
                        <a class="mobile-options waves-effect waves-light">
                            <i class="ti-more"></i>
                        </a>
                    </div>
                    <div class="navbar-container container-fluid">
                        <ul class="nav-left">
                            <li>
                                <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                            </li>
                        </ul>
                        <ul class="nav-right">
                            <li class="header-notification">
                                <a href="#!" class="waves-effect waves-light">
                                    <i class="ti-bell"></i>
                                    <span class="badge bg-c-red"></span>
                                </a>
                                <ul class="show-notification">
                                    <li>
                                        <h6>??????</h6>
                                        <label class="label label-danger">New</label>
                                    </li>
                                    
                                </ul>
                            </li>
                            <li class="user-profile header-notification">
                                <a href="#!" class="waves-effect waves-light">
                                    <img src="<%=request.getContextPath() %>/assets/images/me.jpg" class="img-radius" alt="User-Profile-Image">
                                    <span>?????????</span>
                                    <i class="ti-angle-down"></i>
                                </a>
                                <ul class="show-notification profile-notification">
                                    <li class="waves-effect waves-light">
                                        <a href="#!">
                                            <i class="ti-settings"></i> Settings
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <a href="user-profile.html">
                                            <i class="ti-user"></i> Profile
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <a href="email-inbox.html">
                                            <i class="ti-email"></i> My Messages
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <a href="auth-lock-screen.html">
                                            <i class="ti-lock"></i> Lock Screen
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <a href="<%=request.getContextPath()%>/manager/managerLogoutAction.jsp">
                                            <i class="ti-layout-sidebar-left"></i> Logout
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            </div>

            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    <nav class="pcoded-navbar">
                        <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                        <div class="pcoded-inner-navbar main-menu">
                            <div class="">
                                <div class="main-menu-header">
                                    <div class="user-details">
                                        <span id="more-details">?????????<i class="fa fa-caret-down"></i></span>
                                    </div>
                                </div>
                                <div class="main-menu-content">
                                    <ul>
                                        <li class="more-details">
                                            <a href="user-profile.html"><i class="ti-user"></i>View Profile</a>
                                            <a href="#!"><i class="ti-settings"></i>Settings</a>
                                            <a href="<%=request.getContextPath()%>/manager/managerLogoutAction.jsp"><i class="ti-layout-sidebar-left"></i>Logout</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <div class="pcoded-navigation-label">home</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="<%=request.getContextPath()%>/adminIndex.jsp" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                        <span class="pcoded-mtext">????????? ???</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                            </ul>
                            
                            <div class="pcoded-navigation-label">menu</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i><b>BC</b></span>
                                        <span class="pcoded-mtext">????????? ??????</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class=" ">
                                            <a href="<%=request.getContextPath()%>/manager/managerList.jsp" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">????????? ??????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class=" ">
                                            <a href="<%=request.getContextPath()%>/client/clientList.jsp" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">?????? ??????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="<%=request.getContextPath()%>/category/categoryList.jsp" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">???????????? ??????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class=" ">
                                            <a href="<%=request.getContextPath()%>/ebook/ebookList.jsp" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">?????? ??????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class=" ">
                                            <a href="<%=request.getContextPath()%>/orders/ordersList.jsp" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">?????? ??????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class=" ">
                                            <a href="<%=request.getContextPath()%>/notice/noticeList.jsp" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">???????????? ??????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    
                    
                    <!-- ???????????? ??????????????? ?????? -->
                    <!-- ????????? ?????? ??? ?????? -->
                    
                    
                    <div class="pcoded-content">
                        <!-- Page-header start -->
                        <div class="page-header">
                            <div class="page-block">
                                <div class="row align-items-center">
                                    <div class="col-md-8">
                                        <div class="page-header-title">
                                            <h5 class="m-b-10"><%=manager.getManagerName()%>??? ???????????????.
																LEVEL : <%=manager.getManagerLevel()%></h5>
                                            <p class="m-b-0">
                                            
                                            ???????????? ????????? ?????????????????????.
			
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <ul class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="index.html"> <i class="fa fa-home"></i> </a>
                                            </li>
                                            <li class="breadcrumb-item"><a href="#!">?????? ????????????</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Page-header end -->
                        
				        <%
							ArrayList<String> categoryNameList = CategoryDao.categoryNameList();
						%>
                        
						<%
						
							//??????
							String ebookISBN = request.getParameter("ebookISBN");
							System.out.printf("ebookISBN: %s<ebookOne.jsp>\n",ebookISBN);
							
							//dao??????
							Ebook ebook = EbookDao.selectEbookOne(ebookISBN);
							System.out.println(ebook);
							
							// ebookStateList ?????? ????????????
							String[] ebookStateList = EbookDao.ebookStateList();
						%>
                        
                        
                        <div class="pcoded-inner-content">
	        <!-- Main-body start -->
	        <div class="main-body">
	            <div class="page-wrapper">
	                <!-- Page-body start -->
	                <div class="page-body">
	                    <!-- Basic table card start -->
	                    <div class="card">
	                        <div class="card-header">
	                            <h5>?????? ?????? ??????</h5>
	                            <div class="card-header-right">
	                                <ul class="list-unstyled card-option">
	                                    <li><i class="fa fa fa-wrench open-card-option"></i></li>
	                                    <li><i class="fa fa-window-maximize full-card"></i></li>
	                                    <li><i class="fa fa-minus minimize-card"></i></li>
	                                    <li><i class="fa fa-refresh reload-card"></i></li>
	                                    <li><i class="fa fa-trash close-card"></i></li>
	                                </ul>
	                            </div>
	                        </div>
	                        <div class="card-block table-border-style">
	                            <div class="table-responsive">
	                                <table class="table">
									    <tr>
											<th>?????? ??????</th>
											<td><%=ebook.getEbookNo()%></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<th>???????????? ??????</th>
											<td><%=ebook.getCategoryName()%></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<th>?????? ??????</th>
											<td><%=ebook.getEbookTitle()%></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<th>?????? ??????</th>
											<td><%=ebook.getEbookState()%></td>
											<td>
												<form action="<%=request.getContextPath()%>/ebook/updateEbookStateAction.jsp" method="post">
													<!-- 
														?????? ????????? ???????????? name??? ??? ??????????????? ???!
														Form?????? ????????? name??? ????????? Action?????? ????????? ???
													 -->
													<input type="hidden" value="<%=ebookISBN%>" name="ebookISBN">
														<select name="ebookState">
														<%
															for(int i = 0; i < ebookStateList.length; i++) {
																if(ebookStateList[i].equals(ebook.getEbookState())) {
														%>
																	<option value="<%=ebookStateList[i]%>" selected = "selected"><%=ebookStateList[i]%></option>
														<%			
																} else {
														%>
																	<option value="<%=ebookStateList[i]%>"><%=ebookStateList[i]%></option>
														<%
																}
														
															}
														%>
														</select>
													<button type="submit">????????? ??????</button>
												</form>
											</td>
										</tr>
										<tr>
											<th>?????????</th>
											<td><%=ebook.getEbookAuthor() %></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<th>?????? ?????????</th>
											<td><img src="<%=request.getContextPath()%>/img/<%=ebook.getEbookImg()%>"></td>
											<td>
												<a href="<%=request.getContextPath()%>/ebook/updateEbookImgForm.jsp?ebookISBN=<%=ebookISBN%>">
													<button type="button">????????? ??????</button>
												</a>
											</td>
										</tr>
										<tr>
											<th>??????ISBN</th>
											<td><%=ebook.getEbookISBN() %></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<th>?????????</th>
											<td><%=ebook.getEbookCompany() %></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<th>?????? ??????</th>
											<td><%=ebook.getEbookDate().substring(0,11)%></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<th>?????? ??????</th>
											<td><%=ebook.getEbookSummary() %></td>
											<td>
												<a href="<%=request.getContextPath()%>/ebook/updateEbookSummaryForm.jsp?ebookISBN=<%=ebookISBN%>">
													<button type="button">????????? ??????</button>
												</a>
											</td>
										</tr>
										<tr>
											<th>?????? ??????</th>
											<td><%=ebook.getEbookPrice() %></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<th>?????? ??????</th>
											<td><%=ebook.getEbookPageCount() %></td>
											<td>&nbsp;</td>
										</tr>
	                                </table>
	                                
									<a href="<%=request.getContextPath()%>/ebook/deleteEbookAction.jsp?ebookISBN=<%=ebookISBN%>">
										<button type="button">?????? ??????</button>
									</a>
	                                
	                            </div>
	                        </div>
	                    </div>
	                    <!-- Basic table card end -->
                    </div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
<div id="styleSelector"></div>
               
 <!-- Required Jquery -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery/jquery.min.js "></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery-ui/jquery-ui.min.js "></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/bootstrap/js/bootstrap.min.js "></script>
    <!-- waves js -->
    <script src="<%=request.getContextPath() %>/assets/pages/waves/js/waves.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/pcoded.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/vertical/vertical-layout.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Custom js -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/script.min.js"></script>
</body>

</html>
