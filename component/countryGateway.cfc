
<cfcomponent displayname="countryGateway" output="false">
 
    <cfset variables.datasource = 'sakila' />
 
    <cffunction name="list" access="public" returntype="query">
        <cfargument name="page" default="1" />
        <cfargument name="maxrow" default="10" />
 
        <cfset var qCountry = "" />
        <cfset local.page = (arguments.page - 1) * arguments.maxrow />
        <cfquery name="qCountry" datasource="#variables.datasource#">
            SELECT *
            FROM   country 
            ORDER BY country_id desc
            LIMIT #local.page#, #arguments.maxrow#;
        </cfquery>
 
        <cfreturn qCountry />
    </cffunction>
    
    <cffunction name="get" access="public" output="true" returntype="country">
        <cfargument name="country_id" type="numeric" required="true" />
        
        <cfset var country = new countryDAO().read(country_id = arguments.country_id)>
        <cfreturn country   />
       
    </cffunction>

    <cffunction name="save" access="public" returntype="country" output="false">
        <cfargument name="country" required="true" type="country"/>

        <cfif country.getCountry_id() EQ 0>
            <cfreturn new countryDAO().insert(arguments.country) />
        <cfelse>
            <cfreturn new countryDAO().update(arguments.country) />
        </cfif>
    </cffunction>

</cfcomponent>