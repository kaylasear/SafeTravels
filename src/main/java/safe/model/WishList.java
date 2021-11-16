package safe.model;

public class WishList {
    protected int wishListID;
    protected User user;
    protected CityInformation cityProfile;
    protected StateProfile stateProfileID;
    protected CountyProfile countyProfileID;

    public WishList(User user, CityInformation cityProfile, StateProfile stateProfileID, CountyProfile countyProfileID) {
        this.user = user;
        this.cityProfile = cityProfile;
        this.stateProfileID = stateProfileID;
        this.countyProfileID = countyProfileID;
    }

    public WishList(int wishListID) {
        this.wishListID = wishListID;
    }

    public int getWishListID() {
        return wishListID;
    }

    public void setWishListID(int wishListID) {
        this.wishListID = wishListID;
    }

    public User getUser() {
        return user;
    }

    public void setUserName(User user) {
        this.user = user;
    }

    public CityInformation getCityProfile() {
        return cityProfile;
    }

    public void setCityProfile(CityInformation cityProfile) {
        this.cityProfile = cityProfile;
    }

    public StateProfile getStateProfile() {
        return stateProfileID;
    }

    public void setStateProfileID(StateProfile stateProfileID) {
        this.stateProfileID = stateProfileID;
    }

    public CountyProfile getCountyProfile() {
        return countyProfileID;
    }

    public void setCountyProfileID(CountyProfile countyProfileID) {
        this.countyProfileID = countyProfileID;
    }
}
