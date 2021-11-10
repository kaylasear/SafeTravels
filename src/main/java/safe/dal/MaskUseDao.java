package safe.dal;

import safe.model.MaskUse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MaskUseDao {
  protected ConnectionManager connectionManager;
  private static MaskUseDao instance = null;

  protected MaskUseDao() {
    connectionManager = new ConnectionManager();
  }

  public static MaskUseDao getInstance() {
    if (instance == null) {
      instance = new MaskUseDao();
    }
    return instance;
  }

  public List<MaskUse> getMaskUseByCity(String cityName) throws SQLException {
    String selectMaskUseByCity =
      "select locTable.CityName, locTable.CountyName, locTable.StateCode, maskuse.CountyFIPS ,ALWAYS, FREQUENTLY, SOMETIMES, RARELY, NEVER\n" +
        "from maskuse join (\n" +
        "    select CityName, StateCode, CountyName, CountyFIPS\n" +
        "    from location\n" +
        "    where CityName = ?" +
        "    ) as locTable\n" +
        "on maskuse.CountyFIPS = locTable.CountyFIPS;";
    Connection connection = null;
    PreparedStatement selectStmt = null;
    ResultSet results = null;
    List<MaskUse> maskUseList = new ArrayList<>();

    try {
      connection = connectionManager.getConnection();
      selectStmt = connection.prepareStatement(selectMaskUseByCity);
      selectStmt.setString(1, cityName);
      results = selectStmt.executeQuery();

      while (results.next()) {
        String CityName = results.getString("CityName");
        String CountyName = results.getString("CountyName");
        String StateCode = results.getString("stateCode");
        Integer CountyFIPS = results.getInt("countyFIPS");
        Double NEVER = results.getDouble("NEVER");
        Double RARELY = results.getDouble("RARELY");
        Double SOMETIMES = results.getDouble("SOMETIMES");
        Double FREQUENTLY = results.getDouble("FREQUENTLY");
        Double ALWAYS = results.getDouble("ALWAYS");


        maskUseList.add(new MaskUse(CityName, CountyName, StateCode, CountyFIPS, NEVER, RARELY, SOMETIMES, FREQUENTLY, ALWAYS));
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
      if (results != null) {
        results.close();
      }
    }
    return maskUseList;
  }

  public List<MaskUse> getMaskUseByString(String string) throws SQLException {
    String selectMaskUseByString =
      "select locTable.CityName, locTable.CountyName, locTable.StateCode, maskuse.CountyFIPS ,ALWAYS, FREQUENTLY, SOMETIMES, RARELY, NEVER\n" +
        "from maskuse join (\n" +
        "    select CityName, StateCode, CountyName, CountyFIPS\n" +
        "    from location\n" +
        "    where CityName like ? or CountyName like ? or StateCode like ?\n" +
        ") as locTable\n" +
        "on maskuse.CountyFIPS = locTable.CountyFIPS;";
    Connection connection = null;
    PreparedStatement selectStmt = null;
    ResultSet results = null;
    List<MaskUse> maskUseList = new ArrayList<>();

    try {
      connection = connectionManager.getConnection();
      selectStmt = connection.prepareStatement(selectMaskUseByString);
      selectStmt.setString(1, string.concat("%"));
      selectStmt.setString(2, string.concat("%"));
      selectStmt.setString(3, string.concat("%"));

      results = selectStmt.executeQuery();

      while (results.next()) {
        String CityName = results.getString("CityName");
        String CountyName = results.getString("CountyName");
        String StateCode = results.getString("stateCode");
        Integer CountyFIPS = results.getInt("countyFIPS");
        Double NEVER = results.getDouble("NEVER");
        Double RARELY = results.getDouble("RARELY");
        Double SOMETIMES = results.getDouble("SOMETIMES");
        Double FREQUENTLY = results.getDouble("FREQUENTLY");
        Double ALWAYS = results.getDouble("ALWAYS");


        maskUseList.add(new MaskUse(CityName, CountyName, StateCode, CountyFIPS, NEVER, RARELY, SOMETIMES, FREQUENTLY, ALWAYS));
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
      if (results != null) {
        results.close();
      }
    }
    return maskUseList;
  }

  public MaskUse getMaskUseByCountyFIPS(Integer countyFIPS) throws SQLException {
    String selectMaskUseByCountyFIPS =
      "select locTable.CityName,locTable.CountyName, locTable.StateCode, maskuse.CountyFIPS ,ALWAYS, FREQUENTLY, SOMETIMES, RARELY, NEVER\n" +
        "from maskuse join (\n" +
        "  select CityName, StateCode, CountyName, CountyFIPS\n" +
        "  from location\n" +
        "  where CountyFIPS = ?\n" +
        "  ) as locTable\n" +
        "on maskuse.CountyFIPS = locTable.CountyFIPS\n" +
        "LIMIT 1;";
    Connection connection = null;
    PreparedStatement selectStmt = null;
    ResultSet results = null;

    try {
      connection = connectionManager.getConnection();
      selectStmt = connection.prepareStatement(selectMaskUseByCountyFIPS);
      selectStmt.setInt(1, countyFIPS);
      results = selectStmt.executeQuery();

      if (results.next()) {
        String CityName = results.getString("CityName");
        String CountyName = results.getString("CountyName");
        String StateCode = results.getString("stateCode");
        Integer CountyFIPS = results.getInt("countyFIPS");
        Double NEVER = results.getDouble("NEVER");
        Double RARELY = results.getDouble("RARELY");
        Double SOMETIMES = results.getDouble("SOMETIMES");
        Double FREQUENTLY = results.getDouble("FREQUENTLY");
        Double ALWAYS = results.getDouble("ALWAYS");

        return new MaskUse(null, CountyName, StateCode, CountyFIPS, NEVER, RARELY, SOMETIMES, FREQUENTLY, ALWAYS);
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
      if (results != null) {
        results.close();
      }
    }
    return null;
  }


  public MaskUse getAvgMaskUseByState(String stateCode) throws SQLException {
    String selectMaskUseByString =
        "  select locTable.StateCode, AVG(NEVER) as NEVER, AVG(RARELY) as RARELY, AVG(SOMETIMES) as SOMETIMES, AVG(FREQUENTLY) as FREQUENTLY, AVG(ALWAYS) as ALWAYS\n" +
        "  from maskuse join (\n" +
        "  select CityName, StateCode, CountyName, CountyFIPS\n" +
        "  from location\n" +
        "  where StateCode = ?\n" +
        "  ) as locTable\n" +
        "  on maskuse.CountyFIPS = locTable.CountyFIPS\n" +
        "  ;";
    Connection connection = null;
    PreparedStatement selectStmt = null;
    ResultSet results = null;
    List<MaskUse> maskUseList = new ArrayList<>();

    try {
      connection = connectionManager.getConnection();
      selectStmt = connection.prepareStatement(selectMaskUseByString);
      selectStmt.setString(1, stateCode);

      results = selectStmt.executeQuery();

      if(results.next()) {
//        String CityName = results.getString("CityName");
//        String CountyName = results.getString("CountyName");
        String StateCode = results.getString("stateCode");
//        Integer CountyFIPS = results.getInt("countyFIPS");
        Double NEVER = results.getDouble("NEVER");
        Double RARELY = results.getDouble("RARELY");
        Double SOMETIMES = results.getDouble("SOMETIMES");
        Double FREQUENTLY = results.getDouble("FREQUENTLY");
        Double ALWAYS = results.getDouble("ALWAYS");


        return (new MaskUse(null, null, StateCode, null, NEVER, RARELY, SOMETIMES, FREQUENTLY, ALWAYS));
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
      if (results != null) {
        results.close();
      }
    }
    return null;
  }
}
