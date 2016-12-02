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
	private final String driverClassName = "com.mysql.jdbc.Driver"; //jdbc ����̹� Ŭ���� �̸�
	private final String url = "jdbc:mysql://127.0.0.1:3306/injava?useUnicode=true&characterEncoding=euckr";
	private final String username = "root";
	private final String password = "java0000";
	int totalRowCount;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	Member m = null;
	ArrayList<Member> arr = null;
	//���̺� : board , ��� : �˻�
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
	// ���̺� : member, ��� : �α���
	
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

			System.out.println(" ���̵� ��ġ �о���� �Ϸ�");
			this.m.setmId(rs.getString("m_id"));
			System.out.println("���̵���");
			this.m.setmPw(rs.getString("m_pw"));
			System.out.println("��й�ȣ ����");
			this.m.setmName(rs.getString("m_name"));
			System.out.println("�����ü ���� �Ϸ�");
			}else{
				System.out.println("���̵����ġ");
				return null;
			}
		} catch (SQLException e) {	
			e.printStackTrace();
		} finally{
			this.close(conn, stmt, rs);
		}
		System.out.println("-----dao����-----");
		return this.m;
		
	}
	// ���̺� : member, ��� : ������ �Է�
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

	//db�� �����ϴ� �޼���
	private Connection getConnection() {
		try {
			Class.forName(driverClassName);
			conn = DriverManager.getConnection(url,username,password);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return conn;
	}
	
	//����� ��ü ����
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
