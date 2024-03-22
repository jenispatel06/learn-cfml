<cfoutput>
    <cfparam name="url.id" default="0" />
    <cfparam name="form.name" default="" />

    <cfif val(url.id)>
        <cfset variables.category =  new component.categoryGateway().get(category_id = url.id)>
  
        <cfset form.name = variables.category.getName() />
       
     </cfif>

<!DOCTYPE html>
<html>
<head>
    <title>FORM</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

    <cfinclude template="/includes/header.cfm">
    
    <div class="text-center mt-5">
        <h1 class="fw-bold">FORM</h1>
    </div>


    <div class="w-25 border border-dark bg-light mx-auto mt-5 mb-5 p-5 rounded ">
        <form name="myForm" action="/category/action.cfm" method="post" class="container">
           
            <input type="hidden" name="category_id" value="#url.id#">

            <div class=" w-50">      
                <label for="name" class="pt-3 pb-1 fw-bold">Name:</label>
                <input type="text" id="name" name="name" value="#form.name#" required />
            </div>

            <div class="text-center pt-4">
                <button type="button" onclick="formValidation()" class="btn btn-dark w-50">SUBMIT</button>
            </div >
        </form>
    <div>

        <script src="/assets/helper.js"></script>
        <script>

            function formValidation() {
                const form = document.myForm;
                const {
                        name:name
                      } = form;

                if(!isBlank(name, 'Please enter your Name!')) {
                    name.focus();
                    return false;
                }
        
                form.submit();
            }

        </script>

</body>
</html>
</cfoutput>