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

		// Text fields
		formData.append("communityName", $('#communityName').val());
		formData.append("openingDate", $('#openingDate').val());
		formData.append("assignedBranch", $('#assignedBranch').val());
		formData.append("communityLeader", $('#communityLeader').val());
		formData.append("contactNo", $('#contactNo').val());
		formData.append("communityAddress", $('#communityAddress').val());
		formData.append("allocatedStaff", $('#allocatedStaff').val());
		formData.append("collectionDay", $('#collectionDay').val());
		formData.append("collectionTime", $('#collectionTime').val());

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
			url: '/api/joinliability/saveGroupDirectory',
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
			url: "/api/joinliability/viewGroupDirectories",  // your GET endpoint
			type: "GET",
			dataType: "json",
			success: function(response) {
				const data = response.data || [];
				const tableBody = $("#groupDirectoryBody").empty();

				if (data.length > 0) {
					$.each(data, function(index, item) {
						const row = `
                        <tr>
                            <td>${index + 1}</td>
                            <td>${item.communityName || ''}</td>
                            <td>${item.openingDate || ''}</td>
                            <td>${item.assignedBranch || ''}</td>
                            <td>${item.communityLeader || ''}</td>
                            <td>${item.contactNo || ''}</td>
                            <td>${item.communityAddress || ''}</td>
                            <td>${item.allocatedStaff || ''}</td>
                            <td>${item.collectionDay || ''}</td>
                            <td>${item.collectionTime || ''}</td>
							
							            
							           <td class="d-flex" style="gap:.5rem;">
							             <button class="edit-btn" data-id="${item.id}"><i class="fa fa-pen text-success"></i></button>
							             <button class="delete-btn" data-id="${item.id}"><i class="fa fa-trash text-danger"></i></button>
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
});


