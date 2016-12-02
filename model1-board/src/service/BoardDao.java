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
public class BoardDao {
	private final String driverClassName = "com.mysql.jdbc.Driver"; //jdbc ����̹� Ŭ���� �̸�
	private final String url = "jdbc:mysql://127.0.0.1:3306/injava?useUnicode=true&characterEncoding=euckr";
	private final String username = "root";
	private final String password = "java0000";
	int totalRowCount;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	Board b = null;
	ArrayList<Board> arr = null;
	//���̺� : board , ��� : �˻�
	public ArrayList<Board> search(String sk,String sv){
		System.out.println("-------search ���� -------");
		arr = new ArrayList<Board>();
		conn = getConnection();
		try {
			
			stmt = conn.prepareStatement("SELECT * FROM board WHERE "+sk+" LIKE ?");
			stmt.setString(1, "%"+sv+"%");
			System.out.println("------stmt--------");
			
			System.out.println(stmt+"<--stmt");
			rs = stmt.executeQuery();
			while(rs.next()){
				Board b = new Board();
				b.setBoardNo(rs.getInt("board_no"));
				b.setBoardTitle(rs.getString("board_title"));
				b.setBoardUser(rs.getString("board_user"));
				b.setBoardDate(rs.getString("board_date"));
				b.setBoardContent(rs.getString("board_content"));
				arr.add(b);
			}
				
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			this.close(conn, stmt, rs);
		}
		
	
		return arr;
		
	}
	
	
	
	// ���̺� : board , ��� : ������ ���� 
	public int updateBoard(Board board) {
		conn =getConnection();
		int result =0;
		try {
			stmt = conn.prepareStatement(
					"UPDATE board SET board_title=?,board_user=?,board_content=? WHERE board_no=? and board_pw = ?");
			stmt.setString(1, board.getBoardTitle());
			stmt.setString(2, board.getBoardTitle());
			stmt.setString(3, board.getBoardContent());
			stmt.setInt(4, board.getBoardNo());
			stmt.setString(5, board.getBoardPw());
			
			result=stmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			this.close(conn, stmt, rs);
		}
		return result;
	}
	
	// ���̺� : board , ��� : ������ ���� 
	public int deleteBoard(Board board) {
		conn= getConnection();
		int result = 0;
		try {
			stmt = conn.prepareStatement("DELETE FROM board WHERE board_no=? and board_pw=?");
			stmt.setInt(1, board.getBoardNo());
			stmt.setString(2, board.getBoardPw());
			result = stmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			this.close(conn,stmt,rs);
		}
		
		return result;
	}
	
	// ���̺� : board , ��� : �ϳ��� ������ ��������
	public Board selectBoardByKey(int boardNo) {
		Board bo = new Board();
		conn = this.getConnection();
		try {
			stmt = conn.prepareStatement("SELECT board_no,board_title,board_user,board_content,board_date FROM board WHERE board_no=?");
			stmt.setInt(1, boardNo);
			System.out.println(stmt+"<--stmt");
			rs = stmt.executeQuery();
			rs.next();
			bo.setBoardNo(rs.getInt("board_no"));
			bo.setBoardTitle(rs.getString("board_title"));
			bo.setBoardUser(rs.getString("board_user"));
			bo.setBoardDate(rs.getString("board_date"));
			bo.setBoardContent(rs.getString("board_content"));
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			this.close(conn,stmt,rs);
		}
		
		return bo;
	}
	
	// ���̺� : board , ��� : �� �������� ������ �������� 
	public List<Board> selectBoardListPerPage(int beginRow, int pagePerRow) {
		
			conn = this.getConnection();
			List<Board> boards = new ArrayList<Board>();//���� �迭 ����
			try {
				stmt = conn.prepareStatement("SELECT board_no, board_title, board_user, board_date FROM board ORDER BY board_no DESC LIMIT ?, ?");
				stmt.setInt(1, beginRow); //�ش� ������ ��� ���� ��ȣ�� �ۺ���
				stmt.setInt(2, pagePerRow); //������ ����
				System.out.println(stmt+"<--stmt");
				rs = stmt.executeQuery();
			
				while(rs.next()){
					Board bo = new Board();//���� ��ü ����
					bo.setBoardNo(rs.getInt("board_no"));
					bo.setBoardTitle(rs.getString("board_title"));
					bo.setBoardUser(rs.getString("board_user"));
					bo.setBoardDate(rs.getString("board_date"));
					boards.add(bo); //���� �迭�� ���尴ü �߰�
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally{
				this.close(conn,stmt,rs);
			}
			
		
		return boards;
	}
	
	// ���̺� : board , ��� : ��ü �ο� ī���� ��������
	public int selectTotalBoardCount() {
		
		
		conn = this.getConnection();
		
		try {
			stmt = conn.prepareStatement("SELECT COUNT(*) FROM board");
			rs = stmt.executeQuery();
			rs.next();
			totalRowCount = rs.getInt(1);
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
		this.close(conn,stmt,rs);
		return totalRowCount;
		}
	}
	
	// ���̺� : board , ��� : ������ �Է��ϱ�
	public int insertBoard(Board board) {
		int rowCount = 0;

		try {
			conn = this.getConnection();
			stmt = conn.prepareStatement("INSERT INTO board(board_title,board_user,board_pw,board_content,board_date) VALUES(?,?,?,?,now())");
			stmt.setString(1,board.getBoardTitle());
			stmt.setString(2,board.getBoardUser());
			stmt.setString(3,board.getBoardPw());
			stmt.setString(4,board.getBoardContent());
			System.out.println(stmt+"<--stmt");
			
			rowCount = stmt.executeUpdate();
			
			System.out.println(rowCount);
			
		} catch (Exception e) {
			
		} finally {
			this.close(conn, stmt, null);
		}
		return rowCount;
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
