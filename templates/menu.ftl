	<!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="http://www.newardassociates.com">Neward & Associates</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>index.html">Blog Home</a></li>
            <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>archive.html">Archive</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sections <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li class="dropdown-header">Some of my Favorites</li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>speaking-tips/">Speaker Tips</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>blog/2006/the-vietnam-of-computer-science.html">O/R-M is the Vietnam of Computer Science</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>blog/2016/enterprise-computing-fallacies.html">The Fallacies of Enterprise Computing</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>blog/2009/sscli-20-internals.html">SSCLI 2.0 Internals</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>blog/2016/functional-java.html">Functional Java</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>blog/2016/on-finding-learning.html">On Finding learning</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>blog/2016/the-value-of-failure.html">The Value of Failure</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>blog/207/programming-promises.html">Programming Promises; a Programmer's Hippocratic Oath</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Patterns, Revisited</li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>patterns/">Catalog</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>patterns/creational/">Creational</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>patterns/structural/">Structural</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>patterns/behavioral/">Behavioral</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>patterns/PatternImplementations.html">Implementation notes</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Interop Briefs</li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>interop-briefs/begin-at-the-beginning.html">Begin at the Beginning</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>interop-briefs/check-your-politics.html">Check Your Politics at the Door</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>interop-briefs/in-proc-interoperability.html">In-Proc Interoperability</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>interop-briefs/in-proc-interop-with-ikvm.html">In-Proc Interop with IKVM</a></li>
                <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>interop-briefs/out-of-proc-interop-using-intrinsycs-j-integra.html">Out-of-Proc Interop with Intrinsyc's J-Integra</a></li>
              </ul>
            </li>
            <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>tags/index.html">All Tags</a></li>
            <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>about.html">About</a></li>
            <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>${config.feed_file}">Subscribe</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    <div class="container">