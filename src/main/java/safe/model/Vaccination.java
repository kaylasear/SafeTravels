package safe.model;

import java.util.Date;
import java.math.BigInteger;

// Has-a Relationship (does not extend CountyProfile, not an is-a relationship)
public class Vaccination{ 
	
	// Do we need profile Id?
	protected Integer vaccinationId;
	protected String countyName;
	protected Integer countyFIPS;
	protected Date date;
	protected Double vaccinationSeriesCompletePct;
	protected BigInteger vaccinationSeriesCompletePop;
	protected Double completenessPct;
	
	// no super() ?
	public Vaccination(Integer vaccinationId, String countyName, Integer countyFIPS,  Date date,
			Double vaccinationSeriesCompletePct, BigInteger vaccinationSeriesCompletePop, Double completenessPct) {
		this.vaccinationId = vaccinationId;
		this.date = date;
		this.countyName = countyName;
		this.countyFIPS = countyFIPS;
		this.vaccinationSeriesCompletePct = vaccinationSeriesCompletePct;
		this.vaccinationSeriesCompletePop = vaccinationSeriesCompletePop;
		this.completenessPct = completenessPct;		
	}
	
	public Integer getVaccinationId() {
		return vaccinationId;
	}
	
	public String getCountyName() {
		return countyName;
	}
	
	public Integer getCountyFIPS() {
		return countyFIPS;
	}
	
	public Date getdate() {
		return date;
	}

	public Double getVaccinationSeriesCompletePct() {
		return vaccinationSeriesCompletePct;
	}
	
	public BigInteger getVaccinationSeriesCompletePop() {
		return vaccinationSeriesCompletePop;
	}
	
	public Double getCompletenessPct() {
		return completenessPct;
	}
}
