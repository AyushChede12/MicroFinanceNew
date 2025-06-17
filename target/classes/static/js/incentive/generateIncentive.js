$(document).ready(function () {
		// Get today's date in YYYY-MM-DD format
		let today = new Date().toISOString().split('T')[0];
		// Set it to the input field
		$("#dateFrom").val(today);
		$("#dateTo").val(today);
	});
	

	  $(document).ready(function () {
	    // Set today's date initially on page load
	    let today = new Date().toISOString().split('T')[0];
	    $("#dateFrom").val(today);
	    $("#dateTo").val(today);

	    // When a month is selected
	    $("#incentiveMonth").on("change", function () {
	      let monthName = $(this).val();
	      if (!monthName) return;

	      let year = new Date().getFullYear(); // You can make this dynamic if needed

	      // Get month index (0-11)
	      let monthIndex = new Date(Date.parse(monthName + " 1, " + year)).getMonth();

	      if (!isNaN(monthIndex)) {
	        let firstDay = new Date(year, monthIndex, 1);           // 1st day
	        let lastDay = new Date(year, monthIndex + 1, 0);        // last day

	        // Format YYYY-MM-DD
	        function formatDate(date) {
	          return date.toISOString().split("T")[0];
	        }

	        // Set the dates
	        $("#dateFrom").val(formatDate(firstDay));
	        $("#dateTo").val(formatDate(lastDay));

	        // Optionally: trigger calendar popup
	        $("#dateFrom")[0].showPicker?.();
	        $("#dateTo")[0].showPicker?.();
	      }
	    });
	  });
	</script>