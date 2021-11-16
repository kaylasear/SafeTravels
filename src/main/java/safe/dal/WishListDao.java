package safe.dal;

import safe.model.User;
import safe.model.WishList;

import java.sql.*;

public class WishListDao {
    protected ConnectionManager connectionManager;

    private static WishListDao instance = null;
    protected WishListDao() {
        connectionManager = new ConnectionManager();
    }
    public static WishListDao getInstance() {
        if (instance == null) {
            instance = new WishListDao();
        }
        return instance;
    }

    /**
     * Creates a User and adds it to our database
     * @param wishlist - new wishlist to add
     * @return the created user
     * @throws SQLException
     */
    public WishList createWishList(WishList wishlist) throws SQLException {
        String insertWishList = "INSERT INTO WishList(UserName, CityProfileId, StateProfileId," +
                "CountyProfileId) VALUES(?, ?, ?,?);";
        Connection connection = null;
        PreparedStatement insertStmt = null;
        ResultSet resultKey = null;
        //need a getStateProfileByI
        try {
            connection = connectionManager.getConnection();
            insertStmt = connection.prepareStatement(insertWishList,
                    Statement.RETURN_GENERATED_KEYS);
            insertStmt.setString(1, wishlist.getUser().getUserName());
            insertStmt.setNull(2, Types.INTEGER);
            if(wishlist.getStateProfile() == null){
                insertStmt.setNull(3, Types.INTEGER);
            }else {
                insertStmt.setInt(3, wishlist.getStateProfile().getProfileId());
            }
            if(wishlist.getCountyProfile() == null){
                insertStmt.setNull(4, Types.INTEGER);
            }else {
                insertStmt.setInt(4, wishlist.getCountyProfile().getProfileId());
            }

            insertStmt.executeUpdate();
            resultKey = insertStmt.getGeneratedKeys();
            int wishListId = -1;
            if(resultKey.next()) {
                wishListId = resultKey.getInt(1);
            } else {
                throw new SQLException("Unable to retrieve auto-generated key.");
            }
            wishlist.setWishListID(wishListId);
            return wishlist;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (insertStmt != null) {
                insertStmt.close();
            }
        }
    }



}
