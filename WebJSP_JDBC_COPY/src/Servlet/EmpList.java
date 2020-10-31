package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.EmpDAO;
import DTO.EmpDTO;

@WebServlet("/EmpList")
public class EmpList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmpList() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response, "get");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response, "post");
	}

	public void doProcess(HttpServletRequest request, HttpServletResponse response, String method)
			throws ServletException, IOException {
		// 1.한글처리
		// 2.데이터 받기
		// 3.DB연결
		// 4.Insert 실행
		// 5.응답구성

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); // 클라언트에게 전달한 페이지의 정보 구성
		
		try {
			EmpDAO empdao = new EmpDAO();
			List<EmpDTO> emplist = empdao.getAllList();
			request.setAttribute("emplist", emplist);
			
		} catch (Exception e) {

		}finally {
			String viewpage = "Ex01_JDBC_Basic.jsp";
			RequestDispatcher dis = request.getRequestDispatcher(viewpage);
			
			dis.forward(request, response);
		}
		
	}

}
