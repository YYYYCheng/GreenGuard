<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.DanMuSafetyMonitor.bean.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	if(request.getSession().getAttribute("Uname") == null)
	{
	        response.sendRedirect("login.jsp");
	}
	else if(request.getSession().getAttribute("Ugrant") == null)
	{
		response.sendRedirect("login.jsp");
	}
	else{
 %>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<!-- monitor_anchor.html -->
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <meta name="format-detection" content="telephone=no">
        <meta charset="UTF-8">

        <meta name="description" content="Violate Responsive Admin Template">
        <meta name="keywords" content="Super Admin, Admin, Template, Bootstrap">

        <title>禁播列表</title>

        <!-- CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/form.css" rel="stylesheet">
        <link href="css/calendar.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/icons.css" rel="stylesheet">
        <link href="css/generics.css" rel="stylesheet">

		<script src="iconfont.js"></script>
		<script src="js/echarts/echarts.min.js"></script>
		<script src="js/echarts/china.js"></script>

    </head>
    <body >

        <header id="header" class="media">
            <a href="" id="menu-toggle"></a>
            <a class="logo pull-left" href="index.html">直播平台监控系统</a>

            <div class="media-body">
                <div class="media" id="top-menu">
                    <div class="pull-left tm-icon">
                        <a data-drawer="messages" class="drawer-toggle" href="">
                            <font color="#ffff00" size="6em"><i class="fa fa-exclamation-triangle" aria-hidden="true" ></i></font>
							<i class="sa-top-message" aria-hidden="true" ></i>
                            <i class="n-count animated" id="alertNumber">1</i>
                            <span>系统警报</span>
                        </a>
                    </div>
                    <div class="pull-left tm-icon">
                        <a data-drawer="notifications" class="drawer-toggle" href="">
							<font color="#ff0000" size="6em"><i class="fa fa-question-circle" aria-hidden="true" ></i></font>
							<i class="sa-top-updates" aria-hidden="true" ></i>
                            <i class="n-count animated" id="reportNumber">0</i>
                            <span>举报投诉</span>
                        </a>
                    </div>



<%--                    <div id="time" class="pull-right">--%>
<%--                        <span id="hours"></span>--%>
<%--                        :--%>
<%--                        <span id="min"></span>--%>
<%--                        :--%>
<%--                        <span id="sec"></span>--%>
<%--                    </div>--%>

                    <div class="media-body">
                        <input type="text" class="main-search" id="indexSearch"><!--全局搜索栏-->
                    </div>
                </div>
            </div>
        </header>

        <div class="clearfix"></div>



        <section id="main" class="p-relative" role="main">

            <!-- Sidebar -->
            <aside id="sidebar">

                <!-- Sidbar Widgets -->
                <div class="side-widgets overflow">
                    <!-- Profile Menu -->
                    <div class="text-center s-widget m-b-25 dropdown" id="profile-menu">
                        <a href="" data-toggle="dropdown" id="theimg">
                            <img class="profile-pic animated" src="img/profile-pic2.jpg" alt="">
                        </a>
                        <ul class="dropdown-menu profile-menu">

                            <li><a href="">个人中心</a> <i class="icon left">&#61903;</i><i class="icon right">&#61815;</i></li>
                        	<li id="usermanager"><!-- <a href="">管理用户</a> <i class="icon left">&#61903;</i><i class="icon right">&#61815;</i>--></li>

                            <li><a href="${pageContext.request.contextPath}/LoginOutServlet">退出登录</a> <i class="icon left">&#61903;</i><i class="icon right">&#61815;</i></li>
                        </ul>
                        <h4 class="m-0"><%=request.getSession().getAttribute("Uname")%></h4>
                        <h5 id="userIdentity">管理员</h5>

                        <%if((int)request.getSession().getAttribute("Ugrant")==1){ %>
			                <script>
			                	var umg=document.getElementById("usermanager").innerHTML='<a href="AddAdmin.jsp">添加管理用户</a> <i class="icon left">&#61903;</i><i class="icon right">&#61815;</i>';
			                	var umt=document.getElementById("userIdentity").innerHTML='经理';
			                	var umi=document.getElementById("theimg").innerHTML='<img class="profile-pic animated" src="img/profile-pic.jpg" alt="">';

			                </script>
			             <%}%>
                    </div>

                    <!-- Calendar -->
                    <div class="s-widget m-b-25">
                        <div id="sidebar-calendar"></div>
                    </div>

                    <!-- Feeds
                    <div class="s-widget m-b-25">
                        <h2 class="tile-title">
                           News Feeds
                        </h2>

                        <div class="s-widget-body">
                            <div id="news-feed"></div>
                        </div>
                    </div>-->

                    <!-- Projects -->
                    <div class="s-widget m-b-25">
                       <%
                            	matableDao mtd=new matableDao();
                            	ResultSet rs_a=null;
                            	if(request.getAttribute("searchAnchorRs") == null)
                 		 		{
                 		 			rs_a=mtd.ALLSelect();
 				   				}
 				   				else{
 				   					rs_a= (ResultSet)request.getAttribute("searchAnchorRs");
 				   				}
                            	while(rs_a.next()){
                            	String room=(String)rs_a.getString("MAroom");

                            	%>
<%--                            <div class="side-border">--%>
<%--                                <small><%=rs_a.getString("MAname") %></small>--%>
<%--                                <div class="progress progress-small">--%>
<%--                                     <a href="${pageContext.request.contextPath}/AnchorProDanMuServlet?listMAname=<%=rs_a.getString("MAname") %>" data-toggle="tooltip" title="" class="tooltips progress-bar progress-bar-info" style="width: 60%;" data-original-title="60%">--%>
<%--                                          <span class="sr-only">60% Complete</span>--%>
<%--                                     </a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <%} %>
							<!--progress-bar tooltips progress-bar-danger-->
							<!--tooltips progress-bar progress-bar-warning -->
							<!--tooltips progress-bar progress-bar-info -->
							<!--tooltips progress-bar progress-bar-success -->
                        </div>
                    </div>
                </div>

                  <!-- Side Menu -->
                <ul class="list-unstyled side-menu">
                    <li class="active">
                        <a class="sa-side-home" href="index.jsp">
                            <span class="menu-item">主页</span>
                        </a>
                    </li>
                    <li>
                        <a class="sa-side-typography" href="list_anchor.jsp">
                            <span class="menu-item">监控列表</span>
                        </a>
                    </li>
                    <li>
                        <a class="sa-side-widget" href="list_video.jsp">
                            <span class="menu-item">视频监控</span>
                        </a>
                    </li>
                    <li>
                        <a class="sa-side-table" href="list_BanAnchor.jsp">
                            <span class="menu-item">禁播列表</span>
                        </a>
                    </li>

                    <li>
                        <a class="sa-side-chart" href="list_DMinfo.jsp">
                            <span class="menu-item">弹幕信息</span>
                        </a>
                    </li>
                    <li>
                        <a class="sa-side-folder" href="SysReport.jsp">
                            <span class="menu-item">系统报告</span>
                        </a>
                    </li>
                    <li>
                        <a class="sa-side-calendar" href="calendar.html">
                            <span class="menu-item">安全日志</span>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a class="sa-side-page" href="">
                            <span class="menu-item">警报/投诉</span>
                        </a>
                        <ul class="list-unstyled menu-item">
                            <li><a data-drawer="messages"  href="#">警报列表</a></li>
                            <li><a data-drawer="notifications" href="#">投诉列表</a></li>
                        </ul>
                    </li>
                </ul>
				<!--END menu-->

            </aside>

            <!-- Content -->
            <section id="content" class="container">

                <!-- Messages Drawer -->
                <div id="messages" class="tile drawer animated">
                    <div class="listview narrow">
                        <div class="media">
                            <a href="">系统对于主播行为的警告</a>
                            <span class="drawer-close">&times;</span>

                        </div>
                        <div class="overflow" style="height: 20em">
                            <div class="media">
                                <div class="pull-left">
                                   <!-- <img width="40" src="img/profile-pics/1.jpg" alt="">-->
								   <font color="#ffff00"><i class="fa fa-exclamation-triangle fa-2x" aria-hidden="true" ></i></font>
                                </div>
                                <div class="media-body">
                                    <small class="text-muted">用户名</small><br>
                                    <a class="t-overflow" href="">警告类型、频繁出现关键词</a>
                                </div>
                            </div>
                        </div>
                        <div class="media text-center whiter l-100">
                            <a href=""><small>显示全部</small></a>
                        </div>
                    </div>
                </div>
				<!--Messages link-->

                <!-- Notification Drawer -->
                <div id="notifications" class="tile drawer animated">
                    <div class="listview narrow">
                        <div class="media">
                            <a href="">用户对于主播的举报列表</a>
                            <span class="drawer-close">&times;</span>
                        </div>
                        <div class="overflow" style="height: 20em">
                            <div class="media">
                                <div class="pull-left">
                                    <!--<img width="40" src="img/profile-pics/1.jpg" alt="">-->
									<font color="#ff0000"><i class="fa fa-question-circle fa-2x" aria-hidden="true" ></i></font>
                                </div>
                                <div class="media-body">
                                    <small class="text-muted">被举报用户</small><br>
                                    <a class="t-overflow" href="">举报内容</a>
                                </div>
                            </div>
                        </div>
                        <div class="media text-center whiter l-100">
                            <a href=""><small>显示全部</small></a>
                        </div>
                    </div>
                </div>
				<!--report end-->

                <!-- Breadcrumb -->
                <ol class="breadcrumb hidden-xs">
                    <li><a href="#">主页</a></li>
                    <li class="active">监控主播列表</li></a>
                </ol>

                <h4 class="page-title">功能列表</h4>

                 <!-- Shortcuts -->
								 <div class="block-area shortcut-area">
								 		<a class="shortcut tile" href="list_anchor.jsp">
								 			<svg class="icon" aria-hidden="true">
								 				<use xlink:href="#icon-renqun"></use>
								 			</svg>
								 				<small class="t-overflow">监控列表</small>
								 		</a>
<%--								 		<a class="shortcut tile" href="list_video.jsp">--%>
<%--								 			<svg class="icon" aria-hidden="true">--%>
<%--								 				<use xlink:href="#icon-shipin"></use>--%>
<%--								 			</svg>--%>
<%--								 				<small class="t-overflow">视频监控</small>--%>
<%--								 		</a>--%>
								 		<a class="shortcut tile" href="list_BanAnchor.jsp">
								 			<svg class="icon" aria-hidden="true">
								 				<use xlink:href="#icon-jinzhi"></use>
								 			</svg>
								 </span>
								 				<!-- <i class="fa fa-ban no fa-comment text-danger" aria-hidden="true"></i> -->
								 				<small class="t-overflow">禁播列表</small>
								 		</a>
<%--								 		<a class="shortcut tile" href="list_DMinfo.jsp">--%>
<%--								 			<svg class="icon" aria-hidden="true">--%>
<%--								 				<use xlink:href="#icon-danmu"></use>--%>
<%--								 			</svg>--%>
<%--								 				<small class="t-overflow">弹幕信息</small>--%>
<%--								 		</a>--%>
								 		<a class="shortcut tile" href="SysReport.jsp">
								 			<svg class="icon" aria-hidden="true">
								 				<use xlink:href="#icon-liebiao"></use>
								 			</svg>
								 				<small class="t-overflow">系统信息</small>
								 		</a>
<%--								 		<a class="shortcut tile" href="list_Incivilizer.jsp">--%>
<%--								 			<svg class="icon" aria-hidden="true">--%>
<%--								 				<use xlink:href="#icon-jinzhifayan"></use>--%>
<%--								 			</svg>--%>
<%--								 				<small class="t-overflow">不文明</small>--%>
<%--								 		</a>--%>
								 </div>
                <hr class="whiter" />

				<!--monitor table-->
				 <!-- Responsive Table -->
                <div class="block-area" id="responsiveTable">

                    <!-- <h2 class="block-title">正在监控的主播列表</h2> -->


					<header class="listview-header media">
						<h3 class="pull-left">禁播主播列表</h3>
						<!--搜索主播-->
						<input class="input-sm col-md-4 pull-right message-search" type="text" placeholder="输入所需搜索主播">
                        <button class="btn m-r-5 pull-right">搜索</button>

                        <div class="clearfix"></div>
                    </header>



                    <div class="table-responsive overflow">
                        <table class="table tile" >

                            <thead>
                                <tr>
                                    <th>用户名(点击查看详情)</th>
									<th>禁播原因</th>
                                    <th>历史评分</th>
                                    <th>禁播方式</th>
									<th>禁播时间</th>
									<th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><a href="" target="_blank">Jhon</a></td><!--链接到主播主页-->
                                    <td>内容低俗</td>
									<td>9.1</td>
                                    <td>系统警报</td>
                                    <td>2019-05-25</td>
									<td><button class="btn" >解除禁言</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row clearfix">
                        <div class="col-md-12 column">
                            <div class="container">
                                <div class="row clearfix">
                                    <div class="col-md-4 column">
                                        <img alt="140x140" src="images/11.jpg" />
                                    </div>
                                    <div class="col-md-4 column">
                                        <img alt="140x140" src="images/2.jpg" />
                                    </div>
                                    <div class="col-md-4 column">
                                        <img alt="140x140" src="images/3.jpg" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



            <!--[endif]-->
        </section>

        <!-- Javascript Libraries -->
        <!-- jQuery -->
        <script src="js/jquery.min.js"></script> <!-- jQuery Library -->
        <script src="js/jquery-ui.min.js"></script> <!-- jQuery UI -->
        <script src="js/jquery.easing.1.3.js"></script> <!-- jQuery Easing - Requirred for Lightbox + Pie Charts-->

        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Charts -->
        <script src="js/charts/jquery.flot.js"></script> <!-- Flot Main -->
        <script src="js/charts/jquery.flot.time.js"></script> <!-- Flot sub -->
        <script src="js/charts/jquery.flot.animator.min.js"></script> <!-- Flot sub -->
        <script src="js/charts/jquery.flot.resize.min.js"></script> <!-- Flot sub - for repaint when resizing the screen -->
		<script src="js/echarts/echarts.min.js"></script>

        <script src="js/sparkline.min.js"></script> <!-- Sparkline - Tiny charts -->
        <script src="js/easypiechart.js"></script> <!-- EasyPieChart - Animated Pie Charts -->
        <script src="js/charts.js"></script> <!-- All the above chart related functions -->

        <!-- Map -->
        <script src="js/maps/jvectormap.min.js"></script> <!-- jVectorMap main library -->
        <script src="js/maps/usa.js"></script> <!-- USA Map for jVectorMap -->

        <!--  Form Related -->
        <script src="js/icheck.js"></script> <!-- Custom Checkbox + Radio -->

        <!-- UX -->
        <script src="js/scroll.min.js"></script> <!-- Custom Scrollbar -->

        <!-- Other -->
        <script src="js/calendar.min.js"></script> <!-- Calendar -->
        <script src="js/feeds.min.js"></script> <!-- News Feeds -->


        <!-- All JS functions -->
        <script src="js/functions.js"></script>
		<script src="js/myScript.js"></script>
    </body>
</html>
<%}%>
