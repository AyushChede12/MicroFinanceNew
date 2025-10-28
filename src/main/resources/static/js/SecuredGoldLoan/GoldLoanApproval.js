$(document).ready(function() {
  $.ajax({
    url: "api/securedGoldLoan/getAllGoldLoanCustomer",
    type: "GET",
    success: function(response) {
      var select = $("#findByGoldLoanId");
      select.empty();
      select.append('<option value="">Select Loan ID</option>');

      if (response && response.data && response.data.length > 0) {
        response.data.forEach(function(gold) {
          var goldId = gold.goldId || gold.goldID;

          
          if (goldId && goldId.trim() !== "") {
            select.append('<option value="' + goldId + '">' + goldId + "</option>");
          }
        });
      } else {
        console.log("No GoldLoan found");
      }
    },
    error: function(err) {
      console.error("Error fetching members", err);
    },
  });
});
