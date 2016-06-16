<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<jsp:useBean id="trgSvc" class="com.lifeeditor.service.TargetSpecService" />
<!DOCTYPE HTML>
<html>
	<head>
		<title>Life Editor</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="css/main.css" />
		<script src="js/jquery.min.js"></script>
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<style>


#hotmanicon{
    width:60px;
    height:60px;
    border-radius: 50%;
    margin:0px 5px 50px 5px;
    left:0px;
}

#hotmanPic{
    width:360px;
    height:240px;
    margin:20px 5px 0px 5px;
}

</style>
	</head>
	<body>
	
<!-- Wrapper -->
<div id="wrapper">


	<jsp:include page="header.jsp"></jsp:include>



				<!-- Menu -->
					<section id="menu">

						<!-- Search -->
							<section>
								<form class="search" method="get" action="#">
									<input type="text" name="query" placeholder="Search" />
								</form>
							</section>

						<!-- Links -->
							<section>
								<ul class="links">
									<li>
										<a href="#">
											<h3>Lorem ipsum</h3>
											<p>Feugiat tempus veroeros dolor</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Dolor sit amet</h3>
											<p>Sed vitae justo condimentum</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Feugiat veroeros</h3>
											<p>Phasellus sed ultricies mi congue</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Etiam sed consequat</h3>
											<p>Porta lectus amet ultricies</p>
										</a>
									</li>
								</ul>
							</section>

						<!-- Actions -->
							<section>
								<ul class="actions vertical">
									<li><a href="#" class="button big fit">登出</a></li>
								</ul>
							</section>

					</section>

				<!-- Main -->
					<div id="main">

						<!-- Post -->
							<article class="post">
								<header>
<%-- 							     	測試: ${LoginOK.pswd}_${LoginOK.gender}_${ LoginOK.email} _${LoginOK.picture } --%>
<!-- 								<div class="postMetaInline-feedSummary inlineEditor-headerContent"> -->
<!-- 								<div class="inlineEditor-placeholder js-inlineEditorPrompt">Write here…</div> -->
									<div class="title">
										<h2><a href="#">資策盃冠軍終於到手</a></h2>
										<h3>不放棄！絕不放棄！永不放棄！</h3>
									</div>
									<div class="meta">
										<time class="published" datetime="2016-06-06">June 6, 2016</time>
										<a href="#" class="author"><span class="name">Shin Da Tsai</span><img src="images/3.jpg" alt="" /></a>
									</div>
								</header>
								<a href="#" class="image featured"><img src="images/band.jpg" alt="band" /></a>
								<p>雖然我們只有成軍短短半年，但大家都非常的努力！半年的密集訓練，每天從早上9點練到晚上8點，有時甚至到10點！每次看到我的隊員們累到直接躺在地上睡著了，我就一直告訴自己:我一定要給大家一個非常難忘的比賽經驗！從未想過我們會得冠軍...</p>
								<footer>
									<ul class="actions">
										<li><a href="#" class="button big">繼續閱讀</a></li>
									</ul>
									<ul class="stats">
										<li><a href="#">General</a></li>
										<li><a href="#" class="icon fa-heart">428</a></li>
										<li><a href="#" class="icon fa-comment">128</a></li>
									</ul>
								</footer>
							</article>

						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h2><a href="#">出版人生第一本圖畫書</a></h2>
										<p>別放棄你的夢想，否則你的夢想也會放棄你。</p>
									</div>
									<div class="meta">
										<time class="published" datetime="2016-05-24">May 24, 2016</time>
										<a href="#" class="author"><span class="name">景竣</span><img src="images/2.jpg" alt="" /></a>
									</div>
								</header>
								<a href="#" class="image featured"><img src="images/book.jpg" alt="" /></a>
								<p>小時候的夢想就是當一個漫畫家！從父母反對，師長朋友們的唾棄，到如今終於出版了人生的第一本圖畫書！這只是我的一小小步，但卻是我人生的一大大步！不管別人怎麼說怎麼看，我就是要一直一直畫下去！有一天我也要開漫畫展...</p>
								<footer>
									<ul class="actions">
										<li><a href="#" class="button big">繼續閱讀</a></li>
									</ul>
									<ul class="stats">
										<li><a href="#">General</a></li>
										<li><a href="#" class="icon fa-heart">228</a></li>
										<li><a href="#" class="icon fa-comment">198</a></li>
									</ul>
								</footer>
							</article>

						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h2><a href="#">我們的第100個旅行</a></h2>
										<p>幸福不在於我們擁有多少，而是在於我們享受多少。</p>
									</div>
									<div class="meta">
										<time class="published" datetime="2016-01-01">Jan 1, 2016</time>
										<a href="#" class="author"><span class="name">Fled Tee</span><img src="images/4.jpg" alt="" /></a>
									</div>
								</header>
								<a href="#" class="image featured"><img src="images/travel.jpg" alt="" /></a>
								<p>第100次的旅行，只是開始，我們還有數不完的旅行；數字，只不過是個符號，我們還要一起躺著看星星，數著那也數不完的星星。「現在就是幸福的時刻；這裡就是幸福的地方；而幸福的方法，就是讓身邊的人感到幸福。」...</p>
								<footer>
									<ul class="actions">
										<li><a href="#" class="button big">繼續閱讀</a></li>
									</ul>
									<ul class="stats">
										<li><a href="#">General</a></li>
										<li><a href="#" class="icon fa-heart">28</a></li>
										<li><a href="#" class="icon fa-comment">128</a></li>
									</ul>
								</footer>
							</article>


						<!-- Pagination -->
							<ul class="actions pagination">
<!-- 								<li><a href="" class="disabled button big previous">Previous Page</a></li> -->
<!-- 								<li><a href="#" class="button big next">Next Page</a></li> -->
							</ul>

					</div>

<!-- Sidebar -->
<section id="sidebar" style="margin-right:50px;">

						<!-- Intro -->
<!-- 							<section id="intro"> -->
<!-- 								<a href="#" class="logo"><img src="images/logo.jpg" alt="" /></a> -->
<!-- 								<header> -->
<!-- 									<h2>Life Editor</h2> -->
<!-- 									<p>Another fine responsive site template by <a href="http://html5up.net">HTML5 UP</a></p> -->
<!-- 								</header> -->
<!-- 							</section> -->

<!-- Mini Posts -->
<section>
   <div class="mini-posts" style="width:400px;">
     <h2>熱門人物</h2>
		<!-- Mini Post -->
		<article class="mini-post">
		  <div id="hotmans">
		  <c:forEach var="Target_specVO" items="${trgSvc.allByHotMan}">
		    <div><a href="#" ><img id="hotmanPic" src='${Target_specVO.trgPicPath}'/></a> <br></div>
		    <header style="margin-bottom:40px;padding:2px;">
			   <a href="#" class="author" ><span>${Target_specVO.userVO.lastName} ${Target_specVO.userVO.firstName}</span>
			   <img id="hotmanicon" src="GetUserPicture?id=${Target_specVO.userVO.userID}" title="${Target_specVO.userVO.lastName}${Target_specVO.userVO.firstName}" alt="userName" /></a>
			   <h4><a href="#">${Target_specVO.targetVO.trgName}</a></h4>
			   <h5><time class="published" datetime="${Target_specVO.targetVO.doneTime}">${Target_specVO.targetVO.doneTime}</time></h5>
			   <div class="fb-share-button" data-href="http://lifeeditor.cloudapp.net/lifeeditor/home.jsp" data-layout="button" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank"">分享</a></div> 
			</header>
			
		  </c:forEach>
		  </div>
		</article>

	</div>
</section>

<!-- Posts List -->
<!-- <section> -->
<!-- 	<ul class="posts"> -->
<!-- 		<li> -->
<!-- 			<article> -->
<!-- 				<header> -->
<!-- 					<h3><a href="#">Lorem ipsum fermentum ut nisl vitae</a></h3> -->
<!-- 					<time class="published" datetime="2015-10-20">October 20, 2015</time> -->
<!-- 				</header> -->
<!-- 			    <a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a> -->
<!-- 			</article> -->
<!-- 		</li> -->
<!-- 									<li> -->
<!-- 										<article> -->
<!-- 											<header> -->
<!-- 												<h3><a href="#">Convallis maximus nisl mattis nunc id lorem</a></h3> -->
<!-- 												<time class="published" datetime="2015-10-15">October 15, 2015</time> -->
<!-- 											</header> -->
<!-- 											<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a> -->
<!-- 										</article> -->
<!-- 									</li> -->
<!-- 									<li> -->
<!-- 										<article> -->
<!-- 											<header> -->
<!-- 												<h3><a href="#">Euismod amet placerat vivamus porttitor</a></h3> -->
<!-- 												<time class="published" datetime="2015-10-10">October 10, 2015</time> -->
<!-- 											</header> -->
<!-- 											<a href="#" class="image"><img src="images/pic10.jpg" alt="" /></a> -->
<!-- 										</article> -->
<!-- 									</li> -->
<!-- 									<li> -->
<!-- 										<article> -->
<!-- 											<header> -->
<!-- 												<h3><a href="#">Magna enim accumsan tortor cursus ultricies</a></h3> -->
<!-- 												<time class="published" datetime="2015-10-08">October 8, 2015</time> -->
<!-- 											</header> -->
<!-- 											<a href="#" class="image"><img src="images/pic11.jpg" alt="" /></a> -->
<!-- 										</article> -->
<!-- 									</li> -->
<!-- 									<li> -->
<!-- 										<article> -->
<!-- 											<header> -->
<!-- 												<h3><a href="#">Congue ullam corper lorem ipsum dolor</a></h3> -->
<!-- 												<time class="published" datetime="2015-10-06">October 7, 2015</time> -->
<!-- 											</header> -->
<!-- 											<a href="#" class="image"><img src="images/pic12.jpg" alt="" /></a> -->
<!-- 										</article> -->
<!-- 									</li> -->
<!-- 								</ul> -->
<!-- </section> -->

<!-- About -->
<!-- <section class="blurb"> -->
<!-- 								<h2>About</h2> -->
<!-- 								<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod amet placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at phasellus sed ultricies.</p> -->
<!-- 								<ul class="actions"> -->
<!-- 									<li><a href="#" class="button">Learn More</a></li> -->
<!-- 								</ul> -->
<!-- </section> -->

						<!-- Footer -->
							<section id="footer">
								<ul class="icons">
									<li><a href="#" class="fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="fa-facebook"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="fa-rss"><span class="label">RSS</span></a></li>
									<li><a href="#" class="fa-envelope"><span class="label">Email</span></a></li>
								</ul>
							</section>

					</section>

			</div>

		<!-- Scripts -->
			
			<script src="js/skel.min.js"></script>
			<script src="js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="js/main.js"></script>
<!-- 			<script> -->		
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
        function share() {   
    		FB.ui(
    	    {
    	      method: 'share',
    	      href: 'http://localhost:8080/lifeeditor/index.jsp',
    	    },
    	    // callback
    	    function(response) {
    	      if (response && !response.error_message) {
    	        alert('分享成功!');
    	      } else {
    	        // alert('Error while posting.');
    	      }
    	    }
    	  )
    	};
        </script>
<!-- 			</script> -->
	</body>

</html>
