<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Header Template</title>
<link rel="stylesheet" href="${ctx}/css/font-awesome.min.css" />

<style>


body {
		padding-top: 3.5em;
	}

	#header {
		display: -moz-flex;
		display: -webkit-flex;
		display: -ms-flex;
		display: flex;
		-moz-justify-content: space-between;
		-webkit-justify-content: space-between;
		-ms-justify-content: space-between;
		justify-content: space-between;
		background-color: #ffffff;
		border-bottom: solid 1px rgba(160, 160, 160, 0.3);
		height: 3.7em;
		left: 0;
		line-height: 3.8em;
		position: fixed;
		top: 0;
		width: 100%;
		z-index: 10000;
		padding-top:5px;
	}
    
    a:hover {
    border-bottom-color: transparent;
    color: #2ebaae !important;
    }
		#header a {
			color: inherit;
			text-decoration: none;
		}

		#header ul {
			list-style: none;
			margin: 0;
			padding-left: 0;
			margin:2px 0 0 10px;
			width: 500px;
		}

			#header ul li {
				display: inline-block;
				padding-left: 0;
				font-size: 0.8em;
				font-family:微軟正黑體;
			}

		#header h1 {
			height: inherit;
			line-height: inherit;
			padding: 0 0 0 1.5em;
			white-space: nowrap;
			text-transform: uppercase;
			margin:2px 0 0 30px;
			font-family: "Raleway", Helvetica, sans-serif;
			letter-spacing: 0.25em;
			font-weight: 500;
			font-size:22px;
			font-weight: bold;
			padding-left: 0.5em;
		}

			#header h1 a {
				font-size: 0.9em;
			}

		#header .links {
			-moz-flex: 1;
			-webkit-flex: 1;
			-ms-flex: 1;
			flex: 1;
			border-left: solid 1px rgba(160, 160, 160, 0.3);
			height: inherit;
			line-height: inherit;
			margin-left: 1.5em;
			overflow: hidden;
		}

			#header .links ul li {
				border-left: solid 1px rgba(160, 160, 160, 0.3);
				line-height: 1;
				margin-left: 1em;
				padding-left: 1em;
			}

				#header .links ul li:first-child {
					border-left: 0;
					margin-left: 0;
					padding-left: 0;
				}

				#header .links ul li a {
					border-bottom: 0;
					font-size: 16px;
					font-weight: 600;
					letter-spacing: 0.25em;
					font-family:Microsoft JhengHei;
				}

		#header .main {
			height: inherit;
			line-height: inherit;
			
			width:300px;
			margin-right:60px;
			float:left;
		}

			#header .main ul {
				height: inherit;
				line-height: inherit;
			}

				#header .main ul li {
					border-left: solid 1px rgba(160, 160, 160, 0.3);
					height: inherit;
					line-height: inherit;
					white-space: nowrap;
				}

					#header .main ul li > * {
						display: block;
						float: left;
					}

					#header .main ul li > a {
						text-decoration: none;
						border-bottom: 0;
						position: relative;
						text-indent: 4em;
						width: 4em;
						font-size: 16px;
						font-family: Microsoft JhengHei;
					}

						#header .main ul li > a:before {
							-moz-osx-font-smoothing: grayscale;
							-webkit-font-smoothing: antialiased;
							font-family: FontAwesome;
							font-style: normal;
							font-weight: normal;
							text-transform: none !important;
						}

						#header .main ul li > a:before {
							display: block;
							height: inherit;
							left: 0;
							line-height: inherit;
							position: absolute;
							text-align: center;
							text-indent: 0;
							top: 0;
							width: inherit;
						}
						
						#UserPicture{
						    float:left;border-radius:50%;height:50px;width:50px;
						    margin:5px 5px 0 0;
						}
						
						#UserName{
						float:left;font-size:14px;
						}

		#header form {
			margin: 0;
		}

			#header form input {
				display: inline-block;
				height: 2.5em;
				position: relative;
				top: -2px;
				vertical-align: middle;
			}

		#header #search {
			-moz-transition: all 0.5s ease;
			-webkit-transition: all 0.5s ease;
			-ms-transition: all 0.5s ease;
			transition: all 0.5s ease;
			max-width: 0;
			opacity: 0;
			overflow: hidden;
			padding: 0;
			white-space: nowrap;
		}

			#header #search input {
				width: 12em;
			}

			#header #search.visible {
				max-width: 12.5em;
				opacity: 1;
				padding: 0 0.5em 0 0;
			}

		@media screen and (max-width: 980px) {

			#header .links {
				display: none;
			}

		}

		@media screen and (max-width: 736px) {

			#header {
				height: 2.75em;
				line-height: 2.75em;
			}

				#header h1 {
					padding: 0 0 0 1em;
				}

				#header .main .search {
					display: none;
				}

		}
</style>


</head>

<body>
<!-- Header -->
<header id="header">
	<h1><a href="home.jsp">Life Editor</a></h1>
		<nav class="links">
			<ul>
				<li><a href="${ctx}/setgoal.jsp">目標</a></li>
				<li><a href="${ctx}/fullCalendar.jsp">行事曆</a></li>
				<li><a href="${ctx}/addfriend.jsp">朋友</a></li>
				<li><a href="${ctx}/apply_challenge.jsp">挑戰任務</a></li>
			</ul>
		</nav>
		<nav class="main">
			<ul>
				<c:if test="${! empty LoginOK }">
					   <a href="UserPage"><img  id="UserPicture" src="${ctx}/GetUserPicture?id=${LoginOK.userID}" ></a>
					   <li id="UserName" style="float:left;font-size:15px;weight:bold;"><a href="UserPage" style="text-indent:0em;">${LoginOK.lastName} ${LoginOK.firstName}</a></li>
			    </c:if>
														
<%-- 													 	<c:if test="${! empty LoginOK }"> --%>
<%-- 																  <a href="<c:url value='/logout_index.jsp'/>"    onclick="javascript:logout();">登出</a>     --%>
<%-- 														</c:if>	 --%>
			   <li>									
					<a id="friend_icon" class="fa-user" href="${ctx}/addfriend.jsp" style="overflow:visible;text-indent:2em;width:2em;"></a>
			   </li>
																	
			   <li>
					<a id="dropdown_icon" class=" fa-chevron-down"  style="overflow:visible;text-indent:0em;width:2em;"></a>
			   </li>
			</ul>
			<ul class="dropdown_area" id="dropdown">
			    <li style="display:list-item;position:fixed;right:195px;top:50px;z-index: 10000;"><a href="${ctx}/updateUser.jsp">設定</a></li>
			    <li style="display: list-item;position:fixed;right:195px;top:100px;z-index: 10000;"><a href="<c:url value='/logout_index.jsp'/>" onclick="javascript:logout();">登出</a></li>
			</ul>
		</nav>
</header>
<script>
$(function(){
	$('#dropdown').hide();
	$('#dropdown_icon').click(function(){
      $('#dropdown').slideToggle('fast');		
	});
});
</script>		
<script>
        window.fbAsyncInit = function() {
                FB.init({
               	appId : '236995580009135',
                status: true,
                cookie: true,
                xfbml: true,
                version : 'v2.6' 
            });
        };
        (function(d, s, id) {
					var js, fjs = d.getElementsByTagName(s)[0];
					if (d.getElementById(id))
						return;
					js = d.createElement(s);
					js.id = id;
					js.src = "//connect.facebook.net/zh_TW/sdk.js";
					fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
        function logout() {
            FB.logout(function(response) {
            });
        }
        </script>
<!-- 			</script> -->

</body>
</html>