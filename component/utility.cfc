<cfcomponent displayname="utility">

    <cffunction name="ListTable" access="public" returntype="any" output="true">
        <cfargument name="columns" type="array" required="true">
        <cfargument name="qData" type="query" required="true">

        <table class="table table-bordered ">
            <thead>
                <tr>
                    <cfloop array="#arguments.columns#" item="local.column" index="local.index">
                        <th class="text.center">#local.column.label#</th>
                    </cfloop>
                </tr>
            </thead>
            <tbody>
                <cfloop query="qData">
                    <tr> 
                        <cfloop array="#arguments.columns#" item="local.column" index="local.index">
                            <cfset var classNames = local.column.classes ?: "" />
                            <td class="#classNames#">
                                #renderCell(local.column, qData.GetRow(qData.currentRow))#
                            </td>
                        </cfloop>
                    </tr>

                </cfloop>
            </tbody>
        </table>
    </cffunction>

    <cffunction name="renderCell" access="public" returntype="any" output="false">
        <cfargument name="column" type="struct" required="true">
        <cfargument name="data" type="struct" required="true">

        <cfif arguments.column.keyExists("content")>
            <cfreturn arguments.column.content(arguments.data) />
        </cfif>
        <cfreturn arguments.data[arguments.column.fieldName] />
    </cffunction>
</cfcomponent>