
<cfcomponent displayname="categoryGateway" output="false">
 
    <cfset variables.datasource = 'sakila' />
 
    <cffunction name="list" access="public" returntype="query">
        <cfargument name="page" default="1" />
        <cfargument name="maxrow" default="10" />
 
        <cfset var qCategory = "" />
        <cfset local.page = (arguments.page - 1) * arguments.maxrow />
        <cfquery name="qCategory" datasource="#variables.datasource#">
            SELECT *
            FROM   category 
            ORDER BY category_id desc
            LIMIT #local.page#, #arguments.maxrow#;
        </cfquery>
 
        <cfreturn qCategory />
    </cffunction>
    
    <cffunction name="get" access="public" output="true" returntype="category">
        <cfargument name="category_id" type="numeric" required="true" />
        
        <cfset var category = new categoryDAO().read(category_id = arguments.category_id)>
        <cfreturn category   />
       
    </cffunction>

    <cffunction name="save" access="public" returntype="category" output="false">
        <cfargument name="category" required="true" type="category"/>

        <cfif category.getCategory_id() EQ 0>
            <cfreturn new categoryDAO().insert(arguments.category) />
        <cfelse>
            <cfreturn new categoryDAO().update(arguments.category) />
        </cfif>
    </cffunction>

</cfcomponent>