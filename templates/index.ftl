<#include "header.ftl">
	
	<#include "menu.ftl">

	<h3>Sections</h3>
	Before wandering through the list, maybe you're looking for <a href="patterns/">patterns reimagined</a> or <a href="speaking-tips/">Speaker Tips/</a>?

	<div class="page-header">
		<h1>Blog</h1>
	</div>
	<#list posts[0..*10] as post>
  		<#if (post.status == "published")>
  			<a href="${post.uri}"><h2>${post.title}</h2></a>
			<h4><em>${post.description}</em></h4>
  			<p>${post.date?string("dd MMMM yyyy")}</p>
  			<p>${post.body?keep_before("<!--more-->")}</p>
  		</#if>
  	</#list>
	
	<hr />
	
	<p>Older posts are available in the <a href="${content.rootpath}${config.archive_file}">archive</a>.</p>

<#include "footer.ftl">