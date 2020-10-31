package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.KoreaMemberDAO;
import DTO.koreamemberDTO;


@WebServlet("/MemberListServlet")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
    	
    	KoreaMemberDAO kdao = new KoreaMemberDAO();
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); // 클라언트에게 전달한 페이지의 정보 구성
    
		try {
			List<koreamemberDTO> memberList = kdao.getAllList();
			request.setAttribute("memberlist",memberList);
			
			String viewpage = "Ex03_Memberlist.jsp";
			RequestDispatcher dis = request.getRequestDispatcher(viewpage);
			
			dis.forward(request, response);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
    
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response,"get");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request, response,"post");
	}

}
