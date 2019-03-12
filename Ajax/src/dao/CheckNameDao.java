package dao;

import java.sql.SQLException;

public interface CheckNameDao {
    boolean checkName(String username) throws SQLException;
}
