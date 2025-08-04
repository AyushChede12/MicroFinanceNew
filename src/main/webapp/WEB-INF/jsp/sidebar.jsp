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

    <ul class="sidebar-nav" id="sidebar-nav">
      <li class="nav-item">
        <a href="openDashboard" class="nav-link" style="display: block">
          <i class="bi bi-house-door" style="color: rgb(255, 255, 255);"></i>
          <span style="font-family: 'Poppins', sans-serif">Dashboard</span>
        </a>
      </li>
      
      
      <!-- Preferences -->
      							
       <li class="nav-item">
        <a class="nav-link collapsed" href="#member-section" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-gear text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Preferences</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="member-section" class="nav-content collapse">
          <li>
            <a href="companyAdministration">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Company Administration</span>
            </a>
          </li>

          <li>
            <a href="financialYear">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Financial Year</span>
            </a>
          </li>
          
          <li>
            <a href="createBranch">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Create Branch</span>
            </a>
          </li>
          
          <li>
            <a href="bankModule">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Bank Module</span>
            </a>
          </li>
          
          <li>
            <a href="relativeModule">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Relative Module</span>
            </a>
          </li>
          
          <li>
            <a href="casteModule">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Caste Module</span>
            </a>
          </li>
          
          <li>
            <a href="categoryModule">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Category Module</span>
            </a>
          </li>
          
          <li>
            <a href="codeModule">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Code Module</span>
            </a>
          </li>
          
          <li>
            <a href="executivePromoter">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Executive/Founder</span>
            </a>
          </li>
          
          <li>
            <a href="customerCreation">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Customer Creation</span>
            </a>
          </li>
          
          <li>
            <a href="customerMenuAccess">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Customer Menu Access</span>
            </a>
          </li>
          
          <li>
            <a href="customerBalanceReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Customer Balance Report</span>
            </a>
          </li>
          
          <li>
            <a href="lockerManagement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Locker Management</span>
            </a>
          </li>
        </ul>
      </li>


	<!-- Customer Management -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="#customer-management" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-people-fill text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Customer Management</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="customer-management" class="nav-content collapse">
          <li>
            <a href="addCustomer">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Add Customer</span>
            </a>
          </li>

          <li>
            <a href="addCustomerKYC">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Add Customer KYC</span>
            </a>
          </li>
          
          <li>
            <a href="customerSummary">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Customer Summary</span>
            </a>
          </li>
          
          <li>
            <a href="customerReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Customer Report</span>
            </a>
          </li>
          
          <li>
            <a href="searchCustomer">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Search Customer</span>
            </a>
          </li>
        </ul>
      </li>


	<!-- Customer Shareholding -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#member-share" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-building-fill-down text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Customer Shareholding</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="member-share" class="nav-content collapse">
          <li>
            <a href="transferShares">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Transfer Shares</span>
            </a>
          </li>

          <li>
            <a href="unallotedShares">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Unallotted Shares</span>
            </a>
          </li>
          
          <li>
            <a href="generateShareCertificate">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Generate Share Certificate</span>
            </a>
          </li>
          
          <li>
            <a href="regenerateDNO">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Regenerate DNO</span>
            </a>
          </li>
          
        </ul>
      </li>
      
      
      <!-- Account Management -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#account-section" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-wallet2 text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Account Management</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="account-section" class="nav-content collapse">
          <li>
            <a href="ledgerAccountMaster">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Ledger Account Master</span>
            </a>
          </li>

          <li>
            <a href="outgoingPaymentEntry">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Outgoing Payment Entry</span>
            </a>
          </li>
          
          <li>
            <a href="incomingReceiptEntry">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Incoming Receipt Entry</span>
            </a>
          </li>
          
          <li>
            <a href="bankCashTransferEntry">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Bank/Cash Transfer Entry</span>
            </a>
          </li>
          
          <li>
            <a href="manualJournalEntry">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Manual Journal Entry</span>
            </a>
          </li>
          
          <li>
            <a href="incentivePayment">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Incentive Payment</span>
            </a>
          </li>
          
          <li>
            <a href="misInterestPaymentAccountSection">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">MIS Interest Payment</span>
            </a>
          </li>
          
          <li>
            <a href="chequeClearingProcessing">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Cheque Clearance Processing</span>
            </a>
          </li>
          
          <li>
            <a href="mandateDepositToBank">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Mandate Deposit To Bank</span>
            </a>
          </li>
          
          <li>
            <a href="bankStatement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Bank Statement</span>
            </a>
          </li>
          
          <li>
            <a href="cashBook">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Cash Book</span>
            </a>
          </li>
          
          <li>
            <a href="fundstransferRegister">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Funds Transfer Register</span>
            </a>
          </li>  
          
          <li>
            <a href="dailyTransactionBook">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Daily Transaction Book</span>
            </a>
          </li> 
          
          <li>
            <a href="ledgerSummaryReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Ledger Summary Report</span>
            </a>
          </li>      
          
          <li>
            <a href="journalEntryReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Journal Entry Report</span>
            </a>
          </li> 
          
          <li>
            <a href="trailBalanceReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Trial Balance Report</span>
            </a>
          </li> 
          
          <li>
            <a href="pLStatement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">P&L Statement</span>
            </a>
          </li> 
          
          <li>
            <a href="balanceSheet">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Balance Sheet</span>
            </a>
          </li> 
          
          <li>
            <a href="interbranchCashTransfer">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Inter-Branch Cash Transfer</span>
            </a>
          </li> 
          
        </ul>
      </li>
      
      
     <!--  Customer Savings -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#saving-account" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-bank text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Customer Savings</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="saving-account" class="nav-content collapse">
          <li>
            <a href="savingsSchemaCatalog">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Savings Scheme Catalog</span>
            </a>
          </li>

          <li>
            <a href="createSavingsAccount">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Create Savings Account</span>
            </a>
          </li>
          
          <!-- <li>
            <a href="createCurrentAccount">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Create Current Account</span>
            </a>
          </li> -->
          
          <li>
            <a href="savingsAccountActivity">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Savings Account Activity</span>
            </a>
          </li>
          
          <li>
            <a href="savingsAccountFundTransfer">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Savings Account Fund Transfer</span>
            </a>
          </li>
          
          <li>
            <a href="savingAccountInterestTransfer">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Savings Account Interest Transfer</span>
            </a>
          </li>
          
          <li>
            <a href="savingsRecordBook">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Savings Record Book</span>
            </a>
          </li>
          
          <!-- <li>
            <a href="currentAccountRecordBook">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Current Account Record Book</span>
            </a>
          </li> -->
          
          <li>
            <a href="savingsAccountStatement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Customer Savings Statement</span>
            </a>
          </li>
          
          <li>
            <a href="savingsAccountCloser">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Saving Account Closer</span>
            </a>
          </li>
          
          <li>
            <a href="savingsAccountInquiry">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Savings Account Inquiry</span>
            </a>
          </li>
          
          <li>
            <a href="smsServiceFee">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">SMS Service Fee</span>
            </a>
          </li>
          
          <li>
            <a href="accountMaintenanceCharges">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Account Maintenance Charges</span>
            </a>
          </li>
          
        </ul>
      </li>
      
      
      <!-- Policy Management -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#investment-section" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-piggy-bank text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Policy Management</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="investment-section" class="nav-content collapse">
          <li>
            <a href="planManagement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Plan Management</span>
            </a>
          </li>

          <li>
            <a href="addNewInvestment">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Add New Investment</span>
            </a>
          </li>
          
          <li>
            <a href="policyRenewalFee">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Policy Renewal Fee</span>
            </a>
          </li>
          
          <li>
            <a href="dailyPremiumRenewal">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Daily premium Renewal</span>
            </a>
          </li>
          
          <li>
            <a href="flexiblePremiumRenewal">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Flexible Premium Renewal</span>
            </a>
          </li>
          
          <li>
            <a href="installmentRecordBook">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Installment Record Book</span>
            </a>
          </li>
          
          <li>
            <a href="InvestmentTransactionSlip">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Investment Transaction Slip</span>
            </a>
          </li>
          
          <li>
            <a href="recurringPaymentReceipt">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Recurring Payment Receipt</span>
            </a>
          </li>
          
          <li>
            <a href="issueCertificate">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Issue Certificate</span>
            </a>
          </li>
          
          <li>
            <a href="reissueCertificate">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">ReIssue Certificate</span>
            </a>
          </li>
          
          <li>
            <a href="interestDetails">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Interest Details</span>
            </a>
          </li>
          
          <li>
            <a href="interestPayable">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Interest Payable</span>
            </a>
          </li>
          
          <li>
            <a href="investmentDataSearch">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Investment Data Search</span>
            </a>
          </li>
          
        </ul>
      </li>
      
      
     <!--  Loan Management -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#loan-section" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-cash-coin text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Loan Management</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="loan-section" class="nav-content collapse">
          <li>
            <a href="loanSchemeCatalog">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Loan Scheme Catalog</span>
            </a>
          </li>

          <li>
            <a href="emiLoanCalculator">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">EMI & Loan Calculator</span>
            </a>
          </li>
          
          <li>
            <a href="newLoanApplication">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">New Loan Application</span>
            </a>
          </li>
          
          <li>
            <a href="loanApprovalLoanManagement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Loan Approval</span>
            </a>
          </li>
          
          <li>
            <a href="loanPaymentLoanManagement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Loan Payment</span>
            </a>
          </li>
          
          <li>
            <a href="regularEmiRePaymentLoanManagement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Regular Installment Payment</span>
            </a>
          </li>
          
          <li>
            <a href="irrregularEmiRePaymentLoanManagement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Irregular Installment Payment</span>
            </a>
          </li>
          
          <li>
            <a href="regularLoanStatementLoanManagement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Regular Loan Statement</span>
            </a>
          </li>
          
          <li>
            <a href="irregularLoanStatementLoanManagement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Irregular Loan Statement</span>
            </a>
          </li>
          
          <li>
            <a href="model">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Generate Loan Documents</span>
            </a>
          </li>
          
          <li>
            <a href="earlyLoanClosure">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Early Loan Closure</span>
            </a>
          </li>
          
          <li>
            <a href="settleLoanRecords">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Settled Loan Records</span>
            </a>
          </li>
          
          <li>
            <a href="generateNOCCertificateLoanManagement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Generate NOC Certificate</span>
            </a>
          </li>
          
          <li>
            <a href="searchLoanAccounts">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Search Loan Accounts</span>
            </a>
          </li>
          
        </ul>
      </li>
      
      
      <!-- Joint Liability Loan -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#group-loan-section" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-person-bounding-box text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Joint Liability Loan</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="group-loan-section" class="nav-content collapse">
          <li>
            <a href="createLendingGroup">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Create Lending Group</span>
            </a>
          </li>

          <li>
            <a href="groupDirectory">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Group Directory</span>
            </a>
          </li>
          
          <li>
            <a href="applyForGroupLoan">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Apply For Group Loan</span>
            </a>
          </li>
          
          <li>
            <a href="loanApproval">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Loan Approval</span>
            </a>
          </li>
          
          <li>
            <a href="loanRepaymentPortal">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Loan Repayment Portal</span>
            </a>
          </li>
          
          <li>
            <a href="installmentRepayment">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Installment Re-payment</span>
            </a>
          </li>
          
          <li>
            <a href="statementOfAccount">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Statement of Account</span>
            </a>
          </li>
          
          <li>
            <a href="earlyLoanClosure">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Early Loan Closure</span>
            </a>
          </li>
          
          <li>
            <a href="completedLoansRecord">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Completed Loans Record</span>
            </a>
          </li>
          
          <li>
            <a href="findLoanRecord">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Find Loan Record</span>
            </a>
          </li>
          
        </ul>
      </li>
      
      
      <!-- Request Approvals -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#approval-section" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-check-circle text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Request Approvals</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="approval-section" class="nav-content collapse">
          <li>
            <a href="approveNewCustomer">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve New Client Request</span>
            </a>
          </li>

          <li>
            <a href="approveShare">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve Share Transactions</span>
            </a>
          </li>
          
          <li>
            <a href="approveFinance">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve Finance Onboarding</span>
            </a>
          </li>
          
          <li>
            <a href="approvePolicy">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve Policy</span>
            </a>
          </li>
          
           <li>
            <a href="approveRD">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve RD</span>
            </a>
          </li>
          
           <li>
            <a href="approveFD">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve FD</span>
            </a>
          </li>
          
           <li>
            <a href="approveDD">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve DD</span>
            </a>
          </li>
          
          <li>
            <a href="approveRecurring">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve Recurring Deposits</span>
            </a>
          </li>
          
          <li>
            <a href="approveSaving">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve Saving Transactions</span>
            </a>
          </li>
          
          <li>
            <a href="approveSavingAccount">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve Savings Account Transfers</span>
            </a>
          </li>
          
          <li>
            <a href="approveRegularEMI">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve Regular EMI Payments</span>
            </a>
          </li>
          
          <li>
            <a href="approveIrregularEMI">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve Irregular EMI Payments</span>
            </a>
          </li>
          
          <li>
            <a href="approveManualPayment">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve Manual Payment Entries</span>
            </a>
          </li>
          
          <li>
            <a href="approveMaturityApp">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve Maturity Applications</span>
            </a>
          </li>
          
          <li>
            <a href="deleteMaturityApp">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Delete Maturity Application Request</span>
            </a>
          </li>
          
          <li>
            <a href="approveInterBranchCashTransfer">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approve Inter-Branch Cash Transfer</span>
            </a>
          </li>
          
        </ul>
      </li>
      
      
     <!--  Data Rectification -->
       <li class="nav-item">
        <a class="nav-link collapsed" href="#rectification-section" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-pencil-square text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Data Correction</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="rectification-section" class="nav-content collapse">
          <li>
            <a href="customerDataUpdate">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Customer Data Update</span>
            </a>
          </li>

          <li>
            <a href="shareholdingAdjustment">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Shareholding Adjustment</span>
            </a>
          </li>
          
          <li>
            <a href="financialEntryCorrection">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Financial Entry Correction</span>
            </a>
          </li>
          
          <li>
            <a href="policyDetailsUpdate">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Policy Details Update</span>
            </a>
          </li>
          
          <li>
            <a href="renewalDataCorrection">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Renewal Data Correction</span>
            </a>
          </li>
          
          <li>
            <a href="dailyRenewalUpdate">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Daily Renewal Update</span>
            </a>
          </li>
          
          <li>
            <a href="flexibleTransactionRemoval">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Flexible Transaction Removal</span>
            </a>
          </li>
          
          <li>
            <a href="savingsAccountCorrection">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Savings Account Correction</span>
            </a>
          </li>
          
          <li>
            <a href="savingsTransactionRemoval">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Savings Transaction Removal</span>
            </a>
          </li>
          
          <li>
            <a href="loanAccountCorrection">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Loan Account Correction</span>
            </a>
          </li>
          
          <li>
            <a href="groupLoanDataUpdate">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Joint Liability Update</span>
            </a>
          </li>       
          
        </ul>
      </li>
      
      
      <!-- Maturity Management -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#maturity-section" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-calendar-check text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Maturity Management</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="maturity-section" class="nav-content collapse">
          <li>
            <a href="maturitySchemeMaster">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Maturity Scheme Master</span>
            </a>
          </li>

          <li>
            <a href="applyForMaturity">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Apply For Maturity</span>
            </a>
          </li>
          
          <li>
            <a href="maturityApplicationStatus">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Maturity Application Status</span>
            </a>
          </li>
          
          <li>
            <a href="fullMaturityPayment">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Full Maturity Payment</span>
            </a>
          </li>
          
           <li>
            <a href="fullPaymentStatus">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Full Payment Status</span>
            </a>
          </li>
          
          
          <li>
            <a href="partialMaturityPayment">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Partial Maturity Payment</span>
            </a>
          </li>
          
           <li>
            <a href="partialPaymentStatusMaturityApplication">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Partial Payment Status</span>
            </a>
          </li>
          
          
          <li>
            <a href="approvedStatusMaturityManagement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approved Status</span>
            </a>
          </li>
          
         
         
          <li>
            <a href="maturityReceiptPrint">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Print Maturity Receipt</span>
            </a>
          </li>
          
        </ul>
      </li>
      
      
     <!--  Incentive Management -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#incentive-section" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-award text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Incentive Management</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="incentive-section" class="nav-content collapse">
          <li>
            <a href="incentiveSchemeMaster">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Incentive Scheme Master</span>
            </a>
          </li>

          <li>
            <a href="generateIncentivePayments">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Generate Incentive Payments</span>
            </a>
          </li>
          
          <li>
            <a href="incentivePaymentDetails">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Incentive Payment Details</span>
            </a>
          </li>
          
          <li>
            <a href="incentiveSummaryReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Incentive Summary Report</span>
            </a>
          </li>
          
        </ul>
      </li>


		<!-- Financial Consultant -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#collector-advisor" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-briefcase text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Financial Consultant</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="collector-advisor" class="nav-content collapse">
          <li>
            <a href="addFinancialConsultant">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Add Financial Consultant</span>
            </a>
          </li>

          <li>
            <a href="financialConsultantHierarchy">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Financial Consultant Hierarchy</span>
            </a>
          </li>
          
          <li>
            <a href="consultantDownlineView">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Consultant Downline View</span>
            </a>
          </li>
          
          <li>
            <a href="consultantPromotionManagement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Consultant Promotion Management</span>
            </a>
          </li>
          
          <li>
            <a href="consultantIDCardGenerator">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Consultant ID Card Generator</span>
            </a>
          </li>
          
        </ul>
      </li>


		<!-- Team Management -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#employee-section" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-person-workspace text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Team Management</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="employee-section" class="nav-content collapse">
          <li>
            <a href="manageDesignations">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Manage Designations</span>
            </a>
          </li>

          <li>
            <a href="manageDepartments">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Manage Departments</span>
            </a>
          </li>
          
          <li>
            <a href="addTeamMember">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Add Team Member</span>
            </a>
          </li>
          
          <li>
            <a href="generateTeamMemberIDCard">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Generate Team Member ID Card</span>
            </a>
          </li>
          
          <li>
            <a href="searchTeamMember">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Search Team Member</span>
            </a>
          </li>
          
        </ul>
      </li> 
         
         
        <!--  Reports & Analytics -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#report-section" data-toggle="collapse">
          <div class="d-flex">
            <i class="bi bi-file-earmark-text text-white"></i>
            <span style="font-family: 'Poppins', sans-serif">Reports & Analytics</span>
          </div>
          <i class="bi bi-chevron-down"></i>
        </a>

        <ul id="report-section" class="nav-content collapse">
          <li>
            <a href="investmentTransactionReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Investment Transaction Report</span>
            </a>
          </li>

          <li>
            <a href="investmentSummaryStatement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Investment Summary Statement</span>
            </a>
          </li>
          
          <li>
            <a href="financialAdvisorReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Financial Advisor Report</span>
            </a>
          </li>
          
          <li>
            <a href="financialConsultantTeamCollectionReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Financial Consultant Team Collection Summary</span>
            </a>
          </li>
          
          <li>
            <a href="chequeTransactionReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Cheque Transaction Report</span>
            </a>
          </li>
          
          <li>
            <a href="incentivePaymentSummary">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Incentive Payment Summary</span>
            </a>
          </li>
          
          <li>
            <a href="recurringInstallmentDueReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Recurring Installment Due Report</span>
            </a>
          </li>
          
          <li>
            <a href="unApprovedLoanApplications">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Unapproved Loan Applications</span>
            </a>
          </li>
          
          <li>
            <a href="approvedLoanReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Approved Loan Report</span>
            </a>
          </li>
          
          <li>
            <a href="loanRePaymentReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Loan Repayment Report</span>
            </a>
          </li>
          
          <li>
            <a href="upcomingEMIDueReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Upcoming EMI Due Report</span>
            </a>
          </li>
          
          <li>
            <a href="overdueRepaymentAnalysis">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Overdue Repayment Analysis</span>
            </a>
          </li>
          
          <li>
            <a href="loanInstallmentPendingReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Loan Installment Pending Report</span>
            </a>
          </li>
          
          <li>
            <a href="emiCollectionSummary">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">EMI Collection Summary</span>
            </a>
          </li>
          
          <li>
            <a href="emiIrregularityStatement">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">EMI Irregularity Statement</span>
            </a>
          </li>
          
          <li>
            <a href="loanConfirmationDocument">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Loan Confirmation Document</span>
            </a>
          </li>
          
          <li>
            <a href="maturityStatusReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Maturity Status Report</span>
            </a>
          </li>
          
          <li>
            <a href="investmentProjectionReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Investment Projection Report</span>
            </a>
          </li>
          
          <li>
            <a href="maturityObligationReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Maturity Obligation Report</span>
            </a>
          </li>
          
          <li>
            <a href="taxDeductedAtSourceSummary">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Tax Deducted at Source Summary</span>
            </a>
          </li>
          
          <li>
            <a href="policyPerformanceReport">
              <i class="bi bi-circle"></i>
              <span style="font-family: 'Poppins', sans-serif">Policy Performance Report</span>
            </a>
          </li>
          
        </ul>
      </li>
      
      

      <!-- <li class="nav-item">
        <p class="text-white">Developed by Infosai Software</p>
      </li> -->
    </ul>
  </aside>
  <script src="./js/adminscript.js"></script>
</body>
</html>