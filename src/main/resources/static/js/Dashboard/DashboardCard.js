$(document).ready(function () {
	 $.ajax({
		  url: "/api/customermanagement/getAllCustomer", 
		        type: "GET",
		        dataType: "json",
		        success: function (response) {
		            if (response && Array.isArray(response)) {
		                let count = response.length; 
		                console.log("Total customers:", count);
		                $("#CustomerCount h6").text(count); 
		            } else {
		                $("#CustomerCount h6").text("0");
		            }
		        },
		        error: function (xhr, status, error) {
		            console.error("Error fetching all customers:", error);
		            $("#CustomerCount h6").text("0");
		        }
		    });
		});