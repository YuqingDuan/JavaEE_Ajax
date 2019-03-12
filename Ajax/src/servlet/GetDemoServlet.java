package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GetDemoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Now there's a post request, and we're going to go to get's code... ");
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        System.out.println("A get request was received..." + " name: " + name + ", age: " + age);

        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("Server has received your request and this is the response...");
    }
}
