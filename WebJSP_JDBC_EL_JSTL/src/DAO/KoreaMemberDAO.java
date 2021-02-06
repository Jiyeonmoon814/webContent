package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.koreamemberDTO;
import kr.or.bit.utils.Singleton_Helper;

public class KoreaMemberDAO {

	public Connection conn = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;

	public KoreaMemberDAO() { // throws Exception
		conn = Singleton_Helper.getConnection("oracle");
	}

	// 로그인 확인
	public koreamemberDTO LoginOk(String id, String pwd) {
		koreamemberDTO kdto = new koreamemberDTO();

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bituser", "tvxq1226");
			String sql = "select id, pwd from koreaMember where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (pwd.equals(rs.getString("pwd"))) {
					kdto.setId(rs.getString("id"));
					kdto.setPwd(rs.getString("pwd"));

				} else {
					kdto.setId(rs.getString("id"));
					kdto.setPwd(null);

				}

			} else {
				kdto.setPwd(null);
				kdto.setId(null);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return kdto;

	}

	// JOIN
	public int joinOk(koreamemberDTO kdto) {
		int result = 0;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bituser", "tvxq1226");
			String sql = "insert into koreaMember(id,pwd,name,age,gender,email,ip) values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kdto.getId());
			pstmt.setString(2, kdto.getPwd());
			pstmt.setString(3, kdto.getName());
			pstmt.setInt(4, kdto.getAge());
			pstmt.setString(5, kdto.getGender());
			pstmt.setString(6, kdto.getEmail());
			pstmt.setString(7, kdto.getIp());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			result = 0;
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}

		}

		return result;

	}

	// 전체회원 보기
	public List<koreamemberDTO> getAllList() {
		List<koreamemberDTO> memberList = new ArrayList<>();

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bituser", "tvxq1226");
			String sql = "select id, ip from koreamember";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				koreamemberDTO kdto = new koreamemberDTO();

				kdto.setId(rs.getString("id"));
				kdto.setIp(rs.getString("ip"));

				memberList.add(kdto);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
		}
		return memberList;
	}

	// countmember
	public int countListByName(String name) {
		int rowcount = 0;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bituser", "tvxq1226");
			String sql = "select count(*) from koreamember where name like ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + name + "%");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				rowcount = rs.getInt(1); // 조회건수
			}
		} catch (Exception e) {

		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return rowcount;
	}

	// find
	public List<koreamemberDTO> getListByName(String name) {
		List<koreamemberDTO> memberlist = new ArrayList<>();

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bituser", "tvxq1226");
			String sql = "select id, name, email from koreamember where name like '%" + name + "%'";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				koreamemberDTO kdto = new koreamemberDTO();

				kdto.setId(rs.getString(1));
				kdto.setName(rs.getString("name"));
				kdto.setEmail(rs.getString("email"));

				memberlist.add(kdto);

			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return memberlist;

	}

	// getkoreamember
	public koreamemberDTO getkoreamember(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id, pwd, name, age, trim(gender), email, ip from koreamember where id=?";
		koreamemberDTO koreamember = new koreamemberDTO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				koreamember.setId(rs.getString(1));
				koreamember.setPwd(rs.getString(2));
				koreamember.setName(rs.getString(3));
				koreamember.setAge(rs.getInt(4));
				koreamember.setGender(rs.getString(5));
				koreamember.setEmail(rs.getString(6));
				koreamember.setIp(rs.getString(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Singleton_Helper.close(pstmt);
			Singleton_Helper.close(rs);
		}
		return koreamember;
	}

	// Delete
	public int DeleteKoreamember(String id) {
		PreparedStatement pstmt = null;
		int row = 0;
		String sql = "delete from koreamember where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Singleton_Helper.close(pstmt);
		}
		return row;
	}

	// update
	public int memberedit(String id, String name, int age, String gender, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String sql = "update koreamember set name=? , age=? , email=? , gender=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setString(3, email);
			pstmt.setString(4, gender);
			pstmt.setString(5, id);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Singleton_Helper.close(pstmt);
			Singleton_Helper.close(rs);
		}
		return row;
	}
	
	// memberCheckByID
		public String memberCheckByID(String id) {
			String result = "false";
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bituser", "tvxq1226");
				String sql = "select * from koreamember where id=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				if(!rs.next()) {
					result = "true";
				}
			} catch (Exception e) {

			} finally {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return result;
		} 


}
