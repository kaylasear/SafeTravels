package safe.model;

import java.time.LocalDateTime;
import java.util.Date;

//import java.text.*;
//import java.text.spi.*;

// Has-a Relationship (no inheritance, no 'extends')
public class Policy {
	
	// Do we need Integer profileId from Profile class?
	protected Integer policyId;
	protected CountyProfile stateCode;
	protected CountyProfile stateName;
	protected Integer fipsCode;
	protected String startStop;
	protected String totalPhases;
	protected LocalDateTime content;
	protected Date policyDate;
	
	public Policy(Integer policyId, CountyProfile countyName, , String stateCode, String stateName, Integer fipsCode,
			String startStop, String totalPhases, LocalDateTime content, Date policyDate) {
		// no super()
		this.stateCode = stateCode;
		this.stateName = stateName;
		this.fipsCode = fipsCode;
		this.startStop = startStop;
		this.totalPhases = totalPhases;
		this.content = content;
		this.policyDate = policyDate;
	}
	
	// Read-Only Implementation (only getters)
	
	public String getStateCode() {
		return stateCode;	
	}
	
	public String getStateName() {
		return stateName;
	}
	
	public Integer getFipsCode() {
		return fipsCode;
	}
	
	public String getStartStop(){
		return startStop;
	}
	
	public String getTotalPhases() {
		return totalPhases;
	}
	
	public LocalDateTime getContent() {
		return content;
	}
	
	public Date getPolicyDate() {
		return policyDate;
	}
	
}

