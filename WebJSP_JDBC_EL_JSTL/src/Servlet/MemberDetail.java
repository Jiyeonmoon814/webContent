package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.KoreaMemberDAO;
import DTO.koreamemberDTO;

@WebServlet("/MemberDetail")
public class MemberDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public MemberDetail() {
        super();
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String userid = (String)request.getSession().getAttribute("userid");
    	if(userid == null || !userid.equals("admin")) {
    		String viewpage = "Login.jsp";
			RequestDispatcher dis = request.getRequestDispatcher(viewpage);
			dis.forward(request, response);
    		
    	}
    	String id = request.getParameter("id");
    	KoreaMemberDAO dao  = new KoreaMemberDAO();
    	response.setContentType("text/html; charset=UTF-8");
		koreamemberDTO koreamember = dao.getkoreamember(id);
		request.setAttribute("koreamember", koreamember);
		
		String viewpage = "Manage_Member.jsp";
		RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		dis.forward(request, response);	
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
