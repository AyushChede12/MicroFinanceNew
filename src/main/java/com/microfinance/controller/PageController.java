package com.microfinance.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.microfinance.repository.AddInvestmentRepo;
import com.microfinance.repository.CreateLendingGroupRepo;
import com.microfinance.repository.CreateSavingAccountRepo;
import com.microfinance.repository.CustomerRepo;
import com.microfinance.service.TeamManagementService;

import com.microfinance.repository.LoanMangmentSchemeRepo;

import com.microfinance.repository.FinancialConsultantRepo;
import com.microfinance.repository.DailyDepositPMRepo;
import com.microfinance.repository.FixedDepositPMRepo;
import com.microfinance.repository.GroupDirectoryRepo;
import com.microfinance.repository.LoanApplicationRepo;
import com.microfinance.repository.MisDepositePMRepo;
import com.microfinance.repository.RecurringDepositRepo;
import com.microfinance.repository.TransferShareRepo;

@Controller
public class PageController {
	
	@Autowired
	CustomerRepo customerRepo;
	
	@Autowired
	LoanMangmentSchemeRepo loanMangmentSchemeRepo;
	
	@Autowired
	FinancialConsultantRepo financialConsultantRepo;

	@Autowired 
	DailyDepositPMRepo dailyDepositRepo;
	
	@Autowired
	RecurringDepositRepo recurringDepositRepo;
	
	@Autowired
	FixedDepositPMRepo fixedDepositPMRepo;
	
	@Autowired
	MisDepositePMRepo misDepositePMRepo;

	@Autowired 
	TransferShareRepo transferShareRepo;
	
	@Autowired
	CreateSavingAccountRepo createSavingAccountRepo;
	
	@Autowired
	TeamManagementService teamService;
	
	@Autowired
	CreateLendingGroupRepo createLendingGroupRepo;
	
	@Autowired
	GroupDirectoryRepo groupDirectoryRepo;

	@Autowired
	AddInvestmentRepo addInvestmentRepo;

	@Autowired
	LoanApplicationRepo loanApplicationRepo;
	
	@GetMapping("/")
	public String getIndex() {
		return "index";
	}
	
	//Dashboard Cards
	@GetMapping("/openDashboard")
	public String getDashboard() {
		return "dashboardPage/dashboard";
	}

	// Financial Consultant
	@GetMapping("/addFinancialConsultant")
	public String getAddFinancialConsultant(Model model) {
		long maxId = financialConsultantRepo.getMaxId();
		String financialCode = "FC" + "0000" + (maxId + 1);
		model.addAttribute("financialCode", financialCode);
		return "financialConsultant/addFinancialConsultant";
	}

	@GetMapping("/financialConsultantHierarchy")
	public String getFinancialConsultantHierarchy() {
		return "financialConsultant/financialConsultantHierarchy";
	}

	@GetMapping("/consultantDownlineView")
	public String getConsultantDownlineView() {
		return "financialConsultant/consultantDownlineView";
	}

	@GetMapping("/consultantPromotionManagement")
	public String getConsultantPromotionManagement() {
		return "financialConsultant/consultantPromotionManagement";
	}

	@GetMapping("/consultantIDCardGenerator")
	public String getConsultantIDCardGenerator() {
		return "financialConsultant/consultantIDCardGenerator";
	}

	@GetMapping("/updateFinacialConsultant")
	public String financialConsultantUpdate() {
		return "financialConsultant/financialConsultantUpdate";
	}
	
	@GetMapping("/IDCardFinancial")
	public String IDCardFinancial() {
		return "financialConsultant/IDCard";
	}
	
	// Data Rectification
	@GetMapping("/customerDataUpdate")
	public String getCustomerDataUpdate() {
		return "dataCorrection/customerDataUpdate";
	}

	@GetMapping("/shareholdingAdjustment")
	public String getShareholdingAdjustment() {
		return "dataCorrection/shareholdingAdjustment";
	}

	@GetMapping("/financialEntryCorrection")
	public String getFinancialEntryCorrection() {
		return "dataCorrection/financialEntryCorrection";
	}

	@GetMapping("/policyDetailsUpdate")
	public String getPolicyDetailsUpdate() {
		return "dataCorrection/policyDetailsUpdate";
	}

	@GetMapping("/renewalDataCorrection")
	public String getRenewalDataCorrection() {
		return "dataCorrection/renewalDataCorrection";
	}

	@GetMapping("/dailyRenewalUpdate")
	public String getDailyRenewalUpdate() {
		return "dataCorrection/dailyRenewalUpdate";
	}

	@GetMapping("/flexibleTransactionRemoval")
	public String getFlexibleTransactionRemoval() {
		return "dataCorrection/flexibleTransactionRemoval";
	}

	@GetMapping("/savingsAccountCorrection")
	public String getSavingsAccountCorrection() {
		return "dataCorrection/savingsAccountCorrection";
	}

	@GetMapping("/savingsTransactionRemoval")
	public String getSavingsTransactionRemoval() {
		return "dataCorrection/savingsTransactionRemoval";
	}

	@GetMapping("/loanAccountCorrection")
	public String getLoanAccountCorrection() {
		return "dataCorrection/loanAccountCorrection";
	}

	@GetMapping("/groupLoanDataUpdate")
	public String getGroupLoanDataUpdate() {
		return "dataCorrection/groupLoanDataUpdate";
	}

	// Employee Section
	@GetMapping("/manageDesignations")
	public String getManageDesignations() {
		return "teamManagement/manageDesignations";
	}

	@GetMapping("/manageDepartments")
	public String getManageDepartments() {
		return "teamManagement/manageDepartments";
	}

	@GetMapping("/addTeamMember")
	public String getAddTeamMember(Model model) {
		long maxId = teamService.getMaxId();
	    String teamMemberUniqueNo = "TM" + "00" + (maxId + 1);
		model.addAttribute("teamMemberUniqueNo", teamMemberUniqueNo);
		return "teamManagement/addTeamMember";
	}

	@GetMapping("/generateTeamMemberIDCard")
	public String getGenerateTeamMemberIDCard() {
		return "teamManagement/generateTeamMemberIDCard";
	}

	@GetMapping("/searchTeamMember")
	public String getSearchTeamMember() {
		return "teamManagement/searchTeamMember";
	}

	// Report & Analytics
	@GetMapping("/investmentTransactionReport")
	public String getInvestmentTransactionReport() {
		return "reportAndAnalytics/investmentTransactionReport";
	}

	@GetMapping("/investmentSummaryStatement")
	public String getInvestmentSummaryStatement() {
		return "reportAndAnalytics/investmentSummaryStatement";
	}

	@GetMapping("/financialAdvisorReport")
	public String getFinancialAdvisorReport() {
		return "reportAndAnalytics/financialAdvisorReport";
	}

	@GetMapping("/financialConsultantTeamCollectionReport")
	public String getFinancialConsultantTeamCollectionReport() {
		return "reportAndAnalytics/financialConsultantTeamCollectionReport";
	}

	@GetMapping("/chequeTransactionReport")
	public String getChequeTransactionReport() {
		return "reportAndAnalytics/chequeTransactionReport";
	}

	@GetMapping("/incentivePaymentSummary")
	public String getIncentivePaymentSummary() {
		return "reportAndAnalytics/incentivePaymentSummary";
	}

	@GetMapping("/recurringInstallmentDueReport")
	public String getRecurringInstallmentDueReport() {
		return "reportAndAnalytics/recurringInstallmentDueReport";
	}

	@GetMapping("/unApprovedLoanApplications")
	public String getUnApprovedLoanApplications() {
		return "reportAndAnalytics/unApprovedLoanApplications";
	}

	@GetMapping("/approvedLoanReport")
	public String getApprovedLoanReport() {
		return "reportAndAnalytics/approvedLoanReport";
	}

	@GetMapping("/loanRePaymentReport")
	public String getLoanRePaymentReport() {
		return "reportAndAnalytics/loanRePaymentReport";
	}

	@GetMapping("/upcomingEMIDueReport")
	public String getUpcomingEMIDueReport() {
		return "reportAndAnalytics/upcomingEMIDueReport";
	}

	@GetMapping("/overdueRepaymentAnalysis")
	public String getOverdueRepaymentAnalysis() {
		return "reportAndAnalytics/overdueRepaymentAnalysis";
	}

	@GetMapping("/loanInstallmentPendingReport")
	public String getLoanInstallmentPendingReport() {
		return "reportAndAnalytics/loanInstallmentPendingReport";
	}

	@GetMapping("/emiCollectionSummary")
	public String getEmiCollectionSummary() {
		return "reportAndAnalytics/emiCollectionSummary";
	}

	@GetMapping("/emiIrregularityStatement")
	public String getEmiIrregularityStatement() {
		return "reportAndAnalytics/emiIrregularityStatement";
	}

	@GetMapping("/loanConfirmationDocument")
	public String getLoanConfirmationDocument() {
		return "reportAndAnalytics/loanConfirmationDocument";
	}

	@GetMapping("/maturityStatusReport")
	public String getMaturityStatusReport() {
		return "reportAndAnalytics/maturityStatusReport";
	}

	@GetMapping("/investmentProjectionReport")
	public String getInvestmentProjectionReport() {
		return "reportAndAnalytics/investmentProjectionReport";
	}

	@GetMapping("/maturityObligationReport")
	public String getMaturityObligationReport() {
		return "reportAndAnalytics/maturityObligationReport";
	}

	@GetMapping("/taxDeductedAtSourceSummary")
	public String getTaxDeductedAtSourceSummary() {
		return "reportAndAnalytics/taxDeductedAtSourceSummary";
	}

	@GetMapping("/policyPerformanceReport")
	public String getPolicyPerformanceReport() {
		return "reportAndAnalytics/policyPerformanceReport";
	}

	// Joint Liability Loan
	@GetMapping("/createLendingGroup")
	public String getCreateLendingGroup(Model model) {
		long maxIdDD = createLendingGroupRepo.getMaxId();
		String memberCodePI = "PI" + "000" + (maxIdDD + 1);
		model.addAttribute("memberCodePI", memberCodePI);
		return "jointLiabilityLoan/createLendingGroup";
	}

	@GetMapping("/groupDirectory")
	public String getGroupDirectory(Model model) {
		long maxIdGD = groupDirectoryRepo.getMaxId();
		String memberCodeGD = "GD" + "000" + (maxIdGD + 1);
		model.addAttribute("memberCodeGD", memberCodeGD);
		return "jointLiabilityLoan/groupDirectory";
	}

	@GetMapping("/applyForGroupLoan")
	public String getApplyForGroupLoan() {
		return "jointLiabilityLoan/applyForGroupLoan";
	}

	@GetMapping("/loanApproval")
	public String getLoanApproval() {
		return "jointLiabilityLoan/loanApproval";
	}

	@GetMapping("/loanRepaymentPortal")
	public String getLoanRepaymentPortal() {
		return "jointLiabilityLoan/loanRepaymentPortal";
	}

	@GetMapping("/installmentRepayment")
	public String getInstallmentRepayment() {
		return "jointLiabilityLoan/installmentRepayment";
	}

	@GetMapping("/statementOfAccount")
	public String getStatementOfAccount() {
		return "jointLiabilityLoan/statementOfAccount";
	}

	@GetMapping("/earlyLoanClosureJointLiability")
	public String getEarlyLoanClosure() {
		return "jointLiabilityLoan/earlyLoanClosure";
	}
	
	@GetMapping("/completedLoansRecord")
	public String getClosedLoanDetails() {
		return "jointLiabilityLoan/completedLoansRecord";
	}

	@GetMapping("/findLoanRecord")
	public String getFindLoanRecord() {
		return "jointLiabilityLoan/findLoanRecord";
	}

	// Customer ShareHolding
		@GetMapping("/transferShares")
		public String getShareTransfer(Model model) {
			 // ✅ Generate certificate number (demo only)
		    String year = String.valueOf(LocalDate.now().getYear());
		    long count = transferShareRepo.count(); // total rows in DB
		    String certNo = "SCF/MICROFINANCE/" + year + "/" + String.format("%06d", count + 1);
		    // ✅ You can pass this to frontend (JSP or HTML) using model
		    model.addAttribute("generatedCertificateNo", certNo);
			return "customerShareHolding/transferShares";
		}

	@GetMapping("/unallotedShares")
	public String getUnAllotedShare() {
		return "customerShareHolding/unAllotedShares";
	}

	@GetMapping("/generateShareCertificate")
	public String getShareCertificate() {
		return "customerShareHolding/generateShareCertificate";
	}

	@GetMapping("/regenerateDNO")
	public String getDnoReGenerate() {
		return "customerShareHolding/regenerateDNO";
	}

	// Customer Management
	@GetMapping("/addCustomer")
	public String getAddClient(Model model) {
		long maxId = customerRepo.getMaxId();
		String memberCode = "M" + "0000" + (maxId + 1);
		model.addAttribute("memberCode", memberCode);
		return "customerManagement/addCustomer";
	}

	@GetMapping("/addCustomerKYC")
	public String getAddClientKYC() {
		return "customerManagement/addCustomerKYC";
	}

	@GetMapping("/customerSummary")
	public String getClientSummary() {
		return "customerManagement/customerSummary";
	}

	@GetMapping("/customerReport")
	public String getClientReport() {
		return "customerManagement/customerReport";
	}

	@GetMapping("/searchCustomer")
	public String getSearchClient() {
		return "customerManagement/searchCustomer";
	}

	// Approval Section
	@GetMapping("/approveNewCustomer")
	public String getCustomerApproval() {
		return "requestApprovals/approveNewClientRequest";
	}

	@GetMapping("/approveShare")
	public String getShareApproval() {
		return "requestApprovals/approveShareTransactions";
	}

	@GetMapping("/approveFinance")
	public String getFinancialApproval() {
		return "requestApprovals/approveFinanceOnboarding";
	}

	@GetMapping("/approvePolicy")
	public String getPolicyApproval() {
		return "requestApprovals/approvePolicy";
	}
	
	@GetMapping("/approveRD")
	public String getRDApproval() {
		return "requestApprovals/approveRD";
	}

	@GetMapping("/approveFD")
	public String getFDApproval() {
		return "requestApprovals/approveFD";
	}

	@GetMapping("/approveDD")
	public String getDDApproval() {
		return "requestApprovals/approveDD";
	}

	@GetMapping("/approveRecurring")
	public String getRecurringApproval() {
		return "requestApprovals/approveRecurringDeposits";
	}

	@GetMapping("/approveSaving")
	public String getSavingTransactionApproval() {
		return "requestApprovals/approveSavingTransactions";
	}

	@GetMapping("/approveSavingAccount")
	public String getSBTransferApproval() {
		return "requestApprovals/approveSavingAccountTransfer";
	}

	@GetMapping("/approveRegularEMI")
	public String getRegularEMIInApprovalSection() {
		return "requestApprovals/approveRegularEmiPayments";
	}

	@GetMapping("/approveIrregularEMI")
	public String getIrregularEMIInApprovalSection() {
		return "requestApprovals/approveIrregularEmiPayments";
	}

	@GetMapping("/approveManualPayment")
	public String getPaymentEntryApproval() {
		return "requestApprovals/approveManualPaymentEntries";
	}

	@GetMapping("/approveMaturityApp")
	public String getMaturityApplicationApproval() {
		return "requestApprovals/approveMaturityApplications";
	}

	@GetMapping("/deleteMaturityApp")
	public String getMaturityApplicationDelete() {
		return "requestApprovals/deleteMaturityApplicationsRequest";
	}

	@GetMapping("/approveInterBranchCashTransfer")
	public String getBranchCashTransferApproval() {
		return "requestApprovals/approveInterBranchCashTransfer";
	}

	// Account Management
	@GetMapping("/ledgerAccountMaster")
	public String getLedgerMasterAccount() {
		return "accountManagement/ledgerAccountMaster";
	}

	@GetMapping("/outgoingPaymentEntry")
	public String getPaymentEntryAccountSection() {
		return "accountManagement/outgoingPaymentEntry";
	}

	@GetMapping("/incomingReceiptEntry")
	public String getReceiveEntryAccountSection() {
		return "accountManagement/incomingReceiptEntry";
	}

	@GetMapping("/bankCashTransferEntry")
	public String getContraEntryAccountSection() {
		return "accountManagement/bankCashTransferEntry";
	}

	@GetMapping("/manualJournalEntry")
	public String getJournalEntryAccountSection() {
		return "accountManagement/manualJournalEntry";
	}

	@GetMapping("/incentivePayment")
	public String getIncentivePaymentAccountSection() {
		return "accountManagement/incentivePayment";
	}

	@GetMapping("/misInterestPaymentAccountSection")
	public String getmisIntPaymentAccountSection() {
		return "accountManagement/misInterestPayment";
	}

	@GetMapping("/chequeClearingProcessing")
	public String getChequeClearingAccountSection() {
		return "accountManagement/chequeClearingProcessing";
	}

	@GetMapping("/mandateDepositToBank")
	public String getMandateDepositToBank() {
		return "accountManagement/mandateDepositToBank";
	}

	@GetMapping("/bankStatement")
	public String getBankStatementAccountSection() {
		return "accountManagement/bankStatement";
	}

	@GetMapping("/cashBook")
	public String getCashBookAccountSection() {
		return "accountManagement/cashbook";
	}

	@GetMapping("/fundstransferRegister")
	public String getTransferBookAccountSection() {
		return "accountManagement/fundsTransferRegister";
	}

	@GetMapping("/dailyTransactionBook")
	public String getDayBookAccountSection() {
		return "accountManagement/dailyTransactionBook";
	}

	@GetMapping("/ledgerSummaryReport")
	public String getLedgerReportAccountSection() {
		return "accountManagement/ledgerSummaryReport";
	}

	@GetMapping("/journalEntryReport")
	public String getJournalReportAccountSection() {
		return "accountManagement/journalEntryReport";
	}

	@GetMapping("/trailBalanceReport")
	public String getTrailBalanceAccountSection() {
		return "accountManagement/trailBalanceReport";
	}

	@GetMapping("/pLStatement")
	public String getPLStatementAccountSection() {
		return "accountManagement/p&lStatement";
	}

	@GetMapping("/balanceSheet")
	public String getBalanceSheetAccountSection() {
		return "accountManagement/balanceSheet";
	}

	@GetMapping("/interbranchCashTransfer")
	public String getBranchCashTransferAccountSection() {
		return "accountManagement/interBranchCashTransfer";
	}

	// HRM Section
	@GetMapping("/addDesignationHRMSection")
	public String getAddDesignationHRMSection() {
		return "accountManagement/addDesignation";
	}

	@GetMapping("/addDepartmentHRMSection")
	public String getAddDepartmentHRMSection() {
		return "accountManagement/addDepartment";
	}

	//HRM Section
	@GetMapping("/addEmployeeHRMSection")
	public String getAddEmployeeHRMSection() {
		return "hrmSection/addEmployee";
	}

	@GetMapping("/EmployeeLeaveHRMSection")
	public String getEmployeeLeaveHRMSection() {
		return "hrmSection/employeeLeave";
	}

	@GetMapping("/salaryDetailsHRMSection")
	public String getSalaryDetailsHRMSection() {
		return "hrmSection/salaryDetails";
	}

	@GetMapping("/appointmentLetterHRMSection")
	public String getAppointmentLetterHRMSection() {
		return "hrmSection/appointmentLetter";
	}

	@GetMapping("/offerLetterIssueHRMSection")
	public String getOfferLetterIssueHRMSection() {
		return "hrmSection/offerLetterIssue";
	}

	@GetMapping("/holidayMasterHRMSection")
	public String getHolidayMasterHRMSection() {
		return "hrmSection/holidayMaster";
	}

	@GetMapping("/leaveAdjustmentHRMSection")
	public String getLeaveAdjustmentHRMSection() {
		return "hrmSection/leaveAdjustment";
	}

	@GetMapping("/attendanceHRMSection")
	public String getAttendanceHRMSection() {
		return "hrmSection/attendance";
	}

	@GetMapping("/salaryGenerateHRMSection")
	public String getSalaryGenerateHRMSection() {
		return "hrmSection/salaryGenerate";
	}

	@GetMapping("/salaryPaymentHRMSection")
	public String getSalaryPaymentHRMSection() {
		return "hrmSection/salaryPayment";
	}

	@GetMapping("/salarySlipPrintHRMSection")
	public String getSalarySlipPrintHRMSection() {
		return "hrmSection/salarySlipPrint";
	}

	@GetMapping("/attendanceReportHRMSection")
	public String getAttendanceReportHRMSection() {
		return "hrmSection/attendanceReport";
	}

	@GetMapping("/salaryPaymentReportHRMSection")
	public String getSalaryPaymentReportHRMSection() {
		return "hrmSection/salaryPaymentReport";
	}

	@GetMapping("/employeeSearchHRMSection")
	public String getEmployeeSearchHRMSection() {
		return "hrmSection/employeeSearch";
	}

	@GetMapping("/employeeIdCardHRMSection")
	public String getEmployeeIdCardHRMSection() {
		return "hrmSection/employeeIdCard";
	}

	// incentive Management
	@GetMapping("/incentiveSchemeMaster")
	public String getIncentiveSchemeMaster() {
		return "incentiveManagement/incentiveSchemeMaster";
	}

	@GetMapping("/generateIncentivePayments")
	public String getGenerateIncentivePayments() {
		return "incentiveManagement/generateIncentivePayments";
	}

	@GetMapping("/incentivePaymentDetails")
	public String getIncentivePaymentDetails() {
		return "incentiveManagement/incentivePaymentDetails";
	}

	@GetMapping("/incentiveSummaryReport")
	public String getIncentiveSummaryReport() {
		return "incentiveManagement/incentiveSummaryReport";
	}

	// Policy Management
	@GetMapping("/planManagement")
	public String getPlanManagement(Model model) {
		
		//Daily Deposit Code
		long maxIdDD = dailyDepositRepo.getMaxId();
		String memberCodeDD = "DD" + "000" + (maxIdDD + 1);
		model.addAttribute("memberCodeDD", memberCodeDD);
		
		long maxIdRD = recurringDepositRepo.getMaxId();
		String memberCodeRD = "RD" + "000" + (maxIdRD + 1);
		model.addAttribute("memberCodeRD", memberCodeRD);
		
		long maxIdFD = fixedDepositPMRepo.getMaxId();
		String memberCodeFD = "FD" + "000" + (maxIdFD + 1);
		model.addAttribute("memberCodeFD", memberCodeFD);
		
		long maxIdMD = misDepositePMRepo.getMaxId();
		String memberCodeMD = "MD" + "000" + (maxIdMD + 1);
		model.addAttribute("memberCodeMD", memberCodeMD);
		
		
		return "policyManagement/planManagement";
	}

	@GetMapping("/addNewInvestment")
	public String getAddNewInvestment() {
		return "policyManagement/addNewInvestment";
	}

	@GetMapping("/policyRenewalFee")
	public String getPolicyRenewalFee() {
		return "policyManagement/policyRenewalFee";
	}

	@GetMapping("/dailyPremiumRenewal")
	public String getDailyPremiumRenewal() {
		return "policyManagement/dailyPremiumRenewal";
	}

	@GetMapping("/flexiblePremiumRenewal")
	public String getFlexiblePremiumRenewal() {
		return "policyManagement/flexiblePremiumRenewal";
	}

	@GetMapping("/installmentRecordBook")
	public String getInstallmentRecordBook() {
		return "policyManagement/installmentRecordBook";
	}

	@GetMapping("/InvestmentTransactionSlip")
	public String getInvestmentTransactionSlip() {
		return "policyManagement/InvestmentTransactionSlip";
	}

	@GetMapping("/recurringPaymentReceipt")
	public String getRecurringPaymentReceipt() {
		return "policyManagement/recurringPaymentReceipt";
	}

	@GetMapping("/issueCertificate")
	public String getIssueCertificate() {
		return "policyManagement/issueCertificate";
	}

	@GetMapping("/reissueCertificate")
	public String getReissueCertificate() {
		return "policyManagement/reissueCertificate";
	}

	@GetMapping("/interestDetails")
	public String getInterestDetails() {
		return "policyManagement/interestDetails";
	}

	@GetMapping("/interestPayable")
	public String getInterestPayable() {
		return "policyManagement/interestPayable";
	}

	@GetMapping("/investmentDataSearch")
	public String getInvestmentDataSearch() {
		return "policyManagement/investmentDataSearch";
	}

	// Maturity Management
	@GetMapping("/maturitySchemeMaster")
	public String getMaturitySchemeMaster() {
		return "maturityManagement/maturitySchemeMaster";
	}

	@GetMapping("/applyForMaturity")
	public String getApplyForMaturity() {
		return "maturityManagement/applyForMaturity";
	}

	@GetMapping("/partialPaymentStatusMaturityApplication")
	public String getullMaturityPayment() {
		return "maturityManagement/partialMaturityStatus";
	}

	@GetMapping("/partialMaturityPayment")
	public String getMaturityPaymentPartly() {
		return "maturityManagement/partialMaturityPayment";
	}

	@GetMapping("/maturityApplicationStatus")
	public String getMaturityApplicationStatus() {
		return "maturityManagement/maturityApplicationStatus";
	}

	@GetMapping("/approvedStatusMaturityManagement")
	public String getApprovedStatusMaturityManagement() {
		return "maturityManagement/approvedStatus";
	}
	
	@GetMapping("/fullPaymentStatus")
	public String getfullPaymentStatus() {
		return "maturityManagement/fullPaymentStatus";
	}
	
	@GetMapping("/fullMaturityPayment")
	public String getPartialPaymentStatusMaturityApplication() {
		return "maturityManagement/fullMaturity";
	}

	@GetMapping("/maturityReceiptPrint")
	public String getMaturityReceiptPrint() {
		return "maturityManagement/printMaturityReceipt";
	}

	// Loan Management
	@GetMapping("/loanSchemeCatalog")
	public String getLoanSchemeCatalog(Model model) {
		return "loanManagement/loanSchemeCatalog";
	}

	@GetMapping("/emiLoanCalculator")
	public String getEmiLoanCalculator() {
		return "loanManagement/emiLoanCalculator";
	}

	@GetMapping("/newLoanApplication")
	public String getNewLoanApplication(Model model) {
		long maxId = loanApplicationRepo.getMaxId();
		String loanCode = "LP" + "0000" + (maxId + 1);
		model.addAttribute("loanCode", loanCode);
		return "loanManagement/newLoanApplication";
	}

	@GetMapping("/loanApprovalLoanManagement")
	public String getLoanApprovalLoanManagement() {
		return "loanManagement/loanApproval";
	}

	@GetMapping("/loanPaymentLoanManagement")
	public String getLoanPaymentLoanManagement() {
		return "loanManagement/loanPayment";
	}

	@GetMapping("/regularEmiRePaymentLoanManagement")
	public String getRegularEmiRePaymentLoanManagement() {
		return "loanManagement/regularInstallmentPayment";
	}

	@GetMapping("/irrregularEmiRePaymentLoanManagement")
	public String getIrregularEmiRePaymentLoanManagement() {
		return "loanManagement/irregularInstallmentPayment";
	}

	@GetMapping("/regularLoanStatementLoanManagement")
	public String getRegularLoanStatementLoanSection() {
		return "loanManagement/regularLoanStatement";
	}

	@GetMapping("/irregularLoanStatementLoanManagement")
	public String getIrregularLoanStatementLoanSection() {
		return "loanManagement/irregularLoanStatement";
	}
	
	@GetMapping("/earlyLoanClosureLoan")
	public String getEarlyLoanClosureLoan() {
		return "loanManagement/earlyLoanClosure";
	}
	
	@GetMapping("/preSettlementLoanManagement")
	public String getPreSettlementLoanSection() {
		return "loanManagement/preSettlement";
	}
	
	@GetMapping("/settleLoanRecords")
	public String getSettleLoanRecords() {
		return "loanManagement/settleLoanRecords";
	}
	
	@GetMapping("/generateNOCCertificateLoanManagement")
	public String getGenerateNOCCertificateLoanManagement() {
		return "loanManagement/generateNOCCertificate";
	}
	
	@GetMapping("/loanDocumentPrintLoanManagement")
	public String getloanDocumentPrintSection() {
		return "loanManagement/loanDocumentPrint";
	}
	
	@GetMapping("/searchLoanAccounts")
	public String getSearchLoanAccounts() {
		return "loanManagement/searchLoanAccounts";
	}

	// Customer Savings

	@GetMapping("/savingsSchemaCatalog")
	public String getSavingsSchemaCatalog() {
		return "customerSavings/savingsSchemaCatalog";
	}
	
	@GetMapping("/createSavingsAccount")
	public String getCreateSavingsAccount(Model model) {
		long maxId = createSavingAccountRepo.getMaxId();
	    String savingaccountnumber = String.format("2025%08d", maxId + 1);
//		//String savingaccountnumber = String.format("%012d", 202500000000L + maxId);
//		String savingaccountnumber = "2025" + "000000" + (maxId + 1);
		model.addAttribute("savingaccountnumber", savingaccountnumber);
		

		return "customerSavings/createSavingsAccount";
	}

	@GetMapping("/createCurrentAccount")
	public String getCreateCurrentAccount() {
		return "customerSavings/createCurrentAccount";
	}
	
	@GetMapping("/savingsAccountActivity")
	public String getSavingsAccountActivity(Model model) {
		String prefix = "TXN";
		String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int randomNumber = new Random().nextInt(9000) + 1000; // 4-digit random number
		String transactionCode = prefix + timestamp + randomNumber;

		model.addAttribute("transactionCode", transactionCode);
		return "customerSavings/savingsAccountActivity";
	}
	
	@GetMapping("/savingsAccountFundTransfer")
	public String getSavingsAccountFundTransfer() {
		return "customerSavings/savingsAccountFundTransfer";
	}
	
	@GetMapping("/savingAccountInterestTransfer")
	public String getSavingAccountInterestTransfer() {
		return "customerSavings/savingAccountInterestTransfer";
	}
	
	@GetMapping("/savingsRecordBook")
	public String getSavingsRecordBook() {
		return "customerSavings/savingsRecordBook";
	}
	
	@GetMapping("/currentAccountRecordBook")
	public String getCurrentAccountRecordBook() {
		return "customerSavings/currentAccountRecordBook";
	}

	@GetMapping("/savingsAccountStatement")
	public String getSavingsAccountStatement() {
		return "customerSavings/savingsAccountStatement";
	}
	
	@GetMapping("/savingsAccountCloser")
	public String getSavingsAccountCloser() {
		return "customerSavings/savingsAccountCloser";
	}

	@GetMapping("/savingsAccountInquiry")
	public String getSavingsAccountInquiry() {
		return "customerSavings/savingsAccountInquiry";
	}
	
	@GetMapping("/smsServiceFee")
	public String getSmsServiceFee() {
		return "customerSavings/smsServiceFee";
	}

	@GetMapping("/accountMaintenanceCharges")
	public String getAccountMaintenanceCharges() {
		return "customerSavings/accountMaintenanceCharges";
	}
	
	//Preferences
	@GetMapping("/companyAdministration")
	public String getCompanyAdministration() {
		return "preferences/companyAdministration";
	}
	
	@GetMapping("/financialYear")
	public String getFinancialYear() {
		return "preferences/financialYear";
	}
	
	@GetMapping("/createBranch")
	public String getCreateBranch() {
		return "preferences/createBranch";
	}
	
	@GetMapping("/bankModule")
	public String getBankModule() {
		return "preferences/bankModule";
	}
	
	@GetMapping("/relativeModule")
	public String getRelativeModule() {
		return "preferences/relativeModule";
	}
	
	@GetMapping("/casteModule")
	public String getCasteModule() {
		return "preferences/casteModule";
	}
	
	@GetMapping("/categoryModule")
	public String getCategoryModule() {
		return "preferences/categoryModule";
	}
	
	@GetMapping("/codeModule")
	public String getCodeModule() {
		return "preferences/codeModule";
	}
	
	@GetMapping("/executivePromoter")
	public String getExecutivePromoter() {
		return "preferences/executivePromoter";
	}
	
	@GetMapping("/customerCreation")
	public String getCustomerCreation() {
		return "preferences/customerCreation";
	}
	
	@GetMapping("/customerMenuAccess")
	public String getCustomerMenu() {
		return "preferences/customerMenuAccess";
	}
	
	@GetMapping("/customerBalanceReport")
	public String getCustomerBalanceReport() {
		return "preferences/customerBalanceReport";
	}
	
	@GetMapping("/lockerManagement")
	public String getLockerManagement() {
		return "preferences/lockerManagement";
	}
	
	@GetMapping("/ViewAdvisorData")
	public String ViewAdvisorData()
	{
		return "reportAndAnalytics/ReportAdvisor";
	}

	
//Secured Gold Loan by Poonam on 29/08/2025
    @GetMapping("/applyforGold")
    public String getapplyforGold()
    {
    	return "goldLoan/applyforGold";
    }
    
    @GetMapping("/emiInstallmentPayment")
    public String getemiInstallmentPayment()
    {
    	return "goldLoan/emiInstallmentPayment";
    }
    
    @GetMapping("/emiStatement")
    public String getemiStatement()
    {
    	return "goldLoan/emiStatement";
    }
    
    @GetMapping("/goldDirectory")
    public String getgoldDirectory()
    {
    	return "goldLoan/goldDirectory";
    }
    
    @GetMapping("/goldLoanApproval")
    public String getgoldLoanApproval()
    {
    	return "goldLoan/goldLoanApproval";
    }
    
    @GetMapping("/goldLoanPayment")
    public String getgoldLoanPayment()
    {
    	return "goldLoan/goldLoanPayment";
    }
    
    @GetMapping("/goldLoanStatement")
    public String getgoldLoanStatement()
    {
    	return "goldLoan/goldLoanStatement";
    }
    
    @GetMapping("/goldSecurePlan")
    public String getgoldSecurePlan()
    {
    	return "goldLoan/goldSecurePlan";
    }
    
    @GetMapping("/printNOC")
    public String getprintNOC()
    {
    	return "goldLoan/printNOC";
    }
    
    @GetMapping("/searchGoldLoan")
    public String getsearchGoldLoan()
    {
    	return "goldLoan/searchGoldLoan";
    }
    
	

}
