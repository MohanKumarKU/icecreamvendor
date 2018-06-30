<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/images/favicon.png">
<title>Snow Admin</title>
<!-- Bootstrap Core CSS -->
<link href="resources/css/lib/bootstrap/bootstrap.min.css"
	rel="stylesheet">


<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/css/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="resources/css/animatee.css">
<!--===============================================================================================-->


<script
	src="https://maps.googleapis.com/maps/api/js?libraries=geometry&key=AIzaSyCSTYwleJCBene1dtmAQDocjcbbD0AU9KE"
	type="text/javascript"></script>
	
<script
	src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyA-uYDl4WW5l7vNabeaz27MgU_nFjNcsVs"
	type="text/javascript"></script>

<!-- Styles -->
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/animate.css">

<link rel="stylesheet" href="resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/css/animate.css">
  <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900|Montserrat:400,700' rel='stylesheet' type='text/css'>
  

  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/css/main.css">

  <script src="resources/js/modernizr-2.7.1.js"></script>
  


<!-- Custom CSS -->

<link href="resources/css/lib/calendar2/semantic.ui.min.css"
	rel="stylesheet">
<link href="resources/css/lib/calendar2/pignose.calendar.min.css"
	rel="stylesheet">
<link href="resources/css/lib/owl.carousel.min.css" rel="stylesheet" />
<link href="resources/css/lib/owl.theme.default.min.css"
	rel="stylesheet" />
<link href="resources/css/helper.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:** -->
<!--[if lt IE 9]>
    <script src="https:**oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https:**oss.maxcdn.com/libs/respond.resources/js/1.4.2/respond.min.js"></script>
<![endif]-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>



<style type="text/css">
body {
	overflow: hidden;
	background-color: #e2e1e0;
	background-image:
		url("https://www.toptal.com/designers/subtlepatterns/patterns/topography.png");
	background-size: 35%;
}


ol.progtrckr {
    margin: 0;
    padding: 0;
    list-style-type none;
}

ol.progtrckr li {
    display: inline-block;
    text-align: center;
    line-height: 3.5em;
}

ol.progtrckr[data-progtrckr-steps="2"] li { width: 49%; }
ol.progtrckr[data-progtrckr-steps="3"] li { width: 33%; }
ol.progtrckr[data-progtrckr-steps="4"] li { width: 24%; }
ol.progtrckr[data-progtrckr-steps="5"] li { width: 19%; }
ol.progtrckr[data-progtrckr-steps="6"] li { width: 16%; }
ol.progtrckr[data-progtrckr-steps="7"] li { width: 14%; }
ol.progtrckr[data-progtrckr-steps="8"] li { width: 12%; }
ol.progtrckr[data-progtrckr-steps="9"] li { width: 11%; }

ol.progtrckr li.progtrckr-done {
    color: black;
    border-bottom: 4px solid yellowgreen;
}
ol.progtrckr li.progtrckr-todo {
    color: silver; 
    border-bottom: 4px solid silver;
}

ol.progtrckr li:after {
    content: "\00a0\00a0";
}
ol.progtrckr li:before {
    position: relative;
    bottom: -2.5em;
    float: left;
    left: 50%;
    line-height: 1em;
}
ol.progtrckr li.progtrckr-done:before {
    content: "\2713";
    color: white;
    background-color: yellowgreen;
    height: 2.2em;
    width: 2.2em;
    line-height: 2.2em;
    border: none;
    border-radius: 2.2em;
}
ol.progtrckr li.progtrckr-todo:before {
    content: "\039F";
    color: silver;
    background-color: white;
    font-size: 2.2em;
    bottom: -1.2em;
}


</style>





</head>

<body class="fix-header">
	<div class="background"></div>

	<div align="center">
		<h3>User Name : ${trackice.username}</h3>
		<img src="resources/img/user.png" alt=""
			style="position: relative; height: 100px;">
	</div>

	<br />
	<div align="center">

	<div class="row">

		<div class="col-lg-12">
		 <div class="card">
				<div class="card-title">
					<h4>Ice Cream Order Details</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>OrderId</th>
									<th>Name</th>
									<th>Address</th>
									<th>Product</th>
									<th>Units</th>
									<th>Status</th>
									<th>Order Date</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">${trackice.id}</th>
									<td>${trackice.username}</td>
									<td>${trackice.address}</td>
									<td><span class="badge badge-primary">${trackice.flavour}</span></td>
									<td>${trackice.units}</td>
									<td>${trackice.status}</td>
									<td class="color-primary">${trackice.date}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
             </div>
		</div>

	</div>
	
	 <div class="row">
	 <div class="col-lg-6" style="position: center;">
   &nbsp;&nbsp;&nbsp;&nbsp; <b>Track Order</b>
    </div>
    </div>


	<div class="row">
		<ol class="progtrckr" data-progtrckr-steps="5">
        <li class="progtrckr-done">Order Processing</li>
        <li class="progtrckr-done">Pre-Production</li>
        <li class="progtrckr-done">In Production</li>
        <li class="progtrckr-todo">Shipped</li>
        <li class="progtrckr-todo">Delivered</li>
        </ol>
	</div>
	
	
	<div class="row">
	 <div class="container">
        <div class="row header-info">
          <div class="col-sm-10 col-sm-offset-1 text-center">
            <h6 class="wow fadeIn">Thanks for your order!</h6>
            <br />
            <br />
                  
                  <div class="col-xs-6 text-left wow fadeInUp" data-wow-delay="1.4s">
                    <a href="orderice?username=${trackice.username}" class="btn btn-primary">Order More!</a>
                  </div>
            
          </div>
        </div>
      </div>
     </div>
     </div>
    


</body>


<script src="resources/js/jquery.geocomplete.js"></script>
<script type="text/javascript">

</script>


</html>