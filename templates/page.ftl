<#include "header.ftl">

	<#include "menu.ftl">

	<#if (content.title)??>
	<div class="page-header">
		<h1>${content.title}</h1>
	</div>
	<#else></#if>

	<p><em>${content.date?string("dd MMMM yyyy")}</em></p>

	<p>${content.body}</p>

	Tags:
	<#list content.tags as tag>
	<a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>tags/${tag}.html">${tag}</a>&nbsp;&nbsp;
	</#list>

	<hr />

<#include "footer.ftl">