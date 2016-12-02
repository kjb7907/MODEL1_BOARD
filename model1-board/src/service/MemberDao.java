package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
public class MemberDao {
	private final String driverClassName = "com.mysql.jdbc.Driver"; //jdbc 드라이버 클래스 이름
	private final String url = "jdbc:mysql://127.0.0.1:3306/injava?useUnicode=true&characterEncoding=euckr";
	private final String username = "root";
	private final String password = "java0000";
	int totalRowCount;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	Member m = null;
	ArrayList<Member> arr = null;
	//테이블 : board , 기능 : 검색
	public ArrayList<Member> search(String sk,String sv){
		arr = new ArrayList<Member>();
		conn = getConnection();
		try {
			stmt = conn.prepareStatement("SELECT * FROM board WHERE board_title LIKE '%?%'");
			stmt.setString(1, sk);
			stmt.setString(2, sv);
			rs = stmt.executeQuery();
			while(rs.next()){}
				
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			this.close(conn, stmt, rs);
		}
		
	
		return arr;
		
	}
	// 테이블 : member, 기능 : 로그인
	
	public Member login(Member m){
		int result = 0;

		conn = getConnection();
		try {
			this.m = new Member();
			stmt = conn.prepareStatement("SELECT * FROM member WHERE m_id = ?");
			stmt.setString(1, m.getmId());
			System.out.println(stmt+"<--stmt");
			rs = stmt.executeQuery();
			if(rs.next()){

			System.out.println(" 아이디 일치 읽어오기 완료");
			this.m.setmId(rs.getString("m_id"));
			System.out.println("아이디세팅");
			this.m.setmPw(rs.getString("m_pw"));
			System.out.println("비밀번호 세팅");
			this.m.setmName(rs.getString("m_name"));
			System.out.println("멤버객체 세팅 완료");
			}else{
				System.out.println("아이디불일치");
				return null;
			}
		} catch (SQLException e) {	
			e.printStackTrace();
		} finally{
			this.close(conn, stmt, rs);
		}
		System.out.println("-----dao종료-----");
		return this.m;
		
	}
	// 테이블 : member, 기능 : 데이터 입력
	public int insertMember(Member m){
		int result =0;
		conn=getConnection();
		try {
			stmt = conn.prepareStatement("INSERT INTO member(m_id,m_pw,m_name,m_email)VALUES(?,?,?,?)");
			stmt.setString(1, m.getmId());
			stmt.setString(2, m.getmPw());
			stmt.setString(3, m.getmName());
			stmt.setString(4, m.getmEmail());
			
			result = stmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			this.close(conn, stmt, rs);
		}
		return result;
		
	}

	//db에 접속하는 메서드
	private Connection getConnection() {
		try {
			Class.forName(driverClassName);
			conn = DriverManager.getConnection(url,username,password);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return conn;
	}
	
	//사용한 객체 종료
	private void close(Connection conn, Statement stmt, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
