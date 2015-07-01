<!-- Team 1 -->
<!-- 02/10/2015 -->
<!-- Task 8-->


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<base href="<%=basePath%>"></base>
<meta charset="utf-8">
<title>Yummy! Find Something To Eat!</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- Styles -->
<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet">
<link href="<%=basePath%>css/style.css" rel="stylesheet">

<link href='http://fonts.googleapis.com/css?family=Quattrocento:400,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Patua+One'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>

<style>
html, body, #map-canvas {
	height: 100%;
	margin: 0px;
	padding: 0px
}

#panel {
	position: absolute;
	top: 5px;
	left: 50%;
	margin-left: -180px;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
}

#photo-panel {
	background: #fff;
	padding: 5px;
	overflow-y: auto;
	overflow-x: hidden;
	width: 300px;
	max-height: 300px;
	font-size: 14px;
	font-family: Arial;
	border: 1px solid #ccc;
	box-shadow: -2px 2px 2px rgba(33, 33, 33, 0.4);
	display: none;
}
</style>
<link href="<%=basePath%>css/bootstrap-responsive.css" rel="stylesheet">
<!-- Favicon -->
<link rel="shortcut icon" href="<%=basePath%>img/favicon.ico">
<!-- JQuery -->
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<!-- Load ScrollTo -->
<script type="text/javascript"
	src="<%=basePath%>js/jquery.scrollTo-1.4.2-min.js"></script>
<!-- Load LocalScroll -->
<script type="text/javascript"
	src="<%=basePath%>js/jquery.localscroll-1.2.7-min.js"></script>
<!-- prettyPhoto Initialization -->
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$("a[rel^='prettyPhoto']").prettyPhoto();
	});
</script>

<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=panoramio"></script>

<script>
	function initialize() {
		var mapOptions = {
			zoom : 11,
			center : new google.maps.LatLng(40.4404491, -79.9743207)
		};

		var map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);

		var panoramioLayer = new google.maps.panoramio.PanoramioLayer();
		panoramioLayer.setMap(map);

		var photoPanel = document.getElementById('photo-panel');
		map.controls[google.maps.ControlPosition.RIGHT_TOP].push(photoPanel);

		google.maps.event.addListener(panoramioLayer, 'click', function(photo) {
			var li = document.createElement('li');
			var link = document.createElement('a');
			link.innerHTML = photo.featureDetails.title + ': '
					+ photo.featureDetails.author;
			link.setAttribute('href', photo.featureDetails.url);
			li.appendChild(link);
			photoPanel.appendChild(li);
			photoPanel.style.display = 'block';
		});
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>

<body>
	<!-- Navbar starts -->
	<div class="navbar-wrapper">
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<!-- Responsive Navbar Part 1: Button for triggering responsive navbar (not covered in tutorial). Include responsive CSS to utilize. -->
					<a class="btn btn-navbar" data-toggle="collapse"
						data-target=".nav-collapse"> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
					</a>
					<h1 class="brand">
						<a href="#top">Yummy!</a>
					</h1>
					<!-- Responsive Navbar Part 2: Place all navbar contents you want collapsed withing .navbar-collapse.collapse. -->
					<nav class="pull-right nav-collapse collapse">
						<ul id="menu-main" class="nav">
							<tag:loggedin>
								<li><a href="index.jsp"> Post Tweets </a></li>
								<li><a href="getToken.do">Get Tweets</a></li>
								<li><a href="tweetAuth.do">Upload Tweets</a></li>
								<li><a href="searchFlickr.do">Search Flickr </a></li>
								<li><a href="uploadPhoto.do">Upload Flickr </a></li>
								<li><a href="trends.do">View Trend </a></li>
								<li><a href="hashcloud.do">#Cloud</a></li>
								<li><a href="maps.do">Restaurants</a></li>
								<li><a href="mapsPhoto.do">Panoramio</a></li>
								<li><a href="./logout">Logout</a></li>
							</tag:loggedin>
						</ul>
					</nav>
				</div>
				<!-- /.container -->
			</div>
			<!-- /.navbar-inner -->
		</div>
		<!-- /.navbar -->
	</div>

	<ul id="photo-panel">
		<li><strong>Photos clicked</strong></li>
	</ul>
	<div id="map-canvas"></div>


	<jsp:include page="template-bottom.jsp" />