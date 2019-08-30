<#--

    Solo - A small and beautiful blogging system written in Java.
    Copyright (c) 2010-present, b3log.org

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<section class="nexmoe-posts" id="brand-waterfall">
    <#list articles as article>
        <div class="nexmoe-post">
            <a href="${servePath}${article.articlePermalink}" title="${article.articleTitle} - ${blogTitle}">
                <div class="nexmoe-post-cover mdui-ripple">
                    <img src="${article.articleImg1URL}" alt="${article.articleTitle}"
                         data-src="/images/5c3aec85a4343.jpg" class=" ls-is-cached lazyloaded"
                         referrerpolicy="no-referrer">
                    <h1>${article.articleTitle}</h1>
                </div>
            </a>
            <div class="nexmoe-post-meta">
                <a>
                    <i class="nexmoefont iconfont solo-calendarl"></i>${article.articleUpdateDate?string("yyyy年MM月dd日")}
                </a>
                <a>
                    <i class="nexmoefont iconfont solo-heat"></i>${article.articleViewCount} °C
                </a>
                <#if article.articleCommentCount != 0>
                    <a href="${servePath}${article.articlePermalink}#comments">
                        <i class="nexmoefont iconfont solo-comment"></i>${article.articleCommentCount}
                    </a>
                </#if>
                <#list article.articleTags?split(",") as articleTag>
                    <#if articleTag_index == 0>
                        <#if article.category??>
                            <a class="nexmoefont iconfont solo-category -link"
                               href="${servePath}/category/${article.category.categoryURI}">${article.category.categoryTitle}</a>
                        </#if>
                    </#if>
                    <a class="nexmoefont iconfont solo-tag -link"
                       href="${servePath}/tags/${articleTag?url('UTF-8')}">${articleTag}</a>
                </#list>

            </div>
            <article>
                <p class="summary">${article.articleAbstractText}</p>
            </article>
        </div>
    </#list>
</section>

<#if 1 < paginationPageCount >
    <nav class="nexmoe-page-nav">
        <#if 1 != paginationPageNums?first>
            <a class="extend prev" rel="prev" href="${servePath}${path}?p=${paginationPreviousPageNum}">
                <i class="nexmoefont iconfont solo-left"></i>
            </a>
            <a class="page-number" href="${servePath}${path}">1</a>
            <span class="page-number">…</span>
        </#if>
        <#list paginationPageNums as paginationPageNum>
            <#if paginationPageNum == paginationCurrentPageNum>
                <span class="page-number current">${paginationPageNum}</span>
            <#else>
                <a class="page-number"
                   href="${servePath}${path}?p=${paginationPageNum}">${paginationPageNum}</a>
            </#if>
        </#list>
        <#if paginationPageNums?last != paginationPageCount>
            <span class="page-number">…</span>
            <a href="${servePath}${path}?p=${paginationPageCount}"
               class="page-number">${paginationPageCount}</a>
            <a class="extend next" rel="next" href="${servePath}${path}?p=${paginationNextPageNum}">
                <i class="nexmoefont iconfont solo-right"></i>
            </a>
        </#if>
    </nav>
</#if>
