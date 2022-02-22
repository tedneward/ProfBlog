<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>${content.title}</h1>
	</div>

    ${content.body}

    <hr />

    <h3>Index</h3>
    <#assign filteredPatterns = patterns?filter(p -> p.tags?seq_contains(content.patternfilter?string)) >
    <ul>
	<#list filteredPatterns?sort_by("title") as pattern>
  		<#if (pattern.status == "published")>
  			<li><a href="${content.rootpath}${pattern.uri}">${pattern.title}</a>: <em>${pattern.description}</em></li>
  		</#if>
  	</#list>
    </ul>

    <h3>Implementations</h3>
    <#assign languages = ["javascript", "csharp", "fsharp", "java", "scala", "kotlin", "swift"] >
    <#list languages as lang>
    <h4>${lang}</h4>
        <ul>
        <#assign impls = patterns?filter(p -> p.tags?seq_contains("pattern implementation") && p.tags?seq_contains(lang?string)) >
        <#list impls?sort_by("title") as impl>
        <li><a href="${content.rootpath}${impl.uri}">${impl.title}</a>: <em>${impl.description}</em></li>
        </#list>
        </ul>
    </#list>

<#include "footer.ftl">