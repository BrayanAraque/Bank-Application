package kz.kalybayevv.Bank.controllers.userController;

import kz.kalybayevv.Bank.repositories.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class UserControllerTest {
    @Mock
    private UserRepository userRepository;
    private UserController userController;

    @BeforeEach
    void setUp() {
        userController = new UserController(userRepository);
    }

    @Test
    void login() {
        User userObj = new User();
        userObj.setIin("030224501113");
        userObj.setPassword("254958era@");

    }
}