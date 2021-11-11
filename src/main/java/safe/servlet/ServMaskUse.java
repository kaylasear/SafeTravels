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


@WebServlet("/maskuse")
public class ServMaskUse extends HttpServlet {

  protected MaskUseDao maskUseDao;

  @Override
  public void init() throws ServletException {
    maskUseDao = MaskUseDao.getInstance();
  }

  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    // Map for storing messages.
    Map<String, String> messages = new HashMap<>();
    req.setAttribute("messages", messages);

    // Defines paramaters in URL bar ie /maskuse?MaskUseId=5
    Integer maskUseId = Integer.valueOf(req.getParameter("MaskUseId"));

    List<MaskUse> maskUse = new ArrayList<>();

    try {
      if (maskUseId != null) {
        maskUse = maskUseDao.getMaskUseByMaskUseId(maskUseId);
        messages.put("title", "MaskUse for MaskUseId " + maskUseId);
      } else {
        messages.put("title", "Invalid maskUseId");
      }
    } catch (SQLException e) {
      e.printStackTrace();
      throw new IOException(e);
    }

    req.setAttribute("maskUse", maskUse);
    req.getRequestDispatcher("/MaskUse.jsp").forward(req, resp);
  }
}
