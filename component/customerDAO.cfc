<cfcomponent displayname="customerDAO" output="true">
    <cffunction name="read" access="public" returntype="customer" output="true">
        <cfargument name="customer_id" type="numeric" required="true">

        <cfset variables.datasource = "sakila">

        <cfset var qCustomer = "" />
        <cfquery name="qCustomer" datasource="#variables.datasource#">
            select * 
            from customer
            where customer_id = <cfqueryparam value="#arguments.customer_id#" cfsqltype="cf_sql_integer" />
        </cfquery>
 
        <cfif qCustomer.recordCount >
            <cfreturn new customer().init(argumentCollection = qCustomer.getRow(1)) />
        <cfelse>
            <cfreturn new customer().init() />
        </cfif>
    </cffunction>

    <cffunction name="insert" access="public" output="false"  returntype="customer">
        <cfargument name="customer" type="customer" required="true">

        <cfset var qCustomers = "" />
        <cfquery name="qCustomers" datasource="sakila">    
            INSERT INTO customer (first_name, last_name, email)
            VALUES
            (
                <cfqueryparam value="#arguments.customer.getFirst_name()#" cfsqltype="cf_sql_varchar"/>,
                <cfqueryparam value="#arguments.customer.getLast_name()#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.customer.getEmail()#" cfsqltype="cf_sql_varchar" />
            );
            select last_insert_id() customer_id;
        </cfquery>
        <cfset arguments.customer.setCustomer_id(qCustomers.customer_id) />

        <cfreturn arguments.customer />

    </cffunction>

    <cffunction name="update" access="public" output="false" returntype="customer">
        <cfargument name="customer" type="customer" required="true">

        <cfquery datasource="sakila">    
            UPDATE customer
            SET
                first_name = <cfqueryparam value="#arguments.customer.getFirst_name()#" cfsqltype="cf_sql_varchar" />,
                last_name = <cfqueryparam value="#arguments.customer.getLast_name()#" cfsqltype="cf_sql_varchar" />,
                email = <cfqueryparam value="#arguments.customer.getEmail()#" cfsqltype="cf_sql_varchar" />
            WHERE customer_id = <cfqueryparam value="#arguments.customer.getCustomer_id()#" cfsqltype="cf_sql_int" />
        </cfquery>

        <cfreturn arguments.customer />
       
    </cffunction>

</cfcomponent>