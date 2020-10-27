package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.bit.dto.memo;
import kr.or.bit.utils.Singleton_Helper;

/*
 * 1.db연결
 * 2.crud 함수 생성
 * 2-1.전체조회 : qeury 먼저 >> select id, email, content from memo >> oracle에서 먼저 실행한 후 오류가 없나 확인하기 
 * 2-2.조건조회 >>select id, email, content from memo where id=?
 * 2-3.삽입 insert into memo (id,email,content) values(?,?,?)
 * 2-4.수정 update memo set email=?, content=? where id=?
 * 2-5.삭제 delete from memo where id=?
 * ++ plus >> like 문자열 검색 (이름, 컨텐츠 내용으로 검색 etc)
 * 
 * */
public class memodao {
		Connection conn = null;
		public memodao() {
			conn = Singleton_Helper.getConnection("oracle");
		}
		
		//전체조회  (구현)
		public  List<memo> getMemoList() throws SQLException{
			
			PreparedStatement pstmt = null;
			String sql = "select id, email ,content from memo";
			
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			List<memo> memolist =  new ArrayList<memo>();
			
			while(rs.next()) {
				memo m = new memo();
				m.setId(rs.getString("id"));
				m.setEmail(rs.getString("email"));
				m.setContent(rs.getString("content"));
				memolist.add(m);
			}
			
			Singleton_Helper.close(rs);
			Singleton_Helper.close(pstmt);
			
			return memolist;
		}
		
		//조건조회 (구현하지 마세요: where id=   unique , primary key)
		public memo getMemoListById(String id) {
			return null;
		}
		
		//INSERT (구현)
		public int insertMemo(memo m) {
			int resultrow=0;
			
			PreparedStatement pstmt=null;
			try {
					String sql="insert into memo(id,email,content) values(?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, m.getId());
					pstmt.setString(2, m.getEmail());
					pstmt.setString(3, m.getContent());
					
					resultrow = pstmt.executeUpdate();
					
			}catch (Exception e) {
				System.out.println("Insert : " + e.getMessage());
			}finally {
				Singleton_Helper.close(pstmt);
			}
			return resultrow;
		}
		
		//UPDATE
		public int updateMemo(memo m) {
					return 0;
				}
				
		//DELET
		public int deleteMemo(String  id) {
					return 0;
		}		
		
		//추가함수
		public String idCheckById(String id) {
			return null;
		}
				
}
