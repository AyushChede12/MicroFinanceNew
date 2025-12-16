<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<aside id="sidebar" class="sidebar">
		<%
		String userName = (String) session.getAttribute("UserName");
		%>

		<ul class="sidebar-nav" id="sidebar-nav">
			<li class="nav-item"><a href="openDashboard" class="nav-link"
				style="display: block"> <i class="bi bi-house-door"
					style="color: rgb(255, 255, 255);"></i> <span
					style="font-family: 'Poppins', sans-serif">Dashboard</span>
			</a></li>


			<!-- Preferences -->

			<li id="preferences" class="nav-item"><a
				class="nav-link collapsed" href="#member-section"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-gear text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Preferences</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="member-section" class="nav-content collapse">
					<li id="Company_Administration"><a
						href="companyAdministration"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Company
								Administration</span>
					</a></li>

					<li id="Financial_Year"><a href="financialYear"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Financial Year</span>
					</a></li>

					<li id="Create_Branch"><a href="createBranch"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Create Branch</span>
					</a></li>

					<li id="Bank_Module"><a href="bankModule"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Bank Module</span>
					</a></li>

					<li id="Relative_Module"><a href="relativeModule"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Relative Module</span>
					</a></li>

					<li id="Category_Caste_Module"><a href="categoryModule"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Category/Caste
								Module</span>
					</a></li>

					<li id="Code_Module"><a href="codeModule"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Code Module</span>
					</a></li>

					<li id="Executive_Founder"><a href="executivePromoter"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Executive/Founder</span>
					</a></li>

					<li id="User_Creation"><a href="customerCreation"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">User Creation</span>
					</a></li>

					<li id="User_Menu_Access"><a href="customerMenuAccess"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">User Menu
								Access</span>
					</a></li>
					<!-- 
					<li><a href="customerBalanceReport"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Balance Sheet</span>
					</a></li>

					<li><a href="lockerManagement"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Locker
								Management</span>
					</a></li> -->
				</ul></li>


			<!-- Customer Management -->

			<li id="Customer_Management" class="nav-item"><a
				class="nav-link collapsed" href="#customer-management"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-people-fill text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Customer
							Management</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="customer-management" class="nav-content collapse">
					<li id="Add_Customer"><a href="addCustomer"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Add Customer</span>
					</a></li>

					<li id="Add_Customer_KYC"><a href="addCustomerKYC"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Add Customer
								KYC</span>
					</a></li>

					<li id="Customer_Summary"><a href="customerSummary"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Customer
								Summary</span>
					</a></li>

					<li id="Customer_Report"><a href="customerReport"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Customer Report</span>
					</a></li>

					<li id="Search_Customer"><a href="searchCustomer"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Search Customer</span>
					</a></li>
				</ul></li>


			<!-- Customer Shareholding -->
			<li id="Customer_Shareholding" class="nav-item"><a
				class="nav-link collapsed" href="#member-share"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-building-fill-down text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Customer
							Shareholding</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="member-share" class="nav-content collapse">
					<li id="Transfer_Shares"><a href="transferShares"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Transfer Shares</span>
					</a></li>

					<li id="Unallotted_Shares"><a href="unallotedShares"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Unallotted
								Shares</span>
					</a></li>

					<li id="Generate_Share_Certificate"><a
						href="GenerateShareCertificate"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Generate
								Share Certificate</span>
					</a></li>

					<li id="Regenerate_DNO"><a href="RegenerateDNO"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Regenerate DNO</span>
					</a></li>

				</ul></li>


			<!-- Account Management -->
			<li id="Account_Management" class="nav-item"><a
				class="nav-link collapsed" href="#account-section"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-wallet2 text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Account
							Management</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="account-section" class="nav-content collapse">
					<li id="Ledger_Account_Master"><a href="ledgerAccountMaster">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Ledger Account
								Master</span>
					</a></li>

					<li id="Outgoing_Payment_Entry"><a href="outgoingPaymentEntry">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Outgoing	Payment Entry</span>
					</a></li>

					<li id="Incoming_Receipt_Entry"><a href="incomingReceiptEntry">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Incoming	Receipt Entry</span>
					</a></li>

					<li id="Bank_Cash_Transfer_Entry"><a
						href="bankCashTransferEntry"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Bank Cash Transfer Entry</span>
					</a></li>

					<li id="Manual_Journal_Entry"><a href="manualJournalEntry">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Manual Journal Entry</span>
					</a></li>

					<li id="Incentive_Payment"><a href="incentivePayment"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Incentive Payment</span>
					</a></li>

					<li id="MIS_Interest_Payment"><a
						href="misInterestPaymentAccountSection"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">MIS Interest	Payment</span>
					</a></li>

					<li id="Cheque_Clearance_Processing"><a
						href="chequeClearingProcessing"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Cheque	Clearance Processing</span>
					</a></li>

					<li id="Mandate_Deposit_To_Bank"><a
						href="mandateDepositToBank"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Mandate Deposit To Bank</span>
					</a></li>

					<li id="Bank_Statement"><a href="bankStatement"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Bank Statement</span>
					</a></li>

					<li id="Cash_Book"><a href="cashBook"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Cash Book</span>
					</a></li>

					<li id="Funds_Transfer_Register"><a
						href="fundstransferRegister"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Funds Transfer Register</span>
					</a></li>

					<li id="Daily_Transaction_Book"><a href="dailyTransactionBook">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Daily Transaction Book</span>
					</a></li>

					<li id="Ledger_Summary_Report"><a href="ledgerSummaryReport">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Ledger Summary Report</span>
					</a></li>

					<li id="Journal_Entry_Report"><a href="journalEntryReport">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Journal Entry Report</span>
					</a></li>

					<li id="Trial_Balance_Report"><a href="trailBalanceReport">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Trial Balance Report</span>
					</a></li>

					<li id="PL_Statement"><a href="pLStatement"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">PL Statement</span>
					</a></li>

					<li id="Balance_Sheet"><a href="balanceSheet"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Balance Sheet</span>
					</a></li>

					<li id="Inter_Branch_Cash_Transfer"><a
						href="interbranchCashTransfer"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Inter Branch	Cash Transfer</span>
					</a></li>

				</ul></li>


			<!--  Customer Savings -->
			<li id="Custome_Savings" class="nav-item"><a
				class="nav-link collapsed" href="#saving-account"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-bank text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Customer
							Savings</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="saving-account" class="nav-content collapse">
					<li id="Savings_Scheme_Catalog"><a href="savingsSchemaCatalog">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Savings Scheme Catalog</span>
					</a></li>

					<li id="Create_Savings_Account"><a href="createSavingsAccount">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Create Savings Account</span>
					</a></li>

					<!-- <li>
            <a href="createCurrentAccount">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Create Current Account</span>
            </a>
          </li> -->

					<li id="Saving_Account_Activity"><a
						href="savingsAccountActivity"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Savings Account Activity</span>
					</a></li>

					<li id="Savings_Account_Fund_Transfer"><a
						href="savingsAccountFundTransfer"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Savings Account Fund Transfer</span>
					</a></li>

					<li id="Savings_Account_Interest_Transfer"><a
						href="savingAccountInterestTransfer"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Savings Account Interest Transfer</span>
					</a></li>

					<li id="Savings_Record_Book"><a href="savingsRecordBook">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Savings Record Book</span>
					</a></li>

					<!-- <li>
            <a href="currentAccountRecordBook">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Current Account Record Book</span>
            </a>
          </li> -->

					<li id="Customer_Savings_Statement"><a
						href="savingsAccountStatement"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Customer	Savings Statement</span>
					</a></li>

					<li id="Saving_Account_Closer"><a href="savingsAccountCloser">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Saving Account Closer</span>
					</a></li>

					<li id="Savings_Account_Inquiry"><a
						href="savingsAccountInquiry"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Savings Account Inquiry</span>
					</a></li>

					<li id="SMS_Service_Fee"><a href="smsServiceFee"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">SMS Service Fee</span>
					</a></li>

					<li id="Account_Maintenance_Charges"><a
						href="accountMaintenanceCharges"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Account Maintenance Charges</span>
					</a></li>

				</ul></li>


			<!-- Policy Management -->
			<li id="Policy_Management" class="nav-item"><a
				class="nav-link collapsed" href="#investment-section"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-piggy-bank text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Policy
							Management</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="investment-section" class="nav-content collapse">
					<li id="Plan_Management"><a href="planManagement"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Plan Management</span>
					</a></li>

					<li id="Add_New_Investment"><a href="addNewInvestment"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Add New
								Investment</span>
					</a></li>

					<li id="Policy_Renewal_Fee"><a href="policyRenewalFee"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Policy Renewal
								Fee</span>
					</a></li>

					<li id="Daily_Premium_Renewal"><a href="dailyPremiumRenewal">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Daily premium
								Renewal</span>
					</a></li>

					<li id="Flexible_Premium_Renewal"><a
						href="flexiblePremiumRenewal"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Flexible
								Premium Renewal</span>
					</a></li>

					<li id="Installment_Record_Book"><a
						href="installmentRecordBook"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Installment
								Record Book</span>
					</a></li>

					<li id="Investment_Transaction_Slip"><a
						href="InvestmentTransactionSlip"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Investment
								Transaction Slip</span>
					</a></li>

					<li id="Recurring_Payment_Receipt"><a
						href="recurringPaymentReceipt"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Recurring
								Payment Receipt</span>
					</a></li>

					<li id="Issue_Certificate"><a href="issueCertificate"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Issue
								Certificate</span>
					</a></li>

					<li id="ReIssue_Certificate"><a href="reissueCertificate">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">ReIssue
								Certificate</span>
					</a></li>

					<li id="Interest_Details"><a href="interestDetails"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Interest
								Details</span>
					</a></li>

					<li id="Interest_Payable"><a href="interestPayable"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Interest
								Payable</span>
					</a></li>

					<li id="Search_Policy"><a href="investmentDataSearch"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Search Policy</span>
					</a></li>

				</ul></li>


			<!--  Loan Management -->
			<li id="Loan_Management" class="nav-item"><a
				class="nav-link collapsed" href="#loan-section"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-cash-coin text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Loan Management</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="loan-section" class="nav-content collapse">
					<li id="Loan_Scheme_Catalog"><a href="loanSchemeCatalog">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Loan Scheme Catalog</span>
					</a></li>

					<li id="EMI_Loan_Calculator"><a href="emiLoanCalculator">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">EMI Loan Calculator</span>
					</a></li>

					<li id="New_Loan_Application"><a href="newLoanApplication">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">New Loan Application</span>
					</a></li>

					<li id="Loan_Approval"><a href="loanApprovalLoanManagement">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Loan Approval</span>
					</a></li>

					<li id="Loan_Payment"><a href="loanPaymentLoanManagement">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Loan Payment</span>
					</a></li>

					<li id="Regular_Installment_Payment"><a
						href="regularEmiRePaymentLoanManagement"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Regular Installment Payment</span>
					</a></li>

					<li id="Irregular_Installment_Payment"><a
						href="irrregularEmiRePaymentLoanManagement"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Irregular Installment Payment</span>
					</a></li>

					<li id="Regular_Loan_Statement"><a
						href="regularLoanStatementLoanManagement"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Regular Loan Statement</span>
					</a></li>

					<li id="Irregular-Loan_Statement"><a
						href="irregularLoanStatementLoanManagement"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Irregular Loan Statement</span>
					</a></li>

					<li id="Generate_Loan_Documents"><a
						href="loanDocumentPrintLoanManagement"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Generate Loan Documents</span>
					</a></li>

					<li id="Early_Loan_Closure"><a href="earlyLoanClosureLoan">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Early Loan Closure</span>
					</a></li>

					<li id="Settled_Loan_Records"><a href="settleLoanRecords">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Settled Loan	Records</span>
					</a></li>

					<li id="Generate_NOC_Certificate"><a
						href="generateNOCCertificateLoanManagement"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Generate NOC ertificate</span>
					</a></li>

					<li id="Search_Loan_Accounts"><a href="searchLoanAccounts">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Search Loan Accounts</span>
					</a></li>

				</ul></li>

			<!--  Secured Gold Loan  -->
			<li id="Secured_Gold_Loan" class="nav-item"><a
				class="nav-link collapsed" href="#Goldloan-section"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-coin text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Secured Gold
							Loan</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="Goldloan-section" class="nav-content collapse">

					<!-- <li><a href="goldSecurePlan"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Gold
								Secure Plan</span>
					</a></li> -->

					<li id="Gold_Directory"><a href="goldDirectory"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Gold Directory</span>
					</a></li>

					<li id="Apply_For_Gold"><a href="applyforGold"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Apply For Gold</span>
					</a></li>

					<li id="Apply_Loan_Approval"><a href="goldLoanApproval"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Gold Loan
								Approval</span>
					</a></li>

					<li id="Gold_Loan_Payment"><a href="goldLoanPayment"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Gold Loan
								Payment</span>
					</a></li>

					<li id="EMI_Installment_Payment"><a
						href="emiInstallmentPayment"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">EMI Installment
								Payment</span>
					</a></li>


					<li id="EmI_Statement<"><a href="emiStatement"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">EmI Statement</span>

					<li><a href="goldLoanDocument"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Gold Loan Document</span>

					</a></li>





					<li id="Gold_Loan_Statement<"><a href="goldLoanStatement">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Gold Loan
								Statement</span>
					</a></li>


					<li id="Gold_Loan_Closure"><a href="goldLoanClosure"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Gold Loan
								Closure</span>
					</a></li>




					<li id="Print_NOC<"><a href="printNOC"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Print NOC</span>
					</a></li>


					<li id="Search_Gold_Loan<"><a href="searchGoldLoan"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Search Gold
								Loan</span>

					<li><a href="GoldLoanSearch"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Search
								Gold Loan</span>

					</a></li>


				</ul></li>



			<!-- Joint Liability Loan -->
			<li id="Joint_Liability_Loan" class="nav-item"><a
				class="nav-link collapsed" href="#group-loan-section"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-person-bounding-box text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Joint Liability
							Loan</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="group-loan-section" class="nav-content collapse">
					<li id="Create_Lending_Group"><a href="createLendingGroup">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Create Lending
								Group</span>
					</a></li>

					<li id="Group_Directory"><a href="groupDirectory"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Group Directory</span>
					</a></li>

					<li id="Apply_For_Group_Loan"><a href="applyForGroupLoan">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Apply For Group
								Loan</span>
					</a></li>

					<li id="Loan_Approval"><a href="loanApproval"> <i
							class="bi bi-circle"></i> \ <span
							style="font-family: 'Poppins', sans-serif">Loan Approval</span>
					</a></li>

					<li id="Group_Loan_Payment"><a href="applyForGroupLoan"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Group Loan
								Payment</span>
					</a></li>

					<li id="Installment_Re-payment"><a href="installmentRepayment">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Installment
								Re-payment</span>
					</a></li>

					<li id="Statement_of_Account"><a href="statementOfAccount">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Statement of
								Account</span>
					</a></li>

					<li id="Early_Loan_Closure"><a href="earlyLoanClosure"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Early Loan
								Closure</span>
					</a></li>

					<li id="Completed_Loans_Record"><a href="completedLoansRecord">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Completed Loans
								Record</span>
					</a></li>

					<li id="Find_Loan_Record"><a href="findLoanRecord"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Find Loan
								Record</span>
					</a></li>


				</ul></li>


			<!-- Request Approvals -->
			<li id="Request_Approvals" class="nav-item"><a
				class="nav-link collapsed" href="#approval-section"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-check-circle text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Request
							Approvals</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="approval-section" class="nav-content collapse">
					<li id="Approve_New_Client_Request"><a
						href="approveNewCustomer"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Approve New
								Client Request</span>
					</a></li>

					<li id="Approve_Share_Transactions"><a href="approveShare">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Approve Share
								Transactions</span>
					</a></li>

					<li id="Approve_Finance_Onboarding"><a href="approveFinance">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Approve Finance
								Onboarding</span>
					</a></li>

					<li id="Approve_Policy"><a href="approvePolicy"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Approve Policy</span>
					</a></li>

					<li id="Approve_RD"><a href="approveRD"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Approve RD</span>
					</a></li>

					<li id="Approve_FD"><a href="approveFD"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Approve FD</span>
					</a></li>

					<li id="Approve_DD"><a href="approveDD"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Approve DD</span>
					</a></li>

					<li id="Approve_Saving_Transactions"><a href="approveSaving">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Approve Saving
								Transactions</span>
					</a></li>

					<li id="Approve_Savings_Account_Transfers"><a
						href="approveSavingAccount"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Approve Savings
								Account Transfers</span>
					</a></li>

					<li id="Approve_Regular_EMI_Payments"><a
						href="approveRegularEMI"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Approve Regular
								EMI Payments</span>
					</a></li>

					<li id="Approve_Irregular_EMI_Payments"><a
						href="approveIrregularEMI"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Approve
								Irregular EMI Payments</span>
					</a></li>

					<li id="Approve_Manual_Payment_Entries"><a
						href="approveManualPayment"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Approve Manual
								Payment Entries</span>
					</a></li>

					<li id="Approve_Maturity_Applications"><a
						href="approveMaturityApp"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Approve
								Maturity Applications</span>
					</a></li>

					<li id="Delete_Maturity_Application_Request"><a
						href="deleteMaturityApp"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Delete Maturity
								Application Request</span>
					</a></li>

					<li id="Approve_Inter_Branch_Cash_Transfer"><a
						href="approveInterBranchCashTransfer"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Approve
								Inter Branch Cash Transfer</span>
					</a></li>

				</ul></li>


			<!--  Data Rectification -->
			<li id="Data_Correction" class="nav-item"><a
				class="nav-link collapsed" href="#rectification-section"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-pencil-square text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Data Correction</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="rectification-section" class="nav-content collapse">
					<li id="Customer_Data_Update"><a href="customerDataUpdate">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Customer Data
								Update</span>
					</a></li>

					<li id="Shareholding_Adjustment"><a
						href="shareholdingAdjustment"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Shareholding
								Adjustment</span>
					</a></li>

					<li id="Financial_Entry_Correction"><a
						href="financialEntryCorrection"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Financial
								Entry Correction</span>
					</a></li>

					<li id="Policy_Details_Update"><a href="policyDetailsUpdate">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Policy Details
								Update</span>
					</a></li>

					<li id="Renewal_Data_Correction"><a
						href="renewalDataCorrection"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Renewal Data
								Correction</span>
					</a></li>

					<li id="Daily_Renewal_Update"><a href="dailyRenewalUpdate">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Daily Renewal
								Update</span>
					</a></li>

					<li id="Flexible_Transaction_Removal"><a
						href="flexibleTransactionRemoval"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Flexible
								Transaction Removal</span>
					</a></li>

					<li id="Savings_Account_Correction"><a
						href="savingsAccountCorrection"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Savings
								Account Correction</span>
					</a></li>

					<li id="Savings_Transaction_Removal"><a
						href="savingsTransactionRemoval"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Savings
								Transaction Removal</span>
					</a></li>

					<li id="Loan_Account_Correction"><a
						href="loanAccountCorrection"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Loan Account
								Correction</span>
					</a></li>

					<li id="Joint_Liability_Update"><a href="groupLoanDataUpdate">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Joint Liability
								Update</span>
					</a></li>

				</ul></li>


			<!-- Maturity Management -->
			<li id="Maturity_Management" class="nav-item"><a
				class="nav-link collapsed" href="#maturity-section"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-calendar-check text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Maturity
							Management</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="maturity-section" class="nav-content collapse">
					<li id="Maturity_Scheme_Master"><a href="maturitySchemeMaster">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Maturity Scheme
								Master</span>
					</a></li>

					<li id="Apply_For_Maturity"><a href="applyForMaturity"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Apply For
								Maturity</span>
					</a></li>

					<li id="Maturity_Application_Status"><a
						href="maturityApplicationStatus"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Maturity
								Application Status</span>
					</a></li>

					<li id="Full_Maturity_Payment"><a href="fullMaturityPayment">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Full Maturity
								Payment</span>
					</a></li>

					<li id="Full_Payment_Status"><a href="fullPaymentStatus">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Full Payment
								Status</span>
					</a></li>


					<li id="Partial_Maturity_Payment"><a
						href="partialMaturityPayment"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Partial
								Maturity Payment</span>
					</a></li>

					<li id="Partial_Payment_Status"><a
						href="partialPaymentStatusMaturityApplication"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Partial Payment
								Status</span>
					</a></li>


					<li id="Approved_Status"><a
						href="approvedStatusMaturityManagement"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Approved Status</span>
					</a></li>


				</ul></li>


			<!--  Incentive Management -->
			<li id="Incentive_Management" class="nav-item"><a
				class="nav-link collapsed" href="#incentive-section"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-award text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Incentive
							Management</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="incentive-section" class="nav-content collapse">
					<li id="Incentive_Scheme_Master"><a
						href="incentiveSchemeMaster"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Incentive
								Scheme Master</span>
					</a></li>

					<li id="Generate_Incentive_Payments"><a
						href="generateIncentivePayments"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Generate
								Incentive Payments</span>
					</a></li>

					<li id="Incentive_Payment_Details"><a
						href="incentivePaymentDetails"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Incentive
								Payment Details</span>
					</a></li>

					<li id="Incentive_Summary_Report"><a
						href="incentiveSummaryReport"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Incentive
								Summary Report</span>
					</a></li>

				</ul></li>


			<!-- Financial Consultant -->
			<li id="Financial_Consultant" class="nav-item"><a
				class="nav-link collapsed" href="#collector-advisor"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-briefcase text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Financial
							Consultant</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="collector-advisor" class="nav-content collapse">
					<li id="Add_Financial_Consultant"><a
						href="addFinancialConsultant"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Add Financial
								Consultant</span>
					</a></li>

					<li id="Financial_Consultant_Hierarchy"><a
						href="financialConsultantHierarchy"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Financial
								Consultant Hierarchy</span>
					</a></li>

					<li id="Consultant_Downline_View"><a
						href="consultantDownlineView"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Consultant
								Downline View</span>
					</a></li>

					<li id="Consultant_Promotion_Management"><a
						href="consultantPromotionManagement"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Consultant
								Promotion Management</span>
					</a></li>

					<li id="Consultant_ID_Card_Generator"><a
						href="consultantIDCardGenerator"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Consultant
								ID Card Generator</span>
					</a></li>

				</ul></li>


			<!-- Team Management -->
			<li id="Team_Management" class="nav-item"><a
				class="nav-link collapsed" href="#employee-section"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-person-workspace text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Team Management</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="employee-section" class="nav-content collapse">
					<li id="Manage_Designations"><a href="manageDesignations">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Manage
								Designations</span>
					</a></li>

					<li id="Add_Team_Member"><a href="addTeamMember"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Add Team Member</span>
					</a></li>

					<li id="Generate_Team_Member_ID_Card"><a
						href="generateTeamMemberIDCard"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Generate
								Team Member ID Card</span>
					</a></li>

					<li id="Search_Team_Member"><a href="searchTeamMember"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Search Team
								Member</span>
					</a></li>

				</ul></li>


			<!--  Reports & Analytics -->
			<li id="Reports_and_Analytics" class="nav-item"><a
				class="nav-link collapsed" href="#report-section"
				data-toggle="collapse">
					<div class="d-flex">
						<i class="bi bi-file-earmark-text text-white"></i> <span
							style="font-family: 'Poppins', sans-serif">Reports and Analytics</span>
					</div> <i class="bi bi-chevron-down"></i>
			</a>

				<ul id="report-section" class="nav-content collapse">
					<li id="Investment_Transaction_Report"><a
						href="investmentTransactionReport"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Investment Transaction Report</span>
					</a></li>

					<li id="Investment_Summary_Statement"><a
						href="investmentSummaryStatement"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Investment	Summary Statement</span>
					</a></li>

					<li id="Financial_Consultant_Report"><a
						href="financialAdvisorReport"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Financial Consultant Report</span>
					</a></li>

					<li id="Financial_Consultant_Team_Collection_Summary"><a
						href="financialConsultantTeamCollectionReport"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Financial Consultant Team Collection Summary</span>
					</a></li>

					<li id="Cheque_Transaction_Report"><a
						href="chequeTransactionReport"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">cheque Transaction Report</span>
					</a></li>

					<li id="Incentive_Payment_Summary"><a
						href="incentivePaymentSummary"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Incentive Payment Summary</span>
					</a></li>

					<li id="Recurring_Installment_Due_Report"><a
						href="recurringInstallmentDueReport"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Recurring Installment Due Report</span>
					</a></li>

					<li id="Unapproved_Loan_Applications"><a
						href="unApprovedLoanApplications"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Unapproved Loan Applications</span>
					</a></li>

					<li id="Loan_Report"><a href="approvedLoanReport"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Loan Report</span>
					</a></li>
					
                     <li id="Loan_Payment_Report"><a
                        href="loanRePaymentReport"><i class="bi bi-circle"></i><span 
                            style="font-family: 'Poppins', sans-serif">Loan Payment Report</span>
                     </a></li>


					<li id="Upcoming_EMI_Due_Report"><a
						href="upcomingEMIDueReport"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Upcoming EMI	Due Report</span>
					</a></li>

					<li id="Overdue_Repayment_Analysis"><a
						href="overdueRepaymentAnalysis"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Overdue Repayment Analysis</span>
					</a></li>

					<li id="Loan_Installment_Pending_Report"><a
						href="loanInstallmentPendingReport"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Loan Installment Pending Report</span>
					</a></li>

					<li id="EMI_Collection_Summary"><a href="emiCollectionSummary"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">EMI Collection Summary</span>
					</a></li>

					<li id="EMI_Irregularity_Statement"><a href="emiIrregularityStatement"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">EMI Irregularity Statement</span>
					</a></li>

					<li id="Loan_Confirmation_Document"><a
						href="loanConfirmationDocument"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Loan Confirmation Document</span>
					</a></li>

					<li id="Gold_Loan_Document"><a href="loanConfirmationDocument"> <i
							class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Gold Loan Document</span>
					</a></li>

					<li id="Joint_Liability_Document"><a
						href="loanConfirmationDocument"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Joint Liability Document</span>
					</a></li>

					<li id="Maturity_Status_Report"><a href="maturityStatusReport">
							<i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Maturity Status Report</span>
					</a></li>

					<li id="Investment_Projection_Report"><a
						href="investmentProjectionReport"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Investment	Projection Report</span>
					</a></li>

					<li id="Maturity_Obligation_Report"><a
						href="maturityObligationReport"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Maturity Obligation Report</span>
					</a></li>

					<li id="Tax_Deducted_at_Source_Summary"><a
						href="taxDeductedAtSourceSummary"> <i class="bi bi-circle"></i>
							<span style="font-family: 'Poppins', sans-serif">Tax Deducted at Source Summary</span>
					</a></li>

					<li id="Policy_Performance_Report"><a
						href="policyPerformanceReport"> <i class="bi bi-circle"></i> <span
							style="font-family: 'Poppins', sans-serif">Policy Performance Report</span>
					</a></li>

				</ul></li>



			<!-- <li class="nav-item">
        <p class="text-white">Developed by Infosai Software</p>
      </li> -->
		</ul>
	</aside>

	<script src="./js/adminscript.js"></script>
	<script src="./js/login.js"></script>
</body>
</html>