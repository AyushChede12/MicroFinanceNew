
//fetch only Drowpdown
$(document).ready(function () {
    console.log("Document ready");

    $.ajax({
        url: '/approved', // ✅ This hits your @GetMapping
        type: 'GET',
        success: function (response) {
            if (Array.isArray(response) && response.length > 0) {
                const dropdown = $('#memberId');
                dropdown.empty(); // Clear existing options
                dropdown.append('<option value="">Select Member</option>');

                response.forEach(function (customer) {
                    dropdown.append(
                        `<option value="${customer.id}">${customer.customerName} - ${customer.memberCode}</option>`
                    );
                });
            } else {
                alert('No member data found');
            }
        },
        error: function (xhr, status, error) {
            console.error('AJAX Error:', status, error);
            alert('Failed to fetch members');
        }
    });
});

//data fetch from id and name

$(document).ready(function () {
    $('#memberId').on('change', function () {
        const selectedId = $(this).val();

        if (selectedId !== "") {
            $.ajax({
                url: '/api/loanmanegment/getByIdNewLoanApplication',
                type: 'GET',
                data: { id: selectedId },
                success: function (response) {
                    console.log("Response:", response);

                    if (response.status=="OK") {
                        const d = response.data;
                        $('#relativeDetails').val(d.relationToApplicant || '');
                        $('#dateOfBirth').val(d.dob || '');
                        $('#age').val(d.customerAge || '');
                        $('#contactNo').val(d.contactNo || '');
                        $('#notificationStatus').val(d.noficationStatus || '');
                        $('#address').val(d.customerAddress || '');
                        $('#pinCode').val(d.pinCode || '');
                        $('#branchName').val(d.branchName || '');
                     
                    } else {
                        alert("Customer not found!");
                    }
                },
                error: function (xhr) {
                    console.error("AJAX Error:", xhr.responseText);
                    alert("Something went wrong while fetching data.");
                }
            });
        } else {
            $('input, textarea').not('#findMember').val('');
        }
    });
});

$(document).ready(function() {
    $.ajax({
        url: "/api/loanmanegment/fetchLoanSchemeCatalog",
        type: "GET",
        success: function(response) {
            console.log("API response:", response);

            var dropdown = $('#loanPlanName');     // shows: memberCode only
            dropdown.empty();
       		dropdown.append('<option value="">Select</option>');

            if (response.status === "FOUND" && response.data) {
                $.each(response.data, function(index, customer) {
                    dropdown.append('<option value="' + customer.loanPlaneName + '">' + customer.loanPlaneName + '</option>');
                });
            } else {
                dropdown.append('<option value="">No customers found</option>');
            }
        },
        error: function() {
            alert("Failed to fetch customer list.");
        }
    });
});

$('#loanPlanName').on('change', function () {
    let selectedName = $(this).val();

    if (selectedName !== "") {
        $.ajax({
            url: '/api/loanmanegment/allfetchdataLoanPlanName?loanPlanName=' + encodeURIComponent(selectedName), // Pass as query param
            type: 'GET',
            success: function (response) {
                if (response.status === "FOUND") {
                    let customer = response.data[0];
                    $('#typeOfLoan').val(customer.typeLoan);
					const emicollection = $('#loanMode').val(customer.loanMode).val();
					const tensure =$('#loanTerm').val(customer.loanTerm).val();
					const interestinyear =$('#rateOfInterest').val(customer.rateIntrestType).val();
					const loanamount =$('#loanAmount').val(customer.loanAmount).val();
					const roitype =$('#interestType').val(customer.typeIntrest).val();
					//$('#purposeOfLoan').val(customer.typeLoan);
				 calculateEMI(emicollection,tensure,interestinyear,loanamount,roitype);
                } else {
                    alert('No data found!');
                    $('#openingAmount').val('');
                }
            },
            error: function () {
                alert('Error while fetching data!');
                $('#openingAmount').val('');
            }
        });
    } else {
        $('#openingAmount').val('');
    }
});

function calculateEMI(emicollection,tensure,interestinyear,loanamount,roitype) {
  const roitype = document.getElementById("interestType").value;
  const emicollection = document.getElementById("loanMode").value;
  const interestinyear = parseFloat(document.getElementById("rateOfInterest").value);
  const loanamount = parseFloat(document.getElementById("loanAmount").value);
  const tensure = parseInt(document.getElementById("loanTerm").value);

  const periods = tensure; // ✅ ALWAYS use entered term — no conversion!
  let periodicRate;

  // ✅ Only adjust the rate — periods stays fixed
  switch (emicollection) {
    case "Daily":
      periodicRate = interestinyear / 365 / 100;
      break;
    case "Weekly":
      periodicRate = interestinyear / 52 / 100;
      break;
    case "Fortnightly":
      periodicRate = interestinyear / 24 / 100;
      break;
    case "Monthly":
      periodicRate = interestinyear / 12 / 100;
      break;
    case "Quarterly":
      periodicRate = interestinyear / 4 / 100;
      break;
  }

  let emi, tabledata = '', principal, currentDate = new Date();

  if (roitype === "FlatInterest") {
    const totalInterest = loanamount * periodicRate * periods;
    const totalAmount = loanamount + totalInterest;
    emi = totalAmount / periods;

    document.getElementById("emiPayment").value = emi.toFixed(2);

    principal = loanamount;

    for (let m = 1; m <= periods; m++) {
      const interestComponent = totalInterest / periods;
      const principalComponent = emi - interestComponent;
      let closingPrincipal = principal - principalComponent;

      if (Math.abs(closingPrincipal) < 0.01) closingPrincipal = 0.00;

      tabledata += buildRow(m, currentDate, emi, principalComponent, interestComponent, closingPrincipal);

      principal = closingPrincipal;
      currentDate = incrementDate(currentDate, emicollection);
    }
  }

  else if (roitype === "reducinginterest") {
    const r = periodicRate;
    emi = (loanamount * r * Math.pow(1 + r, periods)) / (Math.pow(1 + r, periods) - 1);

    document.getElementById("emiPayment").value = emi.toFixed(2);

    principal = loanamount;

    for (let m = 1; m <= periods; m++) {
      const interestComponent = principal * r;
      const principalComponent = emi - interestComponent;
      let closingPrincipal = principal - principalComponent;

      if (Math.abs(closingPrincipal) < 0.01) closingPrincipal = 0.00;

      tabledata += buildRow(m, currentDate, emi, principalComponent, interestComponent, closingPrincipal);

      principal = closingPrincipal;
      currentDate = incrementDate(currentDate, emicollection);
    }
  }

  else if (roitype === "Rule78") {
    const totalInterest = loanamount * periodicRate * periods;
    const sumOfDigits = (periods * (periods + 1)) / 2;

    let interestPerPeriod = [];
    for (let i = periods; i >= 1; i--) {
      interestPerPeriod.push((i / sumOfDigits) * totalInterest);
    }

    const totalAmount = loanamount + totalInterest;
    emi = totalAmount / periods;

    document.getElementById("emiPayment").value = emi.toFixed(2);

    principal = loanamount;
    const principalComponent = loanamount / periods;

    for (let m = 1; m <= periods; m++) {
      const interestComponent = interestPerPeriod[m - 1];
      const installment = principalComponent + interestComponent;
      let closingPrincipal = principal - principalComponent;

      if (Math.abs(closingPrincipal) < 0.01) closingPrincipal = 0.00;

      tabledata += buildRow(m, currentDate, installment, principalComponent, interestComponent, closingPrincipal);

      principal = closingPrincipal;
      currentDate = incrementDate(currentDate, emicollection);
    }
  }

  document.querySelector('.datatable').classList.add('show');
  document.getElementById('tbody').innerHTML = tabledata;
}


   