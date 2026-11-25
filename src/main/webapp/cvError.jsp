<%-- 
    Document   : cvError
    Created on : Oct 28, 2026, 11:29:12 AM
    Author     : Asus'
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CV Form Error</title>

    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>

<body class="min-h-screen bg-gray-100 flex items-center justify-center p-4">

    <div class="max-w-lg w-full bg-white rounded-xl shadow-md p-8 text-center">

        <div class="text-red-600 text-5xl mb-4">
            &#9888;
        </div>

        <h1 class="text-2xl font-bold text-red-700 mb-3">
            Unable to Generate CV
        </h1>

        <p class="text-gray-600 mb-6">
            Please check your information and try again.
        </p>

        <div class="bg-red-50 border border-red-200 rounded-lg p-4 mb-6 text-left">
            <p class="font-semibold text-red-800 mb-1">
                Error Details
            </p>

            <p class="text-red-700">
                ${requestScope.errorMessage}
            </p>
        </div>

        <a href="${pageContext.request.contextPath}/cvForm.jsp"
           class="inline-block bg-blue-700 hover:bg-blue-800 text-white font-semibold py-3 px-6 rounded-lg transition">
            Back to CV Form
        </a>

    </div>

</body>
</html>
