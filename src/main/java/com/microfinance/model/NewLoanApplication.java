package com.microfinance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class NewLoanApplication {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	
	private long id;
	private String findMember;
	private String relativeDetail;
	private String newLoandob;
	private String newLoanage;
	private String newLoanphoneNo;
	private String noficationStatus;
	private String newLoanaddress;
	private String newLoanpincode;
	private String newLoanbranchName;
	private String newloanPlaneName;
	private String newLoanTypeofloan;
	private String newLoanPlanDuration;
	private String newLoanCategory;
	private String newLoanROI;
	private String newloanAmountLoan;
	private String newLoanTypeIntrest;
	private String newloanPaymnetEMI;
	private String newLoanPurpose;
	
	//Gurantor Details
	
	private String memberId;
	private String gurantorIdentifyGurantor;
	private String gurantorAddress;
	private String gurantorPinCode;
	private String guarantorContactno;
	private String guarantorSecurityType;
	private String coApplictionmemberID;
	private String coApplictionGuarantorIdentity;
	private String coApplictionAdress;
	private String coAppicationPinCode;
	private String coApplictionguarantorContactNo;
	private String coAappictionSecurityType;
	
	//Deduction Details
	
	private String deductionProcessingFee;
	private String deductionLegakCharges;
	private String deductionStampDutyFee;
	private String deductionSmsNotificationFee;
	private String deductionServicesCharges;
	private String deductionStationaryCharges;
	private String deductionSmsNotification;
	private String deductionGst;
	private String deductionInsuranaceFee;
	private String deductionPanaltyCharges;
	private String deductionFuelChargesEmi;
	private String deductionOverdueIntrestCharge;
	private String deuctionCollectionCharges;
	private String deductionAdvisorCollectorId;
	private String deductionCollectorName;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getFindMember() {
		return findMember;
	}
	public void setFindMember(String findMember) {
		this.findMember = findMember;
	}
	public String getRelativeDetail() {
		return relativeDetail;
	}
	public void setRelativeDetail(String relativeDetail) {
		this.relativeDetail = relativeDetail;
	}
	public String getNewLoandob() {
		return newLoandob;
	}
	public void setNewLoandob(String newLoandob) {
		this.newLoandob = newLoandob;
	}
	public String getNewLoanage() {
		return newLoanage;
	}
	public void setNewLoanage(String newLoanage) {
		this.newLoanage = newLoanage;
	}
	public String getNewLoanphoneNo() {
		return newLoanphoneNo;
	}
	public void setNewLoanphoneNo(String newLoanphoneNo) {
		this.newLoanphoneNo = newLoanphoneNo;
	}
	public String getNoficationStatus() {
		return noficationStatus;
	}
	public void setNoficationStatus(String noficationStatus) {
		this.noficationStatus = noficationStatus;
	}
	public String getNewLoanaddress() {
		return newLoanaddress;
	}
	public void setNewLoanaddress(String newLoanaddress) {
		this.newLoanaddress = newLoanaddress;
	}
	public String getNewLoanpincode() {
		return newLoanpincode;
	}
	public void setNewLoanpincode(String newLoanpincode) {
		this.newLoanpincode = newLoanpincode;
	}
	public String getNewLoanbranchName() {
		return newLoanbranchName;
	}
	public void setNewLoanbranchName(String newLoanbranchName) {
		this.newLoanbranchName = newLoanbranchName;
	}
	public String getNewloanPlaneName() {
		return newloanPlaneName;
	}
	public void setNewloanPlaneName(String newloanPlaneName) {
		this.newloanPlaneName = newloanPlaneName;
	}
	public String getNewLoanTypeofloan() {
		return newLoanTypeofloan;
	}
	public void setNewLoanTypeofloan(String newLoanTypeofloan) {
		this.newLoanTypeofloan = newLoanTypeofloan;
	}
	public String getNewLoanPlanDuration() {
		return newLoanPlanDuration;
	}
	public void setNewLoanPlanDuration(String newLoanPlanDuration) {
		this.newLoanPlanDuration = newLoanPlanDuration;
	}
	public String getNewLoanCategory() {
		return newLoanCategory;
	}
	public void setNewLoanCategory(String newLoanCategory) {
		this.newLoanCategory = newLoanCategory;
	}
	public String getNewLoanROI() {
		return newLoanROI;
	}
	public void setNewLoanROI(String newLoanROI) {
		this.newLoanROI = newLoanROI;
	}
	public String getNewloanAmountLoan() {
		return newloanAmountLoan;
	}
	public void setNewloanAmountLoan(String newloanAmountLoan) {
		this.newloanAmountLoan = newloanAmountLoan;
	}
	public String getNewLoanTypeIntrest() {
		return newLoanTypeIntrest;
	}
	public void setNewLoanTypeIntrest(String newLoanTypeIntrest) {
		this.newLoanTypeIntrest = newLoanTypeIntrest;
	}
	public String getNewloanPaymnetEMI() {
		return newloanPaymnetEMI;
	}
	public void setNewloanPaymnetEMI(String newloanPaymnetEMI) {
		this.newloanPaymnetEMI = newloanPaymnetEMI;
	}
	public String getNewLoanPurpose() {
		return newLoanPurpose;
	}
	public void setNewLoanPurpose(String newLoanPurpose) {
		this.newLoanPurpose = newLoanPurpose;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getGurantorIdentifyGurantor() {
		return gurantorIdentifyGurantor;
	}
	public void setGurantorIdentifyGurantor(String gurantorIdentifyGurantor) {
		this.gurantorIdentifyGurantor = gurantorIdentifyGurantor;
	}
	public String getGurantorAddress() {
		return gurantorAddress;
	}
	public void setGurantorAddress(String gurantorAddress) {
		this.gurantorAddress = gurantorAddress;
	}
	public String getGurantorPinCode() {
		return gurantorPinCode;
	}
	public void setGurantorPinCode(String gurantorPinCode) {
		this.gurantorPinCode = gurantorPinCode;
	}
	public String getGuarantorContactno() {
		return guarantorContactno;
	}
	public void setGuarantorContactno(String guarantorContactno) {
		this.guarantorContactno = guarantorContactno;
	}
	public String getGuarantorSecurityType() {
		return guarantorSecurityType;
	}
	public void setGuarantorSecurityType(String guarantorSecurityType) {
		this.guarantorSecurityType = guarantorSecurityType;
	}
	public String getCoApplictionmemberID() {
		return coApplictionmemberID;
	}
	public void setCoApplictionmemberID(String coApplictionmemberID) {
		this.coApplictionmemberID = coApplictionmemberID;
	}
	public String getCoApplictionGuarantorIdentity() {
		return coApplictionGuarantorIdentity;
	}
	public void setCoApplictionGuarantorIdentity(String coApplictionGuarantorIdentity) {
		this.coApplictionGuarantorIdentity = coApplictionGuarantorIdentity;
	}
	public String getCoApplictionAdress() {
		return coApplictionAdress;
	}
	public void setCoApplictionAdress(String coApplictionAdress) {
		this.coApplictionAdress = coApplictionAdress;
	}
	public String getCoAppicationPinCode() {
		return coAppicationPinCode;
	}
	public void setCoAppicationPinCode(String coAppicationPinCode) {
		this.coAppicationPinCode = coAppicationPinCode;
	}
	public String getCoApplictionguarantorContactNo() {
		return coApplictionguarantorContactNo;
	}
	public void setCoApplictionguarantorContactNo(String coApplictionguarantorContactNo) {
		this.coApplictionguarantorContactNo = coApplictionguarantorContactNo;
	}
	public String getCoAappictionSecurityType() {
		return coAappictionSecurityType;
	}
	public void setCoAappictionSecurityType(String coAappictionSecurityType) {
		this.coAappictionSecurityType = coAappictionSecurityType;
	}
	public String getDeductionProcessingFee() {
		return deductionProcessingFee;
	}
	public void setDeductionProcessingFee(String deductionProcessingFee) {
		this.deductionProcessingFee = deductionProcessingFee;
	}
	public String getDeductionLegakCharges() {
		return deductionLegakCharges;
	}
	public void setDeductionLegakCharges(String deductionLegakCharges) {
		this.deductionLegakCharges = deductionLegakCharges;
	}
	public String getDeductionStampDutyFee() {
		return deductionStampDutyFee;
	}
	public void setDeductionStampDutyFee(String deductionStampDutyFee) {
		this.deductionStampDutyFee = deductionStampDutyFee;
	}
	public String getDeductionSmsNotificationFee() {
		return deductionSmsNotificationFee;
	}
	public void setDeductionSmsNotificationFee(String deductionSmsNotificationFee) {
		this.deductionSmsNotificationFee = deductionSmsNotificationFee;
	}
	public String getDeductionServicesCharges() {
		return deductionServicesCharges;
	}
	public void setDeductionServicesCharges(String deductionServicesCharges) {
		this.deductionServicesCharges = deductionServicesCharges;
	}
	public String getDeductionStationaryCharges() {
		return deductionStationaryCharges;
	}
	public void setDeductionStationaryCharges(String deductionStationaryCharges) {
		this.deductionStationaryCharges = deductionStationaryCharges;
	}
	public String getDeductionSmsNotification() {
		return deductionSmsNotification;
	}
	public void setDeductionSmsNotification(String deductionSmsNotification) {
		this.deductionSmsNotification = deductionSmsNotification;
	}
	public String getDeductionGst() {
		return deductionGst;
	}
	public void setDeductionGst(String deductionGst) {
		this.deductionGst = deductionGst;
	}
	public String getDeductionInsuranaceFee() {
		return deductionInsuranaceFee;
	}
	public void setDeductionInsuranaceFee(String deductionInsuranaceFee) {
		this.deductionInsuranaceFee = deductionInsuranaceFee;
	}
	public String getDeductionPanaltyCharges() {
		return deductionPanaltyCharges;
	}
	public void setDeductionPanaltyCharges(String deductionPanaltyCharges) {
		this.deductionPanaltyCharges = deductionPanaltyCharges;
	}
	public String getDeductionFuelChargesEmi() {
		return deductionFuelChargesEmi;
	}
	public void setDeductionFuelChargesEmi(String deductionFuelChargesEmi) {
		this.deductionFuelChargesEmi = deductionFuelChargesEmi;
	}
	public String getDeductionOverdueIntrestCharge() {
		return deductionOverdueIntrestCharge;
	}
	public void setDeductionOverdueIntrestCharge(String deductionOverdueIntrestCharge) {
		this.deductionOverdueIntrestCharge = deductionOverdueIntrestCharge;
	}
	public String getDeuctionCollectionCharges() {
		return deuctionCollectionCharges;
	}
	public void setDeuctionCollectionCharges(String deuctionCollectionCharges) {
		this.deuctionCollectionCharges = deuctionCollectionCharges;
	}
	public String getDeductionAdvisorCollectorId() {
		return deductionAdvisorCollectorId;
	}
	public void setDeductionAdvisorCollectorId(String deductionAdvisorCollectorId) {
		this.deductionAdvisorCollectorId = deductionAdvisorCollectorId;
	}
	public String getDeductionCollectorName() {
		return deductionCollectorName;
	}
	public void setDeductionCollectorName(String deductionCollectorName) {
		this.deductionCollectorName = deductionCollectorName;
	}
	
	
	
	
	
	
	
	

}
