package com.microfinance.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.microfinance.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
