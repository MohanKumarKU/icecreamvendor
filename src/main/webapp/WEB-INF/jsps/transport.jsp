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
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
    <title>Snow Admin</title>
    <!-- Bootstrap Core CSS -->
    <link href="resources/css/lib/bootstrap/bootstrap.min.css" rel="stylesheet">
    
    
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/animatee.css">
<!--===============================================================================================-->	

    
    <script
	src="https://maps.googleapis.com/maps/api/js?libraries=geometry&key=AIzaSyCSTYwleJCBene1dtmAQDocjcbbD0AU9KE"
	type="text/javascript"></script>
	
  <!-- Styles -->
  <link rel="stylesheet" href="resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/css/animate.css">
  

  
    <!-- Custom CSS -->

    <link href="resources/css/lib/calendar2/semantic.ui.min.css" rel="stylesheet">
    <link href="resources/css/lib/calendar2/pignose.calendar.min.css" rel="stylesheet">
    <link href="resources/css/lib/owl.carousel.min.css" rel="stylesheet" />
    <link href="resources/css/lib/owl.theme.default.min.css" rel="stylesheet" />
    <link href="resources/css/helper.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:** -->
    <!--[if lt IE 9]>
    <script src="https:**oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https:**oss.maxcdn.com/libs/respond.resources/js/1.4.2/respond.min.js"></script>
<![endif]-->


<style type="text/css">

body {
  overflow: hidden;
  background-color: #e2e1e0;
  background-image: url("https://www.toptal.com/designers/subtlepatterns/patterns/topography.png");
  background-size: 35%;
}
</style>





</head>

<body class="fix-header"> 
<div class="background"></div>

<div align="center">
<h3>Transport Section :</h3>
<img src="resources/img/VectorVehicle.jpg" alt="" style="position: relative;height:100px;">
</div>

<br/>
<div class="row">

 <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Ice Cream Delivery Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Address</th>
                                                <th>Product</th>
                                                <th>PhoneNumber</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>Mohan</td>
                                                <td>No.22 2nd cross vidyanagar DVG</td>
                                                <td><span class="badge badge-primary">Vanilla</span></td>
                                                <td class="color-primary">7676553838</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            
                        </div>
</div>

<div class="col-lg-6" id="map_canvas"></div> 
     
 </div>
 
 <div class="row">
 
 <div class="col-lg-6" style="position: center;">
			&nbsp;&nbsp;&nbsp;&nbsp; <b>Ice Transportation View In Google Map :</b>
     <button type="button" class="btn btn-success m-b-10 m-l-5" onclick="showMap()">Start</button>
</div>					
</div>                   
</body>

<script type="text/javascript">

	var map, marker, infowindow;
	var startPos = [14.4519, 75.9177];
	var speed = 50; // km/h

	var delay = 100;

	function animateMarker(marker, coords, km_h)
	{
	    var target = 0;
	    var km_h = km_h || 50;
	    coords.push([startPos[0], startPos[1]]);
	    
	    function goToPoint()
	    {
	        var lat = marker.position.lat();
	        var lng = marker.position.lng();
	        var step = (km_h * 1000 * delay) / 3600000; // in meters
	        
	        var dest = new google.maps.LatLng(
	        coords[target][0], coords[target][1]);
	        
	        var distance =
	        google.maps.geometry.spherical.computeDistanceBetween(
	        dest, marker.position); // in meters
	        
	        var numStep = distance / step;
	        var i = 0;
	        var deltaLat = (coords[target][0] - lat) / numStep;
	        var deltaLng = (coords[target][1] - lng) / numStep;
	        var num  = 1;
			var dec  = 0.000000001;
	        function moveMarker()
	        {
	            lat += deltaLat;
	            lng += deltaLng;
	            i += step;
				num += dec;
				
	            if (i < distance)
	            {
	                marker.setPosition(new google.maps.LatLng(lat, lng));
					infowindow.setContent('<div class="panel-heading"><h6>Internal Temperature : </h6> <h5>'+num+ ' </h5>Degree</div>');
	                setTimeout(moveMarker, delay);
	            }
	            else
	            {   marker.setPosition(dest);
				    marker.setTitle('i');
	                target++;
	                if (target == coords.length){ target = 0; }
	                
	                setTimeout(goToPoint, delay);
	            }
	        }
	        moveMarker();
	    }
	    goToPoint();
	}

	function showMap()
	{
		var latlng = new google.maps.LatLng(14.4519, 75.9177);
		map = new google.maps.Map(document.getElementById('map_canvas'), {
		  center: latlng,
		  zoom: 16
		});
		
	   var image = { url: "resources/img/ice_cream_van.png",
	    scaledSize: new google.maps.Size(70, 70), // scaled size
	    origin: new google.maps.Point(0,0), // origin
	    anchor: new google.maps.Point(0, 0) // anchor
		}
		
		
		
	    marker = new google.maps.Marker({
	        position: new google.maps.LatLng(startPos[0], startPos[1]),
	        map: map,
		    animation: google.maps.Animation.DROP,
			icon: image
	    });
		
	    infowindow = new google.maps.InfoWindow({
	          content: 's'
	        });
			
			marker.addListener('mouseover', function() {
	          infowindow.open(map, marker);
	        });

	    google.maps.event.addListenerOnce(map, 'idle', function()
	    {
	        animateMarker(marker, [
	            // The coordinates of each point you want the marker to go to.
	            // You don't need to specify the starting position again.
	            [14.4485, 75.9162],
	            [14.4449, 75.9017]
	        ], speed);
	    });
	}

</script>


</html>