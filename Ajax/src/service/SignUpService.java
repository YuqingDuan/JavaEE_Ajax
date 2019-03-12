package service;

import java.sql.SQLException;

public interface SignUpService {
    boolean checkName(String username) throws SQLException;
}
