function photoUpload() {
	const file = document.getElementById("uploadPhoto").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			const previewImg = document.getElementById("photoPreview");
			previewImg.src = e.target.result;
			previewImg.style.width = "100%";
			previewImg.style.height = "150px";
			previewImg.style.objectFit = "cover";
			previewImg.style.borderRadius = "10px";
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for photo.");
	}
}

function signatureUpload() {
	const file = document.getElementById("uploadSignature").files[0];
	if (file && file.type.startsWith("image/")) {
		const reader = new FileReader();
		reader.onload = function(e) {
			const previewImg = document.getElementById("signaturePreview");
			previewImg.src = e.target.result;
			previewImg.style.width = "100%";
			previewImg.style.height = "150px";
			previewImg.style.objectFit = "cover";
			previewImg.style.borderRadius = "10px";
		};
		reader.readAsDataURL(file);
	} else {
		alert("Please upload a valid image file for signature.");
	}
}

$(document).ready(function() {
	$("#savegroupdirectory").show();
	$("#updategroupdirectory").hide();

	$('#savegroupdirectory').on('click', function(e) {
		e.preventDefault();

		const formData = new FormData();

		// 👥 Collect table members
		let memberCodes = [];
		let customerName = [];

		$('#tab1 tr').each(function() {
			let code = $(this).find('td').eq(0).text().trim();
			let name = $(this).find('td').eq(1).text().trim();
			if (code) memberCodes.push(code);
			if (name) customerName.push(name);

		});

		if (memberCodes.length === 0 && memberNames.length === 0) {
			alert("⚠️ No members to save.");
			return;
		}


		
		// Text fields
		formData.append("groupID", $('#groupID').val());
		formData.append("communityName", $('#communityName').val());
		formData.append("openingDate", $('#openingDate').val());
		formData.append("branchName", $('#branchName').val());
		formData.append("communityLeader", $('#communityLeader').val());
		formData.append("contactNo", $('#contactNo').val());
		formData.append("communityAddress", $('#communityAddress').val());
		formData.append("allocatedStaff", $('#allocatedStaff').val());
		formData.append("collectionDay", $('#collectionDay').val());
		formData.append("collectionTime", $('#collectionTime').val());

		// 👥 Optional member fields (comma-separated strings)
		formData.append("selectedMember", memberCodes.join(","));
		formData.append("customerName", customerName.join(","));
		//formData.append("referralDetails", referralDetails.join(","));
		// formData.append("contact", Contact.join(","));



		// File fields
		const photoFile = $('#uploadPhoto')[0].files[0];
		const signatureFile = $('#uploadSignature')[0].files[0];

		if (photoFile) {
			formData.append("uploadPhoto", photoFile);
		}
		if (signatureFile) {
			formData.append("uploadSignature", signatureFile);
		}

		// Debug log
		console.log("📤 Sending Group Directory FormData...");

		$.ajax({
			url: 'api/joinliability/saveGroupDirectory',
			type: 'POST',
			data: formData,
			processData: false,
			contentType: false,
			enctype: 'multipart/form-data',
			success: function(response) {
				if (response.status === 'OK') {
					alert("Group Directory Saved Successfully");
					location.reload();
				} else {
					alert("Failed to Save: " + (response.message || 'Unknown error'));
				}
			},
			error: function(xhr) {
				console.error("💥 Save Error:", xhr.responseText);
				alert("❌ Error occurred while saving.");
			}
		});
	});
	// feach the group directory
	// FETCH GROUP DIRECTORY DATA
	function fetchGroupDirectory() {
		$.ajax({
			url: "api/joinliability/viewGroupDirectories",  // your GET endpoint
			type: "GET",
			dataType: "json",
			success: function(response) {
				const data = response.data || [];
				const tableBody = $("#groupDirectoryBody").empty();

				if (data.length > 0) {
					$.each(data, function(index, item) {
						const row = `
                        <tr>
                            
							<td>${item.groupID || ''}</td>
                            <td>${item.communityName || ''}</td>
                            <td>${item.openingDate || ''}</td>
                            <td>${item.branchName || ''}</td>
                            <td>${item.communityLeader || ''}</td>
                            <td>${item.contactNo || ''}</td>
                            <td>${item.communityAddress || ''}</td>
                            <td>${item.allocatedStaff || ''}</td>
                            <td>${item.collectionDay || ''}</td>
                            <td>${item.collectionTime || ''}</td>
							
							            
							           <td class="d-flex" style="gap:.5rem;">
									   <button class="iconbutton edit-btn" data-id="${item.id}">
									                      <i class="fa-solid fa-pen-to-square text-success"></i>
									                    </button>
									                    <button class="iconbutton delete-group-btn" data-id="${item.id}">
									                      <i class="fa-solid fa-trash text-danger"></i>
									                    </button>
							           </td>
                        </tr>`;
						tableBody.append(row);
					});
				} else {
					tableBody.html(`<tr><td colspan="18" class="text-center text-warning">No data found.</td></tr>`);
				}
			},
			error: function() {
				$("#groupDirectoryBody").html(`<tr><td colspan="18" class="text-center text-danger">Something went wrong.</td></tr>`);
			}
		});
	}
	fetchGroupDirectory();
	// edit the group directory 
	$(document).on("click", ".edit-btn", function() {
		var id = $(this).data("id");

		$.ajax({
			url: `api/joinliability/editGroupDirectory/${id}`,
			type: "GET",
			dataType: "json",
			success: function(res) {
				const item = res.data;
				if (item) {
					// Use 'item' instead of 'data'
					$("#id").val(item.id); // Hidden field to track ID while updating
					
					$("#groupID").val(item.groupID);
					$("#communityName").val(item.communityName);
					$("#openingDate").val(item.openingDate);
					$("#branchName").val(item.branchName);
					$("#communityLeader").val(item.communityLeader);
					$("#contactNo").val(item.contactNo);
					$("#communityAddress").val(item.communityAddress);
					$("#allocatedStaff").val(item.allocatedStaff);
					$("#collectionDay").val(item.collectionDay);
					$("#collectionTime").val(item.collectionTime);

					$("#savegroupdirectory").hide();
					$("#updategroupdirectory").show();
				} else {
					alert("No data found for editing.");
				}
			},
			error: function(xhr) {
				console.error("Edit fetch error:", xhr.responseText);
				alert("Failed to load group directory for editing.");
			}
		});
	});
	// update group directry
	$('#updategroupdirectory').on('click', function() {
		const id = $('#id').val();

		if (!id || isNaN(id)) {
			alert("❌ Invalid ID. Cannot update.");
			return;
		}

		const groupData = {
			groupID: $('#groupID').val()?.trim(),
			communityName: $('#communityName').val()?.trim(),
			openingDate: $('#openingDate').val(),
			branchName: $('#branchName').val(),
			communityLeader: $('#communityLeader').val()?.trim(),
			contactNo: $('#contactNo').val()?.trim(),
			communityAddress: $('#communityAddress').val()?.trim(),
			allocatedStaff: $('#allocatedStaff').val()?.trim(),
			collectionDay: $('#collectionDay').val(),
			collectionTime: $('#collectionTime').val()
		};

		$.ajax({
			url: `api/joinliability/updateGroupDirectory/${id}`,
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(groupData),
			success: function(response) {
				alert("✅ Group Directory updated successfully!");
				$('#groupdirectordform')[0].reset();

				fetchGroupDirectory(); // Make sure this function is defined
			},
			error: function(xhr) {
				console.error("Update error:", xhr.responseText);
				alert("❌ Failed to update. Check console for details.");
			}
		});
	});




	// Delete Group Directory
	$(document).on("click", ".delete-group-btn", function() {
		const id = $(this).data("id");

		if (confirm("Are you sure you want to delete this group?")) {
			$.ajax({
				url: `api/joinliability/deleteGroupDirectory/${id}`, // तुमचं backend endpoint
				type: "POST", // POST आहे तर backend सुद्धा POST expect करतं का हे पाहा (else use DELETE)
				success: function(response) {
					alert("Group Directory deleted successfully!");

					// Optional: Refresh list
					if (typeof fetchGroupDirectories === "function") {
						fetchGroupDirectory();
					}
				},
				error: function(xhr) {
					console.error("Delete failed:", xhr.responseText || xhr.statusText);
					alert("Failed to delete Group Directory.");
				}
			});
		}
	});

	// add que
	$(document).ready(function() {
		$.ajax({
			url: "api/customershareholdingcontroller/findAllCustomerCode",
			type: "GET",
			success: function(response) {
				console.log("API response:", response);

				var dropdown1 = $('#selectedMember');       // shows: memberCode - customerName
				// var dropdown2 = $('#jointOperationCode');     // shows: memberCode only

				dropdown1.empty();
				// dropdown2.empty();

				dropdown1.append('<option value="">Select</option>');
				//  dropdown2.append('<option value="">Select</option>');

				if (response.status === "OK" && response.data) {
					$.each(response.data, function(index, customer) {
						dropdown1.append('<option value="' + customer.memberCode + '">' + customer.memberCode + ' - ' + customer.customerName + '</option>');
						//dropdown2.append('<option value="' + customer.memberCode + '">' + customer.memberCode + '</option>');
					});
				} else {
					dropdown1.append('<option value="">No customers found</option>');
					// dropdown2.append('<option value="">No customers found</option>');
				}
			},
			error: function() {
				alert("Failed to fetch customer list.");
			}
		});
	});


	$('#selectedMember').on('change', function() {
		let selectedCode = $(this).val();

		if (selectedCode !== "") {
			$.ajax({
				url: 'api/customershareholdingcontroller/fetchByCustomerCode?memberCode=' + selectedCode, // ✅ send as query param
				type: 'POST',
				success: function(response) {
					if (response.status === "FOUND") {
						let customer = response.data[0];
						$('#customerName').val(customer.customerName);
						$('#referralDetails').val(customer.referralName);
						$('#contact').val(customer.contactNo);
					} else {
						alert('No customer data found!');
						$('#customerName').val('');
					}
				},
				error: function() {
					alert('Error while fetching customer data!');
				}
			});
		} else {
			$('#customerName').val('');
		}
	});


	// add que 
	$("#addque").click(function() {

		var selectedMember = $("#selectedMember").val();
		var customerName = $("#customerName").val();
		var referralDetails = $("#referralDetails").val();
		var contact = $("#contact").val();


		if (!selectedMember) {
			alert("Please enter a member code.");
			return;
		}

		if ($('#tab1').find('td:contains("' + selectedMember + '")').length > 0) {
			alert("This member is already added to the queue.");
			return;
		}


		$.ajax({
			url: 'api/joinliability/feachdatagroupdirectory',
			type: 'GET',
			data: { selectedMember: selectedMember },
			contentType: 'json',
			success: function(data) {
				if (data) {
					let newRow = `
						                        <tr>
						                            <td>${selectedMember}</td>
						                            <td>${customerName}</td>
													<td>${referralDetails}</td>
													<td>${contact}</td>
													<td><button class="btn btn-danger btn-sm remove-btn"><i class="fa-solid fa-xmark"></i></i></button></td>				                       
													 </tr>
						                    `;
					$('#tab1').append(newRow);


				} else {
					alert("No data found for this member.");
				}
			},
			error: function() {
				alert("Error fetching member data.");
			}
		});


	});

	$('#tab1').on('click', '.remove-btn', function() {
		$(this).closest('tr').remove();
	});





});


