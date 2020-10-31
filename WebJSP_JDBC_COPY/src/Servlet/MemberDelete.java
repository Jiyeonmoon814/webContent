package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.KoreaMemberDAO;

/**
 * Servlet implementation class MemberDelete
 */
@WebServlet("/MemberDelete")
public class MemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    public MemberDelete() {
        super();
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String id = request.getParameter("id");
    	KoreaMemberDAO dao  = new KoreaMemberDAO();
    	response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

    	int result = dao.DeleteKoreamember(id);
    	if(result>0) {
    		out.print("<script>");
			out.print("alert('삭제 성공!');");
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
