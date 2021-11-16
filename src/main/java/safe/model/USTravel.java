package safe.model;

public class USTravel {
    protected int travelID;
    protected int stateFIPS;
    protected Profile profile;
    protected long popStayingAtHome;
    protected long popNotStayingAtHome;
    protected double percentTakingTrips;

    public USTravel(int stateFIPS, Profile profile, long popStayingAtHome, long popNotStayingAtHome, double percentTakingTrips) {
        this.stateFIPS = stateFIPS;
        this.profile = profile;
        this.popStayingAtHome = popStayingAtHome;
        this.popNotStayingAtHome = popNotStayingAtHome;
        this.percentTakingTrips = percentTakingTrips;
    }

    public USTravel(int travelID) {
        this.travelID = travelID;
    }

    public int getTravelID() {
        return travelID;
    }

    public void setTravelID(int travelID) {
        this.travelID = travelID;
    }

    public int getStateFIPS() {
        return stateFIPS;
    }

    public void setStateFIPS(int stateFIPS) {
        this.stateFIPS = stateFIPS;
    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    public long getPopStayingAtHome() {
        return popStayingAtHome;
    }

    public void setPopStayingAtHome(long popStayingAtHome) {
        this.popStayingAtHome = popStayingAtHome;
    }

    public long getPopNotStayingAtHome() {
        return popNotStayingAtHome;
    }

    public void setPopNotStayingAtHome(long popNotStayingAtHome) {
        this.popNotStayingAtHome = popNotStayingAtHome;
    }

    public double getPercentTakingTrips() {
        return percentTakingTrips;
    }

    public void setPercentTakingTrips(double percentTakingTrips) {
        this.percentTakingTrips = percentTakingTrips;
    }
}
