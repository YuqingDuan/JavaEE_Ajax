package dao.impl;

import dao.CheckNameDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import util.JDBCUtil;

import java.sql.SQLException;

public class CheckNameDaoImpl implements CheckNameDao {
    @Override
    public boolean checkName(String username) throws SQLException {
        QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
        String sql = "select count(*) from t_user where name = ?";
        Long result = (Long) runner.query(sql, new ScalarHandler(), username);
        System.out.println("result: " + result);
        return result > 0;
    }
}
