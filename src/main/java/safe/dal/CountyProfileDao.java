package safe.dal;

import safe.model.CountyProfile;
import safe.model.Profile;
import safe.model.StateProfile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CountyProfileDao extends ProfileDao {
  protected ConnectionManager connectionManager;
  private static CountyProfileDao instance = null;
  protected CountyProfileDao() {
    connectionManager = new ConnectionManager();
  }
  public static CountyProfileDao getInstance() {
    if(instance == null) {
      instance = new CountyProfileDao();
    }
    return instance;
  }

  /**
   * get counties from state profile ID
   * @param stateProfileId - state ID
   * @return a list of all the counties in the state
   * @throws SQLException
   */
  public List<CountyProfile> getCountyProfilesByStateProfileId(Integer stateProfileId) throws SQLException {
    List<CountyProfile> countyProfiles = new ArrayList<CountyProfile>();
    String selectCountyProfiles =
      "select ProfileId, CountyName, CountyFIPS, GeoLocation, MaskUseId,\n" +
      "       StateProfileId, NationalProfileId, VaccinationID, PolicyId\n" +
      "from countyprofile\n" +
      "where stateprofileid = ?;";
    Connection connection = null;
    PreparedStatement selectStmt = null;
    ResultSet results = null;
    try {
      connection = connectionManager.getConnection();
      selectStmt = connection.prepareStatement(selectCountyProfiles);
      selectStmt.setInt(1, stateProfileId);

      results = selectStmt.executeQuery();
      while (results.next()) {
        countyProfiles.add(buildCountyProfile(results));
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
    return countyProfiles;
  }

  /**
   * get CountyProfile by its ID
   * @param ProfileId - the county ID
   * @return a new CountyProfile
   * @throws SQLException
   */
  public CountyProfile getCountyProfileByProfileId(Integer ProfileId) throws SQLException {
    String selectCountyProfiles =
            "select ProfileId, CountyName, CountyFIPS, GeoLocation, MaskUseId,\n" +
                    "       StateProfileId, NationalProfileId, VaccinationID, PolicyId\n" +
                    "from countyprofile\n" +
                    "where ProfileId = ?;";
    Connection connection = null;
    PreparedStatement selectStmt = null;
    ResultSet result = null;
    try {
      connection = connectionManager.getConnection();
      selectStmt = connection.prepareStatement(selectCountyProfiles);
      selectStmt.setInt(1, ProfileId);

      result = selectStmt.executeQuery();
      if (result.next()) {
        return buildCountyProfile(result);
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
      if(result != null) {
        result.close();
      }
    }
    return null;

  }

  /**
   * Get CountyProfile by county name
   * @param countyName - name of the county
   * @return a new CountyProfile
   * @throws SQLException
   */
  public CountyProfile getCountyByCountyName(String countyName) throws SQLException {
    String selectCounty =
            "select ProfileId, CountyName, CountyFIPS, GeoLocation, MaskUseId,\n" +
                    "       StateProfileId, NationalProfileId, VaccinationID, PolicyId\n" +
                    "from countyprofile\n" +
                    "where CountyName = ?;";
    Connection connection = null;
    PreparedStatement selectStmt = null;
    ResultSet result = null;

    try {
      connection = connectionManager.getConnection();
      selectStmt = connection.prepareStatement(selectCounty);
      selectStmt.setString(1, countyName);
      result = selectStmt.executeQuery();

      if (result.next()) {
        return buildCountyProfile(result);
      }
    } catch (SQLException e) {
      e.printStackTrace();
      throw e;
    } finally {
      if (connection != null) {
        connection.close();
      }
      if (selectStmt != null) {
        selectStmt.close();
      }
      if (result != null) {
        result.close();
      }
    }
    return null;
  }

  /**
   * Gets a CountyProfile by its FIPS
   * @param fips - the FIPS number for the county
   * @return a new CountyProfile
   * @throws SQLException
   */
  public CountyProfile getCountyByCountyFIPS(Integer fips) throws SQLException {
    String selectCounty =
            "select ProfileId, CountyName, CountyFIPS, GeoLocation, MaskUseId,\n" +
                    "       StateProfileId, NationalProfileId, VaccinationID, PolicyId\n" +
                    "from countyprofile\n" +
                    "where CountyFIPS = ?;";
    Connection connection = null;
    PreparedStatement selectStmt = null;
    ResultSet result = null;

    try {
      connection = connectionManager.getConnection();
      selectStmt = connection.prepareStatement(selectCounty);
      selectStmt.setInt(1, fips);
      result = selectStmt.executeQuery();

      if (result.next()) {
        return buildCountyProfile(result);
      }
    } catch (SQLException e) {
      e.printStackTrace();
      throw e;
    } finally {
      if (connection != null) {
        connection.close();
      }
      if (selectStmt != null) {
        selectStmt.close();
      }
      if (result != null) {
        result.close();
      }
    }
    return null;
  }

  /**
   * builds a CountyProfile object
   * @param results - MySQL results from query
   * @return a new CountyProfile object
   * @throws SQLException
   */
  private CountyProfile buildCountyProfile(ResultSet results) throws SQLException {
    Integer ProfileId = results.getInt("ProfileId");
    String CountyName = results.getString("CountyName");
    Integer CountyFIPS = results.getInt("CountyFIPS");
    Integer GeoLocation = results.getInt("GeoLocation");
    Integer MaskUseId = results.getInt("MaskUseId");
    Integer StateProfileId = results.getInt("StateProfileId");
    Integer NationalProfileId = results.getInt("NationalProfileId");
    Integer VaccinationID = results.getInt("VaccinationID");
    Integer PolicyId = results.getInt("PolicyId");

    CountyProfile countyProfile = new CountyProfile(ProfileId, CountyName, CountyFIPS, MaskUseId, StateProfileId,
        NationalProfileId, VaccinationID, PolicyId);
    return countyProfile;
  }

}
