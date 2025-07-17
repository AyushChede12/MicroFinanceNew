$(document).ready(function () {
	
	$('#plantype').on('change', function () {
	       let plantype = $(this).val();

	       if (plantype == "DD") {
			$.ajax({
					    url: "api/Policymangment/daily-deposit/view",
					    type: "GET",
					    success: function (response) {
					        var dropdown = $('#planCode');
					        dropdown.empty();
					        dropdown.append('<option value="">Select Policy Code</option>');

					        if (response.status == "OK" && response.data) {
					            $.each(response.data, function (index, plan) {
					                // Concatenate planCode + " - " + planName
					                var displayText = plan.planCodeDD + " - " + plan.planNameDD;
					                dropdown.append('<option value="' + plan.planCode + '">' + displayText + '</option>');
					            });
					        } else {
					            dropdown.append('<option value="">No policy code found</option>');
					        }
					    },
					    error: function () {
					        alert("No policy code found.");
					    }
					});

					
	       }
		   else 
		   
		   		if(plantype=="RD"){
				$.ajax({
				        url: "api/Policymangment/recurring-depositview",
				        type: "GET",
				        success: function (response) {
				            var dropdown = $('#planCode');
				            dropdown.empty();
				            dropdown.append('<option value="">Select Policy Code</option>');

							if (response.status == "OK" && response.data) {
									            $.each(response.data, function (index, plan) {
									                // Concatenate planCode + " - " + planName
									                var displayText = plan.planCodeRD + " - " + plan.planNameRD;
									                dropdown.append('<option value="' + plan.planCodeRD + '">' + displayText + '</option>');
									            });
									        } else {
				                dropdown.append('<option value="">No policy code found</option>');
				            }
				        },
				        error: function () {
				            alert("No policy code found.");
				        }
				    });
		  		}
				
				else 
					if(plantype=="FD"){
						
						$.ajax({
						        url: "api/Policymangment/fixed-depositview",
						        type: "GET",
						        success: function (response) {
						            var dropdown = $('#planCode');
						            dropdown.empty();
						            dropdown.append('<option value="">Select Policy Code</option>');

									if (response.status == "OK" && response.data) {
											            $.each(response.data, function (index, plan) {
											                // Concatenate planCode + " - " + planName
											                var displayText = plan.planCodeFD + " - " + plan.planNameFD;
											                dropdown.append('<option value="' + plan.planCodeFD + '">' + displayText + '</option>');
											            });
											        } else {
						                dropdown.append('<option value="">No policy code found</option>');
						            }
						        },
						        error: function () {
						            alert("No policy code found.");
						        }
						    });
					}
					
					else 
						if(plantype=="MIS"){
							$.ajax({
								  url: "api/Policymangment/mis-deposit/view",
										 type: "GET",
											success: function (response) {
											           var dropdown = $('#planCode');
											           dropdown.empty();
											           dropdown.append('<option value="">Select Policy Code</option>');

													   if (response.status == "OK" && response.data) {
													   		            $.each(response.data, function (index, plan) {
													   		                // Concatenate planCode + " - " + planName
													   		                var displayText = plan.planCodeMD + " - " + plan.planNameMD;
													   		                dropdown.append('<option value="' + plan.planCodeMD + '">' + displayText + '</option>');
													   		            });
													   		        } else {
											               dropdown.append('<option value="">No policy code found</option>');
											           }
											       },
											       error: function () {
											           alert("No policy code found.");
											       }
											   });
						}
				
				
	   });
});
