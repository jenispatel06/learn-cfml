<cfcomponent displayname="address" output="false">

    <cfproperty name="address_id" type="numeric" default="0" />
    <cfproperty name="address" type="string" default="" />
    <cfproperty name="district" type="string" default="" />
    <cfproperty name="city_id" type="numeric" default="0" />
    <cfproperty name="postal_code" type="string" default="" />
    <cfproperty name="phone" type="string" default="" />

    <cfset variables.instance = {} />

    <cffunction name="init" access="public" returntype="address" output="true">
        <cfargument name="address_id" type="numeric" default="0" />
        <cfargument name="address" type="string" default="" />
        <cfargument name="district" type="string" default="" />
        <cfargument name="city_id" type="numeric" default="0" />
        <cfargument name="postal_code" type="string" default="" />
        <cfargument name="phone" type="string" default="" />

        <cfset this.setAddress_id(arguments.address_id) />
        <cfset this.setAddress(arguments.address) />
        <cfset this.setDistrict(arguments.district) />
        <cfset this.setCity_id(arguments.city_id) />
        <cfset this.setPostal_code(arguments.postal_code) />
        <cfset this.setPhone(arguments.phone) />
        
        <cfreturn this>
    </cffunction>

    <cffunction name="setAddress_id" access="public"  output="false" returntype="void">
        <cfargument name="address_id" required="true" />
        <cfset variables.instance.address_id = arguments.address_id />
    </cffunction>

    <cffunction name="getAddress_id" access="public" returntype="string" output="false">
        <cfreturn variables.instance.address_id />
    </cffunction>

    <cffunction name="setAddress" access="public"  output="false" returntype="void">
        <cfargument name="address" required="true" />
        <cfset variables.instance.address = arguments.address />
    </cffunction>

    <cffunction name="getAddress" access="public" returntype="string" output="false">
        <cfreturn variables.instance.address />
    </cffunction>

    <cffunction name="setDistrict" access="public"  output="false" returntype="void">
        <cfargument name="district" required="true" />
        <cfset variables.instance.district = arguments.district />
    </cffunction>

    <cffunction name="getDistrict" access="public" returntype="string" output="false">
        <cfreturn variables.instance.district />
    </cffunction>

    <cffunction name="setCity_id" access="public"  output="false" returntype="void">
        <cfargument name="city_id" required="true" />
        <cfset variables.instance.city_id = arguments.city_id />
    </cffunction>

    <cffunction name="getCity_id" access="public" returntype="string" output="false">
        <cfreturn variables.instance.city_id />
    </cffunction>

    <cffunction name="setPostal_code" access="public"  output="false" returntype="void">
        <cfargument name="postal_code" required="true" />
        <cfset variables.instance.postal_code = arguments.postal_code />
    </cffunction>

    <cffunction name="getPostal_code" access="public" returntype="string" output="false">
        <cfreturn variables.instance.postal_code />
    </cffunction>

    <cffunction name="setPhone" access="public"  output="false" returntype="void">
        <cfargument name="phone" required="true" />
        <cfset variables.instance.phone = arguments.phone />
    </cffunction>

    <cffunction name="getPhone" access="public" returntype="string" output="false">
        <cfreturn variables.instance.phone />
    </cffunction>

</cfcomponent>