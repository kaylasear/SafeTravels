package safe.dal;

import safe.model.CountyProfile;
import safe.model.Profile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CountyProfileDao {
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
        countyProfiles.add(countyProfile);
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

  public CountyProfile getCountyProfileByProfileId(Integer ProfileId) throws SQLException {
    List<CountyProfile> countyProfiles = new ArrayList<CountyProfile>();
    String selectCountyProfiles =
            "select ProfileId, CountyName, CountyFIPS, GeoLocation, MaskUseId,\n" +
                    "       StateProfileId, NationalProfileId, VaccinationID, PolicyId\n" +
                    "from countyprofile\n" +
                    "where ProfileId = ?;";
    Connection connection = null;
    PreparedStatement selectStmt = null;
    ResultSet results = null;
    try {
      connection = connectionManager.getConnection();
      selectStmt = connection.prepareStatement(selectCountyProfiles);
      selectStmt.setInt(1, ProfileId);

      results = selectStmt.executeQuery();
      if (results.next()) {
//        Integer ProfileId = results.getInt("ProfileId");
        String CountyName = results.getString("CountyName");
        Integer CountyFIPS = results.getInt("CountyFIPS");
        Integer GeoLocation = results.getInt("GeoLocation");
        Integer MaskUseId = results.getInt("MaskUseId");
        Integer StateProfileId = results.getInt("StateProfileId");
        Integer NationalProfileId = results.getInt("NationalProfileId");
        Integer VaccinationID = results.getInt("VaccinationID");
        Integer PolicyId = results.getInt("PolicyId");

        return new CountyProfile(ProfileId, CountyName, CountyFIPS, MaskUseId, StateProfileId,
                NationalProfileId, VaccinationID, PolicyId);
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



}
