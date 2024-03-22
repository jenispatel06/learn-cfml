<cfcomponent displayname="addressDAO" output="true">
    <cffunction name="read" access="public" returntype="address" output="true">
        <cfargument name="address_id" type="numeric" required="true">

        <cfset variables.datasource = "sakila">

        <cfset var qAddress = "" />
        <cfquery name="qAddress" datasource="#variables.datasource#">
            select * 
            from address
            where address_id = <cfqueryparam value="#arguments.address_id#" cfsqltype="cf_sql_integer" />
        </cfquery>
 
        <cfif qAddress.recordCount >
            <cfreturn new address().init(argumentCollection = qAddress.getRow(1)) />
        <cfelse>
            <cfreturn new address().init() />
        </cfif>
    </cffunction>

    <cffunction name="insert" access="public" output="false"  returntype="address">
        <cfargument name="address" type="address" required="true">

        <cfset var qAddress = "" />
        <cfquery name="qAddress" datasource="sakila">    
            INSERT INTO address (address, district, postal_code, city_id, phone)
            VALUES
            (
                <cfqueryparam value="#arguments.address.getAddress()#" cfsqltype="cf_sql_varchar"/>,
                <cfqueryparam value="#arguments.address.getDistrict()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.address.getPostal_code()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.address.getCity_id()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.address.getPhone()#" cfsqltype="cf_sql_varchar" />
            );
            select last_insert_id() address_id;
        </cfquery>
        <cfset arguments.address.setAddress_id(qAddress.address_id) />

        <cfreturn arguments.address />

    </cffunction>

    <cffunction name="update" access="public" output="false" returntype="address">
        <cfargument name="address" type="address" required="true">

        <cfquery datasource="sakila">    
            UPDATE address
            SET
                address = <cfqueryparam value="#arguments.address.getAddress()#" cfsqltype="cf_sql_varchar" />,
                district = <cfqueryparam value="#arguments.address.getDistrict()#" cfsqltype="cf_sql_varchar" />,
                postal_code = <cfqueryparam value="#arguments.address.getPostal_code()#" cfsqltype="cf_sql_varchar" />,
                phone = <cfqueryparam value="#arguments.address.getPhone()#" cfsqltype="cf_sql_varchar" />,
                city_id = <cfqueryparam value="#arguments.address.getCity_id()#" cfsqltype="cf_sql_integer"/>
            WHERE address_id = <cfqueryparam value="#arguments.address.getAddress_id()#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
        <cfreturn arguments.address />
       
    </cffunction>
</cfcomponent>