package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.KoreaMemberDAO;
import DTO.koreamemberDTO;


@WebServlet("/Login")
public class Login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response,"get");
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response,"post");
	}
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); // 클라언트에게 전달한 페이지의 정보 구성
		String id=request.getParameter("id");
		String pwd =request.getParameter("pwd");
		
		KoreaMemberDAO kdao = new KoreaMemberDAO();
		
		try {
			koreamemberDTO user = kdao.LoginOk(id, pwd);
			
			//아이디 없을때 user==null
			if(user.getId()==null && user.getPwd()==null) {
				String viewpage = "Register.jsp";
				RequestDispatcher dis = request.getRequestDispatcher(viewpage);
				dis.forward(request, response);
			} else if(user.getPwd()==null) {
				String viewpage = "Login.jsp";
				RequestDispatcher dis = request.getRequestDispatcher(viewpage);
				dis.forward(request, response);
			}
			 
			//로그인 성공 했을때 => id 잇고, 비번 같을때 
			session.setAttribute("userid", user.getId());
			String viewpage = "Main.jsp";
			RequestDispatcher dis = request.getRequestDispatcher(viewpage);
			dis.forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			
		}
	
	
	}
}
