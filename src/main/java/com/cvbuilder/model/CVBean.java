
package com.cvbuilder.model;

public class CVBean {

    private String fullName;
    private String professionalTitle;
    private String email;
    private String phoneNumber;
    private String linkedinGithub;
    private String profileSummary;

    private String highestDegree;
    private String institutionName;
    private String graduationYear;
    private String major;

    private String jobTitle;
    private String companyName;
    private String duration;
    private String responsibilities;

    private String technicalSkills;
    private String softSkills;
    private String sidebarColor = "#dbeafe";

    private String photoBase64;
    private String photoContentType;

    public CVBean() {
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getProfessionalTitle() {
        return professionalTitle;
    }

    public void setProfessionalTitle(String professionalTitle) {
        this.professionalTitle = professionalTitle;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getLinkedinGithub() {
        return linkedinGithub;
    }

    public void setLinkedinGithub(String linkedinGithub) {
        this.linkedinGithub = linkedinGithub;
    }

    public String getProfileSummary() {
        return profileSummary;
    }

    public void setProfileSummary(String profileSummary) {
        this.profileSummary = profileSummary;
    }

    public String getHighestDegree() {
        return highestDegree;
    }

    public void setHighestDegree(String highestDegree) {
        this.highestDegree = highestDegree;
    }

    public String getInstitutionName() {
        return institutionName;
    }

    public void setInstitutionName(String institutionName) {
        this.institutionName = institutionName;
    }

    public String getGraduationYear() {
        return graduationYear;
    }

    public void setGraduationYear(String graduationYear) {
        this.graduationYear = graduationYear;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getResponsibilities() {
        return responsibilities;
    }

    public void setResponsibilities(String responsibilities) {
        this.responsibilities = responsibilities;
    }

    public String getTechnicalSkills() {
        return technicalSkills;
    }

    public void setTechnicalSkills(String technicalSkills) {
        this.technicalSkills = technicalSkills;
    }

    public String getSoftSkills() {
        return softSkills;
    }

    public void setSoftSkills(String softSkills) {
        this.softSkills = softSkills;
    }

    public String getSidebarColor() {
    return sidebarColor;
}

    public void setSidebarColor(String sidebarColor) {
        this.sidebarColor = sidebarColor;
    }
    
    // Profile picture getters and setters
    public String getPhotoBase64() {
        return photoBase64;
    }

    public void setPhotoBase64(String photoBase64) {
        this.photoBase64 = photoBase64;
    }

    public String getPhotoContentType() {
        return photoContentType;
    }

    public void setPhotoContentType(String photoContentType) {
        this.photoContentType = photoContentType;
    }

    
    public boolean validate() {

        if (fullName == null || fullName.trim().isEmpty()) {
            return false;
        }

        if (professionalTitle == null || professionalTitle.trim().isEmpty()) {
            return false;
        }

        if (email == null
                || !email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
            return false;
        }

        if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
            return false;
        }

        if (linkedinGithub == null || linkedinGithub.trim().isEmpty()) {
            return false;
        }

        if (profileSummary == null || profileSummary.trim().isEmpty()) {
            return false;
        }

        if (highestDegree == null || highestDegree.trim().isEmpty()) {
            return false;
        }

        if (institutionName == null || institutionName.trim().isEmpty()) {
            return false;
        }

        if (graduationYear == null || graduationYear.trim().isEmpty()) {
            return false;
        }

        if (major == null || major.trim().isEmpty()) {
            return false;
        }

        if (jobTitle == null || jobTitle.trim().isEmpty()) {
            return false;
        }

        if (companyName == null || companyName.trim().isEmpty()) {
            return false;
        }

        if (duration == null || duration.trim().isEmpty()) {
            return false;
        }

        if (responsibilities == null || responsibilities.trim().isEmpty()) {
            return false;
        }

        if (technicalSkills == null || technicalSkills.trim().isEmpty()) {
            return false;
        }

        if (softSkills == null || softSkills.trim().isEmpty()) {
            return false;
        }

        return true;
    }

}
