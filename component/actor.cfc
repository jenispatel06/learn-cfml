<cfcomponent displayname="actor" output="false">

    <cfproperty name="actor_id" type="numeric" default="0" />
    <cfproperty name="first_name" type="string" default="" />
    <cfproperty name="last_name" type="string" default="" />
    <cfproperty name="email" type="string" default="" />

    <cfset variables.instance = {} />

    <cffunction name="init" access="public" returntype="actor" output="true">
        <cfargument name="actor_id" type="numeric" default="0" />
        <cfargument name="first_name" type="string" default="" />
        <cfargument name="last_name" type="string" default="" />
        <cfargument name="email" type="string" default="" />

        <cfset this.setActor_id(arguments.actor_id) />
        <cfset this.setFirst_name(arguments.first_name) />
        <cfset this.setLast_name(arguments.last_name) />
        <cfset this.setEmail(arguments.email) />

        <cfreturn this>
    </cffunction>

    <cffunction name="setActor_id" access="public"  output="false" returntype="void">
        <cfargument name="actor_id" required="true" />
        <cfset variables.instance.actor_id = arguments.actor_id />
    </cffunction>

    <cffunction name="getActor_id" access="public" returntype="string" output="false">
        <cfreturn variables.instance.actor_id />
    </cffunction>

    <cffunction name="setFirst_name" access="public"  output="false" returntype="void">
        <cfargument name="first_name" type="string" required="true" />
        <cfset variables.instance.first_name = arguments.first_name />
    </cffunction>

    <cffunction name="getFirst_name" access="public" returntype="string" output="false">
        <cfreturn variables.instance.first_name />
    </cffunction>

    <cffunction name="setLast_name" access="public"  output="false" returntype="void">
        <cfargument name="last_name" type="string" required="true" />
        <cfset variables.instance.last_name = arguments.last_name />
    </cffunction>

    <cffunction name="getLast_name" access="public" returntype="string" output="false">
        <cfreturn variables.instance.last_name />
    </cffunction>

    <cffunction name="setEmail" access="public"  output="false" returntype="void">
        <cfargument name="email" type="string" required="true" />
        <cfset variables.instance.email = arguments.email />
    </cffunction>

    <cffunction name="getEmail" access="public" returntype="string" output="false">
        <cfreturn variables.instance.email />
    </cffunction>

</cfcomponent>