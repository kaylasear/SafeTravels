package safe.tools;

import safe.dal.MaskUseDao;
import safe.model.MaskUse;

import java.sql.SQLException;
import java.util.List;

public class Inserter {
  public static void main(String[] args) throws SQLException {

// Mask Use
    MaskUseDao maskUseDao = MaskUseDao.getInstance();

    // Get mask use by city name
    List<MaskUse> maskUseList = maskUseDao.getMaskUseByCity("Everett");
    for (MaskUse m : maskUseList) {
      System.out.format("Looping through maskUse: city:%s state:%s Always:%s \n",
        m.getCityName(), m.getStateCode(), m.getALWAYS());
    }

    // Get mask use by countyFIPS
    MaskUse maskUseCountyFIPS = maskUseDao.getMaskUseByCountyFIPS(53033);
    System.out.format("Getting maskUse by CountyFIPS: CountyFIPS:%s CountyName:%s State:%s Always:%s \n",
      maskUseCountyFIPS.getCountyFIPS(), maskUseCountyFIPS.getCountyName(), maskUseCountyFIPS.getStateCode(), maskUseCountyFIPS.getALWAYS());

    // Get mask use by 'like' string
    String likeString = "PA";
    List<MaskUse> maskUseListByString = maskUseDao.getMaskUseByString(likeString);
    for (MaskUse m : maskUseListByString) {
      System.out.format("Looping through maskUse by string like '%s': City:%s State:%s County:%s Always:%s \n",
        likeString, m.getCityName(), m.getStateCode(), m.getCountyName(), m.getALWAYS());
    }

    // Get average mask use by stateCode
    String stateCode = "MT";
    MaskUse avgMaskUseByState = maskUseDao.getAvgMaskUseByState(stateCode);
      System.out.format("Getting AvgMaskUse in state '%s': State:%s Always:%s Frequently:%s Sometimes:%s Rarely:%s Never:%s \n",
        stateCode,
        avgMaskUseByState.getStateCode(),
        avgMaskUseByState.getALWAYS(),
        avgMaskUseByState.getFREQUENTLY(),
        avgMaskUseByState.getSOMETIMES(),
        avgMaskUseByState.getRARELY(),
        avgMaskUseByState.getNEVER());
    }
  }



