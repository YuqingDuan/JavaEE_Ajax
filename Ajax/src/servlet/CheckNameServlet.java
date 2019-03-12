package servlet;

import dao.CheckNameDao;
import dao.impl.CheckNameDaoImpl;
import service.SignUpService;
import service.impl.SignUpServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class CheckNameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            // 1.检测是否存在
            String username = request.getParameter("username");
            System.out.println("username: " + username);

            SignUpService signUpService = new SignUpServiceImpl();
            boolean isExist = signUpService.checkName(username);

            // 2.通知页面，到底有还是没有
            if (isExist) {
                // 存在用户名
                response.getWriter().println(1);
            } else {
                // 不存在该用户名
                response.getWriter().println(0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
