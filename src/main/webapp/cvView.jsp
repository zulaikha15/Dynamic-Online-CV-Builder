<%-- 
    Document   : cvView
    Created on : Oct 28, 2026, 11:28:01 AM
    Author     : Asus'
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Professional CV</title>

    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        body {
            background-color: white;
            font-family: Arial, sans-serif;
        }

        .cv-container {
            width: 210mm;
            min-height: 297mm;
            margin: 0 auto;
            background-color: white;
            display: flex;
            flex-direction: column;
            box-sizing: border-box;
        }

        .cv-main {
            flex: 1;
            display: flex !important;
            flex-direction: row !important;
            align-items: stretch;
            gap: 0 !important;
        }

        .cv-sidebar {
            flex: 0 0 33.333% !important;
            width: 33.333% !important;
            min-width: 0;
            box-sizing: border-box;
            background-color: ${empty requestScope.cvData.sidebarColor ? '#dbeafe' : requestScope.cvData.sidebarColor};
        }

        .cv-content {
            flex: 1 1 66.667% !important;
            width: 66.667% !important;
            min-width: 0;
            box-sizing: border-box;
            background-color: white;
        }

        .skill-heading {
            font-size: 14px;
            font-weight: bold;
            color: #1f2937;
            margin-top: 20px;
            margin-bottom: 5px;
        }

        .skill-list {
            font-size: 14px;
            line-height: 1.5;
            color: #374151;
            white-space: pre-line;
            overflow-wrap: anywhere;
        }

        @page {
            size: A4;
            margin: 0;
        }

        @media print {
            html, body {
                background: white !important;
                margin: 0 !important;
                padding: 0 !important;
            }

            .no-print {
                display: none !important;
            }

            .cv-container {
                width: 210mm !important;
                min-height: 297mm !important;
                margin: 0 !important;
                box-shadow: none !important;
                border: none !important;
            }

            .cv-main {
                display: flex !important;
                flex-direction: row !important;
            }

            .cv-sidebar {
                flex: 0 0 33.333% !important;
                width: 33.333% !important;
                print-color-adjust: exact;
                -webkit-print-color-adjust: exact;
            }

            .cv-content {
                flex: 1 1 66.667% !important;
                width: 66.667% !important;
            }
        }
    </style>
</head>

<body class="min-h-screen py-8 px-4">

    <div class="cv-container bg-white shadow-xl relative">

        <a href="${pageContext.request.contextPath}/cvForm.jsp"
           class="no-print ${requestScope.isSample ? 'flex' : 'hidden'} absolute top-3 right-3 z-10 bg-white hover:bg-gray-200 text-gray-700 rounded-full w-9 h-9 items-center justify-center shadow"
           title="Close CV">

            <span class="text-2xl">&times;</span>

        </a>

        <main class="cv-main">

            <aside class="cv-sidebar p-6 md:p-8 space-y-8">

                <div class="flex justify-center">

                    <img
                        src="${requestScope.isSample ? pageContext.request.contextPath.concat('/assets/sample-profile.jpg') : 'data:'.concat(requestScope.cvData.photoContentType).concat(';base64,').concat(requestScope.cvData.photoBase64)}"
                        alt="Profile Photo"
                        class="${requestScope.isSample || not empty requestScope.cvData.photoBase64 ? 'block' : 'hidden'} w-36 h-36 md:w-40 md:h-40 rounded-full object-cover border-4 border-white shadow">

                    <div class="${empty requestScope.isSample and empty requestScope.cvData.photoBase64 ? 'flex' : 'hidden'} w-36 h-36 md:w-40 md:h-40 rounded-full border-4 border-white bg-gray-200 items-center justify-center text-gray-500 text-5xl">

                        <span>&#128100;</span>

                    </div>

                </div>

                <!-- CONTACT -->
                <section>

                    <h2 class="text-xl font-bold text-gray-900 mb-5">
                        CONTACT
                    </h2>

                    <div class="space-y-4 text-sm text-gray-800">

                        <p class="break-words">
                            <span class="font-semibold">&#9742;</span>
                            ${requestScope.cvData.phoneNumber}
                        </p>

                        <p class="break-words">
                            <span class="font-semibold">&#9993;</span>
                            ${requestScope.cvData.email}
                        </p>

                        <p class="break-words">
                            <span class="font-semibold">&#128279;</span>
                            ${requestScope.cvData.linkedinGithub}
                        </p>

                    </div>

                </section>

                <!-- EDUCATION -->
                <section>

                    <h2 class="text-xl font-bold text-gray-900 mb-5">
                        EDUCATION
                    </h2>

                    <div>

                        <h3 class="font-bold text-sm text-gray-900 uppercase">
                            ${requestScope.cvData.highestDegree}
                        </h3>

                        <p class="text-sm text-gray-800 mt-1">
                            ${requestScope.cvData.institutionName}
                        </p>

                        <p class="text-xs text-gray-700 mt-1">
                            ${requestScope.cvData.major}
                        </p>

                        <p class="text-xs text-gray-700 mt-1">
                            ${requestScope.cvData.graduationYear}
                        </p>

                    </div>

                </section>

                <!-- EXPERTISE -->
                <section>

                    <h2 class="text-xl font-bold text-gray-900 mb-3">
                        EXPERTISE
                    </h2>

                    <!-- TECHNICAL SKILLS -->
                    <h3 class="skill-heading">
                        TECHNICAL SKILLS
                    </h3>

                    <div class="skill-list">
                        ${requestScope.cvData.technicalSkills}
                    </div>

                    <!-- SOFT SKILLS -->
                    <h3 class="skill-heading mt-5">
                        SOFT SKILLS
                    </h3>

                    <div class="skill-list">
                        ${requestScope.cvData.softSkills}
                    </div>

                </section>

            </aside>

            <div class="cv-content p-6 md:p-8 space-y-10">

                <!-- NAME AND PROFESSIONAL TITLE -->
                <header class="border-b border-gray-300 pb-6">

                    <h1 class="text-3xl md:text-4xl font-serif text-gray-900 uppercase font-bold break-words">
                        ${requestScope.cvData.fullName}
                    </h1>

                    <p class="text-sm md:text-base font-serif mt-3 text-gray-600 uppercase tracking-wide">
                        ${requestScope.cvData.professionalTitle}
                    </p>

                </header>

                <!-- PROFILE -->
                <section>

                    <h2 class="text-xl font-bold text-gray-900 mb-4">
                        PROFILE SUMMARY
                    </h2>

                    <p class="text-sm text-gray-700 leading-6 whitespace-pre-line">
                        ${requestScope.cvData.profileSummary}
                    </p>

                </section>

                <!-- EXPERIENCES -->
                <section>

                    <h2 class="text-xl font-bold text-gray-900 mb-5">
                        EXPERIENCES
                    </h2>

                    <div>

                        <!-- Job Title -->
                        <h3 class="font-bold text-base text-gray-900 uppercase">
                            ${requestScope.cvData.jobTitle}
                        </h3>

                        <!-- Duration -->
                        <p class="text-sm text-gray-600 mt-1">
                            ${requestScope.cvData.duration}
                        </p>

                        <!-- Company Name -->
                        <p class="text-sm text-gray-800 mt-1">
                            ${requestScope.cvData.companyName}
                        </p>

                        <!-- Responsibilities -->
                        <p class="text-sm text-gray-700 leading-6 whitespace-pre-line mt-3">
                            ${requestScope.cvData.responsibilities}
                        </p>

                    </div>


                </section>

            </div>

        </main>

        <footer class="no-print ${requestScope.isSample ? 'hidden' : 'bg-gray-50 border-t p-5 flex flex-wrap justify-center gap-4'}">

            <button type="button"
                    onclick="window.print()"
                    class="bg-blue-700 hover:bg-blue-800 text-white font-semibold py-3 px-6 rounded-lg">

                Print CV

            </button>

            <a href="${pageContext.request.contextPath}/cvForm.jsp"
               class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-semibold py-3 px-6 rounded-lg">

                Create Another CV

            </a>

        </footer>

    </div>

</body>
</html>
