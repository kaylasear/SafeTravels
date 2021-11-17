package safe.dal;

import java.math.BigInteger;
import safe.model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import safe.model.*;


/**
 * Data access object (DAO) class to interact with the underlying
 */
public class ReviewsDao {
    protected ConnectionManager connectionManager;
    // Single pattern: instantiation is limited to one object.
    private static ReviewsDao instance = null;
    protected ReviewsDao() {
        connectionManager = new ConnectionManager();
    }
    public static ReviewDao getInstance() {
        if(instance == null) {
            instance = new ProfileDao();
        }
        return instance;
    }

    public User createReviews(Reviews review) throws SQLException {
        String insertReviews = "INSERT INTO Reviews(ReviewId, UserName, Created, UserReview, Rating, ProfileId) VALUES(?, ?, ?,?,?,?);";
        Connection connection = null;
        PreparedStatement insertStmt = null;

        try {
            connection = connectionManager.getConnection();
            insertStmt = connection.prepareStatement(insertReviews);
            insertStmt.setInt(1, review.getReviewId());
            insertStmt.setString(2, review.getUserName());
            insertStmt.setTimestamp(3, new Timestamp(review.getCreated().getTime());
            insertStmt.setString(4, review.getUserReview());
            insertStmt.setDouble(5, review.getRating());
            insertStmt.setInt(6, review.getProfileId());
            insertStmt.executeUpdate();
            return review;
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

    public List<Reviews> getReviewByStateName(String stateName) throws SQLException {

        List<Reviws> reviewList = new ArrayList<Reviews>();
        String selectLocation = "SELECT Reviews.* " +
                "FROM Reviews INNER JOIN StateProfile" +
                "ON Reviews.ProfileId = StateProfile.stateFIPS " +
                "WHERE StateProfile.stateName = ?\n;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;

        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectMaskUseByCountyFIPS);
            selectStmt.sertInt(1, stateName);
            results = selectStmt.executeQuery();

            while (results.next()) {
                Integer resultReviewId = results.getInt("ReviewId");
                String resultUserName = results.getString("UserName");
                Timestamp resultCreate = new Timestamp(results.getTimestamp("Created").getTime());
                String resultUserReview = results.getstring("UserReview");
                Double resultRating = results.getDouble("Rating");
                Integer resultProfileId = results.getInt("ProfileId");
                Reviews resultReview = new Reviews(resultReviewId, resultUserName,resultCreate,resultUserReview,resultRating,resultProfileId);
                reviewList.add(resultReview);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(selectStmt != null) {
                selectStmt.close();
            }
            if(results != null) {
                results.close();
            }
        }
        return reviewList;
    }

    public List<Reviews> getReviewByUserName(String userName) throws SQLException {


        List<Reviws> reviewList = new ArrayList<Reviews>();
        String county = location.concat(" county");
        String selectLocation = "";
        String selectLocation = "SELECT * FROM Profile " +
                "WHERE UserName = ?\n;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;

        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectMaskUseByCountyFIPS);
            selectStmt.setInt(1, profileId);
            results = selectStmt.executeQuery();

            while (results.next()) {
                Integer resultReviewId = results.getInt("ReviewId");
                String resultUserName = results.getString("UserName");
                Timestamp resultCreate = new Timestamp(results.getTimestamp("Created").getTime());
                String resultUserReview = results.getstring("UserReview");
                Double resultRating = results.getDouble("Rating");
                Integer resultProfileId = results.getInt("ProfileId");
                Reviews resultReview = new Reviews(resultReviewId, resultUserName,resultCreate,resultUserReview,resultRating,resultProfileId);
                reviewList.add(resultReview);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(selectStmt != null) {
                selectStmt.close();
            }
            if(results != null) {
                results.close();
            }
        }
        return reviewList;
    }

}
