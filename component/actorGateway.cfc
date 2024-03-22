
<cfcomponent displayname="actorGateway" output="false">
 
    <cfset variables.datasource = 'sakila' />
 
    <cffunction name="list" access="public" returntype="query">
        <cfargument name="page" default="1" />
        <cfargument name="maxrow" default="10" />
 
        <cfset var qActors = "" />
        <cfset local.page = (arguments.page - 1) * arguments.maxrow />
        <cfquery name="qActors" datasource="#variables.datasource#">
            SELECT *
            FROM   Actor 
            ORDER BY actor_id desc
            LIMIT #local.page#, #arguments.maxrow#;
        </cfquery>
 
        <cfreturn qActors />
    </cffunction>

    <cffunction name="get" access="public" output="true" returntype="actor">
        <cfargument name="actor_id" type="numeric" required="true" />
        
        <cfset var actor = new actorDAO().read(actor_id = arguments.actor_id)>
        <cfreturn actor />
       
    </cffunction>

    <cffunction name="save" access="public" returntype="actor" output="false">
        <cfargument name="actor" required="true" type="actor"/>

        <cfif actor.getActor_id() EQ 0>
            <cfreturn new actorDAO().insert(arguments.actor) />
        <cfelse>
            <cfreturn new actorDAO().update(arguments.actor) />
        </cfif>
    </cffunction>

</cfcomponent>