<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/ae73087723.js"
	crossorigin="anonymous"></script>
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.46.0/apexcharts.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

<title>Admin Dashboard</title>
<link rel="stylesheet" href="./css/admin.css" />
<jsp:include page="../sidebar.jsp"></jsp:include>
<jsp:include page="../header.jsp"></jsp:include>

<!-- jQuery CDN (latest 3.x version) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.uploadField {
	margin-top: 10px;
}

.uploadField img {
	width: 100%;
	height: 150px;
	object-fit: contain;
	border: 1px solid #ccc;
	padding: 4px;
	border-radius: 8px;
}
</style>

</head>


<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Preferences</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="openDashboard"> <i
							class="bi bi-gear"></i>
					</a></li>
					<li class="breadcrumb-item action">Company Administration</li>
				</ol>
			</nav>

		</div>

		<div class="row">
			<div class="col-12 d-flex justify-content-end">
				<button type="button" id="editBtn" class="btn btn-outline-secondary"
					data-bs-toggle="tooltip" data-bs-placement="top" title="Edit">
					<i class="bi bi-pen-fill"></i>
				</button>
			</div>
		</div>

		<div>
			<form id="formid">
				<div>
					<nav>
						<ol class="breadcrumb breadcrumb-title">
							<li class="breadcrumb-item action">Company Details</li>
						</ol>
					</nav>
					<div class="row">
						<div class="col-lg-3">
							<!-- <div class="d-flex flex-column formFields" style="margin-bottom: 30px">
                <label>Verify With</label>
                <div class="position-relative">
                  <div class="select-btn1" style="cursor: pointer;">
                    <span name="cityName" id="cityNameId" style="font-size: 12px;">Select</span> <i
                      class="fa-solid fa-angle-down"></i>
                  </div>
                  <div class="content" id="contentCityName" style="display: none;">
                    <div class="search">
                      <input type="text" id="city-search" class="m-0" placeholder="Search City" />
                    </div>
                    <ul class="options" id="city-options">
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                      <li>ABC</li>
                    </ul>
                  </div>
                </div>
              </div> -->
							<input type="hidden" name="id" id="id">
							<div class="d-flex flex-column formFields">
								<label for="">Company Name <span class="star">*</span></label> <input
									type="text" readonly="readonly" name="companyName"
									id="companyName" required="required"
									placeholder="Enter Company Name"
									style="text-transform: uppercase;" /> <small
									id="chkcompanyname" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Short Name <span class="star">*</span></label> <input
									type="Text" name="shortName" readonly="readonly" id="shortName"
									required="required" placeholder="Enter Short Name"
									style="text-transform: uppercase;" /> <small id="chkshortname"
									style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>INC Date/Regd Date <span class="star">*</span></label> <input
									type="Date" readonly="readonly" name="signUpDate"
									id="signUpDate" required="required"
									placeholder="Enter Sign-Up Date"
									style="text-transform: uppercase;" /> <small
									id="chksignupdate" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>CIN No/Regd No<span class="star">*</span></label> <input
									type="Text" name="cinNo" readonly="readonly" id="cinNo"
									required="required" placeholder="Enter CIN No"
									style="text-transform: uppercase;" /> <small id="chkcinno"
									style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>PAN <span class="star">*</span></label> <input
									type="Text" name="pan" id="pan" readonly="readonly"
									required="required" placeholder="Enter Pan No"
									style="text-transform: uppercase;" /> <small id="chkpan"
									style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>TAN <span class="star">*</span></label> <input
									type="text" name="tan" id="tan" readonly="readonly"
									required="required" placeholder="Enter Tan No"
									style="text-transform: uppercase;" /> <small id="chktan"
									style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>GSTIN <span class="star">*</span></label> <input
									type="Text" name="gstin" id="gstin" readonly="readonly"
									required="required" placeholder="Enter GSTIN"
									style="text-transform: uppercase;" /> <small id="chkgstin"
									style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Declared Value <span class="star">*</span></label> <input
									type="Text" name="declaredValue" id="declaredValue"
									required="required" readonly="readonly"
									placeholder="Enter Declared Value "
									style="text-transform: uppercase;" /> <small
									id="chkdeclaredvalue" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Address <span class="star">*</span></label>
								<textarea name="address" id="address" readonly="readonly"
									style="border: 1px solid rgb(224, 224, 224); border-radius: 5px; outline: none; padding: 5px; font-size: 12px;"></textarea>
								<small id="chkaddress" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">State <span class="star">*</span></label> <input
									type="text" readonly="readonly" name="state" id="state"
									required="required" placeholder="Enter State "
									style="text-transform: uppercase;" /> <small id="chkstate"
									style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields">
								<label for="">City <span class="star">*</span></label> <input
									type="text" readonly="readonly" name="city" id="city"
									required="required" placeholder="Enter City "
									style="text-transform: uppercase;" /> <small id="chkcity"
									style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Pin Code <span class="star">*</span></label> <input
									type="text" name="pinCode" readonly="readonly" id="pinCode"
									required="required" placeholder="Enter Pin Code"
									style="text-transform: uppercase;" /> <small id="chkpincode"
									style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Email ID <span class="star">*</span></label> <input
									type="text" name="emailId" readonly="readonly" id="emailId"
									required="required" placeholder="Enter Email ID"
									style="text-transform: uppercase;" /> <small id="chkemailid"
									style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Authorized Share Capital <span class="star">*</span></label>
								<input type="text" readonly="readonly"
									name="authorizedShareCapital" id="authorizedShareCapital"
									required="required" placeholder="Authorized Share Capital"
									style="text-transform: uppercase;" /> <small
									id="chkauthorizedsharecapital" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Paid Up Capital <span class="star">*</span></label> <input
									type="text" readonly="readonly" name="paidUpCapital"
									id="paidUpCapital" required="required"
									placeholder="Enter Paid Up Capital"
									style="text-transform: uppercase;" /> <small
									id="chkpaidupcapital" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>No Of Share <span class="star">*</span></label> <input
									type="text" name="nof" id="nof" readonly="readonly"
									required="required" placeholder="Enter No Of Share "
									style="text-transform: uppercase;" /> <small id="chknof"
									style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>HelpLine No <span class="star">*</span></label> <input
									type="text" name="helpLine No" readonly="readonly"
									id="helplineNo" required="required"
									placeholder="Enter HelpLine No"
									style="text-transform: uppercase;" /> <small
									id="chkhelplineno" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>TDS (With PAN) <span class="star">*</span></label> <input
									type="text" readonly="readonly" name="tdsWithPan"
									id="tdsWithPan" required="required" placeholder="Enter TDS"
									style="text-transform: uppercase;" /> <small
									id="chktdswithpan" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>TDS (Without PAN) <span class="star">*</span></label> <input
									type="text" readonly="readonly" name="tdsWithoutPan"
									id="tdsWithoutPan" required="required"
									placeholder="Enter TDS"
									style="text-transform: uppercase;" /> <small
									id="chktdswithoutpan" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Tax Deduction <span class="star">*</span></label> <input
									type="text" readonly="readonly" name="taxDeduction"
									id="taxDeduction" required="required"
									placeholder="Enter Tax Deduction"
									style="text-transform: uppercase;" /> <small
									id="chktaxdeduction" style="color: red;"></small>
							</div>
						</div>

						<div class="col-lg-3">
							<div class="d-flex flex-column formFields"
								style="margin-bottom: 30px">
								<label>Branch Manager Contact No <span class="star">*</span></label>
								<input type="text" readonly="readonly"
									name="branchManagerContactNo" id="branchManagerContactNo"
									required="required"
									placeholder="Enter Branch Manager Contact No"
									style="text-transform: uppercase;" /> <small
									id="chkbranchManagerContactNo" style="color: red;"></small>
							</div>
						</div>


					</div>

					<div class="container mt-4">
						<div class="row">
							<div class="col-lg-12">
								<h4>Company Image Upload </h4>
								<div id="fieldContainer">
									<!-- First field appears automatically -->
									<div class="textUploadSet mb-4">
										<input type="text" class="form-control nameField"
											placeholder="Enter Image Name...">
										<div class="uploadContainer"></div>
									</div>
								</div>

								<button id="addFieldBtn" class="btn btn-primary mt-2">Add
									+</button>
								<button id="uploadAllBtn" class="btn btn-success mt-2">Upload
									All</button>
							</div>
						</div>
					</div>




					<!-- <div class="mt-4">
						<div class="row mt-4">

							Company Logo
							<div class="col-lg-3 mb-5 imageField" id="companyLogoField">
								<label>Company Logo <span class="star">*</span></label> <label
									for="photo" id="drop-area"> <input type="file"
									accept="image/*" name="photo" id="photo" hidden="hidden"
									onchange="bike1Preview();" />
									<div id="img-view">
										<img src="../images/upload/upload.png" alt="upload_icon"
											id="bike1imagePreview" />
									</div>
								</label> <small id="chkphoto" style="color: red;"></small>
							</div>

							Registration Certificate
							<div class="col-lg-3 mb-5 imageField" id="regnCertField">
								<label>Regn Certificate <span class="star">*</span></label> <label
									for="signature" id="drop-area"> <input type="file"
									accept="image/*" name="signature" id="signature"
									hidden="hidden" onchange="bike2Preview();" />
									<div id="img-view">
										<img src="../images/upload/upload.png" alt="upload_icon"
											id="bike2imagePreview" />
									</div>
								</label> <small id="chksignature" style="color: red;"></small>
							</div>

							Pan Card
							<div class="col-lg-3 mb-5 imageField" id="panCardField">
								<label>Pan Card <span class="star">*</span></label> <label
									for="panphoto" id="drop-area"> <input type="file"
									accept="image/*" name="panphoto" id="panphoto" hidden="hidden"
									onchange="bike1Preview();" />
									<div id="img-view">
										<img src="../images/upload/upload.png" alt="upload_icon"
											id="bike1imagePreview2" />
									</div>
								</label> <small id="chkphoto2" style="color: red;"></small>
							</div>

							GST Certificate
							<div class="col-lg-3 mb-5 imageField" id="gstCertField">
								<label>GST Certificate <span class="star">*</span></label> <label
									for="gstphoto" id="drop-area"> <input type="file"
									accept="image/*" name="gstphoto" id="gstphoto" hidden="hidden"
									onchange="bike1Preview();" />
									<div id="img-view">
										<img src="../images/upload/upload.png" alt="upload_icon"
											id="bike1imagePreview3" />
									</div>
								</label> <small id="chkphoto3" style="color: red;"></small>
							</div>

						</div>
					</div> -->

				</div>

				<div class="row" style="margin-top: 30px;">
					<div class="col-12 text-center">
						<button type="button" id="updateBtn" class="btn btn-success"
							disabled>Update</button>
					</div>
				</div>
			</form>



		</div>


	</main>
	<!-- <script src="js/chartScript.js"></script> -->
	<script src="./js/adminscript.js"></script>
	<script src="./js/preferences/companyAdministration.js"></script>

	<script>
$(document).ready(function() {
    const companyId = 1; // replace as needed
    let counter = 1;

    // Function: create a new text field + upload placeholder
    function createNewTextField() {
        const newField = `
            <div class="textUploadSet mb-4">
                <input type="text" class="form-control nameField" placeholder="Enter Name">
                <div class="uploadContainer"></div>
            </div>`;
        $("#fieldContainer").append(newField);
    }

    // Add new text field on Add + click
    $("#addFieldBtn").click(function(e) {
        e.preventDefault();
        createNewTextField();
    });

    // When typing in a text field, show upload below it dynamically
    $(document).on("input", ".nameField", function() {
        const nameValue = $(this).val().trim();
        const uploadDiv = $(this).closest(".textUploadSet").find(".uploadContainer");

        if (nameValue.length > 0) {
            // Show upload if not already present
            if (uploadDiv.find("input[type=file]").length === 0) {
                const uniqueId = "upload-" + Date.now();
                const uploadField = `
                    <div class="uploadField mt-2">
                        <label>${nameValue} <span class="star">*</span></label>
                        <label for="${uniqueId}" style="cursor:pointer;">
                            <input type="file" accept="image/*" id="${uniqueId}" hidden onchange="previewImage('${uniqueId}')">
                            <div id="img-view-${uniqueId}">
                                <img src="../images/upload/upload.png" alt="upload_icon" id="preview-${uniqueId}">
                            </div>
                        </label>
                    </div>`;
                uploadDiv.html(uploadField);
            } else {
                // Update label text dynamically as user types
                uploadDiv.find("label:first").text(nameValue + " *");
            }
        } else {
            uploadDiv.html(""); // clear upload if name is empty
        }
    });

    // Upload all images (optional feature)
    $("#uploadAllBtn").click(function() {
        $(".uploadField input[type=file]").each(function() {
            const fileInput = this;
            const fieldName = $(this).closest(".uploadField").find("label:first").text().replace("*", "").trim();
            const file = fileInput.files[0];
            if (!file) {
                alert("Please select image for " + fieldName);
                return;
            }
            const formData = new FormData();
            formData.append("fieldName", fieldName);
            formData.append("file", file);

            $.ajax({
                url: "/api/companyImage/upload/" + companyId,
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function() {
                    $(fileInput).closest(".uploadField").css("border", "2px solid green");
                },
                error: function() {
                    $(fileInput).closest(".uploadField").css("border", "2px solid red");
                }
            });
        });
        alert("Upload started for all selected images.");
    });
});

// Preview selected image
function previewImage(id) {
    const input = document.getElementById(id);
    const preview = document.getElementById("preview-" + id);
    const file = input.files[0];

    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            preview.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
}
</script>





</body>

</html>