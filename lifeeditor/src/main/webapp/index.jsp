<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="ico/favicon.ico">
    
    <title>Life Editor</title>
    
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="js/fancybox/jquery.fancybox.css" rel="stylesheet" />

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <style>
  .errorspan{
	font-size:10pt;
	color:red;
	
  }
  </style>

  <body data-spy="scroll" data-offset="0" data-target="#theMenu">
	<!-- Menu -->
	<nav class="menu" id="theMenu">
		<div class="menu-wrap">
			<h1 class="logo"><a href="index.jsp#home">Life Editor</a></h1>
			<i class="fa fa-times menu-close"></i>
			<a href="#home" class="smoothScroll">首頁</a>
			<a href="#about" class="smoothScroll">關於</a>
			<a href="#portfolio" class="smoothScroll">熱門人物</a>
			<a href="#contact" class="smoothScroll">連絡我們</a>
			<a href="register/register.jsp" class="smoothScroll">註冊</a>
			<a href="#modal" class="smoothScroll">會員登入</a>
			<a href="#"><i class="fa fa-facebook"></i></a>
			<a href="#"><i class="fa fa-twitter"></i></a>
			<a href="#"><i class="fa fa-dribbble"></i></a>
			<a href="#"><i class="fa fa-envelope"></i></a>
		</div>
		
		<!-- Menu button -->
		<div id="menuToggle"><i class="fa fa-bars"></i></div>
	</nav>

	<section id="home" name="home"></section>
	<div id="headerwrap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div><h1>Life Editor</h1>		
					<a id="modal_trigger" href="#modal" class="btn">註冊 /登入</a>		
					<!----------------------------------------------------- 	Login start --------------------------------------------------->
<!--     <div class="container"> -->
	<div id="modal" class="popupContainer" style="display:none;">
		<header class="popupHeader">
			<span class="header_title">Login</span>
			<span class="modal_close"><i class="fa fa-times"></i></span>
		</header>
		
		<section class="popupBody">
			<!-- Social Login -->
			<div class="social_login" style="margin:auto;">
				<div class="">					
					<div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="true" onlogin="checkLoginState();" ></div>
<!-- 						<fb:login-button scope="public_profile,email" onlogin="checkLoginState();" ></fb:login-button> -->
						<span class="icon"><i class="fa fa-facebook"></i></span>
						<span class="icon_title">使用Facebook帳號</span>		
<!-- 					</a> -->
				</div>
				<div class="action_btns">
				<div class="one_half"><a href="#" id="login_form" class="btn" >登入</a></div>   <!-- 	 onclick="window.location.href=('login.jsp')"    onclick="document.getElementById('form-id').submit();" -->
					<div class="one_half last"><a href="#" id="register_form" class="btn">註冊</a></div>
				</div>
			</div>

			<!-- Username & Password Login form -->
			<div class="user_login" style="margin:auto;">
				<form id="form-id" Action="Login.java" method="POST">
					<label>帳號</label>
					<input type="text" name="account" size="10">					
					<br />
					<label>密碼</label>
					<input type="password" name="pswd" size="10">
					<small><Font id="ErrorMsg" color='red' size="-1"></Font></small>
					<br />
					<div class="checkbox">
						<input id="remember" type="checkbox" />
						<label for="remember">記住這個帳號</label>
					</div>
					<div class="action_btns">
						<div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> 上一頁</a></div>
						<div class="one_half last"><a href="#" class="btn btn_red"  onclick="LoginAjax();">登入</a></div>
					</div>
				</form>
				<a href="#" class="forgot_password">忘記密碼</a>
			</div>

			<!-- Register Form -->
			<div id="user_register" class="user_register">
				<div id="div1" class="container-fluid">
	<div class="row">
	<FORM METHOD="post" ACTION="register/user_spec.do" id="form1" enctype="multipart/form-data">
    <div class="col-md-6">
	<div>
		<label for="exampleInputaccount">帳號:</label>
		<input type="TEXT" class="form-control" id="exampleInputaccount" name="account" value="${param.account}" size="45"  /><span id="ErrorMsg2" class="errorspan"></span>
	</div>
	<div>
		<label for="exampleInputpswd">密碼</label>
		<input type="password" class="form-control" id="exampleInputpswd"  name="pswd" value="${param.pswd}" size="45" /><span id="ErrorMsg3" class="errorspan"></span>
	</div>
	<div>
		<label for="exampleInputpswd1">再次輸入密碼</label>
		<input type="password" class="form-control" id="exampleInputpswd1" name="pswd1" value="${param.pswd1}" size="45" /><span id="ErrorMsg4" class="errorspan"></span>
	</div>
	<div class="form-group">
		<label for="exampleInputlastName">姓氏</label>
		<input type="TEXT" class="form-control" id="exampleInputlastName" name="lastName" value="${param.lastName}" size="22"><span id="ErrorMsg5" class="errorspan"></span>
	</div>
	<div class="form-group">
		<label for="exampleInputfirstName">姓名</label>
		<input type="TEXT" class="form-control" id="exampleInputfirstName" name="firstName" value="${param.firstName}" size="22" /><span id="ErrorMsg6" class="errorspan"></span>
	</div>
	<div class="form-group">
		<label for="exampleInputgender">性別</label><br>
		<input  id="exampleInputgender" type="radio" name="gender" value="M" size="22" />男
		<input  id="exampleInputgender" type="radio" name="gender" value="F" size="22" />女
		<span id="ErrorMsg7" class="errorspan"></span>
	</div>
	<div class="form-group">
	
		<label for="exampleInputbirthdate">生日</label>
		<input type="date" class="form-control" id="exampleInputbirthdate" name="birthdate" value="${param.birthdate}" size="22"  /><span id="ErrorMsg8" class="errorspan"></span>
	</div>
	</div>
	<div style="padding-left:50px" class="col-md-6">
	<div class="form-group">
		<label for="exampleInputemail">電子信箱</label>
		<input type="TEXT" class="form-control" id="exampleInputemail" name="email" value="${param.email}" size="22"  /><span id="ErrorMsg9" class="errorspan"></span>
	</div>
	<div class="form-group">
		<label for="exampleInputaddress">住址</label>
		<input type="TEXT" class="form-control" id="exampleInputaddress" name="address" value="${param.address}" size="22"  /><span id="ErrorMsg10" class="errorspan"></span>
	</div>
	<div class="form-group">
		<label  for="exampleInputphone">電話號碼</label>
		<input type="TEXT"  class="form-control" id="exampleInputphone" name="phone" value="${param.phone}" size="22"  /><span id="ErrorMsg11" class="errorspan"></span>
	</div>
	<div id="div" class="container-fluid">
		<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label for="exampleInputpicture">上傳大頭貼</label>
		<input type="file" id="exampleInputpicture" class="upl" name="picture" size="22"  /><span id="ErrorMsg12" class="errorspan"></span>
 	</div>
 	</div>
 	<div class="col-md-6">
 	<div>
 	<label>預覽大頭貼</label><br>
        <img class="preview" style="max-width: 150px; max-height: 100px;">
        <div class="size"></div>
    </div>
    </div>
    </div>
    </div>
    
	<div style="font-size:20px;padding-top:10px">
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
		<div class="g-recaptcha" data-sitekey="6LfoPyETAAAAAG8hEQH-RAVNjAft9mX6uzK70CTD"></div>
		<noscript>
		  <div >
		    <div style="width: 302px; height: 422px; position: relative;">
		      <div style="width: 302px; height: 422px; position: absolute;">
		        <iframe src="https://www.google.com/recaptcha/api/fallback?key=6LfoPyETAAAAAG8hEQH-RAVNjAft9mX6uzK70CTD"
		                frameborder="0" scrolling="no"
		                style="width: 302px; height:422px; border-style: none;">
		        </iframe>
		      </div>
		    </div>
		    <div style="width: 300px; height: 60px; border-style: none;
		                   bottom: 12px; left: 25px; margin: 0px; padding: 0px; right: 25px;
		                   background: #f9f9f9; border: 1px solid #c1c1c1; border-radius: 3px;">
		      <textarea id="g-recaptcha-response" name="g-recaptcha-response"
		                   class="g-recaptcha-response"
		                   style="width: 250px; height: 40px; border: 1px solid #c1c1c1;
		                          margin: 10px 25px; padding: 0px; resize: none;" >
		      </textarea>
		    </div>
		  </div>
		</noscript>
		</div>
		<div style="font-size:12pt;color:red;"><p id="ErrorMsg1" class="errorspan"></p></div>
		
		<div class="action_btns" style="padding-top:10px" >
						<input type="hidden" name="action" value="insert">
						<div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> 上一頁</a></div>
						<div class="one_half last"><a href="#" class="btn btn_red"  onclick="RegisterAjax()">註冊</a></div>
		    			
		</div>
		</div>
			
		</FORM>
			</div>
			</div>
			</div>
		</section>
	</div>
</div>
<!-------------------------------------------------- Login end ----------------------------------------------------------->			
					</div>
				</div>
				
			</div><! --/row -->
		</div><! --/container -->
	</div><! --/headerwrap -->

	<section id="about" name="about"></section>
	<div id="aboutwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 name">
					<img class="img-responsive" src="images/quote.jpg">
				</div><! --/col-lg-4-->
				<div class="col-lg-8 name-desc" >
					<h2>Archive your goals and expand your horizon</h2>
					<div class="col-md-6">
					<br>
						<p style="Font-family:Microsoft JhengHei;font-size: 20px;">今年，你完成了哪些目標?<br>下一個十年，你會在哪裡?<br>一個又一個的目標計畫...<br>一本又一本的行事曆...<br>如今都到哪裡去了?<br>完成了哪些目標呢?</p>
					</div>
					<div class="col-md-6">
					<br>
						<p style="Font-family:Microsoft JhengHei;font-size: 15px;">Life Editor是個協助使用者立訂目標，藉由追求目標來充實人生的平台。透過立訂的目標、行事曆與成就系統，使用者可以自由挑戰各式各樣新奇有趣的任務。同時還能利用社群的功能，分享目標、尋找同好、結識新朋走，甚至是跟好友們進行資訊及心得上的交流，最後一同來完成某項目標!</p>
					</div>		
				</div><! --/col-lg-8-->
		
			</div><!-- /row -->
		</div><!-- /container -->
	</div><!-- /aboutwrap -->
		
	<! -- HOTMANS SECTION -->
	<section id="portfolio" name="portfolio"></section>
	<div id="portfoliowrap">
		<div class="container">
			<div class="row">
				<h1>熱門人物</h1>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
<!-- 					<div class="project-wrapper"> -->
<!-- 	                    <div class="project"> -->
	                        <div class="photo-wrapper" style="width:380px;height:auto;">
	                            <div class="photo">
	                            	<a class="fancybox" href="#inline1" title="蛋黃哥懶得展-高雄科工館"><img style="width:370px;height:250px;" class="img-responsive" src="images/portfolio/port04.jpg" alt="蛋黃哥懶得展"></a>
	                            </div>
	                            <div id="inline1" style="width:400px;height:auto;display: none;">
		                             <h3 style="text-align: center;Font-family:Microsoft YaHei;">蛋黃哥懶得展-高雄科工館</h3>
		                             <p style="Font-family:Microsoft JhengHei;font-size: 15px;">即使很多人都說十萬人裡只有一人有機會成為漫畫家！可以藉由畫漫畫賺錢的漫畫家！但那又怎麼樣呢？蛋黃哥經過好幾番的評選後，心情起起伏伏到最後我都快放棄了！想想就算沒有得獎，也不過就是繼續懶洋洋過日子，繼續畫自己想畫的。但沒想到，最後得了第二名！三麗鷗公司後來幫蛋黃哥製作的動畫，讓他的人氣直直攀升！更讓我訝異的是，台灣人特別愛他，這是我最感動的地方，因為我很喜歡台灣！這次蛋黃哥受邀來到台灣策展，我也親自到場與粉絲們見面，希望在短短與粉絲見面的時間裡，可以用蛋黃哥的精神鼓勵每一位喜歡畫畫、想成為漫畫家的台灣朋友們！在你快要放棄時，不要放棄，蛋黃哥懶的爭論但又努力活著的精神與你們同在！</p>
	                            </div>
	                            <div class="overlay"></div>
	                        </div>
<!-- 	                    </div> -->
<!-- 	                </div> -->
				</div><!-- col-lg-4 -->
				
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
<!-- 					<div class="project-wrapper"> -->
<!-- 	                    <div class="project"> -->
	                        <div class="photo-wrapper" style="width:380px;height:auto;">
	                            <div class="photo">
	                            	<a class="fancybox" href="#inline5" title="最有價值球員 Stephen Curry"><img style="width:370px;height:250px;" class="img-responsive" src="images/portfolio/port02.jpg" alt="Stephen-Curry"></a>
	                            </div>
	                            <div id="inline5" style="width:400px;height:auto;display: none;">
		                             <h3 style="text-align: center;Font-family:Microsoft YaHei;color:black;"><a class="fancybox" style="color:black;" href="#inline5-1">成功不是個意外</a><h3>
		                             <p style="Font-family:Microsoft JhengHei;font-size: 15px;">「成功不是個意外；成功其實是一個選擇。」我只是做出了養成好習慣的選擇。而我給你的問題是，你今天所有的習慣能成就你對明天所抱的夢想嗎？那是件你每天都必須要問自己的事，因為不論你今天照慣例做了什麼事情，將會決定你明天所在的位置。<br><br>確保你活在當下，每一天都用盡全力生活。我希望我激勵全世界的人做自己、不驕傲，並對生命中的每件好事心存感恩。我真的很榮幸能成為你們的年度最有價值球員。非常感謝你們。</p>
	                            </div>
	                            <div id="inline5-1" style="width:400px;height:auto;display: none;">
	                            <iframe width="400" height="320" src="https://www.youtube.com/embed/RbsmMnAKeOI"></iframe>
	                            </div>
<!-- 	                            <div class="overlay"></div> -->
	                        </div>
<!-- 	                    </div> -->
<!-- 	                </div> -->
				</div><!-- col-lg-4 -->
				
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
<!-- 					<div class="project-wrapper"> -->
<!-- 	                    <div class="project"> -->
	                        <div class="photo-wrapper" style="width:380px;height:auto;">
	                            <div class="photo">
	                            	<a class="fancybox" href="#inline3" title="Mr.Lady台大盃冠軍"><img style="width:370px;height:250px;" class="img-responsive" src="images/portfolio/port06.jpg" alt="Mr.Lady"></a>
	                            </div>
	                             <div id="inline3" style="width:400px;height:auto;display: none;">
		                             <h3 style="text-align: center;Font-family:Microsoft YaHei;">Mr.Lady台大盃冠軍</h3>
		                             <p style="Font-family:Microsoft JhengHei;font-size: 15px;">再看ㄧ次<a href="https://www.youtube.com/watch?list=PLLzbXUy38VCKdKKLh9UaRdP1YO6LZvRVk&v=fa7sdK5abug">影片</a>雷迪的心情還是跟所有人ㄧ樣激動～也相當感謝大家ㄧ直以來對於Mr.Lady的支持（深深ㄧ鞠躬）！雖然拿到台大盃冠軍是非常大的肯定，也是雷迪成軍多年來相當重要的里程碑，但這絕對不是終點，我們還是會繼續努力帶給大家更棒的作品！這次的作品無論在音樂、舞蹈、道具、架構⋯等各方面雷迪都下足了功夫，尤其最後ㄧ段十字街頭音樂的改編更讓我們費盡心思～這裡要特別感謝DJ KUEI 魁和RED 芮德為雷迪重新錄製了ㄧ個版本，給我們相當大的方向和啟發，最後才讓Mr.Lady創作出最終段瘋狂炸裂的雷迪版十字街頭！非常感謝他們的大力贊助，也希望大家對於這些同樣在藝術領域不斷堅持的創作者，能夠不吝嗇給予掌聲和支持，讓我們更有前進的動力哦！</p>
	                            </div>
<!-- 	                            <div class="overlay"></div> -->
	                        </div>
<!-- 	                    </div> -->
<!-- 	                </div> -->
				</div><!-- col-lg-4 -->
			</div><!-- /row -->
	
			<div class="row mt">
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
<!-- 					<div class="project-wrapper"> -->
<!-- 	                    <div class="project"> -->
	                        <div class="photo-wrapper" style="width:380px;height:auto;">
	                            <div class="photo">
	                            	<a class="fancybox" href="#inline4"><img style="width:370px;height:250px;" class="img-responsive" src="images/portfolio/port01.jpg" alt="Elon Musk"></a>
	                            </div>
	                            <div id="inline4" style="width:400px;height:auto;display: none;">
		                             <h3 style="text-align: center;Font-family:Microsoft YaHei;">特斯拉稱霸全球</h3>
		                             <p style="Font-family:Microsoft JhengHei;font-size: 15px;">2013年，為了證明電動車的潛力，我創立特斯拉公司。以往很多人都認為，電動車速度太慢、跑不遠、外型又醜，跟高爾夫球車沒兩樣。為了改變人們的印象，我們開發出了特斯拉Roadster，一款速度快、跑得遠、造型拉風的電動跑車。<br><br>所以，想要開公司，你必須實實在在地做出產品原型。因為，再怎麼精彩的紙上作業、PowerPoint報告，都比不上拿出實際產品有說服力。<br><br>Roadster面世後，又有人說，「就算做得出昂貴的限量跑車，你們有本事做真正的量產汽車嗎？」沒問題，我們就推出四門房車Model S，證明給大家看。這就是我一路走來的創業歷程。我想說的是，你們都是二十一世紀的魔法師，想像力是沒有極限的，別讓任何事情阻止你，盡情地變魔法吧。</p>
	                            </div>
	                            <div class="overlay"></div>
	                        </div>
<!-- 	                    </div> -->
<!-- 	                </div> -->
				</div><!-- col-lg-4 -->
				
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
<!-- 					<div class="project-wrapper"> -->
<!-- 	                    <div class="project"> -->
	                        <div class="photo-wrapper" style="width:380px;height:auto;">
	                            <div class="photo">
	                              <a class="fancybox" href="#inline2" title="宥勝之旅-帶阿嬤搭郵輪"><img style="width:370px;height:250px;" class="img-responsive" src="images/portfolio/port05.jpg" alt=""></a>                           
	                            </div>               
	                            <div id="inline2" style="width:400px;height:auto;display: none;">
		                             <h3 style="text-align: center;Font-family:Microsoft YaHei;">宥勝之旅-帶阿嬤搭郵輪</h3>
		                             <p style="Font-family:Microsoft JhengHei;font-size: 15px;">我阿嬤將近要九十歲了，今天，是她很重要的一個日子...阿嬤不識字，因為她沒有上過學，可是她會用日文做筆記，寫些電話號碼什麼的，她總是在送弟弟上學之後偷偷趴在教室的床邊，看一點片假名，學一些漢字。這個如電影情節般的畫面，造就了阿嬤筆記本裡那些歪歪斜斜與不甚標準的日文字母...所以阿嬤對日本充滿了特殊情感，所以她這輩子，一直都很想去一趟日本。但經過了這麼多年，阿嬤的身體狀況已經不是用「一年不如一年」來形容了，而是一季不如一季，甚至是一月不如一月...所以當我在新加坡帶著妻女搭上遊輪的那一刻，我當下就立刻決定，就是它了！我要帶阿嬤搭遊輪去日本！而今天，就是遊輪就要啟航的日子。雖然到最後，我決定只讓阿嬤走下遊輪一天，也只能拜訪離台灣最近的沖繩，但我想，這也已經非常足夠了，在一個無法再走遠路的年紀，以及在一個無法離家太久的身體狀況下。希望阿嬤這趟能平平安安，開開心心，雖然她現在跟小孩一樣，有固定要吃、固定要睡的作息，而且擁有不肯坐輪椅的堅持。但我還是會一直陪在妳身旁的，陪妳慢慢走，陪妳慢慢吃，因為妳以前就是這樣陪著我，我一直沒有忘記，所以現在就換我牽著妳，帶妳想去的地方吧！</p>
	                            </div>
	                        </div>
<!-- 	                    </div> -->
<!-- 	                </div> -->
				</div><!-- col-lg-4 -->
				
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
<!-- 					<div class="project-wrapper"> -->
<!-- 	                    <div class="project"> -->
	                        <div class="photo-wrapper" style="width:380px;height:auto;">
	                            <div class="photo">
	                            	<a class="fancybox" href="images/portfolio/port03.jpg"><img style="width:370px;height:250px;" class="img-responsive" src="images/portfolio/port03.jpg" alt=""></a>
	                            </div>
	                            <div class="overlay"></div>
	                        </div>
<!-- 	                    </div> -->
<!-- 	                </div> -->
				</div><!-- col-lg-4 -->
			</div><!-- /row -->
		</div><! --/container -->
		<div class="container">
			<div class="row mt centered">
				<h1>如何開始不一樣的人生</h1>
				<div class="col-lg-4 proc">
					<i class="fa fa-user"></i>
					<h3>登入會員</h3><br>
					<p>註冊登入會員<br>開始不一樣的人生</p>
				</div>
				<div class="col-lg-4 proc">
					<i class="fa fa-pencil"></i>
					<h3>設定目標</h3><br>
					<p>依照個人目標客製化行事曆<br>亦可挑戰Life Editor製訂的目標</p>
				</div>
				<div class="col-lg-4 proc">
					<i class="fa fa-trophy"></i>
					<h3>成功人生</h3><br>
					<p>人性化提醒使用者確實完成目標<br>讓你的人生多采多姿</p>
					
				</div>
				
			</div><! --/row -->
		</div><! --/container -->
	</div><! --/Portfoliowrap -->
	
	<div id="testimonials">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 mt">
				
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					  <!-- Wrapper for slides -->
					  <div class="carousel-inner">
					    <div class="item active mb centered">
					      <h3>Fled Tee</h3>
					      <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					      <p><img class="img-circle" src="images/pic-t1.jpg" width="80"></p>
					    </div>

					    <div class="item mb centered">
					      <h3>Jones Wang</h3>
					      <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					      <p><img class="img-circle" src="images/pic-t2.jpg" width="80"></p>
					    </div>

					    <div class="item mb centered">
					      <h3>Amy Chen</h3>
					      <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					      <p><img class="img-circle" src="images/pic-t3.jpg" width="80"></p>
					    </div>
					    
					    <div class="item mb centered">
					      <h3>Shin Da Tsai</h3>
					      <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					      <p><img class="img-circle" src="images/pic-t4.jpg" width="80"></p>
					    </div>
					    
					    <div class="item mb centered">
					      <h3>Tzu Hao Kuan</h3>
					      <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					      <p><img class="img-circle" src="images/pic-t5.jpg" width="80"></p>
					    </div>
					    
					    <div class="item mb centered">
					      <h3>YANG,JING-JUN</h3>
					      <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					      <p><img class="img-circle" src="images/pic-t6.jpg" width="80"></p>
					    </div>

					  </div>
					  <!-- Indicators -->
					  <ol class="carousel-indicators">
					    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
					  </ol>
					</div>
					  
				</div><! --/col-lg-8 -->
			</div><! --/row -->
		</div><! --/container -->
	</div><! --/testimonials -->
	
	<! -- SERVICE SECTION -->
	<section id="contact" name="contact"></section>
	<! -- CONTACT SEPARATOR -->
<!-- 	<div class="sep contact" data-stellar-background-ratio="0.5"></div> -->
	
	<div id="contactwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<p>CONTACT US RIGHT NOW!</p>
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
					<p>
						<small>No. 390, Section 1, Fuxing S Rd,<br/>
						 Da’an District, Taipei City,<br/>
						TAIWAN</small>
					</p>
					<p>
						<small>Tel. +886 6631 6599<br/>
						eeit85@gmail.com<br/>
						First Group Design
					</p>
			
				</div>
				
				<div class="col-lg-6">
					<form role="form">
					  <div class="form-group">
					    <label for="exampleInputName1">Your Name</label>
					    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter name">
					    <label for="exampleInputEmail1">Email address</label>
					    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
					    <label for="exampleInputText1">Message</label>
					    <textarea class="form-control" rows="3"></textarea>
					  </div>
					  <button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div>
			
			</div><! --/row -->
		</div><!-- /container -->
	</div>
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="js/classie.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/smoothscroll.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/fancybox/jquery.fancybox.js"></script>    
	<script src="js/main.js"></script>
		<script>
		$(function(){
			$.stellar({
				horizontalScrolling: false,
				verticalOffset: 40
			});
		});
		</script>
		
		<script type="text/javascript">
      $(function() {
        //    fancybox
          jQuery(".fancybox").fancybox();
      });
	   </script>
<!----------------------------------------------- login----start---------------------------------------------------->
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript">
	$("#modal_trigger").leanModal({top : 200, overlay : 0.6, closeButton: ".modal_close" });

	$(function(){
		// Calling Login Form
		$("#login_form").click(function(){
			$(".social_login").hide();
			$(".user_login").show();
			return false;
		});

		// Calling Register Form
		$("#register_form").click(function(){
			$(".social_login").hide();
			$(".user_register").show();
			$(".header_title").text('Register');
			return false;
		});

		// Going back to Social Forms
		$(".back_btn").click(function(){
			$(".user_login").hide();
			$(".user_register").hide();
			$(".social_login").show();
			$(".header_title").text('Login');
			return false;
		});

	})

</script>
<script>
	$(function() {
		$("#form-id").submit(function(e)
				{
				    var postData = $(this).serializeArray(); 
				    var formURL = $(this).attr("Action");
			
				    $.ajax(
				    {
				        url : 'ch04_02/Login.do',
				        type: "POST",
				        data : postData,
				        success:function(data) 
				        {   
				        		if(data != "") {
				        			var errMsg = JSON.parse(data);	
					    			
	 				             	       	
					        	    document.getElementById("ErrorMsg").innerHTML =errMsg.LoginError;       
				        		}else {
				        			window.location.href = "home.jsp"
				        		}
				    			
				        }
				        
				    });
				    e.preventDefault(); //STOP default action
// 				    e.unbind(); //unbind. to stop multiple form submit.
				});
	})
	function statusChangeCallback(response) { //檢查登入狀態 為您的回呼所提供 response 的物件中含有數個欄位
		console.log('statusChangeCallback');
		console.log(response);

		if (response.status === 'connected') {
			// 這位用戶已登入 Facebook，也已經登入您的應用程式
			
			testAPI();
		} else if (response.status === 'not_authorized') {
			// 這位用戶已登入 Facebook，但尚未登入您的應用程式。
			document.getElementById('status').innerHTML = '可使用FB快速登入，請同意分享Email';
		} else {
			//這位用戶沒有登入 Facebook，因此您無法得知用戶是否已登入您的應用程式。或者之前已呼叫 FB.logout()，因此無法連結至 Facebook。
			document.getElementById('status').innerHTML = '可使用FB快速登入，請同意分享Email';

		}
	}
	function checkLoginState() {  //檢查登入狀態 
		FB.getLoginStatus(function(response) {  //存取權杖
			statusChangeCallback(response);
		});
	}

	window.fbAsyncInit = function() {
		FB.init({
			appId : '236995580009135',
			//appId : 1751012028468871,
			cookie : true, // enable cookies to allow the server to access 
			// the session
			xfbml : true, // parse social plugins on this page
			version : 'v2.2' 
		});

	};

	// Load the SDK asynchronously
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/zh_TW/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	function testAPI() {
		console.log('Welcome!  Fetching your information.... ');
		FB.api('/me','GET', {"fields":"email,last_name,first_name,id,gender,picture"},
				  function(response){					   
							 ajaxPost(response.email,response.last_name,response.first_name,response.id,response.gender);														
						});		
}
	function LoginAjax(){
		
		$("#form-id").submit();
		
	}
	
	
	function ajaxPost(email,last_name,first_name,id,gender)
	{
		
	      //===AJAX POST===
	        var params = {"EMAIL" : email ,"LASTNAME" : last_name ,"FIRSTNAME" : first_name ,"PSWD" : id,"GENDER":gender };
	         $.ajax({
	            url: 'ch04_02/Fb.do',
	            type:"post",
	            data: params,
	            success: function(data){
	                //表單成功送出後會執行的地方	               
                    alert('個資已被送出');
		      
		         	 window.location.href =  "${ctx}/home.jsp";
			
	            }
	       });
	} 		
</script>
<script>
$(function (){
	 
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
 
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("檔案大小：" + KB + " KB");
            }
 
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl", function (){
        preview(this);
    })
    
})
</script>
<script>

$(function() {
$("#form1").submit(function(e)
		{
		    var postData = new FormData(this ); 
		    var formURL = $(this).attr("Action");
	
		    $.ajax(
		    {
		        url : formURL,
		        type: "POST",
		        processData: false,
		        contentType: false,
		        data : postData,
		        
		        success:function(data) 
		        {   
		        		if(data != "") {
		        			var errMsg = JSON.parse(data);	
			    			
				            
		        			if(errMsg.errorCaptcha != undefined){
		        				document.getElementById("ErrorMsg1").innerHTML =errMsg.errorCaptcha;
				        	}else{
				        		$("#ErrorMsg1").empty();
				        	}4
			        	    if(errMsg.errorAccountempty != undefined){
			        	    	document.getElementById("ErrorMsg2").innerHTML =errMsg.errorAccountempty;
				        	}else{
				        		$("#ErrorMsg2").empty();
				        	}
			        	    if(errMsg.errorpswd != undefined){
			        	    	document.getElementById("ErrorMsg3").innerHTML =errMsg.errorpswd;
				        	}else{
				        		$("#ErrorMsg3").empty();
				        	}
			        	    if(errMsg.errorpswd1 != undefined){
			        	    	document.getElementById("ErrorMsg4").innerHTML =errMsg.errorpswd1;
				        	}else{
				        		$("#ErrorMsg4").empty();
				        	}
			        	    if(errMsg.errorlastName != undefined){
			        	    	document.getElementById("ErrorMsg5").innerHTML =errMsg.errorlastName;
				        	}else{
				        		$("#ErrorMsg5").empty();
				        	}
			        	    if(errMsg.errorfirstName != undefined){
			        	    	document.getElementById("ErrorMsg6").innerHTML =errMsg.errorfirstName;
				        	}else{
				        		$("#ErrorMsg6").empty();
				        	}
			        	    if(errMsg.errorgender != undefined){
			        	    	document.getElementById("ErrorMsg7").innerHTML =errMsg.errorgender;
				        	}else{
				        		$("#ErrorMsg7").empty();
				        	}
			        	    if(errMsg.errorbirthdate != undefined){
			        	    	document.getElementById("ErrorMsg8").innerHTML =errMsg.errorbirthdate;
				        	}else{
				        		$("#ErrorMsg8").empty();
				        	}
			        	    if(errMsg.erroremail != undefined){
			        	    	document.getElementById("ErrorMsg9").innerHTML =errMsg.erroremail;
				        	}else{
				        		$("#ErrorMsg9").empty();
				        	}
			        	    if(errMsg.erroraddress != undefined){
			        	    	document.getElementById("ErrorMsg10").innerHTML =errMsg.erroraddress;
				        	}else{
				        		$("#ErrorMsg10").empty();
				        	}
			        	    if(errMsg.errorphone != undefined){
			        	    	document.getElementById("ErrorMsg11").innerHTML =errMsg.errorphone;
				        	}else{
				        		$("#ErrorMsg11").empty();
				        	}
			        	    if(errMsg.errorpicture != undefined){
			        	    	document.getElementById("ErrorMsg12").innerHTML =errMsg.errorpicture;
				        	}else{
				        		$("#ErrorMsg12").empty();
				        	}
		        		}else{
		        			$(".user_register").empty();
		        			document.getElementById("user_register").innerHTML ="<h1 style='color:black'>系統正在寄信給您</h1>";
		        			
		        		}
		    			
		        }
		        
		    });
		    e.preventDefault(); //STOP default action
//			    e.unbind(); //unbind. to stop multiple form submit.
		});
});
function RegisterAjax(){
	
	$("#form1").submit();
	
}
</script>
// 	<!------------------------------------------- login----end------------------------------------------------>
  </body>
</html>
