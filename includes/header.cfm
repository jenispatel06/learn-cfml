<cfif NOT structKeyExists(session, "name")>
    <cflocation url="index.cfm?msg=session expired" addtoken="false">
</cfif>

  <nav class="navbar navbar-dark bg-secondary ">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </nav>
    <div class="collapse " id="navbarToggleExternalContent">

    <div class="bg-dark p-4 d-flex gap-5">
      <div>
        <a href="/dashboard.cfm" class="text-light fw-bold link-underline-dark">HOME</a>
      </div>  
      <div class="dropdown">
          <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
            MENU
          </a>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
              <li><a class="dropdown-item" href="/actor/index.cfm">ACTOR</a></li>
              <li><a class="dropdown-item" href="/address/index.cfm">ADDRESS</a></li>
              <li><a class="dropdown-item" href="/customer/index.cfm">CUSTOMER</a></li>
              <li><a class="dropdown-item" href="/category/index.cfm">CATEGORY</a></li>
              <li><a class="dropdown-item" href="/country/index.cfm">COUNTRY</a></li>
              <li><a class="dropdown-item" href="/film/index.cfm">FILM</a></li>

          </ul>
      </div>
      <div class="float-end">
          <a href="/logout.cfm" class="text-light fw-bold link-underline-dark">LOG OUT</a>
      </div>
    </div>
    </div>
