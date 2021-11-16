//package safe.dal;
//import safe.model.Profile;
//import safe.model.USTravel;
//import safe.model.User;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//public class USTravelsDao {
//    protected ConnectionManager connectionManager;
//
//    private static USTravelsDao instance = null;
//    protected USTravelsDao() {
//        connectionManager = new ConnectionManager();
//    }
//    public static USTravelsDao getInstance() {
//        if (instance == null) {
//            instance = new USTravelsDao();
//        }
//        return instance;
//    }
//
//    public USTravel getTravelStatisticsByProfileId(Profile profile) throws SQLException {
//        String selectTravelStatsById = "SELECT * FROM USTravel where ProfileId=?;";
//        Connection connection = null;
//        PreparedStatement selectStmt = null;
//        ResultSet result = null;
//
//        try {
//            connection = connectionManager.getConnection();
//            selectStmt = connection.prepareStatement(selectTravelStatsById);
//            selectStmt.setInt(1, profile.getProfileId());
//
//            if (result.next()) {
//                String resultTravelID = result.getString("UserName");
//                String email = result.getString("Email");
//                String password = result.getString("Password");
//
//                User user = new User(resultUserName, email, password);
//                return user;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw e;
//        } finally {
//            if (connection != null) {
//                connection.close();
//            }
//            if (selectStmt != null) {
//                selectStmt.close();
//            }
//            if (result != null) {
//                result.close();
//            }
//        }
//        return null;
//    }
//}
//
