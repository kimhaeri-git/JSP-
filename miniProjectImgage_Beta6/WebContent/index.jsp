<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>JSP 이미지 영상처리 .MiniProject_Beta5</title>

    <!-- load CSS -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600"
    />
    <!-- Google web font "Open Sans" -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <!-- <link rel="stylesheet" href="slick/slick.css" /> -->
    <!-- <link rel="stylesheet" href="slick/slick-theme.css" /> -->
    <link rel="stylesheet" href="css/magnific-popup.css" />
    <link rel="stylesheet" href="css/tooplate-style.css?ver1" />
    <link rel="stylesheet" href="css/canvas-style.css?ver4" />
    <!-- Templatemo style -->
   
  </head>

  <body>
    <!-- Loader -->
    <div id="loader-wrapper">
      <div id="loader"></div>
      <div class="loader-section section-left"></div>
      <div class="loader-section section-right"></div>
    </div>

    <div class="tm-main-container">
    	
      <div class="tm-top-container">
      	
        <!-- Menu -->
        <nav id="tmNav" class="tm-nav">
          <a class="tm-navbar-menu" href="#" onclick="reutrn false;">Menu</a>
          <ul class="tm-nav-links">
            <li id="loginPopup" class="tm-nav-item active">
              <a href="#" onclick="reutrn false;" data-linkid="0" data-align="right" class="tm-nav-link">Intro</a>
            </li>
            <li class="tm-nav-item">
              <a href="#" onclick="reutrn false;" data-linkid="1" data-align="right" class="tm-nav-link">About</a>
            </li>
            <li class="tm-nav-item">
               <a
                href="#" onclick="reutrn false;"
                data-linkid="2"
                data-align="middle"
                class="tm-nav-link">Work</a> 
                
            </li>
            <li class="tm-nav-item">
              <a href="#" onclick="reutrn false;" data-linkid="3" data-align="left" class="tm-nav-link">Contact</a>
            </li>
          </ul>
        </nav>

        <!-- Site header -->
        <header class="tm-site-header-box tm-bg-dark">
          <h1 class="tm-site-title">Mini Project</h1>
          <p class="mb-0 tm-site-subtitle">JSP 이미지 영상처리</p>
        </header>
      </div>
      <!-- tm-top-container -->
      <div style="border: 1px solid black;">
      
      </div>

      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <!-- Site content -->
            <div class="tm-content">
            	<form method="post" action="./member/login_server.jsp" accept-charset="utf-8">
	            	<div style="width: 500px;height: 250px;margin-right: 200px;margin-top: 150px;text-align:center;display: none" id="memberLog">
	            		<!-- 아이디 -->
	            		<input type="text" style="width:100%;margin-top: 30px;opacity: 0.7;text-align: center;" placeholder="아이디 입력" name="u_id">
	            		<!-- 비밀번호 -->
	            		<input type="text" style="width:100%;margin-top: 20px;margin-bottom: 20px;opacity: 0.7;text-align: center;" placeholder="패스워드 입력" name="u_pass">
	            		<input type="submit" value="로그인" style="opacity: 0.5;width: 40%;" >
	            		<input type="button" value="회원가입" style="opacity: 0.5;width: 40%;" onclick="location.href='/miniProjectImgage_Beta6/member/join.jsp'">
	            	</div>
            	</form>
            	
              <!-- Section 0 Introduction -->
              <section class="tm-section tm-section-0"> 
                <h2 class="tm-section-title mb-3 font-weight-bold">
                  Introduction
                </h2>
                <div class="tm-textbox tm-bg-dark">
                  <p>
                   이미지 영상처리 프로그램
                  </p>
                  <p class="mb-0">
                    - 서버 기반의 JSP 영상처리 프로그래밍 개발 - <br>
                    javascript 디지털 영상처리 프로그래밍 미니 프로젝트(Ver 1.0)프로젝트에서 업그레이드하여 
                    서버사이드의 이미지 영상처리를 동적 JSP 프로그래밍으로 구현하여 DB와 연동하여 특정 회원에 한해 
                    영상처리를 사용할 수 있도록 처리하였다. 
                  </p>
                </div>
                <a href="#" onclick="reutrn false;" id="tm_about_link" data-linkid="1" class="tm-link">Read More</a>
              </section>

              <!-- Section 1 About Me -->
              <section class="tm-section tm-section-1">
                <div class="tm-textbox tm-textbox-2 tm-bg-dark">
                  <h2 class="tm-text-blue mb-4">프로젝트 개요</h2>
                  <p class="mb-4">
                    - 개발 환경 - <br>
                  </p>
                  <p class="mb-4">
                    운영체제 : virtual box / windows server 2022 <br>
                    프로그래밍 언어 : [백엔드]java [개발 언어] <br>
                               [프론트]HTML5/CSS/JavaScript <br>
                    Java 사용 버젼 및 개발 Tool : jdk 1.7 [java 버전] / Eclipse 2021-09 [개발 Tool]<br>
                    웹 서버 : APACHE <br>
                    WAS [Web Application Server] : Tomcat        
                  </p>
                  <a
                    href="#" onclick="reutrn false;"
                    id="tm_work_link"
                    data-linkid="2"
                    class="tm-link m-0"
                    >Next</a
                  >
                </div>
              </section>

              <!-- Section 2 Work (Gallery) -->
              <section class="tm-section tm-section-2 mx-auto">
                <div class="">
                <form id="menubar" name='fileForm' method='post' action='photo_server.jsp'
					enctype='multipart/form-data'>
					<span> 
					<select name="algo">
						<option value=""> ~~ 선택 하세요 ~~~ </option>
						<option value="101"> 반전 처리 </option>
						<option value="102"> 밝게/어둡게</option>
						<option value="103"> 명암 대비</option>
						<option value=""> -- 선택하세요[기하학] -- </option>
						<option value=201> 축소하기 </option>
						<option value=202> 확대하기 </option>
						<option value=203> 양선형 보간법 </option>
						<option value=""> -- 선택하세요[히스토그램] -- </option>
						<option value=301> 가우시안 필터 </option>
						<option value=302> 엔드인 탐색 </option>
						<option value=""> -- 선택하세요[영역] -- </option>
						<option value=401> 엠보싱 </option>
						<option value=402> LoG </option>
						<option value=403> DoG </option>
					</select>
					</span>
					<span> value: <input type='text' value = 50 name='addVal'></span>
					<span> File: <input type='file' name='filename' ></span>
					<span> <input type='submit' value='영상처리' style="width:200px;background-color: white;">	</span>
				</form>
	                <!-- <canvas id='inCanvas' style="background-color:rgb(144, 219, 219)" class="canvasIn" ></canvas>
	       			<canvas id='outCanvas' style="background-color:rgb(189, 162, 165)" class="canvasOut" ></canvas> -->
                </div>
              </section>

              <!-- Section 3 Contact -->
              <section class="tm-section tm-section-3 tm-section-left">
                <form action="" class="tm-contact-form" method="post">
                  <div class="form-group mb-4">
                    <input
                      type="text"
                      id="contact_name"
                      name="contact_name"
                      class="form-control"
                      placeholder="김혜리"
                      disabled
                    />
                  </div>
                  <div class="form-group mb-4">
                    <input
                      type="email"
                      id="contact_email"
                      name="contact_email"
                      class="form-control"
                      placeholder="hr4454@naver.com"
                      disabled
                    />
                  </div>
                  <div class="form-group mb-4">
                    <textarea
                      rows="4"
                      id="contact_message"
                      name="contact_message"
                      class="form-control"
                      placeholder="안녕하세요 . 신입 개발자 김혜리입니다. 개발 가능한 언어로는 JAVA,Python,javascript,jquery,ajax,javascript,css,html 이 있습니다. 빅데이터 Hadoop-HIVE,인공지능 기초 ,통계 시각화 , JSP ,디지털 시각화 처리 등의 기술을 보유하고 있습니다. 늘 노력하고 공부하여 어떠한 알고리즘도 풀어나가는 개발자가 되겠습니다."
                      required
                    ></textarea>
                  </div>
                  <div class="form-group mb-0">
                    <!-- <button type="submit" class="btn tm-send-btn tm-fl-right">
                      Send
                    </button> -->
                  </div>
                </form>
              </section>
            </div>
          </div>
        </div>
      </div>

      <div class="tm-bottom-container">
        <!-- Barcode -->
        <div class="tm-barcode-box">
          <img src="img/bar-code.jpg" alt="Bar code" />
        </div>

        <!-- Footer -->
        <footer>
          || Copyright &copy; 2021 KIM HAE RI || 
                  
        	Project: <a rel="nofollow" href="https://haerr-kim.tistory.com/">서버 기반의 디지털 영상처리 프로그램 Beta3.0</a> || 
        
        </footer>
      </div>
    </div>

    <script src="js/jquery-1.11.0.min.js?ver1"></script>
    <script src="js/background.cycle.js?ver1"></script>
    <script src="slick/slick.min.js?ver1"></script> 
    <script src="js/jquery.magnific-popup.min.js?ver1"></script> 
   
    <script>
      let slickInitDone = false;
      let previousImageId = 0,
        currentImageId = 0;
      let pageAlign = "right";
      let bgCycle;
      let links;
      let eachNavLink;

      window.onload = function() {

        $("body").addClass("loaded");
      };

      function navLinkClick(e) {
    	  console.log($(e.target).data("align"));
        if ($(e.target).hasClass("external")) {
          return;
        }

        e.preventDefault();

        if ($(e.target).data("align")) {
          pageAlign = $(e.target).data("align");
        }

        // Change bg image
        previousImageId = currentImageId;
        currentImageId = $(e.target).data("linkid");
        console.log(currentImageId);
        bgCycle.cycleToNextImage(previousImageId, currentImageId);

        // Change menu item highlight
        $(`.tm-nav-item:eq(${previousImageId})`).removeClass("active");
        $(`.tm-nav-item:eq(${currentImageId})`).addClass("active");

        // Change page content\
        console.log(previousImageId);
        $(`.tm-section-${previousImageId}`).fadeOut(function(e) {
        	$(`.tm-section-${currentImageId}`).fadeIn();
          // Gallery
          if (currentImageId === 2) {
            setupSlider();
          }
        });

        adjustFooter();
      }

      $(document).ready(function() {
        // Set first page
        $(".tm-section").fadeOut(0);
        $(".tm-section-0").fadeIn();

        // Set Background images
        // https://www.jqueryscript.net/slideshow/Simple-jQuery-Background-Image-Slideshow-with-Fade-Transitions-Background-Cycle.html
        bgCycle = $("body").backgroundCycle({
          imageUrls: [
            "img/photo-02.jpg",
            "img/photo-03.jpg",
            "img/photo-04.jpg",
            "img/photo-05.jpg"
          ],
          fadeSpeed: 2000,
          duration: -1,
          backgroundSize: SCALING_MODE_COVER
        });

        eachNavLink = $(".tm-nav-link");
        links = $(".tm-nav-links");

        // "Menu" open/close
        if (links.hasClass("open")) {
          links.fadeIn(0);
        } else {
          links.fadeOut(0);
        }

        $("#tm_about_link").on("click", navLinkClick);
        $("#tm_work_link").on("click", navLinkClick);

        // Each menu item click
        eachNavLink.on("click", navLinkClick);

        $(".tm-navbar-menu").click(function(e) {
          if (links.hasClass("open")) {
            links.fadeOut();
          } else {
            links.fadeIn();
          }

          links.toggleClass("open");
        });

        // window resize
        $(window).resize(function() {
          // If current page is Gallery page, set it up
          if (currentImageId === 2) {
            setupSlider();
          }

          // Adjust footer
          adjustFooter();
        });
        
        $(`.tm-nav-item`).click(function(){
            $('#memberLog').stop().fadeOut();
        });
        $(`#loginPopup`).click(function(){
        	$('#memberLog').hide();
        	$('#memberLog').stop().fadeIn();
        });
        adjustFooter();
      }); // DOM is ready

      function adjustFooter() {
        const windowHeight = $(window).height();
        const topHeight = $(".tm-top-container").height();
        const middleHeight = $(".tm-content").height();
        let contentHeight = topHeight + middleHeight;

        if (pageAlign === "left") {
          contentHeight += $(".tm-bottom-container").height();
        }

        if (contentHeight > windowHeight) {
          $(".tm-bottom-container").addClass("tm-static");
        } else {
          $(".tm-bottom-container").removeClass("tm-static");
        }
      }

      function setupSlider() {
        let slidesToShow = 4;
        let slidesToScroll = 2;
        let windowWidth = $(window).width();

        if (windowWidth < 480) {
          slidesToShow = 1;
          slidesToScroll = 1;
        } else if (windowWidth < 768) {
          slidesToShow = 2;
          slidesToScroll = 1;
        } else if (windowWidth < 992) {
          slidesToShow = 3;
          slidesToScroll = 2;
        }

        if (slickInitDone) {
          $(".tm-gallery").slick("unslick");
        }

        slickInitDone = true;

        $(".tm-gallery").slick({
          dots: true,
          customPaging: function(slider, i) {
            var thumb = $(slider.$slides[i]).data();
            return `<a>${i + 1}</a>`;
          },
          infinite: true,
          prevArrow: false,
          nextArrow: false,
          slidesToShow: slidesToShow,
          slidesToScroll: slidesToScroll
        });

        // Open big image when a gallery image is clicked.
        $(".slick-list").magnificPopup({
          delegate: "a",
          type: "image",
          gallery: {
            enabled: true
          }
        });
      }
    </script>
    
  </body>
</html>
