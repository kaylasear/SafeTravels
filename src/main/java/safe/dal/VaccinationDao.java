package safe.dal;

import safe.model.*;
import java.math.BigInteger;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.sql.Statement;

public class VaccinationDao {
	
	protected ConnectionManager connectionManager;
	
	private static VaccinationDao instance = null;
	
	protected VaccinationDao() {
		connectionManager = new ConnectionManager();
	}
	public static VaccinationDao getInstance() {
		if(instance == null) {
			instance = new VaccinationDao();
		}
		return instance;
	}
	
	public Vaccination getVaccinationByVacId(int vaccinationId) throws SQLException {
		
		String selectVaccination =
				
			"SELECT vaccinationId, countyName, countyFIPS, date, vaccinationSeriesCompletePct,vaccinationSeriesCompletePop,completenessPct " +
			"FROM Vaccination " +
			"WHERE VaccinationId=?;";
		Connection connection = null;
		PreparedStatement selectStmt = null;
		ResultSet results = null;
		try {
			connection = connectionManager.getConnection();
			selectStmt = connection.prepareStatement(selectVaccination);
			selectStmt.setInt(1, vaccinationId);
			results = selectStmt.executeQuery();
			
			if(results.next()) {
				int resultVaccinationId = results.getInt("VaccinationId");
				String resultcountyName = results.getString("CountyName");
				int resultCountyFIPS = results.getInt("CountyFIPS");
				Date resultdate =  new Date(results.getTimestamp("Date").getTime());
				Double resultVaccinationSeriesCompletePct = results.getDouble("VaccinationSeriesCompletePct");
				//BigInteger resultVaccinationSeriesCompletePop = ((BigInteger)results.getInt("VaccinationSeriesCompletePop");
				Double completenessPct = results.getDouble("CompletenessPct");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}

