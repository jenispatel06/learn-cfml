
<cfset variables.categoryGateway = new component.categoryGateway() />
    <cfset variables.category = variables.categoryGateway.get(category_id = val(form.category_id)) />
    <cfset variables.category.setName(form.name) />

    <cfset variables.category = variables.categoryGateway.save(variables.category) />
    <cfset variables.message = form.category_id EQ 0 ? "Data Inserted Successfully!" : "Data Updated Successfully!">
    
    <cflocation addtoken="false" url="index.cfm?id=#form.category_id#&message=#variables.message#" />
