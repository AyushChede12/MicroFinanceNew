$(document).ready(function () {
    $('#branchName').on('change', function () {
        let branchName = $(this).val();
	
        if (branchName !== "") {
            $.ajax({
                url: '/api/Policymangment/getinvestmentdetails?branchName=' + encodeURIComponent(branchName),
                type: 'GET',
                success: function (response) {
                    var dropdown = $('#policyNo');
                    dropdown.empty();
                    dropdown.append('<option value="">Select Policy No</option>');

                    if (response.data && response.data.length > 0) {
                        $.each(response.data, function (index, policyNo) {
                            dropdown.append('<option value="' + policyNo.id+'">'+ policyNo.id+'</option>');
                        });
                    } else {
                        dropdown.append('<option value="">No policies found</option>');
                    }
                },
                error: function () {
                    alert("Error fetching policy numbers.");
                }
            });
        }
    });
	
	$('#policyNo').on('change', function () {
	       let policyId = $(this).val(); 

	       if (policyId !== "") {
	           $.ajax({
	               url: '/api/Policymangment/getDetailsById/' + policyId,
	               type: 'GET',
	               success: function (response) {
					
	                   if (response.data) {
	                       $('#customerName').val(response.data.customerName);
	                       $('#schemeMode').val(response.data.schemeMode);
	                       $('#schemeType').val(response.data.schemeType);
	                       $('#policyAmount').val(response.data.policyAmount);
	                       $('#depositAmount').val(response.data.depositAmount);
	                       $('#maturityAmount').val(response.data.maturityAmount);
	                       $('#maturityDate').val(response.data.maturityDate);
						   
	                   } else {
	                       alert("No data found for this policy.");
	                   }
	               },
	               error: function () {
	                   alert("Error fetching policy details.");
	               }
	           });
	       } else {
	           
	           $('#customerName, #schemeName, #schemeType, #policyAmount, #depositAmount, #maturityAmount, #maturityDate').val('');
	       }
	   });
	   
	   
	   //saving apply Maturity data
	   
	   $("#formid").submit(function (event) {
	   						event.preventDefault();
	   					
	   								       var data = {
	   								           branchName: $("#branchName").val(),       
	   								           policyNo: $("#policyNo").val(),         
	   								           maturityDate: $("#maturityDate").val(),             
	   								           customerName: $("#customerName").val(),   
	   								           schemeMode: $("#schemeMode").val(),      
											   policyAmount: $("#policyAmount").val() , 
											   depositAmount: $("#depositAmount").val(),
											   maturityAmount: $("#maturityAmount").val(), 
											   remark: $("#remark").val()    
	   								       };

	   									   
	   								       $.ajax({
	   										
	   								           url: "/api/Maturitymanagement/saveApplymaturity",  
	   								           type: "POST",
	   								           contentType: "application/json",
	   								           data: JSON.stringify(data),
	   								           success: function (response) {
	   											
	   								               if (response.status === "OK") {
	   								                   alert(" " + response.message);
	   								                   $("#formid")[0].reset(); 
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
									   
									  
										
									   $('#viewBtn').on('click', function (e) {
									       e.preventDefault(); // <-- Stop form submission

									       $.ajax({
									           url: "/api/Maturitymanagement/getApplymaturitydetails",
									           type: "GET",
									           success: function (response) {
									               if (response.status === "OK" && response.data && response.data.length > 0) {
									                   var tableBody = $("#table tbody");
									                   tableBody.empty();

									                   $.each(response.data, function (index, item) {
									                       var row = "<tr>" +
									                           "<td>" + item.policyNo + "</td>" +
									                           "<td>" + item.branchName + "</td>" +
									                           "<td>" + item.maturityDate + "</td>" +
									                           "<td>" + item.customerName + "</td>" +
									                           "<td>" + item.schemeName + "</td>" +
									                           "<td>" + item.schemeType + "</td>" +
									                           "<td>" + item.policyAmount + "</td>" +
									                           "<td>" + item.maturityAmount + "</td>" +
									                           "<td>" + item.remark + "</td>" +
									                           "</tr>";
									                       tableBody.append(row);
									                   });
									               } else {
									                   alert("No maturity details found.");
									               }
									           },
									           error: function (xhr, status, error) {
									               console.error("Error fetching maturity details:", error);
									               alert("Failed to load maturity details.");
									           }
									       });
									   });

										  });

