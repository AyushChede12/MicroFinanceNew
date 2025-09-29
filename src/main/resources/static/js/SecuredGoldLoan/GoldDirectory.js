$(document).ready(function() {
	// Populate member codes
	$.ajax({
		url: "api/customermanagement/approved",
		type: "GET",
		data: { memberCode: "" },
		success: function(response) {
			var select = $("#customerCode");
			select.empty();
			select.append('<option value="">Select member Code</option>');

			if (response && response.data && response.data.length > 0) {
				response.data.forEach(function(customer) {
					var optionText = customer.memberCode + "-" + customer.customerName;
					var optionValue = customer.memberCode;
					select.append(
						'<option value="' + optionValue + '">' + optionText + "</option>"
					);
				});
			} else {
				console.log("No members found");
			}
		},
		error: function(err) {
			console.error("Error fetching members", err);
		},
	});
	$("#customerCode").on("change", function() {
			var memberCode = $(this).val();
			if (memberCode) {
				$.ajax({
					url: "api/securedGoldLoan/getByMemberCodeGoldLoan",
					type: "GET",
					data: { memberCode: memberCode },
					success: function(response) {
						if (response && response.data && response.data.length > 0) {
							var customer = response.data[0]; // assuming first record

							// Populate form fields
							$("#customerName").val(customer.customerName || "");

						} else {
							alert("No details found for this member");
						}
					},
					error: function(err) {
						console.error("Error fetching customer details", err);
					},
				});
			} else {
				// clear fields if no member selected
				$("#customerName").val("");
			}
		});
		
		//for bind the branch in dropdown
		$.ajax({
		        url: "api/customermanagement/approved",
		        type: "GET",
		        success: function (response) {
		            var select = $("#lockerBranch");
		            select.empty(); 
		            select.append('<option value="">Select Branch</option>');

		            if (response && response.data) {
		                // Store distinct branch names in a Set
		                var branchSet = new Set();

		                $.each(response.data, function (index, customer) {
		                    if (customer.branchName) {
		                        branchSet.add(customer.branchName.trim());
		                    }
		                });

		                // Append distinct branches
		                branchSet.forEach(function (branch) {
		                    select.append('<option value="' + branch + '">' + branch + '</option>');
		                });
		            }
		        },
		        error: function () {
		            alert("Failed to fetch branches.");
		        }
		    });
			
			//for save the data 
			
			$("#saveButtonforGoldDirectory").click(function (e) {
			       e.preventDefault(); // form submit ko stop kare

			       // Form data collect
			       var formData = {
			           //id: $("#goldDirectoryId").val(), // agar id empty hai to null bhejega
			           customerCode: $("#customerCode").val(),
			           customerName: $("#customerName").val(),
			           karat: $("#karat").val(),
			           todayRate: $("#todayRate").val(),
			           custgoldRate: $("#custgoldRate").val(),
			           itemMasterType: $("#itemMasterType").val(),
			           itemName: $("#ItemName").val(),
			           lockerBranch: $("#lockerBranch").val(),
			           lockerNumber: $("#lockerNumber").val(),
			           purityName: $("#purityName").val(),
			           purity: $("#purity").val(),
			           itemPurityType: $("#itemPurityType").val(),
			           loanPlanName: $("#loanPlanName").val(),
			           typeOfLoan: $("#typeOfLoan").val(),
			           loanMode: $("#loanMode").val(),
			           loanTerm: $("#loanTerm").val(),
			           rateOfInterest: $("#rateOfInterest").val(),
			           loanAmount: $("#loanAmount").val(),
			           typeIntrest: $("#typeIntrest").val(),
			           emiPayment: $("#emiPayment").val()
			       };

			       // Ajax call
			       $.ajax({
			           url: "/api/securedGoldLoan/saveGoldDirectory",
			           type: "POST",
			           contentType: "application/json",
			           data: JSON.stringify(formData),
			           success: function (response) {
			               alert(response.message || "Saved successfully");
			               $("#formid")[0].reset(); // form reset
			               $("#goldDirectoryId").val(""); // hidden id clear
			           },
			           error: function (xhr) {
			               alert("Error: " + (xhr.responseJSON?.message || "Something went wrong"));
			           }
			       });
			   });
	});