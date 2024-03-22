
<cfcomponent displayname="customerGateway" output="false">
 
    <cfset variables.datasource = 'sakila' />
 
    <cffunction name="list" access="public" returntype="query">
        <cfargument name="page" default="1" />
        <cfargument name="maxrow" default="10" />
 
        <cfset var qCustomer = "" />
        <cfset local.page = (arguments.page - 1) * arguments.maxrow />
        <cfquery name="qCustomer" datasource="#variables.datasource#">
            SELECT *
            FROM   customer 
            ORDER BY customer_id desc
            LIMIT #local.page#, #arguments.maxrow#;
        </cfquery>
 
        <cfreturn qCustomer />
    </cffunction>
    
    <cffunction name="get" access="public" output="true" returntype="customer">
        <cfargument name="customer_id" type="numeric" required="true" />
        
        <cfset var customer = new customerDAO().read(customer_id = arguments.customer_id)>
        <cfreturn customer />
       
    </cffunction>

    <cffunction name="save" access="public" returntype="customer" output="false">
        <cfargument name="customer" required="true" type="customer"/>

        <cfif customer.getCustomer_id() EQ 0>
            <cfreturn new customerDAO().insert(arguments.customer) />
        <cfelse>
            <cfreturn new customerDAO().update(arguments.customer) />
        </cfif>
    </cffunction>

</cfcomponent>