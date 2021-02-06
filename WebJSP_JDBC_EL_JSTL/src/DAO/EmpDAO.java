package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.EmpDTO;
import kr.or.bit.utils.ConnectionHelper;

public class EmpDAO {
	
	public Connection conn =null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;
	
	
	//전체조회
	public List<EmpDTO> getAllList(){
		List<EmpDTO> emplist = new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bituser","1004");
			String sql = "select empno, ename, sal, job from emp";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EmpDTO empdto = new EmpDTO();
				empdto.setEmpno(rs.getInt("empno"));
				empdto.setEname(rs.getString("ename"));
				empdto.setJob(rs.getString("job"));
				empdto.setSal(rs.getInt("sal"));
				emplist.add(empdto);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return emplist;
		
	}
	
	
	
}
