$(document).ready(function() {
	$.ajax({
		url: '/api/datacorrection/fetchAllLoanApplications',
		type: 'GET',
		success: function(response) {
			if (response.status === "FOUND") {
				let loanOptions = response.data.map(function(item) {
					return {
						id: item.loanId,
						text: item.loanId
					};
				});

				// Initialize Select2 with full data and custom search matcher
				$('#loanId').select2({
					placeholder: '-- Search Loan ID --',
					data: loanOptions,
					matcher: function(params, data) {
						// If no search term, return all
						if ($.trim(params.term) === '') {
							return data;
						}

						if (typeof data.text === 'undefined') {
							return null;
						}

						// Case-insensitive match on memberCode or customerName
						const term = params.term.toLowerCase();
						const text = data.text.toLowerCase();

						if (text.includes(term)) {
							return data;
						}

						return null;
					}
				});

			} else {
				alert("No Loan ID found.");
			}
		},
		error: function() {
			alert("Failed to load ID");
		}
	});
});