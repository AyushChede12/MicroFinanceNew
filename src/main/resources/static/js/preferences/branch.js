function saveBranch() {
	const formData = {
		branchCode: $('input[name="branchCode"]').val(),
		branchName: $('input[name="branchName"]').val(),
		openingDate: $('input[name="openingDate"]').val(),
		address: $('textarea[name="address"]').val(),
		pin: $('input[name="pin"]').val(),
		state: $('select[name="state"]').val(),
		primaryContact: $('input[name="primaryContact"]').val(),
		contact: $('input[name="contact"]').val()
	};

	$.ajax({
		type: "POST",
		url: "/saveAllBranchModule", // Make sure the context path is correct
		contentType: "application/json",
		data: JSON.stringify(formData),
		success: function(response) {
			if (response === "success") {
				alert("Branch Saved Successfully");
				location.reload();
			}

		},
		error: function(xhr, status, error) {
			$('#responseMessage').text("Error: " + xhr.responseText);
		}
	});

}

$(document).ready(function() {
	$("#tableBody").hide();
	$("#updateBtn").hide();
	$.ajax({
		url: "/getAllBranchModule",
		type: "GET",
		contentType: "application/json",
		success: function(data) {
			var tbody = $(".datatable tbody");
			tbody.empty(); // Clear existing rows

			$.each(data, function(index, item) {
				var row = `<tr style="font-family: 'Poppins', sans-serif;">
              <th scope="row"><a href="#">${index + 1}</a></th>
              <td>${item.branchCode || ''}</td>
              <td><a href="#" class="text-primary">${item.branchName || ''}</a></td>
              <td>${item.openingDate || ''}</td>
              <td>${item.address || ''}</td>
              <td>${item.pin || ''}</td>
              <td>${item.state || ''}</td>
              <td>${item.primaryContact || ''}</td>
              <td>${item.contact || ''}</td>
			  <td><button class="iconbutton" onclick="viewData(${item.id})" title="View"><i class="fa-solid fa-pen-to-square text-primary"></i></button></td>
			  <td><button class="iconbutton" onclick="deleteData(${item.id})" title="Delete"><i class="fa-solid fa-trash text-danger"></i></button></td>
            </tr>`;
				tbody.append(row);
			});
		},
		error: function(xhr, status, error) {
			console.error("Error fetching data:", error);
			alert("Failed to load branch module data.");
		}
	});
});

function showTableData() {
	$("#tableBody").show();
}

function hideTableData() {
	$("#tableBody").hide();
}

function viewData(id) {
	$("#updateBtn").show();
	$("#saveBtn").hide();
	$("#hideBtn").hide();
	$("#showBtn").hide();
	$.ajax({
		url: "/getBranchModuleById",
		type: "GET",
		data: { id: id },
		success: function(data) {
			$("#id").val(data.id);
			$("#branchCode").val(data.branchCode);
			$("#branchName").val(data.branchName);
			$("#openingDate").val(data.openingDate);
			$("#address").val(data.address);
			$("#pin").val(data.pin);
			$("#state").val(data.state);
			$("#primaryContact").val(data.primaryContact);
			$("#contact").val(data.contact);
		},
		error: function(xhr) {
			alert("Error: " + xhr.responseText);
		}
	});

}

function deleteData(id) {
	if (confirm("Are you sure you want to delete this branch?")) {
		$.ajax({
			url: "/deleteBranchModuleById", // or "/deleteAllBranchModule" if you're sending full object
			type: "POST",
			data: { id: id }, // if using @RequestParam long id
			success: function(response) {
				alert("Branch deleted successfully.");
				// Refresh the table or page here
				location.reload(); // example method to reload your data
			},
			error: function(xhr, status, error) {
				alert("Failed to delete branch.");
				console.error(error);
			}
		});
	}
}



function updateBranch(){
	let payload = {
			id: $("#id").val(),
			branchCode: $("#branchCode").val(),
			branchName: $("#branchName").val(),
			openingDate: $("#openingDate").val(),
			address: $("#address").val(),
			pin: $("#pin").val(),
			state: $("#state").val(),
			primaryContact: $("#primaryContact").val(),
			contact: $("#contact").val()
		};
		$.ajax({
			url: "/updateBranchModuleById",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify(payload),
			success: function(response) {
				alert("Update Branch successfully!");
				location.reload();
				// Optionally refresh table or redirect
			},
			error: function(xhr, status, error) {
				alert("Update failed: " + xhr.responseText);
			}
		});
}


$(document).ready(function () {
    // Fetch all branches and populate the dropdown
    $.ajax({
        url: "getAllBranchModule",
        method: "GET",
        success: function (data) {
            console.log("Fetched Branches:", data);
            data.forEach(function (branch) {
                $('#branchName').append(
                    $('<option>', {
                        value: branch.branchName,
                        text: branch.branchName
                    })
                );
            });
        },
        error: function (err) {
            console.error("Error fetching branches:", err);
        }
    });
});


