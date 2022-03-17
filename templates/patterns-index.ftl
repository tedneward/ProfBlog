<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>${content.title}</h1>
	</div>

    ${content.body}

    (Back to the <a href="${content.rootpath}patterns">main catalog</a>.)

    <hr />

    <#if content.patternfilter == "pattern">
    <#assign filteredPatterns = patterns?filter(p -> p.tags?seq_contains(!p.tags?seq_contains("pattern implementation")) >
    <#else>
    <#assign filteredPatterns = patterns?filter(p -> p.tags?seq_contains(content.patternfilter?string) && !p.tags?seq_contains("pattern implementation")) >
    </#if>

    <h3>Index</h3>
    <ul>
	<#list filteredPatterns?sort_by("title") as pattern>
  		<#if (pattern.status == "published")>
  			<li><strong><a href="${content.rootpath}${pattern.uri}">${pattern.title}</a></strong>: ${pattern.description}</em></li>
  		</#if>
  	</#list>
    </ul>

    <h3>Implementations</h3>
    <#assign languages = ["javascript", "csharp", "fsharp", "java", "scala", "kotlin", "swift"] >
    <#list languages as lang>
    <h4>${lang}</h4>
        <ul>
        <#assign impls = filteredPatterns?filter(p -> p.tags?seq_contains("pattern implementation") && p.tags?seq_contains(lang?string)) >
        <#list impls?sort_by("title") as impl>
        <li><em><a href="${content.rootpath}${impl.uri}">${impl.title}</a></em></li>
        </#list>
        </ul>
    </#list>

<#include "footer.ftl">