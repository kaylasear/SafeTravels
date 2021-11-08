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


/**
 * Data access object (DAO) class to interact with the underlying
 */
public class ProfileDao {
	protected ConnectionManager connectionManager;
	// Single pattern: instantiation is limited to one object.
	private static ProfileDao instance = null;
	protected ProfileDao() {
		connectionManager = new ConnectionManager();
	}
	public static ProfileDao getInstance() {
		if(instance == null) {
			instance = new ProfileDao();
		}
		return instance;
	}


	public List<Profile> getProfileByLocation(String location) throws SQLException {

		List<Profile> profiles = new ArrayList<Profile>();
		String county = location.concat(" county");
		String selectLocation = "";
		if (location.toLowerCase().equals("all")) {
			selectLocation =
					"SELECT ProfileId, Date, CovidCases, CovidDeaths " +
							"FROM Profile " +
							"LEFT OUTER JOIN CountyProfile USING (ProfileId) " +
							"LEFT OUTER JOIN StateProfile USING (ProfileId);";
		}
		else {
			selectLocation =
					"SELECT ProfileId, Date, CovidCases, CovidDeaths " +
							"FROM Profile " +
							"LEFT OUTER JOIN CountyProfile USING (ProfileId) " +
							"LEFT OUTER JOIN StateProfile USING (ProfileId) " +
							"WHERE StateName=? OR StateCode=? OR CountyName=?;";
		}
		Connection connection = null;
		PreparedStatement selectStmt = null;
		ResultSet results = null;
		try {
			connection = connectionManager.getConnection();
			selectStmt = connection.prepareStatement(selectLocation);
			if (!location.toLowerCase().equals("all")) {
				selectStmt.setString(1, location);
				selectStmt.setString(2, location);
				selectStmt.setString(3, location.concat(" county"));
			}
			results = selectStmt.executeQuery();
			while (results.next()) {
				Integer profileId = results.getInt("ProfileId");
				Date date = new Date(results.getTimestamp("Date").getTime());
				Integer covidCases = results.getInt("CovidCases");
				Integer covidDeaths = results.getInt("covidDeaths");

				Profile profile = new Profile(profileId, date, covidCases, covidDeaths);
				profiles.add(profile);
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
		return profiles;
	}

}
