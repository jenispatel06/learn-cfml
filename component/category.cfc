<cfcomponent displayname="category" output="false">

    <cfproperty name="category_id" type="numeric" default="0" />
    <cfproperty name="name" type="string" default="" />

    <cfset variables.instance = {} />

    <cffunction name="init" access="public" returntype="category" output="true">
        <cfargument name="category_id" type="numeric" default="0" />
        <cfargument name="name" type="string" default="" />

        <cfset this.setCategory_id(arguments.category_id) />
        <cfset this.setName(arguments.name) />
        
        <cfreturn this>
    </cffunction>

    <cffunction name="setCategory_id" access="public"  output="false" returntype="void">
        <cfargument name="category_id" required="true" />
        <cfset variables.instance.category_id = arguments.category_id />
    </cffunction>

    <cffunction name="getCategory_id" access="public" returntype="string" output="false">
        <cfreturn variables.instance.category_id />
    </cffunction>

    <cffunction name="setName" access="public" output="false" returntype="void">
        <cfargument name="name" required="true" />
        <cfset variables.instance.name = arguments.name>
    </cffunction>

    <cffunction name="getName" access="public" returntype="string" output="false">
        <cfreturn variables.instance.name>
    </cffunction>


</cfcomponent>