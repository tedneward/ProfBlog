<#include "header.ftl">

	<#include "menu.ftl">

	<div class="page-header">
		<h1>${content.title}</h1>
	</div>

	<p>${content.body}</p>

	<p><em>Last updated: ${content.date?string("dd MMMM yyyy")}</em></p>

<#include "footer.ftl">
