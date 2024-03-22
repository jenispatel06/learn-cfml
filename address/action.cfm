
<cfset variables.addressGateway = new component.addressGateway() />
    <cfset variables.address = variables.addressGateway.get(address_id = val(form.address_id)) />
    <cfset variables.address.setAddress(form.address) />
    <cfset variables.address.setDistrict(form.district) />
    <cfset variables.address.setPostal_code(form.postalcode) />
    <cfset variables.address.setCity_id(form.cityId) />
    <cfset variables.address.setPhone(form.phone)>
    

    <cfset variables.address = variables.addressGateway.save(variables.address) />
    <cfset variables.message = form.address_id EQ 0 ? "Data Inserted Successfully!" : "Data Updated Successfully!">
    
    <cflocation addtoken="false" url="index.cfm?id=#form.address_id#&message=#variables.message#" />
