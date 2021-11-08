package safe.servlet;

import safe.dal.*;
import safe.model.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**

 */
@WebServlet("/stateprofile")
public class FindStateProfiles extends HttpServlet {

  protected StateProfileDao stateProfileDao;

  @Override
  public void init() throws ServletException {
    stateProfileDao = StateProfileDao.getInstance();
  }

  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    // Map for storing messages.
    Map<String, String> messages = new HashMap<String, String>();
    req.setAttribute("messages", messages);

    List<StateProfile> stateProfiles = new ArrayList<>();

    // Retrieve and validate location.
    // location is retrieved from the URL query string.
    String location = req.getParameter("location");
    if (location == null || location.trim().isEmpty()) {
      messages.put("success", "Please enter a valid location.");
    } else {
      // Retrieve location data, and store as a message.
      try {
        stateProfiles = stateProfileDao.getStateProfiles();
      } catch (SQLException e) {
        e.printStackTrace();
        throw new IOException(e);
      }
      messages.put("success", "Displaying results for states");
      // Save the previous search term, so it can be used as the default
      // in the input box when rendering FindUsers.jsp.
//      messages.put("previous location", location);
    }
    req.setAttribute("stateprofile", stateProfiles);

    req.getRequestDispatcher("/StateProfile.jsp").forward(req, resp);
  }

  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    // Map for storing messages.
    Map<String, String> messages = new HashMap<String, String>();
    req.setAttribute("messages", messages);

    List<StateProfile> stateProfiles = new ArrayList<>();

    // Retrieve and validate name.
    // firstname is retrieved from the form POST submission. By default, it
    // is populated by the URL query string (in FindUsers.jsp).
    String location = req.getParameter("location");
    if (location == null || location.trim().isEmpty()) {
      messages.put("success", "Please enter a valid name.");
    } else {
      // Retrieve BlogUsers, and store as a message.
      try {
        stateProfiles = stateProfileDao.getStateProfiles();
      } catch (SQLException e) {
        e.printStackTrace();
        throw new IOException(e);
      }
      messages.put("success", "Displaying results for State Profiles");
    }
    req.setAttribute("stateProfiles", stateProfiles);

    req.getRequestDispatcher("/StateProfile.jsp").forward(req, resp);
  }
}
