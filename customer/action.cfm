
<cfset variables.customerGateway = new component.customerGateway() />
<cfset variables.customer = variables.customerGateway.get(customer_id = val(form.customer_id)) />
<cfset variables.customer.setFirst_name(form.fname) />
<cfset variables.customer.setLast_name(form.lname) />
<cfset variables.customer.setEmail(form.mail) />

<cfset variables.customer = variables.customerGateway.save(variables.customer) />
<cfset variables.message = form.customer_id EQ 0 ? "Data Inserted Successfully!" : "Data Updated Successfully!">

<cflocation addtoken="false" url="index.cfm?id=#form.customer_id#&message=#variables.message#" />
