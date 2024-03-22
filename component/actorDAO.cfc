<cfcomponent displayname="actorDAO" output="true">
    <cffunction name="read" access="public" returntype="actor" output="true">
        <cfargument name="actor_id" type="numeric" required="true">

        <cfset variables.datasource = "sakila">

        <cfset var qActors = "" />
        <cfquery name="qActors" datasource="#variables.datasource#">
            select * 
            from actor
            where actor_id = <cfqueryparam value="#arguments.actor_id#" cfsqltype="cf_sql_integer" />
        </cfquery>
 
        <cfif qActors.recordCount >
            <cfreturn new actor().init(argumentCollection = qActors.getRow(1)) />
        <cfelse>
            <cfreturn new actor().init() />
        </cfif>
    </cffunction>

    <cffunction name="insert" access="public" output="false"  returntype="actor">
        <cfargument name="actor" type="actor" required="true">

        <cfset var qActors = "" />
        <cfquery name="qActors" datasource="sakila">    
            INSERT INTO actor (first_name, last_name, email)
            VALUES
            (
                <cfqueryparam value="#arguments.actor.getFirst_name()#" cfsqltype="cf_sql_varchar"/>,
                <cfqueryparam value="#arguments.actor.getLast_name()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.actor.getEmail()#" cfsqltype="cf_sql_varchar" />
            );
            select last_insert_id() actor_id;
        </cfquery>
        <cfset arguments.actor.setActor_id(qActors.actor_id) />

        <cfreturn arguments.actor />

    </cffunction>

    <cffunction name="update" access="public" output="false" returntype="actor">
        <cfargument name="actor" type="actor" required="true">

        <cfquery datasource="sakila">    
            UPDATE actor
            SET
                first_name = <cfqueryparam value="#arguments.actor.getFirst_name()#" cfsqltype="cf_sql_varchar" />,
                last_name = <cfqueryparam value="#arguments.actor.getLast_name()#" cfsqltype="cf_sql_varchar" />,
                email = <cfqueryparam value="#arguments.actor.getEmail()#" cfsqltype="cf_sql_varchar" />
            WHERE actor_id = <cfqueryparam value="#arguments.actor.getActor_id()#" cfsqltype="cf_sql_int" />
        </cfquery>

        <cfreturn arguments.actor />
       
    </cffunction>
</cfcomponent>