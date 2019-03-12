package service.impl;

import dao.CheckNameDao;
import dao.impl.CheckNameDaoImpl;
import service.SignUpService;

import java.sql.SQLException;

public class SignUpServiceImpl implements SignUpService {
    @Override
    public boolean checkName(String username) throws SQLException {
        CheckNameDao checkNameDao = new CheckNameDaoImpl();
        return checkNameDao.checkName(username);
    }
}
