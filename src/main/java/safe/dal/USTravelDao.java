//package safe.dal;
//import safe.model.Profile;
//import safe.model.StateProfile;
//import safe.model.USTravel;
//import safe.model.User;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//public class USTravelDao {
//    protected ConnectionManager connectionManager;
//
//    private static USTravelDao instance = null;
//    protected USTravelDao() {
//        connectionManager = new ConnectionManager();
//    }
//    public static USTravelDao getInstance() {
//        if (instance == null) {
//            instance = new USTravelDao();
//        }
//        return instance;
//    }
//
//    public USTravel getTravelStatisticsByProfileId(StateProfile stateProfile) throws SQLException {
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
//                String resultTravelID = result.getString("UserName");
//                String resultTravelID = result.getString("UserName");
//                String resultTravelID = result.getString("UserName");
//                String resultTravelID = result.getString("UserName");
//                String resultTravelID = result.getString("UserName");
//
//
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
