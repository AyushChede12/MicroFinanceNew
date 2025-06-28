// get current date
  $(document).ready(function () {
    // Get today's date in YYYY-MM-DD format
    const today = new Date().toISOString().split('T')[0];
    $('#applicationDate').val(today);
	$('#fromDate').val(today);
	$('#toDate').val(today);
	$('#approvalDate').val(today);
  });

