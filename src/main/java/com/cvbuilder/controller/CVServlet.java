
package com.cvbuilder.controller;

import com.cvbuilder.model.CVBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.util.Base64;

@MultipartConfig(
        maxFileSize = 2097152,
        maxRequestSize = 3145728
)
public class CVServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        CVBean cvBean = new CVBean();

        cvBean.setFullName(request.getParameter("fullName"));
        cvBean.setProfessionalTitle(request.getParameter("professionalTitle"));
        cvBean.setEmail(request.getParameter("email"));
        cvBean.setPhoneNumber(request.getParameter("phoneNumber"));
        cvBean.setLinkedinGithub(request.getParameter("linkedinGithub"));
        cvBean.setProfileSummary(request.getParameter("profileSummary"));

        cvBean.setHighestDegree(request.getParameter("highestDegree"));
        cvBean.setInstitutionName(request.getParameter("institutionName"));
        cvBean.setGraduationYear(request.getParameter("graduationYear"));
        cvBean.setMajor(request.getParameter("major"));

        cvBean.setJobTitle(request.getParameter("jobTitle"));
        cvBean.setCompanyName(request.getParameter("companyName"));
        cvBean.setDuration(request.getParameter("duration"));
        cvBean.setResponsibilities(request.getParameter("responsibilities"));

        cvBean.setTechnicalSkills(request.getParameter("technicalSkills"));
        cvBean.setSoftSkills(request.getParameter("softSkills"));

        String sidebarColor = request.getParameter("sidebarColor");

        if (sidebarColor == null || sidebarColor.isEmpty()) {
            sidebarColor = "#dbeafe";
        }

        cvBean.setSidebarColor(sidebarColor);

        Part photoPart = request.getPart("profilePhoto");

        if (photoPart != null && photoPart.getSize() > 0) {

            String contentType = photoPart.getContentType();

            if (!"image/jpeg".equals(contentType)
                    && !"image/png".equals(contentType)) {

                request.setAttribute("errorMessage",
                        "Please upload an image in JPG or PNG format.");

                RequestDispatcher dispatcher =
                        request.getRequestDispatcher("/cvError.jsp");

                dispatcher.forward(request, response);
                return;
            }

            byte[] imageBytes = photoPart.getInputStream().readAllBytes();

            String base64Image =
                    Base64.getEncoder().encodeToString(imageBytes);

            cvBean.setPhotoBase64(base64Image);
            cvBean.setPhotoContentType(contentType);
        }

        if (cvBean.validate()) {

            request.setAttribute("cvData", cvBean);

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("/cvView.jsp");

            dispatcher.forward(request, response);

        } else {

            request.setAttribute("errorMessage",
                    "Please enter your full name, a valid email, "
                    + "your highest degree, and at least one technical skill.");

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("/cvError.jsp");

            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("sample".equals(action)) {

            CVBean cvBean = new CVBean();

            cvBean.setFullName("Juliana Evans");
            cvBean.setProfessionalTitle("Junior Software Developer");
            cvBean.setEmail("juliana.evans@example.com");
            cvBean.setPhoneNumber("+60 12-345 6789");
            cvBean.setLinkedinGithub("https://github.com/julianaevans");
            cvBean.setProfileSummary(
                    "A motivated graduate with an interest in software "
                    + "development, problem solving, and information technology.");

            cvBean.setHighestDegree("Bachelor of Computer Science");
            cvBean.setInstitutionName("Oxford University");
            cvBean.setGraduationYear("2026");
            cvBean.setMajor("Computer Science");

            cvBean.setJobTitle("IT Intern");
            cvBean.setCompanyName("Expert Technology Sdn. Bhd.");
            cvBean.setDuration("June 2025 - August 2025");
            cvBean.setResponsibilities(
                    "Assisted with software testing, documentation, "
                    + "and basic technical support.");

            cvBean.setTechnicalSkills("Java, HTML, CSS, SQL");
            cvBean.setSoftSkills("Communication, teamwork, problem solving");

            // Set default sidebar color for sample CV
            cvBean.setSidebarColor("#dbeafe");

            request.setAttribute("cvData", cvBean);
            request.setAttribute("isSample", true);

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("/cvView.jsp");
            dispatcher.forward(request, response);

        } else {

            response.sendRedirect(
                    request.getContextPath() + "/cvForm.jsp");
        }
    }
}
