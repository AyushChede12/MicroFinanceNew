$(document).ready(function() {
	alert("ready Function");
	$.ajax({
		url: 'api/joinliability/viewgrouploans',
		type: 'GET',
		success: function(response) {
			if (response && Array.isArray(response.data) && response.data.length > 0) {
				let groupOptions = response.data.map(function(item) {
					return {
						id: item.groupCode,
						text: item.groupCode + " - " + item.communityName
					};
				});

				$('#groupCode').select2({
					placeholder: '-- Search Group Code or Name --',
					data: groupOptions,
					matcher: function(params, data) {
						if ($.trim(params.term) === '') return data;
						if (typeof data.text === 'undefined') return null;

						const term = params.term.toLowerCase();
						const text = data.text.toLowerCase();
						return text.includes(term) ? data : null;
					}
				});
			} else {
				alert("No approved Group found.");
			}
		},
		error: function() {
			alert("Failed to load Group codes.");
		}
	});

});