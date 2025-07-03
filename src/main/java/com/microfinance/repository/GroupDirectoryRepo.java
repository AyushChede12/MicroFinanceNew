package com.microfinance.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.microfinance.model.GroupDirectory;
@Repository
public interface GroupDirectoryRepo extends JpaRepository<GroupDirectory, Long>{

}
