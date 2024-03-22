<cfoutput>
    <cfparam name="url.id" default="0" />
    <cfparam name="form.fname" default="" />
    <cfparam name="form.lname" default="" />
    <cfparam name="form.mail" default="" />
    

    <cfif val(url.id)>
       <cfset variables.actor =  new component.actorGateway().get(actor_id = url.id)>
 
        <cfset form.fname = variables.actor.getFirst_name() />
        <cfset form.lname = variables.actor.getLast_name() />
        <cfset form.mail = variables.actor.getEmail() />
   
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
        <form action="/actor/action.cfm" name="myForm" method="post" class="container">
           
            <input type="hidden" name="actor_id" value="#url.id#">

            <div class=" w-50">      
                <label for="fname" class="pt-3 pb-1 fw-bold">First Name:</label>
                <input type="text" id="fname" name="fname" value="#form.fname#" required />
            </div>
            <div class=" w-50">      
                <label for="lname" class="pt-3 pb-1 fw-bold">Last Name:</label>
                <input type="text" id="lname" name="lname" value="#form.lname#" required />
            </div>
            <div class=" w-50">      
                <label for="mail" class="pt-3 pb-1 fw-bold">Email Id:</label>
                <input type="mail" id="mail" name="mail" value="#form.mail#" required />
            </div>
            <div class="text-center pt-4">
                <button type="submit" class="btn btn-dark w-50" onclick="formValidation()">SUBMIT</button>
            </div >
        </form>
    <div>

        <script src="/assets/helper.js"></script>

        <script>

            function formValidation() {
                const form = document.myForm;
                const {
                        fname:first_name,
                        lname:last_name,
                        mail:email
                      } = form;

                if(!isBlank(first_name, 'Please enter your First Name!')) {
                    first_name.focus();
                    return false;
                }
                if( first_name.value.includes('0') || first_name.value.includes('1') 
                    || first_name.value.includes('2') || first_name.value.includes('3') 
                    || first_name.value.includes('4') || first_name.value.includes('5') 
                    || first_name.value.includes('6') || first_name.value.includes('7') 
                    || first_name.value.includes('8') || first_name.value.includes('9'))
                { 
                    alert ("Please enter your first name Properly."); 
                    first_name.focus(); 
                    return false; 
                }
                if(!isBlank(last_name, 'Please enter your Last Name!')) {
                    last_name.focus();
                    return false;
                }
                if(last_name.value.includes('0') || last_name.value.includes('1') 
                    || last_name.value.includes('2') || last_name.value.includes('3') 
                    || last_name.value.includes('4') || last_name.value.includes('5') 
                    || last_name.value.includes('6') || last_name.value.includes('7') 
                    || last_name.value.includes('8') || last_name.value.includes('9'))
                { 
                    alert ("Please enter your last name Properly."); 
                    last_name.focus(); 
                    return false; 
                }
                if(!isBlank(email, 'Please enter your Email!')) {
                    email.focus();
                    return false;
                }
                if(!isEmail(email, 'Please enter your valid Email!')) {
                    email.focus();
                    return false;
                }
                form.submit();
            }

        </script>

</body>
</html>
</cfoutput>