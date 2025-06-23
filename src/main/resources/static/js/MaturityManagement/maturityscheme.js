  function getMonthNames() {
    return [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
  }

  function populateAllDropdownsWithCurrentMonth(className) {
    const dropdowns = document.querySelectorAll(`.${className}`);
    const months = getMonthNames();
    const currentMonthIndex = new Date().getMonth();

    dropdowns.forEach(dropdown => {
      dropdown.innerHTML = ""; 
      months.forEach((month, index) => {
        const option = document.createElement("option");
        option.value = month;
        option.textContent = month;

        if (index === currentMonthIndex) {
          option.selected = true;
        }

        dropdown.appendChild(option);
      });
    });
  }

  


$(document).ready(function () {
	
	populateAllDropdownsWithCurrentMonth("monthname");
	

	  
		
    //for fixed deposit
    $.ajax({
        url: "api/fixed-deposit/view",
        type: "GET",
        success: function (response) {
            var dropdown = $('#fdPolicyCode');
            dropdown.empty();
            dropdown.append('<option value="">Select Policy Code</option>');

			if (response.status == "OK" && response.data) {
					            $.each(response.data, function (index, plan) {
					                // Concatenate planCode + " - " + planName
					                var displayText = plan.planCodeFD + " - " + plan.planNameFD;
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
	// for fixed deposit saving 
	$("#formfd").submit(function (event) {
			event.preventDefault();
		
					       var data = {
					           policyCode: $("#fdPolicyCode").val(),       
					           instFrom: $("#fdInstFrom").val(),         
					           instTo: $("#fdInstTo").val(),             
					           interestRate: $("#fdInterestRate").val(),   
					           deduction: $("#fdDeduction").val()          
					       };

						   console.log("Data"+data.instFrom);
					       $.ajax({
							
					           url: "savematurityscheme",  
					           type: "POST",
					           contentType: "application/json",
					           data: JSON.stringify(data),
					           success: function (response) {
								
					               if (response.status === "OK") {
					                   alert(" " + response.message);
					                   $("#formfd")[0].reset(); 
					               } else {
					                   alert(" " + response.message);
					               }
					           },
					           error: function (xhr, status, error) {
					               console.error(" Error saving:", error);
								   console.log(" ",response.message);
					               alert(" Something went wrong while saving the data.");
					           }
							   
					       });
					   });

	
	//recurring deposit
	$.ajax({
	        url: "api/recurring-deposit/view",
	        type: "GET",
	        success: function (response) {
	            var dropdown = $('#rdPolicyCode');
	            dropdown.empty();
	            dropdown.append('<option value="">Select Policy Code</option>');

				if (response.status == "OK" && response.data) {
						            $.each(response.data, function (index, plan) {
						                // Concatenate planCode + " - " + planName
						                var displayText = plan.planCodeRD + " - " + plan.planNameRD;
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
		
		//save recurring deposit
		$("#formrd").submit(function (event) {
				event.preventDefault();
			
						       var data = {
						           policyCode: $("#rdPolicyCode").val(),       
						           instFrom: $("#rdInstFrom").val(),         
						           instTo: $("#rdInstTo").val(),             
						           interestRate: $("#rdInterestRate").val(),   
						           deduction: $("#rdDeduction").val()          
						       };

							   console.log("Data"+data.instFrom);
						       $.ajax({
								
						           url: "savematurityscheme",  
						           type: "POST",
						           contentType: "application/json",
						           data: JSON.stringify(data),
						           success: function (response) {
									
						               if (response.status === "OK") {
						                   alert(" " + response.message);
						                   $("#formrd")[0].reset(); 
						               } else {
						                   alert(" " + response.message);
						               }
						           },
						           error: function (xhr, status, error) {
						               console.error(" Error saving:", error);
									   console.log(" ",response.message);
						               alert(" Something went wrong while saving the data.");
						           }
								   
						       });
						   });

		
		//for Daily Deposit
		
		$.ajax({
		    url: "api/daily-deposit/view",
		    type: "GET",
		    success: function (response) {
		        var dropdown = $('#ddPolicyCode');
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

		
				
				$("#formdd").submit(function (event) {
						event.preventDefault();
					
								       var data = {
								           policyCode: $("#ddPolicyCode").val(),       
								           instFrom: $("#ddInstFrom").val(),         
								           instTo: $("#ddInstTo").val(),             
								           interestRate: $("#ddInterestRate").val(),   
								           deduction: $("#ddDeduction").val()          
								       };

									   console.log("Data"+data.instFrom);
								       $.ajax({
										
								           url: "savematurityscheme",  
								           type: "POST",
								           contentType: "application/json",
								           data: JSON.stringify(data),
								           success: function (response) {
											
								               if (response.status === "OK") {
								                   alert(" " + response.message);
								                   $("#formdd")[0].reset(); 
								               } else {
								                   alert(" " + response.message);
								               }
								           },
								           error: function (xhr, status, error) {
								               console.error(" Error saving:", error);
											   console.log(" ",response.message);
								               alert(" Something went wrong while saving the data.");
								           }
										   
								       });
								   });

// for mis deposit
				$.ajax({
				       url: "api/mis-deposit/view",
				       type: "GET",
				       success: function (response) {
				           var dropdown = $('#misPolicyCode');
				           dropdown.empty();
				           dropdown.append('<option value="">Select Policy Code</option>');

						   if (response.status == "OK" && response.data) {
						   		            $.each(response.data, function (index, plan) {
						   		                // Concatenate planCode + " - " + planName
						   		                var displayText = plan.planCodeMD + " - " + plan.planNameMD;
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
			
				   
	$("#formmis").submit(function (event) {
		event.preventDefault();
	
				       var data = {
				           policyCode: $("#misPolicyCode").val(),       
				           instFrom: $("#misInstFrom").val(),         
				           instTo: $("#misInstTo").val(),             
				           interestRate: $("#misInterestRate").val(),   
				           deduction: $("#misDeduction").val()          
				       };

					   console.log("Data"+data.instFrom);
				       $.ajax({
						
				           url: "savematurityscheme",  
				           type: "POST",
				           contentType: "application/json",
				           data: JSON.stringify(data),
				           success: function (response) {
							
				               if (response.status === "OK") {
				                   alert(" " + response.message);
				                   $("#formmis")[0].reset(); 
				               } else {
				                   alert(" " + response.message);
				               }
				           },
				           error: function (xhr, status, error) {
				               console.error(" Error saving:", error);
							   console.log(" ",response.message);
				               alert(" Something went wrong while saving the data.");
				           }
						   
				       });
				   });

});




