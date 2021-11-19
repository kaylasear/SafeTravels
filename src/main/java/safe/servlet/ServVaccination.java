package safe.servlet;

import safe.dal.*;
import safe.model.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/vaccination")
public class ServVaccination extends HttpServlet {
	
	protected VaccinationDao vaccinationDao;
	
	@Override
	public void init() throws ServletException{
		vaccinationDao = VaccinationDao.getInstance();
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, String> messages = new HashMap<>();
		req.setAttribute("messages", messages);
		Vaccination vacId = null;
		
		// Retrieve vaccination data depending on valid vaccinationId
		Integer vaccinationId = Integer.valueOf(req.getParameter("vaccinationId"));
		VaccinationDao vaccinationDao = VaccinationDao.getInstance();

		try {
			if (vaccinationId != null) {
				vacId = vaccinationDao.getVaccinationInformationByVacId(vaccinationId);
				messages.put("title", "Vaccination information by vaccinationId" + vaccinationId);
			}
				else {
					messages.put("title", "Invalid vaccination Id");
				}
				
		} catch (SQLException e) {
				e.printStackTrace();
				throw new IOException(e);
			}
			

		req.setAttribute("vaccinationId", vaccinationId);
		req.getRequestDispatcher("/Vaccination.jsp").forward(req, resp);
		
	}
}
