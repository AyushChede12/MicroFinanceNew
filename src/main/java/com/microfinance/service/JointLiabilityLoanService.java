package com.microfinance.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

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
import com.microfinance.model.LoanAprroval;
import com.microfinance.repository.ApplyForGroupLoanRepo;
import com.microfinance.repository.CreateLendingGroupRepo;
import com.microfinance.repository.GroupDirectoryRepo;
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
			

			existing.setUploadPhoto(updatedDirectory.getUploadPhoto());
			existing.setUploadSignature(updatedDirectory.getUploadSignature());

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

	public ApiResponse<GroupDirectory> saveGroupDirectory(GroupDirectoryDto groupDirectoryDto,
			MultipartFile uploadPhoto, MultipartFile uploadSignature) {
		GroupDirectory groupDirectory = new GroupDirectory();
		boolean isNew = true;

		// Existing record check
		if (groupDirectoryDto.getId() != null && groupDirectoryDto.getId() > 0) {
			groupDirectory = groupDirectoryRepo.findById(groupDirectoryDto.getId()).orElse(new GroupDirectory());
			isNew = false;
		}

		// Map DTO to entity
		groupDirectory.setGroupID(groupDirectoryDto.getGroupID());
		groupDirectory.setCommunityName(groupDirectoryDto.getCommunityName());
		groupDirectory.setOpeningDate(groupDirectoryDto.getOpeningDate());
		groupDirectory.setBranchName(groupDirectoryDto.getBranchName());
		groupDirectory.setCommunityLeader(groupDirectoryDto.getCommunityLeader());
		groupDirectory.setContactNo(groupDirectoryDto.getContactNo());
		groupDirectory.setCommunityAddress(groupDirectoryDto.getCommunityAddress());
		groupDirectory.setAllocatedStaff(groupDirectoryDto.getAllocatedStaff());
		groupDirectory.setCollectionDay(groupDirectoryDto.getCollectionDay());
		groupDirectory.setCollectionTime(groupDirectoryDto.getCollectionTime());
		groupDirectory.setSelectedMember(groupDirectoryDto.getSelectedMember());
		groupDirectory.setCustomerName(groupDirectoryDto.getCustomerName());
		groupDirectory.setReferralDetails(groupDirectoryDto.getReferralDetails());
		groupDirectory.setContact(groupDirectoryDto.getContact());
		

		// Photo save
		if (uploadPhoto != null && !uploadPhoto.isEmpty()) {
			try {
				String photoFileName = saveFile(uploadPhoto);
				groupDirectory.setUploadPhoto(photoFileName);
			} catch (IOException e) {
				return ApiResponse.error(HttpStatus.INTERNAL_SERVER_ERROR, "Photo upload failed");
			}
		}

		// Signature save
		if (uploadSignature != null && !uploadSignature.isEmpty()) {
			try {
				String signatureFileName = saveFile(uploadSignature);
				groupDirectory.setUploadSignature(signatureFileName);
			} catch (IOException e) {
				return ApiResponse.error(HttpStatus.INTERNAL_SERVER_ERROR, "Signature upload failed");
			}
		}

		// Save to DB
		GroupDirectory savedData = groupDirectoryRepo.save(groupDirectory);

		if (isNew) {
			return ApiResponse.success(HttpStatus.CREATED,
					"Saved successfully. Community: " + savedData.getCommunityName(), savedData);
		} else {
			return ApiResponse.success(HttpStatus.OK,
					"Updated successfully. Community: " + savedData.getCommunityName(), savedData);
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

	public boolean saveGroupLoan(ApplyForGroupLoan applyGroupLoan) {
		// TODO Auto-generated method stub
		 try {
			applyForGroupLoanRepo.save(applyGroupLoan);
			return true;
		} catch (Exception e) {
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


	public ApplyForGroupLoan updateApprovalStatusApplyGroupLoan(String groupCode, String approvalStatus) {
		 ApplyForGroupLoan existingLoan = applyForGroupLoanRepo.findSingleByGroupCode(groupCode);

	        if (existingLoan != null) {
	            existingLoan.setApprovalStatus(approvalStatus);
	            return applyForGroupLoanRepo.save(existingLoan); // ✅ update होईल
	        } else {
	            return null; // group नाही सापडला
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

	
	
	


