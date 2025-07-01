package com.microfinance.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.model.CreateLendingGroup;
import com.microfinance.repository.CreateLendingGroupRepo;

@Service
public class JointLiabilityLoanService {
	@Autowired
	CreateLendingGroupRepo createLendingGroupRepo;

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

            existing.setLoanSchemeInformation(updatedGroup.getLoanSchemeInformation());
            existing.setMinimumAge(updatedGroup.getMinimumAge());
            existing.setMaxLoanDurationMonths(updatedGroup.getMaxLoanDurationMonths());
            existing.setMinLoanDurationMonths(updatedGroup.getMinLoanDurationMonths());
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
	}


