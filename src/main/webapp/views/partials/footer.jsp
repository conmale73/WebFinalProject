<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Site footer -->
<c:choose>
    <c:when test ="${lev2}"> <%--    neu la Admin--%>

    </c:when>
<c:otherwise>

<style>
    /*.site-footer*/
    /*{*/
    /*    background-image: url(data:image/jpeg;base64,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);*/
    /*    background-repeat: no-repeat;*/
    /*    background-size: 100% 100%;*/
    /*}*/
    .site-footer
    {
        background-color:#26272b;
        padding:45px 0 20px;
        font-size:15px;
        line-height:24px;
        color:#737373;
    }
    .site-footer hr
    {
        border-top-color:#bbb;
        opacity:0.5
    }
    .site-footer hr.small
    {
        margin:20px 0
    }
    .site-footer h6
    {
        color:#fff;
        font-size:16px;
        text-transform:uppercase;
        margin-top:5px;
        letter-spacing:2px
    }
    .site-footer a
    {
        color:#737373;
    }
    .site-footer a:hover
    {
        color:#3366cc;
        text-decoration:none;
    }
    .footer-links
    {
        padding-left:0;
        list-style:none
    }
    .footer-links li
    {
        display:block
    }
    .footer-links a
    {
        color:#737373
    }
    .footer-links a:active,.footer-links a:focus,.footer-links a:hover
    {
        color:#3366cc;
        text-decoration:none;
    }
    .footer-links.inline li
    {
        display:inline-block
    }
    .site-footer .social-icons
    {
        text-align:right
    }
    .site-footer .social-icons a
    {
        width:40px;
        height:40px;
        line-height:40px;
        margin-left:6px;
        margin-right:0;
        border-radius:100%;
        background-color:#33353d
    }
    .copyright-text
    {
        margin:0
    }
    @media (max-width:991px)
    {
        .site-footer [class^=col-]
        {
            margin-bottom:30px
        }
    }
    @media (max-width:767px)
    {
        .site-footer
        {
            padding-bottom:0
        }
        .site-footer .copyright-text,.site-footer .social-icons
        {
            text-align:center
        }
    }
    .social-icons
    {
        padding-left:0;
        margin-bottom:0;
        list-style:none
    }
    .social-icons li
    {
        display:inline-block;
        margin-bottom:4px
    }
    .social-icons li.title
    {
        margin-right:15px;
        text-transform:uppercase;
        color:#96a2b2;
        font-weight:700;
        font-size:13px
    }
    .social-icons a{
        background-color:#eceeef;
        color:#818a91;
        font-size:16px;
        display:inline-block;
        line-height:44px;
        width:44px;
        height:44px;
        text-align:center;
        margin-right:8px;
        border-radius:100%;
        -webkit-transition:all .2s linear;
        -o-transition:all .2s linear;
        transition:all .2s linear
    }
    .social-icons a:active,.social-icons a:focus,.social-icons a:hover
    {
        color:#fff;
        background-color:#29aafe
    }
    .social-icons.size-sm a
    {
        line-height:34px;
        height:34px;
        width:34px;
        font-size:14px
    }
    .social-icons a.facebook:hover
    {
        background-color:#3b5998
    }
    .social-icons a.twitter:hover
    {
        background-color:#00aced
    }
    .social-icons a.linkedin:hover
    {
        background-color:#007bb6
    }
    .social-icons a.dribbble:hover
    {
        background-color:#ea4c89
    }
    @media (max-width:767px)
    {
        .social-icons li.title
        {
            display:block;
            margin-right:0;
            font-weight:600
        }
    }
</style>
    <div style="height: 250px"></div>
    <!-- Site footer -->
    <footer class="site-footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <h6>About</h6>
                    <p class="text-justify">Scanfcode.com <i>CODE WANTS TO BE SIMPLE </i> is an initiative  to help the upcoming programmers with the code. Scanfcode focuses on providing the most efficient code or snippets as the code wants to be simple. We will help programmers build up concepts in different programming languages that include C, C++, Java, HTML, CSS, Bootstrap, JavaScript, PHP, Android, SQL and Algorithm.</p>
                </div>

                <div class="col-xs-6 col-md-3">
                    <h6>Categories</h6>
                    <ul class="footer-links">
                        <li><a href="http://scanfcode.com/category/c-language/">C</a></li>
                        <li><a href="http://scanfcode.com/category/front-end-development/">UI Design</a></li>
                        <li><a href="http://scanfcode.com/category/back-end-development/">PHP</a></li>
                        <li><a href="http://scanfcode.com/category/java-programming-language/">Java</a></li>
                        <li><a href="http://scanfcode.com/category/android/">Android</a></li>
                        <li><a href="http://scanfcode.com/category/templates/">Templates</a></li>
                    </ul>
                </div>

                <div class="col-xs-6 col-md-3">
                    <h6>Quick Links</h6>
                    <ul class="footer-links">
                        <li><a href="http://scanfcode.com/about/">About Us</a></li>
                        <li><a href="http://scanfcode.com/contact/">Contact Us</a></li>
                        <li><a href="http://scanfcode.com/contribute-at-scanfcode/">Contribute</a></li>
                        <li><a href="http://scanfcode.com/privacy-policy/">Privacy Policy</a></li>
                        <li><a href="http://scanfcode.com/sitemap/">Sitemap</a></li>
                    </ul>
                </div>
            </div>
            <hr>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <p class="copyright-text">Copyright &copy; 2017 All Rights Reserved by
                        <a href="#">Scanfcode</a>.
                    </p>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <ul class="social-icons">
                        <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                        <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    </c:otherwise>
</c:choose>

