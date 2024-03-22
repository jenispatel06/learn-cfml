<cfcomponent displayname="addressGateway" output="false" >

<cfset variables.datasource = 'sakila' />
 
<cffunction name="list" access="public" returntype="query">
    <cfargument name="page" default="1" />
    <cfargument name="maxrow" default="10" />

    <cfset var qAddress = "" />
    <cfset local.page = (arguments.page - 1) * arguments.maxrow />
    <cfquery name="qAddress" datasource="#variables.datasource#">
        SELECT *
        FROM   address 
        ORDER BY address_id desc
        LIMIT #local.page#, #arguments.maxrow#;
    </cfquery>

    <cfreturn qAddress />
</cffunction>

    <cffunction name="get" access="public" output="true" returntype="address">
        <cfargument name="address_id" type="numeric" required="true" />
        
        <cfset var address = new addressDAO().read(address_id = arguments.address_id)>
        <cfreturn address   />
       
    </cffunction>

    <cffunction name="save" access="public" returntype="address" output="false">
        <cfargument name="address" required="true" type="address"/>

        <cfif address.getAddress_id() EQ 0>
            <cfreturn new addressDAO().insert(arguments.address) />
        <cfelse>
            <cfreturn new addressDAO().update(arguments.address) />
        </cfif>
    </cffunction>

</cfcomponent>


