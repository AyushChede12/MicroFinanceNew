/* $(document).ready(function () {
	$.ajax({
			type: "GET",
			url: "api/customersavings/getAllSavingAccountData",
			contentType: "application/json",
			success: function(response) {
				console.log("Full Response from API:", response); 
				if (response.status =="FOUND" ) {
					let data = response.data;
					let tableBody = $(".datatable tbody");
					tableBody.empty();
					data.forEach((item, index) => {
						let row = `<tr>
			                        <td>${index + 1}</td>
			                        <td>${item.accountNumber}</td>
									<td>${item.typeofaccount}</td>
			                        <td>${item.selectByCustomer}</td>
			                        <td>${item.enterCustomerName}</td>
									<td>${item.contactNumber}</td>
									<td>${item.branchName}</td>
									<td>${item.address}</td>
									<td>${item.district}</td>
									<td>${item.state}</td>
									<td><button class="iconbutton" onclick="viewData(${item.id})" title="View"><i class="fa-solid fa-pen-to-square text-primary"></i></button></td>
									<td><button class="iconbutton" onclick="deleteData(${item.id})" title="Delete"><i class="fa-solid fa-trash text-danger"></i></button></td>
			                    </tr>`;
						tableBody.append(row);
					});
				} else {
					alert("Failed to fetch saving account data: " + response.message);
				}
			},
			error: function() {
				alert("Error while calling the API.");
			}
		});
}); */

//janvi : today 

	//search team member
let allSavingAccData = []; 
 // Global array to store all team member data

function searchInTheSavingAcc() {
	$.ajax({
		type: "GET",
		contentType: "application/json",
		url: 'api/customersavings/getAllSavingAccountData',
		data: {},
		async: false,
		success: function(response) {
			if (!response.data || response.data.length === 0) {
				alert("No data found!");
				return;
			}

			allSavingAccData = response.data; // store for filtering
			renderTable(response.data);
		},
		error: function() {
			alert("Failed to fetch data. Please try again.");
		}
	});
}

function renderTable(data) {
	let j = 1;
	
	const tableData = data.map(function(value) {			
		return (
			`<tr>
                <td>${j++}</td>
               <td>${value.accountNumber}</td>
									<td>${value.typeofaccount}</td>
			                        <td>${value.selectByCustomer}</td>
			                        <td>${value.enterCustomerName}</td>
									<td>${value.contactNumber}</td>
									<td>${value.branchName}</td>
									<td>${value.address}</td>
									<td>${value.district}</td>
									<td>${value.state}</td>
            </tr>`
		);
	}).join('');
	$('#tableSavingAcc').html(tableData);
}


