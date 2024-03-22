<cfparam name="url.page" default="1">
<cfparam name="variables.maxrow" default="10">

<cfset variables.qCategory = new component.categoryGateway().list(
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
        <cfoutput>
        <cfinclude template="/includes/header.cfm">

        <nav data-mdb-navbar-init class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/dashboard.cfm">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page"><a href="/category/index.cfm">Category</a></li>
                </ol>
              </nav>
            </div>
          </nav>

            <div class="text-center mt-5">
                <h1 class="fw-bold">CATEGORY</h1>
            </div>

            <div class="container">
                <div >
                    <button class=" float-end mb-4 "><a href="./add-edit.cfm" class="text-white">Insert Value</a></button>
                </div>

                <div>
                    <cfset variables.columns = [
                        {
                            "label":"id",
                            "fieldName":"category_id",
                        },
                        {
                            "label":"Name",
                            "fieldName":"name",
                        },
                        {
                            "label":"Action",
                            "content":(customer)=>{
                                var edit = "<a href='add-edit.cfm?id=#category_id#'>EDIT</a>"
                                return edit;
                            }
                        }

                    ]/>

                        #new component.utility().ListTable(
                            columns = variables.columns,
                            qData = variables.qCategory
                        )#

                </div>
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
