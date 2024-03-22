<cfoutput>
    
    <cfparam name="url.id" default="0" />
    <cfparam name="form.address" default="" />
    <cfparam name="form.district" default="" />
    <cfparam name="form.postalcode" default="" />
    <cfparam name="form.phone" default="" />
    <cfparam name="form.cityId" default=""/>
    
    <cfset variables.qGetAllCities =  new component.cityGateway().getAllCities() />

    <cfif val(url.id)>
        <cfset variables.address =  new component.addressGateway().get(address_id = url.id)>
  
        <cfset form.address = variables.address.getAddress() />
        <cfset form.district = variables.address.getDistrict() />
        <cfset form.postalcode = variables.address.getPostal_code() />
        <cfset form.phone = variables.address.getPhone() />
        <cfset form.cityId = variables.address.getCity_id() />
    
     </cfif>

<!DOCTYPE html>
<html>
<head>
    <title>FORM</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

    <cfinclude template="/includes/header.cfm">
    
    <div class="text-center mt-5">
        <h1 class="fw-bold">FORM</h1>
    </div>


    <div class="w-25 border border-dark bg-light mx-auto mt-5 mb-5 p-5 rounded ">
        <form action="/address/action.cfm" name="myForm" method="post" class="container">
           
            <input type="hidden" name="address_id" value="#url.id#">

            <div class=" w-50">      
                <label for="address" class="pt-3 pb-1 fw-bold">Address:</label>
                <input type="text" id="address" name="address" value="#form.address#"  />
            </div>
            <div class=" w-50">      
                <label for="district" class="pt-3 pb-1 fw-bold">District:</label>
                <input type="text" id="district" name="district" value="#form.district#" required />
            </div>
            <div class=" w-50">      
                <label for="postalcode" class="pt-3 pb-1 fw-bold">Postal Code:</label>
                <input type="number" id="postalcode" name="postalcode" value="#form.postalcode#" required />
            </div>
            <div class=" w-50">      
                <label for="phone" class="pt-3 pb-1 fw-bold">Phone:</label>
                <input type="tel" id="phone" name="phone" value="#form.phone#" required />
            </div>
            <div class=" w-50">      
                <label for="city" class="pt-3 pb-1 fw-bold">City</label>
                <select name="cityId" id="city" class="w-100">
                    <option value="">- SELECT CITY -</option>
                    <cfloop query="#variables.qGetAllCities#">
                        <option value="#variables.qGetAllCities.city_id#" <cfif form.cityId eq variables.qGetAllCities.city_id >selected</cfif>>
                            #variables.qGetAllCities.city# [#variables.qGetAllCities.country#]
                        </option>
                    </cfloop>
                </select>
            </div>
            <div class="text-center pt-4">
                <button type="button" onclick="formValidation()" class="btn btn-dark w-50">SUBMIT</button>
            </div >
        </form>
    <div>

        <script src="/assets/helper.js"></script>

        <script>

            function formValidation() {
                const form = document.myForm;
                const {
                        address:address,
                        district:district,
                        postalcode:postal_code,
                        phone:phone,
                        cityId:city_id
                      } = form;

                if(!isBlank(address, 'Please enter your Address!')) {
                    address.focus();
                    return false;
                }
                if(!isBlank(district, 'Please enter your District!')) {
                    district.focus();
                    return false;
                }
                if(!isBlank(postal_code, 'Please enter your PostalCode!')) {
                    postal_code.focus();
                    return false;
                }
                if(!isBlank(phone, 'Please enter your contact Number!')) {
                    phone.focus();
                    return false;
                }
                if(!isNumber(phone, 'Please enter your valid contact number!')) {
                    phone.focus();
                    return false;
                }
                if(!isBlank(city_id, 'Please select your city!')) {
                    cityId.focus();
                    return false;
                }
                form.submit();
            }

        </script>
</body>
</html>
</cfoutput>