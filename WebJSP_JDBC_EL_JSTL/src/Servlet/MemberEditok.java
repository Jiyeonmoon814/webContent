package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.KoreaMemberDAO;


@WebServlet("/MemberEditok")
public class MemberEditok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberEditok() {
        super();
    }
    
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = (String)request.getSession().getAttribute("userid");
    	if(userid == null || !userid.equals("admin")) {
    		String viewpage = "Login.jsp";
			RequestDispatcher dis = request.getRequestDispatcher(viewpage);
			dis.forward(request, response);
    		
    	}
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		
		PrintWriter out = response.getWriter();
		
		KoreaMemberDAO dao = new KoreaMemberDAO();
		int row = dao.memberedit(id, name, age, gender, email);
		if(row>0) {
			out.print("<script>");
			out.print("alert('수정 성공 !');");
			out.print("location.href='MemberListServlet';");
			out.print("</script>");
    	}else {
    		
    	}		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
