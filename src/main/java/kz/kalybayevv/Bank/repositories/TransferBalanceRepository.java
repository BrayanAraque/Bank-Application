package kz.kalybayevv.Bank.repositories;

import kz.kalybayevv.Bank.controllers.TransferBalanceController.TransferBalance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransferBalanceRepository extends JpaRepository<TransferBalance, Long> {
    List<TransferBalance> findTransferBalancesByFromCardNumber(Long cardNumber);
}
