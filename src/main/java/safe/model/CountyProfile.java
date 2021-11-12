package safe.model;

public class CountyProfile {
  protected Integer ProfileId;
  protected String CountyName;
  protected Integer CountyFIPS;
  protected Integer MaskUseId;
  protected Integer StateProfileId;
  protected Integer NationalProfileId;
  protected Integer VaccinationId;
  protected Integer PolicyId;

  public CountyProfile(Integer profileId, String countyName, Integer countyFIPS, Integer maskUseId, Integer stateProfileId, Integer nationalProfileId, Integer vaccinationId, Integer policyId) {
    ProfileId = profileId;
    CountyName = countyName;
    CountyFIPS = countyFIPS;
    MaskUseId = maskUseId;
    StateProfileId = stateProfileId;
    NationalProfileId = nationalProfileId;
    VaccinationId = vaccinationId;
    PolicyId = policyId;
  }

  public Integer getProfileId() {
    return ProfileId;
  }

  public String getCountyName() {
    return CountyName;
  }

  public Integer getCountyFIPS() {
    return CountyFIPS;
  }

  public Integer getMaskUseId() {
    return MaskUseId;
  }

  public Integer getStateProfileId() {
    return StateProfileId;
  }

  public Integer getNationalProfileId() {
    return NationalProfileId;
  }

  public Integer getVaccinationId() {
    return VaccinationId;
  }

  public Integer getPolicyId() {
    return PolicyId;
  }
}
