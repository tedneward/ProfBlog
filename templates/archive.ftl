<#include "header.ftl">

	<#include "menu.ftl">
	
	<div class="page-header">
		<h1>Archive</h1>
	</div>
	
	<!--<ul>-->
		<#list published_posts?reverse as post>
		<#if (last_year)??>
			<#if post.date?string("yyyy") != last_year>
				</ul>
				<h2>${post.date?string("yyyy")}</h4>
				<ul>
			</#if>
		<#else>
			<h2>${post.date?string("yyyy")}</h2>
			<ul>
		</#if>

		<li><a href="${content.rootpath}${post.uri}">${post.title}</a> (<em>${post.date?string("dd MMMM")}</em>)</li>

		<#assign last_year = post.date?string("yyyy")>
		</#list>
	</ul>
	
<#include "footer.ftl">