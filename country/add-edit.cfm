<cfoutput>
    <cfparam name="url.id" default="0" />
    <cfparam name="form.country" default="" />
   
    
    <cfif val(url.id)>
        <cfset variables.country =  new component.countryGateway().get(country_id = url.id)>
  
        <cfset form.country = variables.country.getCountry() />
    
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
        <form name="myForm" action="/country/action.cfm" method="post" class="container">
           
            <input type="hidden" name="country_id" value="#url.id#">

            <div class=" w-50">      
                <label for="country" class="pt-3 pb-1 fw-bold">Country:</label>
                <input type="text" id="country" name="country" value="#form.country#" required />
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
                        country:country
                      } = form;

                if(!isBlank(country, 'Please enter your Country!')) {
                    country.focus();
                    return false;
                }
                
                form.submit();
            }

        </script>
</body>
</html>
</cfoutput>