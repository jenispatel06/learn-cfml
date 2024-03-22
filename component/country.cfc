<cfcomponent displayname="country" output="false">

    <cfproperty name="country_id" type="numeric" default="0" />
    <cfproperty name="country" type="string" default="" />

    <cfset variables.instance = {} />

    <cffunction name="init" access="public" returntype="country" output="true">
        <cfargument name="country_id" type="numeric" default="0" />
        <cfargument name="country" type="string" default="" />

        <cfset this.setCountry_id(arguments.country_id) />
        <cfset this.setCountry(arguments.country) />
        
        <cfreturn this>
        
    </cffunction>

    <cffunction name="setCountry_id" access="public"  output="false" returntype="void">
        <cfargument name="country_id" required="true" />
        <cfset variables.instance.country_id = arguments.country_id />
    </cffunction>

    <cffunction name="getCountry_id" access="public" returntype="string" output="false">
        <cfreturn variables.instance.country_id />
    </cffunction>

    <cffunction name="setCountry" access="public" output="false" returntype="void">
        <cfargument name="country" required="true" />
        <cfset variables.instance.country = arguments.country>
    </cffunction>

    <cffunction name="getCountry" access="public" returntype="string" output="false">
        <cfreturn variables.instance.country>
    </cffunction>

</cfcomponent>