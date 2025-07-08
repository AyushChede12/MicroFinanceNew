$(document).ready(function () {
    let allData = [];

    // ✅ Only run this on the listing page
    if (window.location.pathname !== "/updateFinacialConsultant") {
        // Fetch all data once on page load
        $.ajax({
            url: "/api/financialconsultant/getAllFinancialConsultantDetails",
            type: "POST",
            contentType: "application/json",
            success: function (response) {
                if (response.status === "OK" && response.data.length > 0) {
                    allData = response.data;
                    renderTable(allData); // Initial full load
                } else {
                    $(".datatable tbody").html(`<tr><td colspan="11" class="text-center">No data available</td></tr>`);
                }
            },
            error: function (xhr, status, error) {
                console.error("Error fetching financial consultants:", error);
                alert("Failed to load financial consultant data.");
            }
        });

        // Function to render table
        function renderTable(data) {
            const tbody = $(".datatable tbody");
            tbody.empty();

            if (data.length === 0) {
                tbody.html(`<tr><td colspan="11" class="text-center">No matching data found</td></tr>`);
                return;
            }

            $.each(data, function (index, item) {
                const row = `
                    <tr style="font-family: 'Poppins', sans-serif;">
                        <td>${index + 1}</td>
                        <td>${item.customerName || ''}</td>
                        <td>${item.financialCode || ''}</td>
                        <td>${item.contactNo || ''}</td>
                        <td>${item.joiningDate || ''}</td>
                        <td>${item.customerAddress || ''}</td>
                        <td>${item.branchName || ''}</td>
                        <td>${item.financialStatus === true || item.financialStatus === 1 ? 'Active' : 'Inactive'}</td>
                        <td>
                            <button class="iconbutton editBtn" data-id="${item.id}" title="Edit">
                                <i class="fa-solid fa-pen-to-square text-primary"></i>
                            </button>
                        </td>
                        <td>
                            <button class="iconbutton deleteBtn" data-id="${item.id}" title="Delete">
                                <i class="fa-solid fa-trash text-danger"></i>
                            </button>
                        </td>
                    </tr>`;
                tbody.append(row);
            });
        }

        // ✅ Live search on typing
        $('#searchKeyword').on('keyup', function () {
            const keyword = $(this).val().trim().toLowerCase();

            if (keyword === "") {
                renderTable(allData); // Show all if nothing typed
                return;
            }

            const filteredData = allData.filter(item =>
                (item.customerName && item.customerName.toLowerCase().includes(keyword)) ||
                (item.financialCode && item.financialCode.toLowerCase().includes(keyword))
            );

            renderTable(filteredData);
        });

        // ✅ Edit button redirect
        $(document).on('click', '.editBtn', function () {
            const id = $(this).data('id');
            if (id) {
                window.location.href = `/updateFinacialConsultant?id=${id}`;
            }
        });
    }

    // ✅ Only run this on the edit page
    if (window.location.pathname.includes("/updateFinacialConsultant")) {
        const urlParams = new URLSearchParams(window.location.search);
        const id = urlParams.get("id");

        if (id) {
            $.ajax({
                url: "/api/financialconsultant/getFinancialConsultantById",
                type: "GET",
                data: { id: id },
                success: function (response) {
                    if (response.status === "OK" && response.data) {
                        const data = response.data;

                        $("#id").val(data.id);
                        $("#joiningDate").val(data.joiningDate || '');
                        $("#memberCode").val(data.memberCode || '');
                        $("#customerName").val(data.customerName || '');
                        $("#dob").val(data.dob || '');
                        $("#customerAge").val(data.customerAge || '');
                        $("#guardianName").val(data.guardianName || '');
                        $("#relationToApplicant").val(data.relationToApplicant || '');
                        $("#contactNo").val(data.contactNo || '');
                        $("#nomineeName").val(data.nomineeName || '');
                        $("#branchName").val(data.branchName || '');
                        $("#nomineeAge").val(data.nomineeAge || '');
                        $("#customerAddress").val(data.customerAddress || '');
                        $("#district").val(data.district || '');
                        $("#state").val(data.state || '');
                        $("#pinCode").val(data.pinCode || '');
                        $("#profession").val(data.profession || '');
                        $("#academicBackground").val(data.academicBackground || '');
                        $("#selectPosition").val(data.selectPosition || '');
                        $("#referralCode").val(data.referralCode || '');
                        $("#referralName").val(data.referralName || '');
                        $("#fees").val(data.fees || '');
                        $("#modeofPayment").val(data.modeofPayment || '');
                        $("#chequeNo").val(data.chequeNo || '');
                        $("#chequeDate").val(data.chequeDate || '');
                        $("#depositAccount").val(data.depositAccount || '');
                        $("#refNo").val(data.refNo || '');
                        $("#comments").val(data.comments || '');
                        document.getElementById("financialStatus").checked = data.financialStatus === true || data.financialStatus === '1';
                        document.getElementById("smsSend").checked = data.smsSend === true || data.smsSend === '1';

                        if (data.customerPhoto) {
                            const img = `Uploads/${data.customerPhoto}`;
                            $("#financialPhotoPreview").attr("src", img);
                            $("#photoHidden").val(img);
                        }

                        if (data.customerSignature) {
                            const img = `Uploads/${data.customerSignature}`;
                            $("#financialSignaturePreview").attr("src", img);
                            $("#signatureHidden").val(img);
                        }

                        // Scroll to form (optional)
                        if ($("#formid").length > 0) {
                            $('html, body').animate({
                                scrollTop: $("#formid").offset().top
                            }, 500);
                        }
                    } else {
                        alert("No data found for the selected financial consultant.");
                    }
                },
                error: function () {
                    alert("Failed to fetch data for editing.");
                }
            });
        } else {
            alert("No ID found in URL.");
        }
    }
});
