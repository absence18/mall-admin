package gdu.mall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import gdu.mall.util.DBUtil;
import gdu.mall.vo.Ebook;

public class EbookDao {
	
	// 삭제 method
	public static void deleteEbook(String ebookISBN) throws Exception{
		//sql
		String sql = "DELETE FROM ebook WHERE ebook_isbn = ?";
		
		//db처리
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,ebookISBN);
		
		//stmt디버깅
		System.out.println(stmt + "<-- EbookDao.java에서 deleteEbook() stmt");
		
		//삭제실행
		stmt.executeUpdate();
	}
	
	// Summary 수정 method
		public static void updateEbookSummary(Ebook ebook) throws Exception {
			//sql
			String sql = "UPDATE ebook SET ebook_summary = ? WHERE ebook_isbn = ?";
			
			//db연결
			Connection conn = DBUtil.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, ebook.getEbookSummary());
			stmt.setString(2, ebook.getEbookISBN());
			//디버깅 
			System.out.println(stmt + "<--- EbookDao.java에서 updateEbookSummary()의 stmt");
			
			//업데이트 실행
			stmt.executeUpdate();
		}
	
	// State 수정 method
	public static void updateEbookState(Ebook ebook) throws Exception {
		
		// 쿼리
		String sql = "UPDATE ebook SET ebook_state = ? WHERE ebook_isbn = ?";
		
		// DB & 실행
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		System.out.println(stmt + "<-- updateEbookState stmt"); // 디버깅
		
		stmt.setString(1, ebook.getEbookState());
		stmt.setString(2, ebook.getEbookISBN());
		
		stmt.executeUpdate();
	}
	
	// State 수정을 위한 목록 배열 (최정아님꺼 참고함...)
			public static String[] ebookStateList() throws Exception {
				String[] list = {"판매중", "품절", "절판", "구편절판"};
				
				return list;
			}
	
	// ebook 사진 수정 method
	public static int updateEbookImg(Ebook ebook) throws Exception {
		String sql ="UPDATE ebook SET ebook_img=? WHERE ebook_isbn =?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebook.getEbookImg());
		stmt.setString(2, ebook.getEbookISBN());
		int rowCnt = stmt.executeUpdate();
		return rowCnt;
	}
	
	// ebook 상세보기 method
	public static Ebook selectEbookOne(String ebookISBN) throws Exception{
		//sql은 모두 다 가져와야 한다
		String sql = "SELECT ebook_no ebookNo, ebook_isbn ebookISBN, category_name categoryName, ebook_title ebookTitle, ebook_author ebookAuthor, ebook_summary ebookSummary, ebook_company ebookCompany, ebook_page_Count ebookPageCount, ebook_price ebookPrice, ebook_img ebookImg, ebook_date ebookDate, ebook_state ebookState FROM ebook WHERE ebook_isbn = ?";
		//초기화
		Ebook ebook = null;
		//DB연동
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebookISBN);
		System.out.printf("stmt: %s<EbookDao.selectEbookOne>\n", stmt);
		
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebook_no"));
			ebook.setEbookISBN(rs.getString("ebookISBN"));
			ebook.setCategoryName(rs.getString("categoryName"));
			ebook.setEbookTitle(rs.getString("ebookTitle"));
			ebook.setEbookAuthor(rs.getString("ebookAuthor"));
			ebook.setEbookSummary(rs.getString("ebookSummary"));
			ebook.setEbookCompany(rs.getString("ebookCompany"));
			ebook.setEbookImg(rs.getString("ebookImg"));
			ebook.setEbookDate(rs.getString("ebookDate"));
			ebook.setEbookState(rs.getString("ebookState"));
			ebook.setEbookPageCount(rs.getInt("ebookPageCount"));
			ebook.setEbookPrice(rs.getInt("ebookPrice"));
			
		}
		
		return ebook;
	}
	
	
	// Ebook isbn 중복검사 method
	public static String checkEbookISBN(String ebookISBN) throws Exception{
		//1.sql
		String sql="SELECT ebook_isbn ebookISBN FROM ebook where ebook_isbn=?";
		//2.초기화
		String returnEbookISBN = null;
		//3.db연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebookISBN);
		
		System.out.printf("stmt: %s <--ebookDao.checkEbookISBN \n",stmt);
		//4.쿼리완성
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			returnEbookISBN = rs.getString("ebookISBN");
		}
		//5.리턴값
		return returnEbookISBN;
	}
	
	// 입력 method
	public static int insertEbook(Ebook ebook) throws Exception {
		/*
		 * INSERT INTO ebook(
		 * 		ebook_isbn,
		 * 		category_name,
		 * 		ebook_title,
		 * 		ebook_author,
		 * 		ebook_company,
		 * 		ebook_page_count,
		 * 		ebook_price,
		 * 		ebook_summary,
		 * 		ebook_img,
		 * 		ebook_date,
		 * 		ebook_state
		 * ) VALUES (
		 * 		?, ?, ?, ?, ?, ?, ?, ?, 'default.jpg', NOW(), '판매중'
		 * )			 
		 */
		String sql = "INSERT INTO ebook(ebook_isbn,category_name,ebook_title,ebook_author,ebook_company,ebook_page_count,ebook_price,ebook_summary,ebook_img,ebook_date,ebook_state) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'default.jpg', NOW(), '판매중')";
		int rowCnt = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ebook.getEbookISBN());
		stmt.setString(2, ebook.getCategoryName());
		stmt.setString(3, ebook.getEbookTitle());
		stmt.setString(4, ebook.getEbookAuthor());
		stmt.setString(5, ebook.getEbookCompany());
		stmt.setInt(6, ebook.getEbookPageCount());
		stmt.setInt(7, ebook.getEbookPrice());
		stmt.setString(8, ebook.getEbookSummary());
		rowCnt = stmt.executeUpdate();
		return rowCnt;
	}
	
	// 목록 method
	public static ArrayList<Ebook> selectEbookListByPage(int rowPerPage, int beginRow) throws Exception {
		
		// 쿼리 작성
		String sql = "SELECT category_name categoryName, ebook_isbn ebookISBN, ebook_title ebookTitle, ebook_author ebookAuthor, ebook_date ebookDate, ebook_price ebookPrice FROM ebook ORDER BY ebook_date DESC LIMIT ?, ?";
		
		// 리턴값 초기화
		ArrayList<Ebook> list = new ArrayList<>();
		
		// DB 핸들링
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		System.out.println(stmt + "<-- EbookDao selectEbookListByPage의 stmt");
		
		ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Ebook e = new Ebook();
				e.setCategoryName(rs.getString("categoryName"));
				e.setEbookISBN(rs.getString("ebookISBN"));
				e.setEbookTitle(rs.getString("ebookTitle"));
				e.setEbookAuthor(rs.getString("ebookAuthor"));
				e.setEbookDate(rs.getString("ebookDate"));
				e.setEbookPrice(rs.getInt("ebookPrice"));
				list.add(e);
			}
		// 4. 결과값 리턴
		return list;
		}
	
	// 전체 행의 수 세는 메소드
	public static int totalCount() throws Exception {
		// 변수 초기화
		int totalRow = 0;
		
		// 쿼리 작성
		String sql = "SELECT COUNT(*) cnt FROM ebook";
		
		// DB 핸들링
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt + " <-- Ebook count의 stmt"); // 디버깅
		ResultSet rs = stmt.executeQuery();
			while(rs.next()) { // ebook 데이터의 총 개수
				totalRow = rs.getInt("cnt");
		}
		// 결과값 리턴
		return totalRow;
	}
}
