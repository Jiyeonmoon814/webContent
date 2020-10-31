package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.KoreaMemberDAO;
import DTO.koreamemberDTO;

@WebServlet("/JoinServlet")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinServlet() {
        super();
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); // 클라언트에게 전달한 페이지의 정보 구성
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("mname");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String ip = request.getRemoteAddr();
		PrintWriter out = response.getWriter();
		
		try {
			KoreaMemberDAO kdao = new KoreaMemberDAO();
			
			int n = kdao.joinOk(new koreamemberDTO(id,pwd,name,age,gender,email,ip));
			if(n != 0 ) {
				out.print("<script>");
				out.print("location.href='Ex02_JDBC_Login.jsp'");	
				out.print("</script>");
			}else {
				out.print("<script>");
				out.print("alert('가입실패');");	
				out.print("location.href='Ex02_JDBC_JoinForm.jsp'");	
				out.print("</script>");
			}
			
			
		}catch (Exception e) {
		
		}
		
		
	}
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response,"GET");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response,"POST");
	}

}
