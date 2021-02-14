package Board.Action;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.wic.action.Action;
import kr.or.wic.action.ActionForward;
import kr.or.wic.dao.MemberDAO;
import kr.or.wic.dto.MemberDTO;

public class RegisterService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
		MemberDAO memberdao = new MemberDAO();
		MemberDTO memberdto = new MemberDTO();
		int result=0;
		
		String uploadpath = request.getSession().getServletContext().getRealPath("upload");
		System.out.println(uploadpath);
		int filesize = 10 * 1024 * 1024; // 10M
		String filename = "";

		// MultipartRequest type의 multi 객체 초기화 설정
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(
					request,	// 요청 객체 (Mulitpart 와 연결)
					uploadpath, // 저장경로 (실질적 저장 경로)
					filesize,   // 파일 크기 (10M)(한번에 업로드할 최대 파일 크기)
					"UTF-8",    // 한글 인코딩
					new DefaultFileRenamePolicy() // 파일 중복 처리 객체
			);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println(e);
			System.out.println("주소"+uploadpath);
		}
		
		
		 Enumeration filenames = multi.getFileNames(); filename =
		  multi.getFilesystemName((String)filenames.nextElement());
		 
		
		
		memberdto.setId(multi.getParameter("id"));
		memberdto.setPwd(multi.getParameter("pwd"));
		memberdto.setName(multi.getParameter("name"));
		
		
		/*
		 * String fullAddr=multi.getParameter("address");
		 * fullAddr+=" "+multi.getParameter("detailAddr");
		 */
		 
		memberdto.setAddr(multi.getParameter("address"));
		memberdto.setCloset_num(Integer.parseInt(multi.getParameter("detailAddr")));
		 memberdto.setProfile_pic(filename); 
		
		result = memberdao.insertMember(memberdto);
		
		String viewpage="";
		if(result != 0) {
			viewpage = "LoginRegister.jsp";
		}else {
			viewpage = "index.html";
		}
		
		//이동경로(viewpage)
		ActionForward forward = new ActionForward();
		forward.setPath(viewpage);
		
		return forward;
	}
}