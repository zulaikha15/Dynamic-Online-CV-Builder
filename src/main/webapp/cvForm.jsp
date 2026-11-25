<%-- 
    Document   : cvForm
    Created on : Oct 28, 2026, 11:25:43 AM
    Author     : Asus'
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Dynamic Online CV Builder</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

    <!-- Custom CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .preview-paper {
            width: 210mm;
            min-height: 297mm;
            background: white;
            display: flex;
            flex-direction: column;
            margin: auto;
            overflow: hidden;
        }

        .preview-main {
            display: flex;
            flex: 1;
            min-height: 297mm;
        }

        .preview-sidebar {
            width: 33.333%;
            flex-shrink: 0;
            padding: 25px 20px;
            word-wrap: break-word;
        }

        .preview-content {
            width: 66.667%;
            padding: 35px 30px;
            word-wrap: break-word;
        }

        .preview-photo {
            width: 130px;
            height: 130px;
            object-fit: cover;
            border-radius: 50%;
            display: block;
            margin: 0 auto 20px;
        }

        .preview-section-title {
            font-size: 15px;
            font-weight: bold;
            letter-spacing: 1px;
            margin-top: 22px;
            margin-bottom: 10px;
            border-bottom: 1px solid rgba(0,0,0,0.2);
            padding-bottom: 5px;
        }

        .preview-content-title {
            font-size: 30px;
            font-weight: bold;
            text-transform: uppercase;
            overflow-wrap: anywhere;
        }

        .preview-professional-title {
            font-size: 16px;
            margin-top: 8px;
            color: #475569;
        }

        .preview-text {
            white-space: pre-line;
            overflow-wrap: anywhere;
        }

        @media print {
            body {
                background: white !important;
            }
        }

        @media screen and (max-width: 800px) {
            .preview-paper {
                width: 100%;
                min-height: auto;
            }

            .preview-main {
                min-height: auto;
            }

            .preview-sidebar {
                width: 35%;
            }

            .preview-content {
                width: 65%;
            }
        }
    </style>
</head>

<body class="min-h-screen bg-slate-100 py-10 px-4">

    <div class="max-w-5xl mx-auto">

        <div class="text-center mb-10">
            <p class="text-blue-700 font-semibold tracking-widest">
                BUILD YOUR FUTURE
            </p>

            <h1 class="text-3xl font-bold text-slate-800 mt-2">
                Dynamic Online CV Builder
            </h1>

            <p class="text-slate-500 mt-2">
                Create your professional CV easily.
            </p>
        </div>

        <form id="cvForm"
              action="${pageContext.request.contextPath}/CVServlet"
              method="POST"
              enctype="multipart/form-data"
              class="bg-white rounded-xl shadow-lg p-6 md:p-10">

            <!-- PERSONAL INFORMATION -->
            <section class="mb-10">

                <h2 class="text-xl font-bold text-blue-700 mb-6 border-b pb-3">
                    Personal Information
                </h2>

                <!-- Profile Photo -->
                <div class="mb-6">

                    <label for="profilePhoto"
                           class="block text-sm font-semibold text-gray-700 mb-2">
                        Profile Photo
                    </label>

                    
                    <input type="file"
                           id="profilePhoto"
                           name="profilePhoto"
                           required
                           accept="image/png,image/jpeg"
                           class="w-full border border-gray-300 rounded-lg p-3
                                  file:bg-blue-600
                                  file:text-white
                                  file:font-semibold
                                  file:px-4
                                  file:py-2
                                  file:rounded-lg
                                  file:border-0
                                  file:mr-3
                                  file:cursor-pointer
                                  hover:file:bg-blue-700">


                    <p class="text-xs text-gray-500 mt-2">
                        Upload JPG or PNG image. Maximum file size: 2MB.
                    </p>

                    <img id="photoPreview"
                         src=""
                         alt="Profile Photo Preview"
                         class="hidden mt-4 w-36 h-36 object-cover rounded-lg border">
                </div>

                <!-- Full Name -->
                <div class="mb-5">

                    <label for="fullName"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Full Name *
                    </label>

                    <input type="text"
                           id="fullName"
                           name="fullName"
                           required
                           placeholder="Enter your full name"
                           class="w-full border border-gray-300 rounded-lg p-3">
                </div>

                <!-- Professional Title -->
                <div class="mb-5">

                    <label for="professionalTitle"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Professional Title
                    </label>

                    <input type="text"
                           id="professionalTitle"
                           name="professionalTitle"
                           required
                           placeholder="Example: Software Developer"
                           class="w-full border border-gray-300 rounded-lg p-3">
                </div>

                <!-- Email -->
                <div class="mb-5">

                    <label for="email"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Email *
                    </label>

                    <input type="email"
                           id="email"
                           name="email"
                           required
                           placeholder="example@email.com"
                           class="w-full border border-gray-300 rounded-lg p-3">
                </div>

                <!-- Phone -->
                <div class="mb-5">

                    <label for="phoneNumber"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Phone Number
                    </label>

                    <input type="text"
                           id="phoneNumber"
                           name="phoneNumber"
                           required
                           placeholder="Enter your phone number"
                           class="w-full border border-gray-300 rounded-lg p-3">
                </div>

                <!-- LinkedIn / Github -->
                <div class="mb-5">

                    <label for="linkedinGithub"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        LinkedIn / GitHub
                    </label>

                    <input type="text"
                           id="linkedinGithub"
                           name="linkedinGithub"
                           required
                           placeholder="Enter your LinkedIn or GitHub link"
                           class="w-full border border-gray-300 rounded-lg p-3">
                </div>

                <!-- Profile Summary -->
                <div class="mb-5">

                    <label for="profileSummary"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Profile Summary
                    </label>

                    <textarea id="profileSummary"
                              name="profileSummary"
                              required
                              rows="4"
                              placeholder="Write a short introduction about yourself"
                              class="w-full border border-gray-300 rounded-lg p-3"></textarea>
                </div>

            </section>


            <!-- EDUCATION -->
            <section class="mb-10">

                <h2 class="text-xl font-bold text-blue-700 mb-6 border-b pb-3">
                    Education
                </h2>

                <div class="mb-5">

                    <label for="highestDegree"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Highest Degree *
                    </label>

                    <input type="text"
                           id="highestDegree"
                           name="highestDegree"
                           required
                           placeholder="Example: Bachelor Degree"
                           class="w-full border border-gray-300 rounded-lg p-3">
                </div>

                <div class="mb-5">

                    <label for="institutionName"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Institution Name
                    </label>

                    <input type="text"
                           id="institutionName"
                           name="institutionName"
                           required
                           placeholder="Enter institution name"
                           class="w-full border border-gray-300 rounded-lg p-3">
                </div>

                <div class="mb-5">

                    <label for="major"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Major / Field of Study
                    </label>

                    <input type="text"
                           id="major"
                           name="major"
                           required
                           placeholder="Example: Computer Science"
                           class="w-full border border-gray-300 rounded-lg p-3">
                </div>

                <div class="mb-5">

                    <label for="graduationYear"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Graduation Year
                    </label>

                    <input type="text"
                           id="graduationYear"
                           name="graduationYear"
                           required
                           placeholder="Example: 2026"
                           class="w-full border border-gray-300 rounded-lg p-3">
                </div>

            </section>


            <!-- WORK EXPERIENCE -->
            <section class="mb-10">

                <h2 class="text-xl font-bold text-blue-700 mb-6 border-b pb-3">
                    Work Experience
                </h2>

                <div class="mb-5">

                    <label for="jobTitle"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Job Title
                    </label>

                    <input type="text"
                           id="jobTitle"
                           name="jobTitle"
                           required
                           placeholder="Example: Intern"
                           class="w-full border border-gray-300 rounded-lg p-3">
                </div>

                <div class="mb-5">

                    <label for="companyName"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Company Name
                    </label>

                    <input type="text"
                           id="companyName"
                           name="companyName"
                           required
                           placeholder="Enter company name"
                           class="w-full border border-gray-300 rounded-lg p-3">
                </div>

                <div class="mb-5">

                    <label for="duration"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Duration
                    </label>

                    <input type="text"
                           id="duration"
                           name="duration"
                           required
                           placeholder="Example: January 2025 - June 2025"
                           class="w-full border border-gray-300 rounded-lg p-3">
                </div>

                <div class="mb-5">

                    <label for="responsibilities"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Responsibilities
                    </label>

                    <textarea id="responsibilities"
                              name="responsibilities"
                              required
                              rows="4"
                              placeholder="Describe your responsibilities"
                              class="w-full border border-gray-300 rounded-lg p-3"></textarea>
                </div>

            </section>


            <!-- SKILLS -->
            <section class="mb-10">

                <h2 class="text-xl font-bold text-blue-700 mb-6 border-b pb-3">
                    Skills
                </h2>

                <div class="mb-5">

                    <label for="technicalSkills"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Technical Skills *
                    </label>

                    <textarea id="technicalSkills"
                              name="technicalSkills"
                              rows="4"
                              required
                              placeholder="Example: Java, HTML, CSS, MySQL"
                              class="w-full border border-gray-300 rounded-lg p-3"></textarea>
                </div>

                <div class="mb-5">

                    <label for="softSkills"
                           class="block text-sm font-semibold text-gray-700 mb-1">
                        Soft Skills
                    </label>

                    <textarea id="softSkills"
                              name="softSkills"
                              required
                              rows="4"
                              placeholder="Example: Communication, Teamwork, Leadership"
                              class="w-full border border-gray-300 rounded-lg p-3"></textarea>
                </div>

            </section>


            <section class="mb-10">

                <h2 class="text-xl font-bold text-blue-700 mb-6 border-b pb-3">
                    CV Design
                </h2>

                <label for="sidebarColor"
                       class="block text-sm font-semibold text-gray-700 mb-2">
                    Choose Sidebar Color
                </label>

                <select id="sidebarColor"
                        name="sidebarColor"
                        class="w-full border border-gray-300 rounded-lg p-3">

                    <option value="#dbeafe">Light Blue</option>
                    <option value="#e2e8f0">Light Grey</option>
                    <option value="#dcfce7">Light Green</option>
                    <option value="#fce7f3">Light Pink</option>
                    <option value="#ede9fe">Light Purple</option>
                    <option value="#fef3c7">Light Yellow</option>

                </select>

            </section>


            <div class="flex flex-wrap justify-center gap-4 mt-10">

                <button type="button"
                        onclick="previewCV()"
                        class="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 px-6 rounded-lg">
                    Preview My CV
                </button>

                <button type="submit"
                        class="bg-green-600 hover:bg-green-700 text-white font-semibold py-3 px-6 rounded-lg">
                    Generate My CV
                </button>

                <a href="${pageContext.request.contextPath}/CVServlet?action=sample"
                   class="bg-purple-600 hover:bg-purple-700 text-white font-semibold py-3 px-6 rounded-lg">
                    View Sample CV
                </a>

            </div>

        </form>


        <footer class="text-center mt-8 text-sm text-slate-500">

            <p>© 2026 Dynamic Online CV Builder</p>

            <p class="mt-1">
                Create your professional profile with ease.
            </p>

        </footer>

    </div>


    <div id="previewModal"
         class="hidden fixed inset-0 z-50 bg-black bg-opacity-60 overflow-y-auto p-4">

        <div class="max-w-5xl mx-auto my-6">

            <!-- Close Button -->
            <div class="flex justify-end mb-3">

                <button type="button"
                        onclick="closePreview()"
                        class="bg-white text-gray-700 hover:bg-gray-200 rounded-full w-10 h-10 font-bold text-xl">
                    &times;
                </button>

            </div>


            <div class="preview-paper shadow-2xl">

                <div class="preview-main">

                    <aside id="previewSidebar"
                           class="preview-sidebar"
                           style="background-color: #dbeafe;">

                        <!-- Profile Photo -->
                        <img id="previewPhoto"
                             src=""
                             alt="Profile Photo"
                             class="preview-photo">

                        <!-- CONTACT -->
                        <div>

                            <h3 class="preview-section-title">
                                CONTACT
                            </h3>

                            <p id="previewEmail"
                               class="text-sm mb-2 break-words"></p>

                            <p id="previewPhone"
                               class="text-sm mb-2 break-words"></p>

                            <p id="previewLinkedin"
                               class="text-sm mb-2 break-words"></p>

                        </div>


                        <!-- EDUCATION -->
                        <div>

                            <h3 class="preview-section-title">
                                EDUCATION
                            </h3>

                            <p id="previewDegree"
                               class="font-semibold text-sm"></p>

                            <p id="previewInstitution"
                               class="text-sm mt-1"></p>

                            <p id="previewMajor"
                               class="text-sm mt-1"></p>

                            <p id="previewYear"
                               class="text-sm mt-1"></p>

                        </div>


                        <!-- EXPERTISE -->
                        <div>

                            <h3 class="preview-section-title">
                                EXPERTISE
                            </h3>

                            <p class="text-sm">
                                Professional knowledge and abilities
                            </p>

                        </div>


                        <!-- TECHNICAL SKILLS -->
                        <div>

                            <h3 class="preview-section-title">
                                TECHNICAL SKILLS
                            </h3>

                            <p id="previewTechnical"
                               class="preview-text text-sm"></p>

                        </div>


                        <!-- SOFT SKILLS -->
                        <div>

                            <h3 class="preview-section-title">
                                SOFT SKILLS
                            </h3>

                            <p id="previewSoft"
                               class="preview-text text-sm"></p>

                        </div>

                    </aside>


                    <main class="preview-content">

                        <!-- Name and Professional Title -->
                        <div class="mb-8">

                            <h1 id="previewNameMain"
                                class="preview-content-title">
                            </h1>

                            <p id="previewTitleMain"
                               class="preview-professional-title">
                            </p>

                        </div>


                        <!-- PROFILE -->
                        <section class="mb-8">

                            <h2 class="text-lg font-bold text-blue-700 border-b-2 border-blue-700 pb-2 mb-4">
                                PROFILE SUMMARY
                            </h2>

                            <p id="previewSummary"
                               class="preview-text text-sm leading-relaxed text-gray-700">
                            </p>

                        </section>


                        <!-- EXPERIENCES -->
                        <section class="mb-8">

                            <h2 class="text-lg font-bold text-blue-700 border-b-2 border-blue-700 pb-2 mb-4">
                                EXPERIENCES
                            </h2>

                            <h3 id="previewJob"
                                class="font-bold text-base">
                            </h3>

                            <p id="previewCompany"
                               class="text-sm font-semibold text-gray-600 mt-1">
                            </p>

                            <p id="previewDuration"
                               class="text-sm italic text-gray-500 mt-1">
                            </p>

                            <p id="previewResponsibilities"
                               class="preview-text text-sm leading-relaxed text-gray-700 mt-3">
                            </p>

                        </section>

                    </main>

                </div>

            </div>

        </div>

    </div>


    <script>

        function getValue(id) {

            return document.getElementById(id).value.trim();

        }


        function setPreview(id, value) {

            document.getElementById(id).textContent = value;

        }


        const photoInput = document.getElementById("profilePhoto");

        photoInput.addEventListener("change", function () {

            const file = this.files[0];

            if (!file) {
                return;
            }

            const allowedTypes = ["image/jpeg", "image/png"];

            if (!allowedTypes.includes(file.type)) {

                alert("Please upload JPG or PNG image only.");

                this.value = "";

                document.getElementById("photoPreview").classList.add("hidden");

                return;
            }

            if (file.size > 2 * 1024 * 1024) {

                alert("Image size must not exceed 2MB.");

                this.value = "";

                document.getElementById("photoPreview").classList.add("hidden");

                return;
            }

            const reader = new FileReader();

            reader.onload = function (event) {

                const image = document.getElementById("photoPreview");

                image.src = event.target.result;

                image.classList.remove("hidden");

            };

            reader.readAsDataURL(file);

        });


        function previewCV() {

            const form = document.getElementById("cvForm");

            if (!form.reportValidity()) {

                return;

            }


            setPreview("previewNameMain", getValue("fullName"));

            setPreview("previewTitleMain", getValue("professionalTitle"));

            setPreview("previewEmail", getValue("email"));

            setPreview("previewPhone", getValue("phoneNumber"));

            setPreview("previewLinkedin", getValue("linkedinGithub"));

            setPreview("previewSummary", getValue("profileSummary"));


            setPreview("previewDegree", getValue("highestDegree"));

            setPreview("previewInstitution", getValue("institutionName"));

            setPreview("previewMajor", getValue("major"));

            setPreview("previewYear", getValue("graduationYear"));


            setPreview("previewJob", getValue("jobTitle"));

            setPreview("previewCompany", getValue("companyName"));

            setPreview("previewDuration", getValue("duration"));

            setPreview("previewResponsibilities", getValue("responsibilities"));


            setPreview("previewTechnical", getValue("technicalSkills"));

            setPreview("previewSoft", getValue("softSkills"));


            const selectedColor = getValue("sidebarColor");

            document.getElementById("previewSidebar").style.backgroundColor = selectedColor;


            const uploadedPhoto = document.getElementById("profilePhoto").files[0];

            const previewPhoto = document.getElementById("previewPhoto");

            if (uploadedPhoto) {

                const reader = new FileReader();

                reader.onload = function (event) {

                    previewPhoto.src = event.target.result;

                };

                reader.readAsDataURL(uploadedPhoto);

            } else {

                previewPhoto.src = "${pageContext.request.contextPath}/assets/sample-profile.jpg";

            }


            document.getElementById("previewModal").classList.remove("hidden");

        }


        function closePreview() {

            document.getElementById("previewModal").classList.add("hidden");

        }

    </script>

</body>
</html>
