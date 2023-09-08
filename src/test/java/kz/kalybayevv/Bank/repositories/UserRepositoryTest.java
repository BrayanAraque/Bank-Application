package kz.kalybayevv.Bank.repositories;

import kz.kalybayevv.Bank.PasswordEncoder.PasswordEncoder;
import kz.kalybayevv.Bank.controllers.userController.User;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;


@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;


    @AfterEach
    void tearDown() {
        userRepository.deleteAll();
    }

    @Test
    void findUserByIinAndPassword() {
        String iin = "030224501113";
        String password = PasswordEncoder.hashcode("254958era@");
        User userObj = userRepository.findUserByIinAndPassword(iin, password);
        assertThat(userObj).isNotNull();
    }
}