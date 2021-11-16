package safe.dal;

import safe.model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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


	public List<Profile> getProfileByName(String name) throws SQLException {

		List<Profile> profiles = new ArrayList<Profile>();
		String county = name.concat(" county");
		String selectLocation = "";
		if (name.toLowerCase().equals("all")) {
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
			if (!name.toLowerCase().equals("all")) {
				selectStmt.setString(1, name);
				selectStmt.setString(2, name);
				selectStmt.setString(3, name.concat(" county"));
			}
			results = selectStmt.executeQuery();
			while (results.next()) {
				profiles.add(buildProfile(results));
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



	public Profile getProfileById(Integer profileId) throws SQLException {
		String selectLocation =
				"SELECT ProfileId, Date, StateFIPS, StateName, StateCode, SafetyRating, CovidCases, CovidDeaths, NumCounties " +
						"FROM Profile " +
						"INNER JOIN StateProfile USING (ProfileId) " +
						"WHERE ProfileId=?;";

		Connection connection = null;
		PreparedStatement selectStmt = null;
		ResultSet results = null;
		try {
			connection = connectionManager.getConnection();
			selectStmt = connection.prepareStatement(selectLocation);
			selectStmt.setInt(1, profileId);
			results = selectStmt.executeQuery();
			if (results.next()) {
				return buildProfile(results);
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
		return null;
	}

	private Profile buildProfile(ResultSet results) throws SQLException {
		Integer profileId = results.getInt("ProfileId");
		Date date = new Date(results.getTimestamp("Date").getTime());
		Integer covidCases = results.getInt("CovidCases");
		Integer covidDeaths = results.getInt("covidDeaths");

		Profile profile = new Profile(profileId, date, covidCases, covidDeaths);

		return profile;
	}

}
