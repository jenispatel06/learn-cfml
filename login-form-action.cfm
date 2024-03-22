

<cfquery name = "variables.qLoginform" datasource = "sakila" >
    SELECT *
    FROM actor
    where email = <cfqueryparam value="#form.mail#" cfsqltype="cf_sql_varchar" />
    and password =<cfqueryparam value="#form.password#" cfsqltype="cf_sql_varchar" />
</cfquery>
 
<cfoutput>
<cfif variables.qLoginform.recordCount EQ 0>
    <cflocation url = "index.cfm?enter_valid_information" addtoken="false" />
<cfelse>
    <cfset session.name = #variables.qLoginform.first_name#>
    <cflocation url = "dashboard.cfm?message=login_successfully" addtoken="false" />
</cfif>
</cfoutput>

