package com.microfinance.service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microfinance.dto.BankCashTransferDto;
import com.microfinance.dto.IncomingReceiptDto;
import com.microfinance.dto.LedgerAccountDto;
import com.microfinance.dto.ManualJournalDto;
import com.microfinance.dto.OutgoingPaymentDto;
import com.microfinance.exception.BadRequestException;
import com.microfinance.exception.BusinessLogicException;
import com.microfinance.exception.ResourceNotFoundException;
import com.microfinance.model.BankCashTransferEntry;
import com.microfinance.model.IncomingReceiptEntry;
import com.microfinance.model.LedgerAccountMaster;
import com.microfinance.model.ManualJournalEntry;
import com.microfinance.model.OutgoingPaymentEntry;
import com.microfinance.repository.BankCashTransferRepo;
import com.microfinance.repository.BranchModuleRepo;
import com.microfinance.repository.IncomingReceiptRepo;
import com.microfinance.repository.LedgerAccountRepository;
import com.microfinance.repository.ManualJournalRepo;
import com.microfinance.repository.OutgoingPaymentRepo;

@Service
public class AccountManagementService {

	@Autowired
	private BranchModuleRepo branchModuleRepo;

	@Autowired
	private LedgerAccountRepository ledgerAccountRepository;

	@Autowired
	private OutgoingPaymentRepo outgoingPaymentRepo;

	@Autowired
	private IncomingReceiptRepo incomingReceiptRepo;

	@Autowired
	private BankCashTransferRepo bankCashTransferRepo;

	@Autowired
	private ManualJournalRepo manualJournalRepo;

	/**
	 * Create a new Ledger Account. Business Logic: - Title must be unique per
	 * branch - Title must have at least 3 characters
	 */
	public LedgerAccountDto createLedger(LedgerAccountDto dto) {

		validateLedgerData(dto);

		String accountTitle = dto.getAccountTitle().trim().replaceAll("\\s+", "").toLowerCase();
		String branchName = dto.getBranchName().trim();
		boolean exists = ledgerAccountRepository.existsByAccountTitleIgnoreCaseAndBranchName(accountTitle, branchName);
		if (exists) {
			throw new BusinessLogicException("Ledger with this title already exists in this branch");
		}

		LedgerAccountMaster entity = mapToEntity(dto);
		LedgerAccountMaster saved = ledgerAccountRepository.save(entity);
		return mapToDto(saved);
	}

	/**
	 * Fetch all ledger accounts.
	 */

	public List<LedgerAccountDto> getAllLedgers() {
		return ledgerAccountRepository.findAll().stream().map(this::mapToDto).collect(Collectors.toList());
	}

	/**
	 * Fetch ledger account by ID.
	 * 
	 */
	public LedgerAccountDto getLedgerById(Long id) {
		LedgerAccountMaster entity = ledgerAccountRepository.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("Ledger", "id", id));
		return mapToDto(entity);
	}

	// ✅ Business Validation Logic
	private void validateLedgerData(LedgerAccountDto dto) {
		if (dto.getAccountTitle().length() < 3) {
			throw new BusinessLogicException("Account title must be at least 3 characters long");
		}
	}

	public List<String> groupNames() {
		return Arrays.asList("Bank", "Cash", "Loan", "Income", "Expense", "Share Capital", "Reserve Fund", "Investment",
				"Receivables", "Payables", "Savings", "Other Assets", "Other Liabilities");
	}

	private LedgerAccountMaster mapToEntity(LedgerAccountDto dto) {
		LedgerAccountMaster entity = new LedgerAccountMaster();
		entity.setId(dto.getId());
		entity.setAccountTitle(dto.getAccountTitle());
		entity.setGroupName(dto.getGroupName()); // ✅
		entity.setBranchName(dto.getBranchName());
		return entity;
	}

	private LedgerAccountDto mapToDto(LedgerAccountMaster entity) {
		LedgerAccountDto dto = new LedgerAccountDto();
		dto.setId(entity.getId());
		dto.setAccountTitle(entity.getAccountTitle());
		dto.setGroupName(entity.getGroupName()); // ✅
		dto.setBranchName(entity.getBranchName());
		return dto;
	}

	/**
	 * Retrieves all ledger accounts associated with the given branch name.
	 *
	 * @param branchName the name of the branch whose ledgers are to be retrieved
	 * @return a list of LedgerAccountDto objects belonging to the specified branch
	 * @throws ResourceNotFoundException if no ledgers are found for the given
	 *                                   branch name
	 */
	public List<LedgerAccountDto> getLedgersByBranch(String branchName) {
		List<LedgerAccountMaster> ledgers = ledgerAccountRepository.findByBranchName(branchName);
		if (ledgers.isEmpty()) {
			throw new ResourceNotFoundException("No ledgers found for branch '" + branchName + "'");
		}
		return ledgers.stream().map(this::mapToDto).collect(Collectors.toList());
	}

	/**
	 * Searches for outgoing payment entries by branch name and date range.
	 *
	 * @param branchName The name of the branch to search payments for.
	 * @param startDate  The start date of the range in yyyy-MM-dd format.
	 * @param endDate    The end date of the range in yyyy-MM-dd format.
	 * @return List of {@link OutgoingPaymentEntry} matching the search criteria.
	 * @throws BadRequestException if the date format is invalid, if the end date is
	 *                             before the start date, or if the end date is in
	 *                             the future.
	 */
	public List<OutgoingPaymentDto> searchPayments(String branchName, String startDate, String endDate) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate start;
		LocalDate end;

		try {
			start = LocalDate.parse(startDate, formatter);
			end = LocalDate.parse(endDate, formatter);
		} catch (DateTimeParseException e) {
			throw new BadRequestException("Invalid date format. Expected yyyy-MM-dd.");
		}

		if (!branchModuleRepo.existsByBranchNameIgnoreCase(branchName)) {
			throw new BadRequestException("Invalid branch name: " + branchName);
		}

		if (end.isBefore(start)) {
			throw new BadRequestException("End date cannot be before start date.");
		}

		if (end.isAfter(LocalDate.now())) {
			throw new BadRequestException("End date cannot be in the future.");
		}

		// If your repository expects LocalDate range
		// If your repository still expects String format, then:
		List<OutgoingPaymentEntry> entries = outgoingPaymentRepo.findByBranchNameAndDateOfEntryBetween(branchName,
				start.format(formatter), end.format(formatter));
		return entries.stream().map(this::mapToDto).collect(Collectors.toList());
	}

	/**
	 * Create a new Outgoing Payment Entry.
	 * 
	 * Business Logic: - Branch and Ledger must exist (validated with
	 * case-insensitive match, but saved with original DB casing) - Date must be in
	 * 'yyyy-MM-dd' format and cannot be in the future - Duplicate entries are
	 * prevented using branch, ledger, date, amount, mode, and remarks - Receipt ID
	 * is auto-generated in the format: RCPT-{BRANCH}-{DATE}-{UUID}
	 */

	public OutgoingPaymentDto createOutgoingPayment(OutgoingPaymentDto dto) {
		// Trimming & Normalization
		dto.setBranchName(dto.getBranchName() != null ? dto.getBranchName().trim() : null);
		dto.setLedgerAccount(dto.getLedgerAccount() != null ? dto.getLedgerAccount().trim() : null);
		dto.setRemarks(dto.getRemarks() != null ? dto.getRemarks().replaceAll("\\s+", "").trim().toLowerCase() : null);

		// Branch validation
		branchModuleRepo.findByBranchNameIgnoreCase(dto.getBranchName())
				.ifPresentOrElse(branch -> dto.setBranchName(branch.getBranchName()), () -> {
					throw new BadRequestException("Invalid branch name: " + dto.getBranchName());
				});

		// Ledger validation and normalization
		LedgerAccountMaster matchedLedger = ledgerAccountRepository.findByBranchName(dto.getBranchName()).stream()
				.filter(l -> l.getAccountTitle().replaceAll("\\s+", "")
						.equalsIgnoreCase(dto.getLedgerAccount().replaceAll("\\s+", "")))
				.findFirst().orElseThrow(
						() -> new BadRequestException("Ledger account not found for branch: " + dto.getBranchName()));

		dto.setLedgerAccount(matchedLedger.getAccountTitle());

		// Duplicate entry check
		boolean exists = outgoingPaymentRepo
				.existsByBranchNameIgnoreCaseAndLedgerAccountIgnoreCaseAndDateOfEntryAndTransactionAmountAndTransferModeIgnoreCaseAndRemarksIgnoreCase(
						dto.getBranchName(), dto.getLedgerAccount(), dto.getDateOfEntry(), dto.getTransactionAmount(),
						dto.getTransferMode(), dto.getRemarks());

		if (exists) {
			throw new BadRequestException("Duplicate entry already exists for the given data.");
		}

		validateOutgoingPayment(dto);
		OutgoingPaymentEntry entity = mapToEntity(dto);

		// 📌 Auto-generate Receipt ID
		String branch = dto.getBranchName().toUpperCase();
		String dateStr = dto.getDateOfEntry().replace("-", "");
		String shortUUID = UUID.randomUUID().toString().substring(0, 8);
		String receiptId = "RCPT-" + branch + "-" + dateStr + "-" + shortUUID;
		entity.setGeneratedReceiptID(receiptId);
		return mapToDto(outgoingPaymentRepo.save(entity));
	}

	/**
	 * Validates the fields of an outgoing payment DTO.
	 *
	 * Checks include:
	 * <ul>
	 * <li>Branch must exist in DB.</li>
	 * <li>Date format must be 'yyyy-MM-dd' and not in the future.</li>
	 * <li>Ledger account must exist.</li>
	 * <li>Transfer mode must be from allowed values.</li>
	 * <li>Transaction amount must be numeric.</li>
	 * </ul>
	 *
	 * @param dto The {@link OutgoingPaymentDto} to validate.
	 * @throws BadRequestException if any validation rule fails.
	 */
	private void validateOutgoingPayment(OutgoingPaymentDto dto) {

		// 1. Validate branch
		if (!branchModuleRepo.existsByBranchNameIgnoreCase(dto.getBranchName())) {
			throw new BadRequestException("Invalid branch name: " + dto.getBranchName());
		}

		// 2. Validate date format
		LocalDate parsedDate;
		try {
			parsedDate = LocalDate.parse(dto.getDateOfEntry(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			dto.setDateOfEntry(parsedDate.toString()); // sets date in yyyy-MM-dd format
		} catch (DateTimeParseException e) {
			throw new BadRequestException("Invalid date format. Expected yyyy-MM-dd.");
		}

		// 3. Validate ledger
		if (!ledgerAccountRepository.existsByAccountTitle(dto.getLedgerAccount())) {
			throw new BadRequestException("Ledger account not found: " + dto.getLedgerAccount());
		}

		// 4. Validate transfer mode
		List<String> validModes = Arrays.asList("Direct Payment", "Bank Transfer", "Cash Payment", "Cheque Payment",
				"Loan Disbursement", "Inter-Branch Transfer", "Other");
		if (!validModes.contains(dto.getTransferMode())) {
			throw new BadRequestException("Invalid transfer mode: " + dto.getTransferMode());
		}

		// 5. Validate amount
		try {
			new BigDecimal(dto.getTransactionAmount());
		} catch (NumberFormatException e) {
			throw new BadRequestException("Invalid transaction amount.");
		}

		// 6.Validation for Future Date Prevention
		if (parsedDate.isAfter(LocalDate.now())) {
			throw new BadRequestException("Date of entry cannot be in the future.");
		}

	}

	/**
	 * Retrieves all outgoing payment entries from the database.
	 *
	 * @return List of {@link OutgoingPaymentDto} representing all outgoing
	 *         payments.
	 */
	public List<OutgoingPaymentDto> getAllOutgoingPayment() {
		return outgoingPaymentRepo.findAll().stream().map(this::mapToDto).collect(Collectors.toList());
	}

	/**
	 * Retrieves a specific outgoing payment by its unique identifier.
	 *
	 * @param id The ID of the outgoing payment to retrieve.
	 * @return {@link OutgoingPaymentDto} representing the found outgoing payment.
	 * @throws ResourceNotFoundException if no payment is found with the given ID.
	 */
	public OutgoingPaymentDto getOutgoingPayment(Long id) {
		OutgoingPaymentEntry entity = outgoingPaymentRepo.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("OutgoingPayment", "id", id));
		return mapToDto(entity);
	}

	private OutgoingPaymentEntry mapToEntity(OutgoingPaymentDto dto) {
		OutgoingPaymentEntry entity = new OutgoingPaymentEntry();
		entity.setId(dto.getId());
		entity.setBranchName(dto.getBranchName());
		entity.setDateOfEntry(dto.getDateOfEntry());
		entity.setLedgerAccount(dto.getLedgerAccount());
		entity.setTransferMode(dto.getTransferMode());
		entity.setTransactionAmount(dto.getTransactionAmount());
		entity.setRemarks(dto.getRemarks());
		return entity;
	}

	private OutgoingPaymentDto mapToDto(OutgoingPaymentEntry entity) {
		OutgoingPaymentDto dto = new OutgoingPaymentDto();
		dto.setId(entity.getId());
		dto.setBranchName(entity.getBranchName());
		dto.setGeneratedReceiptID(entity.getGeneratedReceiptID());
		dto.setDateOfEntry(entity.getDateOfEntry());
		dto.setLedgerAccount(entity.getLedgerAccount());
		dto.setTransferMode(entity.getTransferMode());
		dto.setTransactionAmount(entity.getTransactionAmount());
		dto.setRemarks(entity.getRemarks());
		return dto;
	}

	/**
	 * Searches for Incoming Receipt entries by branch name and date range.
	 *
	 * @param branchName The name of the branch to search payments for.
	 * @param startDate  The start date of the range in yyyy-MM-dd format.
	 * @param endDate    The end date of the range in yyyy-MM-dd format.
	 * @return List of {@link OutgoingPaymentEntry} matching the search criteria.
	 * @throws BadRequestException if the date format is invalid, if the end date is
	 *                             before the start date, or if the end date is in
	 *                             the future.
	 */

	public List<IncomingReceiptDto> searchIncomingReceipt(String branchName, String startDate, String endDate) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate start;
		LocalDate end;

		try {
			start = LocalDate.parse(startDate, formatter);
			end = LocalDate.parse(endDate, formatter);
		} catch (DateTimeParseException e) {
			throw new BadRequestException("Invalid date format. Expected yyyy-MM-dd.");
		}
		if (!branchModuleRepo.existsByBranchNameIgnoreCase(branchName)) {
			throw new BadRequestException("Invalid branch name: " + branchName);
		}

		if (end.isBefore(start)) {
			throw new BadRequestException("End date cannot be before start date.");
		}

		if (end.isAfter(LocalDate.now())) {
			throw new BadRequestException("End date cannot be in the future.");
		}

		List<IncomingReceiptEntry> entries = incomingReceiptRepo.findByBranchNameAndDateOfEntryBetween(branchName,
				start.format(formatter), end.format(formatter));

		return entries.stream().map(this::mapToDto).collect(Collectors.toList());

	}

	/**
	 * Create a new Incoming Receipt Entry.
	 * 
	 * Business Logic: - Branch and Ledger must exist (validated with
	 * case-insensitive match, but saved with original DB casing) - Date must be in
	 * 'yyyy-MM-dd' format and cannot be in the future - Duplicate entries are
	 * prevented using branch, ledger, date, amount, mode, and remarks - Receipt ID
	 * is auto-generated in the format: RCPT-{BRANCH}-{DATE}-{UUID}
	 */

	public IncomingReceiptDto createIncomingReceipt(IncomingReceiptDto dto) {

		// Trimming & Normalization
		dto.setBranchName(dto.getBranchName() != null ? dto.getBranchName().trim() : null);
		dto.setLedgerAccount(dto.getLedgerAccount() != null ? dto.getLedgerAccount().trim() : null);
		dto.setRemarks(dto.getRemarks() != null ? dto.getRemarks().replaceAll("\\s+", "").trim().toLowerCase() : null);

		// Branch validation
		branchModuleRepo.findByBranchNameIgnoreCase(dto.getBranchName())
				.ifPresentOrElse(branch -> dto.setBranchName(branch.getBranchName()), () -> {
					throw new BadRequestException("Invalid branch name: " + dto.getBranchName());
				});

		// Ledger validation and normalization
		LedgerAccountMaster matchedLedger = ledgerAccountRepository.findByBranchName(dto.getBranchName()).stream()
				.filter(l -> l.getAccountTitle().replaceAll("\\s+", "")
						.equalsIgnoreCase(dto.getLedgerAccount().replaceAll("\\s+", "")))
				.findFirst().orElseThrow(
						() -> new BadRequestException("Ledger account not found for branch: " + dto.getBranchName()));

		dto.setLedgerAccount(matchedLedger.getAccountTitle());

		// Duplicate entry check
		boolean exists = incomingReceiptRepo
				.existsByBranchNameIgnoreCaseAndLedgerAccountIgnoreCaseAndDateOfEntryAndTransactionAmountAndTransferModeIgnoreCaseAndRemarksIgnoreCase(
						dto.getBranchName(), dto.getLedgerAccount(), dto.getDateOfEntry(), dto.getTransactionAmount(),
						dto.getTransferMode(), dto.getRemarks());

		if (exists) {
			throw new BadRequestException("Duplicate entry already exists for the given data.");
		}

		validateIncomingReceipt(dto);

		IncomingReceiptEntry entity = mapToEntity(dto);

		// 📌 Auto-generate Receipt ID
		String branch = dto.getBranchName().toUpperCase();
		String dateStr = dto.getDateOfEntry().replace("-", "");
		String shortUUID = UUID.randomUUID().toString().substring(0, 8);
		String receiptId = "RCPT-" + branch + "-" + dateStr + "-" + shortUUID;

		entity.setGeneratedReceiptID(receiptId);

		return mapToDto(incomingReceiptRepo.save(entity));
	}

	private void validateIncomingReceipt(IncomingReceiptDto dto) {

		// 1. Validate branch
		if (!branchModuleRepo.existsByBranchNameIgnoreCase(dto.getBranchName())) {
			throw new BadRequestException("Invalid branch name: " + dto.getBranchName());
		}

		// 2. Validate date format
		LocalDate parsedDate;
		try {
			parsedDate = LocalDate.parse(dto.getDateOfEntry(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			dto.setDateOfEntry(parsedDate.toString()); // sets date in yyyy-MM-dd format
		} catch (DateTimeParseException e) {
			throw new BadRequestException("Invalid date format. Expected yyyy-MM-dd.");
		}

		// 3. Validate ledger
		if (!ledgerAccountRepository.existsByAccountTitle(dto.getLedgerAccount())) {
			throw new BadRequestException("Ledger account not found: " + dto.getLedgerAccount());
		}

		// 4. Validate transfer mode
		List<String> validModes = Arrays.asList("Cash Deposit", "Bank Transfer", "Cheque Deposit", "DD Deposit",
				"Inter-Branch Transfer", "Loan Repayment", "Savings Deposit", "Share Capital Deposit", "Other");
		if (!validModes.contains(dto.getTransferMode())) {
			throw new BadRequestException("Invalid transfer mode: " + dto.getTransferMode());
		}

		// 5. Validate amount
		try {
			new BigDecimal(dto.getTransactionAmount());
		} catch (NumberFormatException e) {
			throw new BadRequestException("Invalid transaction amount.");
		}

		// 6.Validation for Future Date Prevention
		if (parsedDate.isAfter(LocalDate.now())) {
			throw new BadRequestException("Date of entry cannot be in the future.");
		}

	}

	public List<IncomingReceiptDto> getAllIncomingReceipt() {
		return incomingReceiptRepo.findAll().stream().map(this::mapToDto).collect(Collectors.toList());
	}

	public IncomingReceiptDto getIncomingReceipt(Long id) {
		IncomingReceiptEntry entity = incomingReceiptRepo.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("IncomingReceipt", "id", id));
		return mapToDto(entity);
	}

	private IncomingReceiptEntry mapToEntity(IncomingReceiptDto dto) {
		IncomingReceiptEntry entity = new IncomingReceiptEntry();
		entity.setId(dto.getId());
		entity.setBranchName(dto.getBranchName());
		entity.setDateOfEntry(dto.getDateOfEntry());
		entity.setLedgerAccount(dto.getLedgerAccount());
		entity.setTransferMode(dto.getTransferMode());
		entity.setTransactionAmount(dto.getTransactionAmount());
		entity.setRemarks(dto.getRemarks());
		return entity;
	}

	private IncomingReceiptDto mapToDto(IncomingReceiptEntry entity) {
		IncomingReceiptDto dto = new IncomingReceiptDto();
		dto.setId(entity.getId());
		dto.setBranchName(entity.getBranchName());
		dto.setGeneratedReceiptID(entity.getGeneratedReceiptID());
		dto.setDateOfEntry(entity.getDateOfEntry());
		dto.setLedgerAccount(entity.getLedgerAccount());
		dto.setTransferMode(entity.getTransferMode());
		dto.setTransactionAmount(entity.getTransactionAmount());
		dto.setRemarks(entity.getRemarks());
		return dto;
	}

	// BankCashTransferEntry

	public List<BankCashTransferDto> searchBankCashTransfer(String branchName, String startDate, String endDate) {

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate start;
		LocalDate end;

		try {
			start = LocalDate.parse(startDate, formatter);
			end = LocalDate.parse(endDate, formatter);
		} catch (DateTimeParseException e) {
			throw new BadRequestException("Invalid date format. Expected yyyy-MM-dd.");
		}
		if (!branchModuleRepo.existsByBranchNameIgnoreCase(branchName)) {
			throw new BadRequestException("Invalid branch name: " + branchName);
		}

		if (end.isBefore(start)) {
			throw new BadRequestException("End date cannot be before start date.");
		}

		if (end.isAfter(LocalDate.now())) {
			throw new BadRequestException("End date cannot be in the future.");
		}
		System.out.println("Searching for Branch: [" + branchName + "], Start: " + start + ", End: " + end);

		// ✅ Main repo call
		List<BankCashTransferEntry> entries = bankCashTransferRepo.findByBranchNameIgnoreCaseAndDateOfEntryBetween(
				branchName, start.format(formatter), end.format(formatter));
		if (entries.isEmpty()) {
			throw new BadRequestException("No transfers found for given search criteria.");
		}

		// ✅ DEBUG LOG AFTER QUERY
		System.out.println("Records found: " + entries.size());

		return entries.stream().map(this::mapToDto).collect(Collectors.toList());

	}

	public BankCashTransferDto createBankCashTransfer(BankCashTransferDto dto) {
		BankCashTransferEntry entity = mapToEntity(dto);

		validateBankCashTransfer(dto);
		System.out.println("Duplicate Check (Bank Cash): " + dto.getBranchName() + ", " + dto.getDateOfEntry() + ", "
				+ dto.getDebitLedger() + ", " + dto.getCreditLedger() + ", " + dto.getTransactionAmount());

		boolean exists = bankCashTransferRepo
				.existsByBranchNameIgnoreCaseAndDateOfEntryAndDebitLedgerIgnoreCaseAndCreditLedgerIgnoreCaseAndTransactionAmount(
						dto.getBranchName().trim(), dto.getDateOfEntry().trim(), dto.getDebitLedger().trim(),
						dto.getCreditLedger().trim(), dto.getTransactionAmount().trim());

		if (exists) {
			throw new BadRequestException(
					"Duplicate bank/cash transfer entry detected for the same branch, date, ledgers, and amount.");
		}

		String branch = dto.getBranchName().toUpperCase();
		String dateStr = dto.getDateOfEntry().replace("-", "");
		String shortUUID = UUID.randomUUID().toString().substring(0, 8);
		String receiptId = "RCPT-" + branch + "-" + dateStr + "-" + shortUUID;

		entity.setGeneratedReceiptID(receiptId);
		return mapToDto(bankCashTransferRepo.save(entity));

	}

	private void validateBankCashTransfer(BankCashTransferDto dto) {

		// A. Validate Branch
		if (!branchModuleRepo.existsByBranchNameIgnoreCase(dto.getBranchName())) {
			throw new BadRequestException("Invalid branch name: " + dto.getBranchName());
		}

		// B. Validate Date Format and Future Date
		LocalDate parsedDate;
		try {
			parsedDate = LocalDate.parse(dto.getDateOfEntry(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			dto.setDateOfEntry(parsedDate.toString()); // normalize
		} catch (DateTimeParseException e) {
			throw new BadRequestException("Invalid date format. Expected yyyy-MM-dd.");
		}

		if (parsedDate.isAfter(LocalDate.now())) {
			throw new BadRequestException("Date of entry cannot be in the future.");
		}

		// C. Validate Amount
		try {
			BigDecimal amount = new BigDecimal(dto.getTransactionAmount());

			if (amount.compareTo(BigDecimal.ZERO) <= 0) {
				throw new BadRequestException("Transaction amount must be greater than zero.");
			}
		} catch (NumberFormatException e) {
			throw new BadRequestException("Invalid transaction amount format.");
		}

		// D. Validate Ledgers & Groups (re-use existing method)
		validateLedgerGroups(dto.getDebitLedger(), dto.getCreditLedger(), dto.getBranchName());
	}

	private void validateLedgerGroups(String debitLedger, String creditLedger, String branchName) {
		List<String> allowedGroups = Arrays.asList("Bank", "Cash");

		LedgerAccountMaster debit = ledgerAccountRepository.findByAccountTitleAndBranchName(debitLedger, branchName)
				.orElseThrow(() -> new IllegalArgumentException("Invalid debit ledger: " + debitLedger));

		LedgerAccountMaster credit = ledgerAccountRepository.findByAccountTitleAndBranchName(creditLedger, branchName)
				.orElseThrow(() -> new IllegalArgumentException("Invalid credit ledger: " + creditLedger));

		if (!allowedGroups.contains(debit.getGroupName())) {
			throw new IllegalArgumentException("Debit ledger must belong to Bank or Cash group.");
		}

		if (!allowedGroups.contains(credit.getGroupName())) {
			throw new IllegalArgumentException("Credit ledger must belong to Bank or Cash group.");
		}

		if (debitLedger.equalsIgnoreCase(creditLedger)) {
			throw new IllegalArgumentException("Debit and Credit ledgers cannot be the same.");
		}

		if (!debit.getBranchName().equalsIgnoreCase(credit.getBranchName())) {
			throw new IllegalArgumentException("Both ledgers must belong to the same branch.");

		}
	}

	public List<BankCashTransferDto> getAllBankCashTransfer() {
		return bankCashTransferRepo.findAll().stream().map(this::mapToDto).collect(Collectors.toList());
	}

	public BankCashTransferDto getBankCashTransfer(Long id) {
		BankCashTransferEntry entity = bankCashTransferRepo.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("BankCashTransfer", "id", id));
		return mapToDto(entity);
	}

	public List<LedgerAccountMaster> getBankCashLedgersByBranch(String branchName) {
		List<String> groups = Arrays.asList("Bank", "Cash");
		return ledgerAccountRepository.findByBranchNameIgnoreCaseAndGroupNameIn(branchName, groups);
	}

	private BankCashTransferEntry mapToEntity(BankCashTransferDto dto) {
		BankCashTransferEntry entity = new BankCashTransferEntry();
		entity.setId(dto.getId());
		entity.setBranchName(dto.getBranchName());
		entity.setDateOfEntry(dto.getDateOfEntry());
		entity.setCreditLedger(dto.getCreditLedger());
		entity.setDebitLedger(dto.getDebitLedger());
		entity.setTransactionAmount(dto.getTransactionAmount());
		entity.setRemarks(dto.getRemarks());
		return entity;
	}

	private BankCashTransferDto mapToDto(BankCashTransferEntry entity) {
		BankCashTransferDto dto = new BankCashTransferDto();
		dto.setId(entity.getId());
		dto.setBranchName(entity.getBranchName());
		dto.setGeneratedReceiptID(entity.getGeneratedReceiptID());
		dto.setDateOfEntry(entity.getDateOfEntry());
		dto.setCreditLedger(entity.getCreditLedger());
		dto.setDebitLedger(entity.getDebitLedger());
		dto.setTransactionAmount(entity.getTransactionAmount());
		dto.setRemarks(entity.getRemarks());
		return dto;
	}

	/**
	 * Searches Manual Journal entries for a given branch and date range.
	 * 
	 * Business Logic: - Validates date format and range. - Validates branch
	 * existence. - Prevents future end dates and end date before start date.
	 * 
	 * @param branchName The branch to search in.
	 * @param startDate  Start date in yyyy-MM-dd format.
	 * @param endDate    End date in yyyy-MM-dd format.
	 * @return List of ManualJournalDto objects matching criteria.
	 * @throws BadRequestException if validation fails.
	 */
	public List<ManualJournalDto> searchManualJournal(String branchName, String startDate, String endDate) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate start;
		LocalDate end;

		try {
			start = LocalDate.parse(startDate, formatter);
			end = LocalDate.parse(endDate, formatter);
		} catch (DateTimeParseException e) {
			throw new BadRequestException("Invalid date format. Expected yyyy-MM-dd.");
		}

		if (!branchModuleRepo.existsByBranchNameIgnoreCase(branchName)) {
			throw new BadRequestException("Invalid branch name: " + branchName);
		}

		if (end.isBefore(start)) {
			throw new BadRequestException("End date cannot be before start date.");
		}

		if (end.isAfter(LocalDate.now())) {
			throw new BadRequestException("End date cannot be in the future.");
		}

		List<ManualJournalEntry> entries = manualJournalRepo.findByBranchNameAndDateOfEntryBetween(branchName,
				start.format(formatter), end.format(formatter));

		return entries.stream().map(this::mapToDto).collect(Collectors.toList());
	}

	/**
	 * Retrieves all eligible ledgers for Manual Journal entry for a branch.
	 * 
	 * Business Logic: - Only ledgers belonging to allowed groups are eligible.
	 * 
	 * @param branchName Branch name.
	 * @return List of LedgerAccountMaster objects in allowed groups for that
	 *         branch.
	 */

	public List<LedgerAccountMaster> getEligibleLedgersForManualJournal(String branchName) {
		List<String> allowedGroups = Arrays.asList("Expense", "Income", "Loan", "Payables", "Receivables",
				"Other Assets", "Other Liabilities", "Reserve Fund", "Investment", "Share Capital", "Savings");

		return ledgerAccountRepository.findByBranchNameIgnoreCaseAndGroupNameIn(branchName, allowedGroups);
	}

	/**
	 * Creates a new Manual Journal entry.
	 * 
	 * Business Logic: - Validates input via validateManualJournal. - Prevents
	 * duplicate entries based on branch, date, ledgers, and amount. -
	 * Auto-generates receipt ID.
	 * 
	 * @param dto ManualJournalDto containing entry data.
	 * @return ManualJournalDto for the created entry.
	 * @throws BadRequestException if business validation fails or duplicate exists.
	 */

	public ManualJournalDto createManualJournal(ManualJournalDto dto) {
		ManualJournalEntry entity = mapToEntity(dto);

		validateManualJournal(dto);
		System.out.println("Duplicate Check (Manual Journal): " + dto.getBranchName() + ", " + dto.getDateOfEntry()
				+ ", " + dto.getDebitLedger() + ", " + dto.getCreditLedger() + ", " + dto.getTransactionAmount());

		boolean exists = manualJournalRepo
				.existsByBranchNameIgnoreCaseAndDateOfEntryAndDebitLedgerIgnoreCaseAndCreditLedgerIgnoreCaseAndTransactionAmount(
						dto.getBranchName().trim(), dto.getDateOfEntry().trim(), dto.getDebitLedger().trim(),
						dto.getCreditLedger().trim(), dto.getTransactionAmount().trim());

		if (exists) {
			throw new BadRequestException(
					"Duplicate bank/cash transfer entry detected for the same branch, date, ledgers, and amount.");
		}

		// 📌 Auto-generate Receipt ID
		String branch = dto.getBranchName().toUpperCase();
		String dateStr = dto.getDateOfEntry().replace("-", "");
		String shortUUID = UUID.randomUUID().toString().substring(0, 8);
		String receiptId = "RCPT-" + branch + "-" + dateStr + "-" + shortUUID;

		entity.setGeneratedReceiptID(receiptId);

		return mapToDto(manualJournalRepo.save(entity));
	}

	/**
	 * Validates Manual Journal entry business rules.
	 * 
	 * Checks: - Branch existence. - Date format and future date prevention. -
	 * Positive numeric transaction amount. - Ledgers are valid and belong to
	 * allowed groups and same branch.
	 * 
	 * @param dto ManualJournalDto to validate.
	 * @throws BadRequestException if any validation fails.
	 */
	private void validateManualJournal(ManualJournalDto dto) {

		// A. Validate Branch
		if (!branchModuleRepo.existsByBranchNameIgnoreCase(dto.getBranchName().trim())) {
			throw new BadRequestException("Invalid branch name: " + dto.getBranchName());
		}

		// B. Validate Date Format and Future Date
		LocalDate parsedDate;
		try {
			parsedDate = LocalDate.parse(dto.getDateOfEntry().trim(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			dto.setDateOfEntry(parsedDate.toString()); // normalize
		} catch (DateTimeParseException e) {
			throw new BadRequestException("Invalid date format. Expected yyyy-MM-dd.");
		}

		if (parsedDate.isAfter(LocalDate.now())) {
			throw new BadRequestException("Date of entry cannot be in the future.");
		}

		// C. Validate Amount
		try {
			BigDecimal amount = new BigDecimal(dto.getTransactionAmount().trim());

			if (amount.compareTo(BigDecimal.ZERO) <= 0) {
				throw new BadRequestException("Transaction amount must be greater than zero.");
			}
		} catch (NumberFormatException e) {
			throw new BadRequestException("Invalid transaction amount format.");
		}

		// D. Validate Ledgers & Groups (re-use existing method)
		validateLedgerGroupsManual(dto.getDebitLedger(), dto.getCreditLedger(), dto.getBranchName());
	}

	/**
	 * Validates selected ledgers for Manual Journal entry.
	 * 
	 * Checks: - Both ledgers exist for branch. - Both ledgers belong to allowed
	 * groups. - Debit/Credit ledgers are not the same. - Both ledgers are for the
	 * same branch.
	 * 
	 * @param debitLedger  Debit ledger account title.
	 * @param creditLedger Credit ledger account title.
	 * @param branchName   Branch name.
	 * @throws IllegalArgumentException if any validation fails.
	 */

	private void validateLedgerGroupsManual(String debitLedger, String creditLedger, String branchName) {

		List<String> allowedGroups = Arrays.asList("Expense", "Income", "Loan", "Payables", "Receivables",
				"Other Assets", "Other Liabilities", "Reserve Fund", "Investment", "Share Capital", "Savings");

		String sanitizedDebitLedger = debitLedger.trim();
		String sanitizedCreditLedger = creditLedger.trim();
		String sanitizedBranch = branchName.trim();

		LedgerAccountMaster debit = ledgerAccountRepository
				.findByAccountTitleAndBranchNameIgnoreCaseAndTrimmed(sanitizedDebitLedger, sanitizedBranch)
				.orElseThrow(() -> new IllegalArgumentException("Invalid debit ledger: " + sanitizedDebitLedger));

		LedgerAccountMaster credit = ledgerAccountRepository
				.findByAccountTitleAndBranchNameIgnoreCaseAndTrimmed(sanitizedCreditLedger, sanitizedBranch)
				.orElseThrow(() -> new IllegalArgumentException("Invalid credit ledger: " + sanitizedCreditLedger));

		if (!allowedGroups.contains(debit.getGroupName())) {
			throw new IllegalArgumentException("Debit and Credit ledgers cannot be the same.");
		}

		if (!allowedGroups.contains(credit.getGroupName())) {
			throw new IllegalArgumentException("Both ledgers must belong to the same branch.");
		}

		if (sanitizedDebitLedger.equalsIgnoreCase(sanitizedCreditLedger)) {
			throw new IllegalArgumentException("Debit and Credit ledgers cannot be the same.");
		}

		if (!debit.getBranchName().equalsIgnoreCase(credit.getBranchName())) {
			throw new IllegalArgumentException("Invalid group for Credit Ledger '" + credit.getAccountTitle()
					+ "'. Found group: '" + credit.getGroupName() + "'. Allowed groups: " + allowedGroups);

		}
	}

	public List<ManualJournalDto> getAllManualJournal() {
		return manualJournalRepo.findAll().stream().map(this::mapToDto).collect(Collectors.toList());
	}

	public ManualJournalDto getManualJournal(Long id) {
		ManualJournalEntry entity = manualJournalRepo.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("ManualJournal", "id", id));
		return mapToDto(entity);
	}

	private ManualJournalEntry mapToEntity(ManualJournalDto dto) {
		ManualJournalEntry entity = new ManualJournalEntry();
		entity.setId(dto.getId());
		entity.setBranchName(dto.getBranchName());
		entity.setDateOfEntry(dto.getDateOfEntry());
		entity.setCreditLedger(dto.getCreditLedger());
		entity.setDebitLedger(dto.getDebitLedger());
		entity.setTransactionAmount(dto.getTransactionAmount());
		entity.setRemarks(dto.getRemarks());
		return entity;
	}

	private ManualJournalDto mapToDto(ManualJournalEntry entity) {
		ManualJournalDto dto = new ManualJournalDto();
		dto.setId(entity.getId());
		dto.setBranchName(entity.getBranchName());
		dto.setGeneratedReceiptID(entity.getGeneratedReceiptID());
		dto.setDateOfEntry(entity.getDateOfEntry());
		dto.setCreditLedger(entity.getCreditLedger());
		dto.setDebitLedger(entity.getDebitLedger());
		dto.setTransactionAmount(entity.getTransactionAmount());
		dto.setRemarks(entity.getRemarks());
		return dto;
	}

}
