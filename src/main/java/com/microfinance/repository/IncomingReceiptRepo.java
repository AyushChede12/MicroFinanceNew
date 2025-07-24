package com.microfinance.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.microfinance.model.IncomingReceiptEntry;

public interface IncomingReceiptRepo extends JpaRepository<IncomingReceiptEntry, Long> {
	
    List<IncomingReceiptEntry> findByBranchNameAndDateOfEntryBetween(String branchName, String startDate, String endDate);

	boolean existsByBranchNameIgnoreCaseAndLedgerAccountIgnoreCaseAndDateOfEntryAndTransactionAmountAndTransferModeIgnoreCaseAndRemarksIgnoreCase(
			String branchName, String ledgerAccount, String dateOfEntry, String transactionAmount, String transferMode,
			String remarks);

	

}
