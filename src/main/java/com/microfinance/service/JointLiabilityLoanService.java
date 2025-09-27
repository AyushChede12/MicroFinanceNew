package com.microfinance.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.microfinance.dto.ApiResponse;
import com.microfinance.dto.GroupDirectoryDto;
import com.microfinance.model.ApplyForGroupLoan;
import com.microfinance.model.CreateLendingGroup;
import com.microfinance.model.GroupDirectory;
import com.microfinance.model.InstallmentRepayment;
import com.microfinance.model.LoanApplication;
import com.microfinance.model.LoanAprroval;
import com.microfinance.repository.ApplyForGroupLoanRepo;
import com.microfinance.repository.CreateLendingGroupRepo;
import com.microfinance.repository.GroupDirectoryRepo;
import com.microfinance.repository.InstallmentRepymentRepo;
import com.microfinance.repository.LoanApprovalRepo;

@Service
public class JointLiabilityLoanService {
	@Autowired
	CreateLendingGroupRepo createLendingGroupRepo;

	@Autowired
	GroupDirectoryRepo groupDirectoryRepo;

	@Autowired
	ApplyForGroupLoanRepo applyForGroupLoanRepo;

	@Autowired
	LoanApprovalRepo loanApprovalRepo;

	@Autowired
	InstallmentRepymentRepo installmentRepymentRepo;

	@Value("${upload.directory}")
	private String uploadDirectory;

	public boolean saveLendingGroup(CreateLendingGroup createLendingGroup) {
		// TODO Auto-generated method stub
		try {
			createLendingGroupRepo.save(createLendingGroup);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<CreateLendingGroup> getAlllendinggroup() {
		// TODO Auto-generated method stub
		return createLendingGroupRepo.findAll();
	}

	public CreateLendingGroup getLendingGroupById(Long id) {
		// TODO Auto-generated method stub
		return createLendingGroupRepo.findById(id).orElse(null);
	}

	public CreateLendingGroup updategroupLending(Long id, CreateLendingGroup updatedGroup) {
		Optional<CreateLendingGroup> existingOpt = createLendingGroupRepo.findById(id);
		if (existingOpt.isPresent()) {
			CreateLendingGroup existing = existingOpt.get();
			existing.setPlanCode(updatedGroup.getPlanCode());
			existing.setLoanSchemeInformation(updatedGroup.getLoanSchemeInformation());
			existing.setMinimumAge(updatedGroup.getMinimumAge());

			existing.setTerm(updatedGroup.getTerm());
			existing.setBranchName(updatedGroup.getBranchName());
			existing.setMaximumAge(updatedGroup.getMaximumAge());
			existing.setMinLoanAmt(updatedGroup.getMinLoanAmt());
			existing.setRateOfInterest(updatedGroup.getRateOfInterest());
			existing.setEmiFrequency(updatedGroup.getEmiFrequency());
			existing.setInterestType(updatedGroup.getInterestType());
			existing.setMaximumLoanAmount(updatedGroup.getMaximumLoanAmount());
			existing.setSecurityType(updatedGroup.getSecurityType());
			existing.setEmiType(updatedGroup.getEmiType());
			existing.setPlanActivationStatus(updatedGroup.getPlanActivationStatus());
			existing.setProcessingFeePercent(updatedGroup.getProcessingFeePercent());
			existing.setLegalChargesPercent(updatedGroup.getLegalChargesPercent());
			existing.setGstPercent(updatedGroup.getGstPercent());
			existing.setInsuranceFeePercent(updatedGroup.getInsuranceFeePercent());
			existing.setValuationFeePercent(updatedGroup.getValuationFeePercent());
			existing.setLateAllowanceDays(updatedGroup.getLateAllowanceDays());
			existing.setPenaltyMode(updatedGroup.getPenaltyMode());
			existing.setMonthlyPenalty(updatedGroup.getMonthlyPenalty());

			return createLendingGroupRepo.save(existing);
		} else {
			return null;
		}

	}

	public boolean deleteLendingGroup(Long id) {
		Optional<CreateLendingGroup> existing = createLendingGroupRepo.findById(id);
		if (existing.isPresent()) {
			createLendingGroupRepo.deleteById(id);
			return true;
		}
		return false;
	}
	// Group Directory Service code

	public GroupDirectory updateGroupDirectory(Long id, GroupDirectory updatedDirectory) {
		Optional<GroupDirectory> optional = groupDirectoryRepo.findById(id);
		if (optional.isPresent()) {
			GroupDirectory existing = optional.get();

			// Update all fields
			existing.setGroupID(updatedDirectory.getGroupID());
			existing.setCommunityName(updatedDirectory.getCommunityName());
			existing.setOpeningDate(updatedDirectory.getOpeningDate());
			existing.setBranchName(updatedDirectory.getBranchName());
			existing.setCommunityLeader(updatedDirectory.getCommunityLeader());
			existing.setContactNo(updatedDirectory.getContactNo());
			existing.setCommunityAddress(updatedDirectory.getCommunityAddress());
			existing.setAllocatedStaff(updatedDirectory.getAllocatedStaff());
			existing.setCollectionDay(updatedDirectory.getCollectionDay());
			existing.setCollectionTime(updatedDirectory.getCollectionTime());

			existing.setSelectedMember(updatedDirectory.getSelectedMember());
			existing.setCustomerName(updatedDirectory.getCustomerName());
			existing.setReferralDetails(updatedDirectory.getReferralDetails());
			existing.setContact(updatedDirectory.getContact());

			// existing.setUploadPhoto(updatedDirectory.getUploadPhoto());
			// existing.setUploadSignature(updatedDirectory.getUploadSignature());

			return groupDirectoryRepo.save(existing);
		} else {
			return null;
		}
	}

	public boolean deleteGroupDirectory(Long id) {
		if (groupDirectoryRepo.existsById(id)) {
			groupDirectoryRepo.deleteById(id);
			return true;
		}
		return false;
	}

	// Service for saving group directory
	public boolean saveGroupDirectoryData(GroupDirectory groupDirectory) {
		try {
			groupDirectoryRepo.save(groupDirectory);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	private String saveFile(MultipartFile file) throws IOException {
		ensureUploadDirectoryExists();
		String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
		File dest = new File(uploadDirectory + File.separator + fileName);
		file.transferTo(dest);
		return fileName;
	}

	private void ensureUploadDirectoryExists() {
		File dir = new File(uploadDirectory);
		if (!dir.exists()) {
			boolean created = dir.mkdirs();
			if (created) {
				System.out.println("Directory created: " + uploadDirectory);
			} else {
				System.err.println("Failed to create directory: " + uploadDirectory);
			}
		}
	}

	public List<GroupDirectory> getAllGroupDirectories() {
		return groupDirectoryRepo.findAll();
	}

	public GroupDirectory getGroupDirectoryById(Long id) {
		return groupDirectoryRepo.findById(id).orElse(null);
	}

	public List<GroupDirectory> getaddquedata() {
		// TODO Auto-generated method stub
		return groupDirectoryRepo.findAll();
	}

	// Service for group laon application
	public boolean saveGroupLoan(ApplyForGroupLoan applyGroupLoan) {
		try {
			// force values before saving
			applyGroupLoan.setGroupLoanStatus("ACTIVE"); // default: active loan

			applyForGroupLoanRepo.save(applyGroupLoan);
			return true;
		} catch (Exception e) {
			e.printStackTrace(); // helpful for debugging
			return false;
		}
	}

	public List<ApplyForGroupLoan> getAllApplyForGroupLoan() {
		// TODO Auto-generated method stub
		return applyForGroupLoanRepo.findAll();
	}

	public List<GroupDirectory> fetchByGroupID(String groupID) {
		// TODO Auto-generated method stub
		return groupDirectoryRepo.findByGroupID(groupID);
	}

	public List<CreateLendingGroup> fetchByPlanCode(String planCode) {
		return createLendingGroupRepo.findByPlanCode(planCode);
	}

	public List<ApplyForGroupLoan> getAllgroupdata() {
		// TODO Auto-generated method stub
		return applyForGroupLoanRepo.findAll();
	}

	public boolean saveLoanApproval(LoanAprroval loanAprroval) {
		// TODO Auto-generated method stub
		try {
			loanApprovalRepo.save(loanAprroval);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// Service for approving the group loan application
	public String approveGroupLoan(ApplyForGroupLoan approvalRequest) {

		// Step 1: Find the existing group loan by groupCode
		ApplyForGroupLoan existingLoan = applyForGroupLoanRepo.findSingleByGroupCode(approvalRequest.getGroupCode());

		if (existingLoan != null) {

			// ✅ Check if already approved
			if (existingLoan.isApprovalStatus()) {
				return "already_approved";
			}

			// Step 2: Update approval status and date
			existingLoan.setApprovalStatus(true); // approved
			existingLoan.setApprovalDate(approvalRequest.getApprovalDate()); // today's date

			// Step 3: Save updated group loan
			applyForGroupLoanRepo.save(existingLoan);

			return "success";
		} else {
			return "not_found"; // group loan not found
		}
	}

	// ✅ Fetch Method (list)
	public List<ApplyForGroupLoan> fetchApplyGroupLoanByGroupcode(String groupCode) {
		return applyForGroupLoanRepo.findByGroupCode(groupCode);
	}

	public List<ApplyForGroupLoan> fetchBygroupCode(String groupCode) {
		// TODO Auto-generated method stub
		return applyForGroupLoanRepo.findByGroupCode(groupCode);

	}

	public boolean saveRepayment(InstallmentRepayment repayment) {
		try {
			installmentRepymentRepo.save(repayment);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<InstallmentRepayment> getAllRepayments() {
		return installmentRepymentRepo.findAll();
	}

	// Service for getting Approved & Active loan Ids( Vaibhav)

	public List<String> getApprovedGroupLoanIds() {
		List<ApplyForGroupLoan> approvedActiveLoans = applyForGroupLoanRepo
				.findByApprovalStatusTrueAndGroupLoanStatus("ACTIVE");

		return approvedActiveLoans.stream().map(ApplyForGroupLoan::getGroupCode).collect(Collectors.toList());
	}

}
