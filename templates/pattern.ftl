<#include "header.ftl">

	<#include "menu.ftl">

	<div class="page-header">
		<h1>${content.title}</h1>
	</div>

	<p>${content.body}</p>

	<p><em>Last updated: ${content.date?string("dd MMMM yyyy")}</em></p>

	Tags:
	<#list content.tags as tag>
	<a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>tags/${tag}.html">${tag}</a>&nbsp;&nbsp;
	</#list>

<#include "footer.ftl">
