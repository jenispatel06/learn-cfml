
    <cfset variables.actorGateway = new component.actorGateway() />
    <cfset variables.actor = variables.actorGateway.get(actor_id = val(form.actor_id)) />
    <cfset variables.actor.setFirst_name(form.fname) />
    <cfset variables.actor.setLast_name(form.lname) />
    <cfset variables.actor.setEmail(form.mail) />

    <cfset variables.actor = variables.actorGateway.save(variables.actor) />
    <cfset variables.message = form.actor_id EQ 0 ? "Data Inserted Successfully!" : "Data Updated Successfully!">
    
    <cflocation addtoken="false" url="index.cfm?id=#form.actor_id#&message=#variables.message#" />
