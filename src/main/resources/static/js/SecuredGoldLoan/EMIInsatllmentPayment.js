$(document).ready(function(){
	
	$.ajax({
			url: 'api/securedGoldLoan/getAllActive',
			type: 'GET',
			success: function(response) {
				// Check data
				if (!(response && response.data && Array.isArray(response.data))) {
					alert("No Gold Data found.");
					return;
				}

				// 👉 Step 1: Distinct Set banaye
				let distinctMap = new Map();
				// Map use kiya taaki GoldID ke hisab se latest/first customerName bhi mil jaye

				response.data.forEach(function(item) {
					let goldId = item.goldID || item.goldId;
					if (goldId && goldId.trim() !== "") {
						distinctMap.set(goldId.trim(), item.customerName);
					}
				});

				// 👉 Step 2: Select2 ke liye data convert
				let goldOptions = [];
				distinctMap.forEach((customerName, goldId) => {
					goldOptions.push({
						id: goldId,
						text: goldId + " - " + customerName
					});
				});

				// 👉 Step 3: Select2 Initialize (distinct data)
				$('#findByGoldLoanId').select2({
					placeholder: '-- Search Gold ID or Name --',
					data: goldOptions,
					matcher: function(params, data) {
						if ($.trim(params.term) === '') return data;
						if (typeof data.text === 'undefined') return null;

						const term = params.term.toLowerCase();
						const text = data.text.toLowerCase();
						return text.includes(term) ? data : null;
					}
				});
			},
			error: function(xhr, status, error) {
				console.error("Error fetching Gold Data:", error);
				alert("Failed to load Gold ID.");
			}
		});
	
});