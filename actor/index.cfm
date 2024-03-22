<cfoutput>
    <cfparam name="url.page" default="1">
    <cfparam name="variables.maxrow" default="10">

    <cfset variables.qActors = new component.actorGateway().list(
            page = url.page,
            maxrow = variables.maxrow
    )/>
    
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <title>FORM LIST</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
       
        <style>
            button{
                font-size:large;
                border: 2px solid black;
                background-color:grey;
            }
            button>a{
                color:black;
                text-decoration:none;
            }
        </style>
         
    </head>
    <body>

        <cfinclude template="/includes/header.cfm">

        <nav data-mdb-navbar-init class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/dashboard.cfm">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page"><a href="/actor/index.cfm">Actor</a></li>
                </ol>
              </nav>
            </div>
          </nav>

            <div class="text-center mt-5">
                <h1 class="fw-bold">ACTOR</h1>
            </div>
        <cfoutput>

        <div class="container">
            <div >
                <button class=" float-end mb-4 "><a href="./add-edit.cfm" class="text-white">Insert Value</a></button>
            </div>
            <table class="table-bordered border border-dark mt-2 mb-5" border="1" cellpadding="5" cellspacing="0" width="100%">
                    <tr>

                        <td><b>actor_id</b></td>
                        <td><b>first_name</b></td>
                        <td><b>last_name</b></td>
                        <td><b>email</b></td>   
                        <td><b>last_update</b></td>
                        <td><b>Action</b></td>
                        
                    </tr>
                <cfloop query="variables.qActors">
                    <tr>
    
                        <td>#variables.qActors.actor_id#</td>
                        <td>#variables.qActors.first_name#</td>
                        <td>#variables.qActors.last_name#</td>
                        <td>#variables.qActors.email#</td>
                        <td>#dateFormat(variables.qActors.last_update, 'dd-mm-yyyy')#</td>
                        <td><a href="./add-edit.cfm?id=#variables.qActors.actor_id#">EDIT</td>
    
                    </tr>
                </cfloop>
            </table>
        </div>
            
        <div class="text-center">
            <input type="button" value="PREVIOUS" onclick="prev_page()">
            <input type="button" value="NEXT" onclick="next_page()">
            <input type="hidden" name="page" value="#url.page#">
        </div>

        <script  src="/assets/helper.js"></script>
        
    </cfoutput>
        
</body>
</html>
</cfoutput>