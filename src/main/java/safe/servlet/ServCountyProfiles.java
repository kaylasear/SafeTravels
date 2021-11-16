package safe.servlet;

import safe.dal.*;
import safe.model.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/countyprofile")
public class ServCountyProfiles extends HttpServlet {

    protected CountyProfileDao countyProfileDao;

    @Override
    public void init() throws ServletException {
        countyProfileDao = CountyProfileDao.getInstance();
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Map for storing messages.
        Map<String, String> messages = new HashMap<>();
        req.setAttribute("messages", messages);

        // Defines paramaters in URL bar ie /countyprofile?stateProfileId=5
        Integer profileId = Integer.valueOf(req.getParameter("stateProfileId"));

        List<CountyProfile> countyProfiles = new ArrayList<>();
        System.out.println(profileId);
        try {
            if (profileId != null) {
                countyProfiles = countyProfileDao.getCountyProfilesByStateProfileId(profileId);
                messages.put("title", "County Profiles for state " + profileId);
            } else {
                messages.put("title", "Invalid profileId");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new IOException(e);
        }

        req.setAttribute("countyProfiles", countyProfiles);
        req.getRequestDispatcher("/StateCountyProfiles.jsp").forward(req, resp);
    }
}