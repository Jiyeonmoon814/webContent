package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.KoreaMemberDAO;
import DTO.koreamemberDTO;


@WebServlet("/KoreamemberList")
public class KoreamemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public KoreamemberList() {
        super();
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
//    	HttpSession session = request.getSession();
//    	String id = (String) session.getAttribute("id");
//    	if(id == null || !id.equals("admin")){
//    		//������ ������ �̵�
//    		response.sendRedirect("Ex02_JDBC_Login.jsp");
//    	}
    	KoreaMemberDAO dao  = new KoreaMemberDAO();
    	List<koreamemberDTO> koreamemberList = dao.getAllList();
    	//1.������ ���� 
    	request.setAttribute("koreamemberList", koreamemberList);	
		//view������ ����
		RequestDispatcher dis = request.getRequestDispatcher("/KoreamemberList.jsp");
		dis.forward(request, response);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
