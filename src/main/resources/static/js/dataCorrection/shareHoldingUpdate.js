$(document).ready(function() {
	$.ajax({
		url: "/api/customershareholdingcontroller/findAllTransferShare",
		type: "GET",
		success: function(response) {
			if (response.status === "OK") {
				$("#findByCode").empty().append("<option value=''>-- Select Code --</option>");
				response.data.forEach(function(item) {
					$("#findByCode").append(`<option value='${item.findByCode}'>${item.findByCode}-${item.customerName}</option>`);
				});
			} else {
				alert("No customer codes found.");
			}
		},
		error: function() {
			alert("Failed to load customer codes.");
		}
	});

	$.ajax({
		url: "api/preference/getAllBranchModule", // Add base path if needed like /api/preference/getAllBranchModule
		type: "GET",
		success: function(response) {
			if (response.status == "FOUND") {
				const branchList = response.data;
				$("#branchName").empty(); // Clear existing options
				$("#branchName").append("<option value=''>-- Select Branch --</option>");

				for (let i = 0; i < branchList.length; i++) {
					let branch = branchList[i];
					let option = `<option value="${branch.branchName}">${branch.branchName}</option>`;
					$("#branchName").append(option);

				}
			} else {
				alert("Error: " + response.message);
			}
		},
		error: function(xhr) {
			console.error("Error loading branches:", xhr.responseText);
			alert("Failed to load dropdown data.");
		}
	});

	$("#findByCode").change(function() {
		let findByCode = $("#findByCode").val();
		$.ajax({
			type: "POST",
			url: "api/customershareholdingcontroller/fetchByFindByCode",
			data: { findByCode: findByCode },
			success: function(response) {
				if (response.status == "FOUND") {
					let data = response.data[0];
					$("#id").val(data.id);
					$("#customerName").val(data.customerName);
					$("#startDate").val(data.startDate);
					$("#previousAccountBalance").val(data.previousAccountBalance);
					$("#previousShareCount").val(data.previousShareCount);
					$("#baseValue").val(data.baseValue);
					$("#branchName").val(data.branch);
					$("#dateOfTransfer").val(data.dateOfTransfer);
					$("#shareIssuedBy").val(data.shareIssuedBy);
					$("#noOfShare").val(data.noOfShare);
					$("#amountTransferred").val(data.amountTransferred);
					$("#balanceShares").val(data.balanceShares);
					$("#modeOfPayment").val(data.modeOfPayment);
					$("#comments").val(data.comments);

				} else {
					alert("Transfer Share Details Not Found For Customer");
				}
			},
			error: function() {
				alert("Shares not found or server error");
			}
		});

	});

	$('#updateBtn').click(function(e) {
		e.preventDefault();

		let transferData = {
			id: $('#id').val(), // Required for update
			findByCode: $('#findByCode').val(),
			customerName: $('#customerName').val(),
			startDate: $('#startDate').val(),
			previousAccountBalance: $('#previousAccountBalance').val(),
			previousShareCount: $('#previousShareCount').val(),
			baseValue: $('#baseValue').val(),
			branch: $('#branch').val(),
			dateOfTransfer: $('#dateOfTransfer').val(),
			shareIssuedBy: $('#shareIssuedBy').val(),
			noOfShare: $('#noOfShare').val(),
			amountTransferred: $('#amountTransferred').val(),
			balanceShares: $('#balanceShares').val(),
			modeOfPayment: $('#modeOfPayment').val(),
			comments: $('#comments').val()
		};

		$.ajax({
			url: '/api/customershareholdingcontroller/updateTransferShare',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(transferData),
			success: function(response) {
				if (response.status === "FOUND") {
					alert("Transfer Data Updated Successfully");
					location.reload();
					// Optionally refresh the table or UI
				} else {
					alert("Something went wrong: " + response.message);
				}
			},
			error: function(xhr) {
				alert("Error while saving data: " + xhr.responseText);
			}
		});
	});
});