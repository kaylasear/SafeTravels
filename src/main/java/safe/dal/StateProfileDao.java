package safe.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import safe.model.StateProfile;

public class StateProfileDao extends ProfileDao {
  private static StateProfileDao instance = null;
  protected StateProfileDao() {super(); }
  public static StateProfileDao getInstance() {
    if (instance == null) {
      instance = new StateProfileDao();
    }
    return instance;
  }

  public List<StateProfile> getStateProfiles() throws SQLException {

    List<StateProfile> stateProfiles = new ArrayList<StateProfile>();

    String selectLocation =
        "SELECT ProfileId, Date, StateFIPS, StateName, StateCode, SafetyRating, CovidCases, CovidDeaths, NumCounties " +
            "FROM Profile " +
            "INNER JOIN StateProfile USING (ProfileId);";

    Connection connection = null;
    PreparedStatement selectStmt = null;
    ResultSet results = null;
    try {
      connection = connectionManager.getConnection();
      selectStmt = connection.prepareStatement(selectLocation);
      results = selectStmt.executeQuery();
      while (results.next()) {
        Integer profileId = results.getInt("ProfileId");
        Date date = new Date(results.getTimestamp("Date").getTime());
        Integer covidCases = results.getInt("CovidCases");
        Integer covidDeaths = results.getInt("covidDeaths");
        Integer stateFIPS = results.getInt("StateFIPS");
        String stateName = results.getString("StateName");
        String stateCode = results.getString("StateCode");
        Integer numCounties = results.getInt("NumCounties");
        Double safetyRating = results.getDouble("SafetyRating");


        StateProfile stateProfile = new StateProfile(profileId, date, covidCases, covidDeaths,
            stateFIPS, stateCode, stateName, numCounties, safetyRating);
        stateProfiles.add(stateProfile);
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
    return stateProfiles;
  }
}
