package gdu.mall.dao;
import gdu.mall.vo.*;
import gdu.mall.util.*;
import java.util.*;
import java.sql.*;

public class ManagerDao {
	
	// 전체 행의 개수 세는 메소드
		public static int totalCount() throws Exception {
			// 변수 초기화
			int totalRow = 0;
			
			// 쿼리 작성
			String sql = "SELECT COUNT(*) cnt FROM notice";
			
			// DB 연결
			Connection conn = DBUtil.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			System.out.println(stmt + " <-- ManagerDao totalCount stmt"); // 디버깅
			ResultSet rs = stmt.executeQuery();
				while(rs.next()) {
					totalRow = rs.getInt("cnt");
			}
			
			// 리턴값
			return totalRow;
		}
	
	
	// 승인 대기중인 매니저 목록
	public static ArrayList<Manager> selectManagerListByZero() throws Exception {
		
		ArrayList<Manager> list = new ArrayList<>();
		
		String sql = "SELECT manager_id managerId, manager_date managerDate FROM manager WHERE manager_level=0";
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Manager m = new Manager();
			m.setManagerId(rs.getString("managerId"));
			m.setManagerDate(rs.getString("managerDate"));
			list.add(m);
		}
		// 4. 리턴
		return list;
	}
	
	// 수정 메서드
		// public static void updateManagerLevel(int managerNo, int managerLevel) throws Exception
		public static int updateManagerLevel(int managerNo, int managerLevel) throws Exception {
			//1. sql : no가 일치하면 level을 수정해라.
			String sql = "UPDATE manager SET manager_level=? WHERE manager_no=?";
			
			//2. 리턴값 초기화	
			int rowCount = 0;
			
			//3. db 핸들링
			Connection conn = DBUtil.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, managerLevel);
			stmt.setInt(2, managerNo);
			System.out.println(stmt+"<--update stmt");
			rowCount = stmt.executeUpdate();
			
			//4. 리턴
			return rowCount;
		}
	
	// 삭제 메서드
	// public static void deleteManager(int managerNo) throws Exception
	public static int deleteManager(int managerNo) throws Exception {
		//1. sql : no가 일치하면 행을 지워라.
		String sql = "DELETE FROM manager WHERE manager_no=?";
		
		//2. 리턴값 초기화	
		int rowCount = 0;
		
		//3. db 핸들링
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, managerNo);
		System.out.println(stmt+"<--delete stmt");
		rowCount = stmt.executeUpdate();
		
		//4. 리턴
		return rowCount;
	}
	
	// 매니저 목록 메소드
    public static ArrayList <Manager> selectManagerList(int rowPerPage, int beginRow) throws Exception {
       // 쿼리 작성
       String sql = "SELECT manager_no managerNo, manager_id managerId, manager_name managerName, manager_date managerDate, manager_level managerLevel FROM manager ORDER BY manager_date DESC LIMIT ?, ?";
       
       // 배열 변수 초기화
       ArrayList<Manager> list = new ArrayList<>();
       
       // DB 메소드 사용
       Connection conn = DBUtil.getConnection();
       PreparedStatement stmt = conn.prepareStatement(sql);
       stmt.setInt(1, beginRow);
       stmt.setInt(2, rowPerPage);
       System.out.println(stmt + "<-- ManagerDao selectManagerListByPage의 stmt"); // 디버깅
       
       // 결과물 복사
       ResultSet rs = stmt.executeQuery();
          while (rs.next()) {
             Manager m = new Manager();
             m.setManagerNo(rs.getInt("managerNo"));
             m.setManagerId(rs.getString("managerId"));
             m.setManagerName(rs.getString("managerName"));
             m.setManagerDate(rs.getString("managerDate"));
             m.setManagerLevel(rs.getInt("managerLevel"));
             list.add(m);
          }
       
       // list 리턴
       return list;
       }
	
	// 입력 메서드
	public static int insertManager(String managerId, String managerPw, String managerName) throws Exception {
		// 1.
		String sql = "INSERT INTO manager(manager_id,manager_pw,manager_name,manager_date,manager_level) VALUES(?,?,?,now(),0)";
		// 2.
		int rowCnt = 0; // 입력성공시 1, 실패 0
		// 3.
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, managerId);
		stmt.setString(2, managerPw);
		stmt.setString(3, managerName);
		System.out.println(stmt+" <-- stmt");
		rowCnt = stmt.executeUpdate();
		return rowCnt;
	}
	
	// id 사용가능여부
	public static String selectManagerId(String managerId) throws Exception {
		// 1. sql문
		String sql = "SELECT manager_id FROM manager WHERE manager_id = ?";
		// 2. 리턴타입 초기화
		String returnManagerId = null;
		
		// 3. DB 처리
		Connection conn = DBUtil.getConnection();
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, managerId);
		ResultSet rs = stmt.executeQuery();		
		if(rs.next()) {
			returnManagerId = rs.getString("manager_id");
		}
		// 4. 리턴
		return returnManagerId;
	}
	
	// 로그인 메서드
	public static Manager login(String managerId, String managerPw) throws Exception {
		
		String sql = "SELECT manager_id, manager_name, manager_level FROM manager WHERE manager_id=? AND manager_pw=? AND manager_level>0";
		Manager manager = null;
		
		Connection conn = DBUtil.getConnection();
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, managerId);
		stmt.setString(2, managerPw);
		System.out.println(stmt + " <--login() sql");
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			manager = new Manager();
			manager.setManagerId(rs.getString("manager_id"));
			manager.setManagerName(rs.getString("manager_name"));
			manager.setManagerLevel(rs.getInt("manager_level"));
		}
		return manager;
	}	
}
