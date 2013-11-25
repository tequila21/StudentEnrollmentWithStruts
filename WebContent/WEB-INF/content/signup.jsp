<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Enrollment Signup</title>
<sb:head includeScripts="false" includeScriptsValidation="false"
	includeStylesResponsive="true" />
<sj:head jqueryui="true" />

<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="datepicker/css/datepicker.css" rel="stylesheet" />
<link href="assets/css/bootstrap-united.css" rel="stylesheet" />


<style>
.green {
	font-weight: bold;
	color: green;
}

.message {
	margin-bottom: 10px;
}

.error {
	color: #ff0000;
	font-size: 0.9em;
	font-weight: bold;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}

input[type="text"],input[type="password"] {
	height: 40px;
}
</style>
</head>
<body>

	<div class="navbar navbar-default">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<div class="navbar-collapse collapse navbar-responsive-collapse">
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search">
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/StudentEnrollmentWithStruts">Home</a></li>
				<li class="active"><a href="signup-input">Signup</a></li>
				<li><a href="login-input">Login</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Explore<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Contact us</a></li>
						<li class="divider"></li>
						<li><a href="#">Further Actions</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.nav-collapse -->
	</div>

	<script src="jquery-1.8.3.js">
		
	</script>

	<script src="bootstrap/js/bootstrap.js">
		
	</script>
	
	<script src="datepicker/js/bootstrap-datepicker.js">
		
	</script>

	<div class="container">
		<div class="jumbotron">
			<div>
				<h1>Welcome to Online Student Enrollment Signup</h1>
				<p>Its absolutely quick!</p>
			</div>
		</div>

		<div></div>
	</div>

	<s:actionerror theme="bootstrap" />
	<s:actionmessage theme="bootstrap" />
	<s:fielderror theme="bootstrap" />

	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<s:form id="myForm" method="post" action="signup"
							enctype="multipart/form-data" theme="bootstrap" validate="true"
							cssClass="bs-example form-horizontal">
							
							<fieldset>
								<legend>Student Enrollment Signup Form</legend>

								<s:hidden name="pageName" value="signup" />
								
								<s:textfield label="User Name" name="userName"
									cssClass="col-lg-11" placeholder="User Name" />

								<s:password label="Password" name="password"
									cssClass="col-lg-11" placeholder="Password" />

								<s:textfield label="First Name" name="firstName"
									cssClass="col-lg-11" placeholder="First Name" />

								<s:textfield label="Last Name" name="lastName"
									cssClass="col-lg-11" placeholder="Last Name" />

								<sj:datepicker id="dateOfBirthInput" name="dateOfBirth"
									label="Date of Birth" placeholder="Date of Birth"
									displayFormat="mm/dd/yy" changeMonth="true" changeYear="true"
									buttonImageOnly="true" yearRange="c-100:c+0"
									cssClass="col-lg-11" />

								<s:textfield label="Email Address" name="emailAddress"
									cssClass="col-lg-11" placeholder="Email Address" />

								<div class="col-lg-9 col-lg-offset-3">
									<button class="btn btn-default">Cancel</button>
									
									<button class="btn btn-primary" data-toggle="modal"
										data-target="#themodal">Submit</button>
										
									<div id="themodal" class="modal fade col-lg-9 col-lg-offset-3" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h3>Signup Form Submission</h3>
												</div>
												<div class="modal-body">
													<p>Are you sure you want to do this?</p>
													<div class="progress progress-striped active">
														<div id="doitprogress" class="progress-bar"></div>
													</div>
												</div>
												<div class="modal-footer">													
													<a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
													<input type="submit" value="Yes" id="yesbutton"
														class="btn btn-primary" data-loading-text="Saving.."
														data-complete-text="Submit Complete!">
												</div>
											</div>
										</div>
									</div>

								</div>
							</fieldset>
							
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function() {
			$('#dateOfBirthInput').datepicker();
		});
	</script>	
		
	<script type="text/javascript">
		$(function() {
			var yesButton = $("#yesbutton");
			var progress = $("#doitprogress");		
			
			yesButton.click(function() {		
				yesButton.button("loading");

				var counter = 0;
				var countDown = function() {
					counter++;
					if (counter == 11) {
						yesButton.button("complete");
					} else {
						progress.width(counter * 10 + "%");
						setTimeout(countDown, 100);
					}
				};
				
				setTimeout(countDown, 100);
			});
			
		});
	</script>



</body>
</html>