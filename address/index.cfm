<cfoutput>
    <cfparam name="url.page" default="1">
    <cfparam name="variables.maxrow" default="10">

    <cfset variables.qAddress = new component.addressGateway().list(
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
                  <li class="breadcrumb-item active" aria-current="page"><a href="/address/index.cfm">Address</a></li>
                </ol>
              </nav>
            </div>
          </nav>

            <div class="text-center mt-5">
                <h1 class="fw-bold">ADDRESS</h1>
            </div>
        <cfoutput>

        <div class="container">
            <div >
                <button class=" float-end mb-4 "><a href="./add-edit.cfm" class="text-white">Insert Value</a></button>
            </div>
            <table class="table-bordered border border-dark mt-2 mb-5" border="1" cellpadding="5" cellspacing="0" width="100%">
                    <tr>

                        <td><b>address_id</b></td>
                        <td><b>address</b></td>
                        <td><b>district</b></td>   
                        <td><b>postal_code</b></td>
                        <td><b>phone</b></td>
                        <td><b>last_update</b></td>
                        <td><b>Action</b></td>

                    </tr>
                <cfloop query="variables.qAddress">
                    <tr>
    
                        <td>#variables.qAddress.address_id#</td>
                        <td>#variables.qAddress.address#</td>
                        <td>#variables.qAddress.district#</td>
                        <td>#variables.qAddress.postal_code#</td>
                        <td>#variables.qAddress.phone#</td>
                        <td>#dateFormat(variables.qAddress.last_update, 'dd-mm-yyyy')#</td>
                        <td><a href="./add-edit.cfm?id=#variables.qAddress.address_id#">Edit</td>
    
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