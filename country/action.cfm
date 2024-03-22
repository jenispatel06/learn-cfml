
<cfset variables.countryGateway = new component.countryGateway() />
    <cfset variables.country = variables.countryGateway.get(country_id = val(form.country_id)) />
    <cfset variables.country.setCountry(form.country) />

    <cfset variables.country = variables.countryGateway.save(variables.country) />
    <cfset variables.message = form.country_id EQ 0 ? "Data Inserted Successfully!" : "Data Updated Successfully!">
    
    <cflocation addtoken="false" url="index.cfm?id=#form.country_id#&message=#variables.message#" />

    