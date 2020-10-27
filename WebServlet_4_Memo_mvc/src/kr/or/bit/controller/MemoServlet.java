package kr.or.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;


@WebServlet("/MemoServlet")
public class MemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    private void doProcess(HttpServletRequest request, HttpServletResponse response , String method) throws ServletException, IOException {
	     //http://192.168.0.169:8090/WebServlet_4_Memo_mvc/MemoServlet
    	//서블릿은 하나의 요청만 처리 : insert   .... command , url 통한 판단 필요없다
    	 request.setCharacterEncoding("UTF-8");
    	 
    	 String id = request.getParameter("id");
    	 String email = request.getParameter("email");
    	 String content = request.getParameter("memo");
    	 
    	 //UI or UI(x)
    	 //insert 처리 하는 ....
    	 //성공 여부 .... 
    	 
    	 response.setContentType("text/html;charset=UTF-8");
    	 PrintWriter  out =  response.getWriter();
    	 
    	 try {
    		     //DAO 단  //key point
    		      memodao dao = new memodao();
    		      int n = dao.insertMemo(new memo(id, email, content));
    		      
    		      if(n > 0) {
    		    	   out.print("<script>");
    		    	   		out.print("alert('등록성공');");
    		    	   		out.print("location.href='MemoList';");
    		    	   	   //http://192.168.0.169:8090/WebServlet_4_Memo_mvc/MemoList
    		    	   out.print("</script>");
    		      }else {
    		    	  out.print("<script>");
		    	   		out.print("alert('등록실패');");
		    	   		out.print("location.href='memo.html';");
		    	      out.print("</script>");
    		      }
    		      
    	 }catch (Exception e) {
			
		}
    	 
	}
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     doProcess(request, response, "GET");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  doProcess(request, response, "POST");
	}

}
