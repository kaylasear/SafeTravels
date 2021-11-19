package safe.servlet;

import safe.dal.ReviewsDao;
import safe.dal.UserDao;
import safe.model.Review;
import safe.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/reviewscreate")
public class ReviewsCreate extends HttpServlet {

    protected ReviewsDao reviewDao;

    @Override
    public void init() throws ServletException {
        reviewDao = ReviewsDao.getInstance();
    }

    /**
     * The doGet() method is called by the server (via the service method) to allow a servlet to handle a GET request.
     * Generally, we use the doGet() method for getting the information from the server.
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Map for storing messages.
        Map<String, String> messages = new HashMap<String, String>();
        req.setAttribute("messages", messages);
        //Just render the JSP.
        req.getRequestDispatcher("/ReviewsCreate.jsp").forward(req, resp);
    }


    /**
     * The doPost() method is called by the server (via the service method) to allow a servlet to handle a POST request.
     * Generally, we use the doPost() method for sending information to the server like HTML form data.
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Map for storing messages.\
        Date date = new Date();
        Map<String, String> messages = new HashMap<String, String>();
        req.setAttribute("messages", messages);

        // Retrieve and validate name.
        String userName = req.getParameter("username");
        if (userName == null || userName.trim().isEmpty()) {
            messages.put("success", "Invalid UserName");
        }
        else {

            try {

                String reviewId = req.getParameter("reviewId");
                String userName1 = req.getParameter("userName");
                Timestamp created = new Timestamp(date.getTime());
                String userReview = req.getParameter("userReview");
                String rating = req.getParameter("rating");
                String profileId = req.getParameter("profileId");
                
                Integer reviewId2 = Integer.parseInt(reviewId);
                Integer profileId2 = Integer.parseInt(profileId);
                Double rating2 = Double.parseDouble(rating);
                
                Review review = new Review(reviewId2,userName1,created,userReview,rating2,profileId2);
                review = reviewDao.createReviews(review);
                messages.put("success", "Successfully created " + userName);

            } catch (SQLException e) {
                e.printStackTrace();
                throw new IOException(e);
            }
        }

        req.getRequestDispatcher("/ReviewsCreate.jsp").forward(req, resp);
    }
}
