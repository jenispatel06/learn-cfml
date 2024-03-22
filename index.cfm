
<!DOCTYPE html>
<html>
<head>
    <title>LOGIN FORM</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-secondary">

    <h1 class="text-center pt-4 text-white" >LOGIN FORM</h1>

    <div class="w-25 border border-dark bg-light mx-auto mt-5 mb-5 p-5 rounded ">
        <form action="/login-form-action.cfm" method="post" class="container">
           
            <div class=" w-50">      
                <label for="mail" class="pt-3 pb-1 fw-bold">Email Id:</label>
                <input type="mail" id="mail" name="mail" value="" required />
            </div>
            <div class=" w-50">      
                <label for="password" class="pt-3 pb-1 fw-bold">Password:</label>
                <input type="password" id="password" name="password" value="" required/>
            </div>
            <div class="text-center pt-4">
                <button class="btn btn-dark w-50">LOGIN</button>
            </div >
        </form>
    <div>
</body>
</html>