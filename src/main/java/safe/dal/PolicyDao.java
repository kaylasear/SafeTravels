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

public class PolicyDao {
	

protected ConnectionManager connectionManager;
	
	private static PolicyDao instance = null;
	
	protected PolicyDao() {
		connectionManager = new ConnectionManager();
	}
	public static PolicyDao getInstance() {
		if(instance == null) {
			instance = new PolicyDao();
		}
		return instance;	
	}		
	
	
		
}
