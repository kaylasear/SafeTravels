package safe.model;

public class MaskUse {
  protected String CityName;
  protected String CountyName;
  protected String StateCode;
  protected Integer CountyFIPS;
  protected Double NEVER;
  protected Double RARELY;
  protected Double SOMETIMES;
  protected Double FREQUENTLY;
  protected Double ALWAYS;

  public MaskUse(String cityName, String countyName, String stateCode, Integer countyFIPS, Double NEVER, Double RARELY, Double SOMETIMES, Double FREQUENTLY, Double ALWAYS) {
    CityName = cityName;
    CountyName = countyName;
    StateCode = stateCode;
    CountyFIPS = countyFIPS;
    this.NEVER = NEVER;
    this.RARELY = RARELY;
    this.SOMETIMES = SOMETIMES;
    this.FREQUENTLY = FREQUENTLY;
    this.ALWAYS = ALWAYS;
  }

  public String getCityName() {
    return CityName;
  }

  public void setCityName(String cityName) {
    CityName = cityName;
  }

  public String getStateCode() {
    return StateCode;
  }

  public void setStateCode(String stateCode) {
    StateCode = stateCode;
  }

  public Integer getCountyFIPS() {
    return CountyFIPS;
  }

  public void setCountyFIPS(Integer countyFIPS) {
    CountyFIPS = countyFIPS;
  }

  public Double getNEVER() {
    return NEVER;
  }

  public void setNEVER(Double NEVER) {
    this.NEVER = NEVER;
  }

  public Double getRARELY() {
    return RARELY;
  }

  public void setRARELY(Double RARELY) {
    this.RARELY = RARELY;
  }

  public Double getSOMETIMES() {
    return SOMETIMES;
  }

  public void setSOMETIMES(Double SOMETIMES) {
    this.SOMETIMES = SOMETIMES;
  }

  public Double getFREQUENTLY() {
    return FREQUENTLY;
  }

  public void setFREQUENTLY(Double FREQUENTLY) {
    this.FREQUENTLY = FREQUENTLY;
  }

  public Double getALWAYS() {
    return ALWAYS;
  }

  public void setALWAYS(Double ALWAYS) {
    this.ALWAYS = ALWAYS;
  }

  public String getCountyName() {
    return CountyName;
  }
}
