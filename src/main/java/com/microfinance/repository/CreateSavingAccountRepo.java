package com.microfinance.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.microfinance.model.CreateSavingsAccount;
import com.microfinance.model.SavingSchemeCatalog;

public interface CreateSavingAccountRepo extends JpaRepository<CreateSavingsAccount, Long> {
	@Transactional
	@Query("select coalesce(max(id), 0) from CreateSavingsAccount")
	long getMaxId();

	List<CreateSavingsAccount> findByIsApprovedFalse();

	//List<CreateSavingsAccount> findAllByAccountNumber(String accountNumber);

	Optional<CreateSavingsAccount> findByAccountNumber(String accountNumber);

	List<CreateSavingsAccount> findByTypeofaccountContainingIgnoreCaseAndIsApproved(String keyword, boolean isApproved);


	List<CreateSavingsAccount> findAllByAccountNumberAndIsApprovedTrue(String accountNumber);

	List<CreateSavingsAccount> findByIsApprovedTrue();

	List<CreateSavingsAccount> findBySelectByCustomer(String selectByCustomer);

	boolean existsBySelectByCustomer(String customerId);

	

	//CreateSavingsAccount findByaAccountNumber(String accountNumber);
}
