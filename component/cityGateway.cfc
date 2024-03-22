
<cfcomponent displayname="cityGateway" output="false" >

    <cffunction name="getAllCities" access="public" returntype="query">
        <cfset var qCities = "" />

        <cfquery name="qCities" datasource="sakila">
            SELECT c.city_id, c.city, country.country
            FROM   city c
            inner join country on country.country_id = c.country_id
            ORDER BY country.country, c.city
        </cfquery>
        <cfreturn qCities>

    </cffunction>

</cfcomponent>