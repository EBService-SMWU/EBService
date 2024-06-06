package util;
import java.sql.*;

public class BasketService {
	//history�� (userId, product_id) ��ȸ.
	//stored procedure, cursor, IF
	public static boolean isInHistory(String userId, String productId) {
		String query = "{call check_history(?,?,?)}";
		
		try (Connection connection = DatabaseUtil.getConnection();
				CallableStatement cstmt = connection.prepareCall(query);
			){
			cstmt.setString(1, userId);
			cstmt.setInt(2, Integer.parseInt(productId));
			cstmt.registerOutParameter(3, Types.NUMERIC);
			cstmt.execute();
			
			boolean inHistory =  (cstmt.getInt(3)==1);
			
			DatabaseUtil.closeConnection();
			return inHistory;
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	//basket�� (user_id, product_id) ��ȸ.
	//stored procedure, cursor, IF
	public static boolean isInBasket(String userId, String productId) {
		String query = "{call check_basket(?,?,?)}";
		
		try (Connection connection = DatabaseUtil.getConnection();
				CallableStatement cstmt = connection.prepareCall(query);
			){
			cstmt.setString(1, userId);
			cstmt.setInt(2, Integer.parseInt(productId));
			cstmt.registerOutParameter(3, Types.NUMERIC);
			cstmt.execute();
			
			boolean inBasket =  (cstmt.getInt(3)==1);
			
			DatabaseUtil.closeConnection();
			return inBasket;
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//basket ����
	//stored procedure, If
	//basket�� (user_id, product_id) ������ ����.
	//basket�� (user_id, product_id) ������ ����.
	public static boolean updateBasket(String userId, String productId, boolean inBasket) {
		String query = "{CALL update_basket(?, ?, ?)}";
		boolean result = false;
		
		try (Connection connection = DatabaseUtil.getConnection();
				CallableStatement cstmt = connection.prepareCall(query);
			){
			cstmt.setString(1, userId);
			cstmt.setInt(2, Integer.parseInt(productId));
			cstmt.setInt(3, inBasket?1:0);
			result = (cstmt.executeUpdate() > 0);

			DatabaseUtil.closeConnection();
			return result;
			
		}catch (SQLException e) {
			e.printStackTrace();
			return result;
		}
	}
}
