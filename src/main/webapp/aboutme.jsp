<%--
  Created by IntelliJ IDEA.
  User: Zephery
  Date: 2017/7/21
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<jsp:include page="head.jsp">
    <jsp:param name="aboutmeactive" value="active"/>
    <jsp:param name="title" value="关于我"/>
</jsp:include>

<!DOCTYPE html>
<html>
<head>
    <link href="http://image.wenzhihuai.com/lanrenzhijia.css?ver=20171017" type="text/css"
          rel="stylesheet"/>
    <!--畅言获取评论数，未来有可能变为https-->
    <script type="text/javascript"
            src="http://assets.changyan.sohu.com/upload/plugins/plugins.count.js">
    </script>
    <link rel="stylesheet" href="http://image.wenzhihuai.com/editormd.preview.css?ver=20171017"/>
    <style>
        * {
            font-family: "微软雅黑", arial, sans-serif;
        }

        .colleft {
            margin-left: -30px;
        }

        .article-content h1 {
            margin: 20px -20px 20px -20px;
            padding: 10px 20px 9px 10px;
            border-left: 4px solid #00a67c;
            background-color: #fbfbfb
        }

        .icon-contact .sinaweibo {
            background-color: #EC5B5B;
        }

        .icon-contact .tencentweibo {
            background-color: #2BC0B5;
        }

        .icon-contact .wechat {
            background-color: #49C085;
        }

        .icon-contact .qq {
            background-color: #6F92FF;
        }

        .icon-contact .renren {
            background-color: #7243D4;
        }

        .icon-contact .github {
            background-color: #7782D1;
        }

        .icon-contact a {
            color: #fff !important;
        }

        .icon-contact #icon {
            float: left;
        }

        .icon-contact .col {
            width: 16.666667%;
            float: left;
            position: relative;
            min-height: 1px;
        }

        .icon-contact {
            max-width: 700px;
            text-indent: 0px;
            margin: 0 230px 0 250px
        }

        .friend-link a {
            color: #00a67c !important;
        }

        .tech {
            max-width: 700px;
            margin: auto;
        }

        .tech .item {
            width: 100%;
            clear: both;
            margin-right: auto;
            margin-left: auto;
            height: 35px;
        }

        .tech .describe {
            margin-right: 12px;
            text-align: center;
        }

        .tech .progress {
            float: left;
            height: 25px;
            background: #f2f2f2;
            border-left: 1px solid transparent;
            border-right: 1px solid transparent;
            width: 70%;
        }

        .tech .progress > span {
            position: relative;
            float: left;
            margin: 0 -1px;
            min-width: 30px;
            height: 25px;
            line-height: 21px;
            text-align: right;
            background: #cccccc;
            border: none;
            border-color: #bfbfbf #b3b3b3 #9e9e9e;
            -webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.3), 0 1px 2px rgba(0, 0, 0, 0.2);
            box-shadow: inset 0 1px rgba(255, 255, 255, 0.3), 0 1px 2px rgba(0, 0, 0, 0.2);
        }

        .tech .progress > span > span {
            padding: 0 8px;
            font-size: 14px;
            color: #404040;
            color: rgba(0, 0, 0, 0.7);
            line-height: 25px;
        }

        .tech .progress > span:before {
            content: '';
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            z-index: 1;
            height: 25px;
            border-radius: 10px;
        }

        .tech .progress .green {
            background: #49C085;
        }

        .tech .progress .darkblue {
            background: #7782D1;
        }

        .tech .progress .red {
            background: rgb(245, 138, 135);
        }

        .tech .progress .orange {
            background: #f2b63c;
        }

        .tech .progress .blue {
            background: #6F92FF;
        }

        @media (min-width: 750px) {
            .tech .describe {
                width: 130px;
                float: left;
            }

            .tech .progress {
                width: 79%;
                float: left;
            }
        }

        @media (max-width: 750px) {
            .tech .describe {
                width: 100%;
                margin-bottom: 5px;
                text-align: left;
            }

            .tech .progress {
                width: 100%;
                margin-bottom: 5px;
            }
        }

        /* 响应式布局 */
        @media (min-width: 768px) {
            .icon-contact {
                height: 80px;
                margin: auto;
                width: 100%;
                max-width: 700px;
            }

            .colleft {
                margin-left: -30px;
            }

            .icon-contact .fa {
                line-height: 70px;
                font-size: 35px;
                width: 70px;
            }

            .icon-contact .social-icon {
                display: inline-block;
                width: 70px;
                height: 70px;
                color: #fff;
                border-radius: 100%;
                margin: 6px;
                text-align: center;
                text-indent: 0px;
            }
        }

        @media (max-width: 768px) {
            .icon-contact {
                height: 60px;
                margin: auto;
                width: 100%;
            }

            .icon-contact .fa {
                line-height: 50px;
                font-size: 20px;
                width: 50px;
            }

            .colleft {
                margin-left: 0;
            }

            .icon-contact .social-icon {
                display: inline-block;
                width: 50px;
                height: 50px;
                color: #fff;
                border-radius: 100%;
                margin: 6px;
                text-align: center;
                text-indent: 0px;
            }
        }
    </style>
    <script>
        function showwechat() {
            console.log("hello world");
            $(".wechat-qrcode").css("display", "block");
        }
    </script>
</head>
<body class="home blog hPC">
<section class="contentcontainer">
    <div class="article-content" style="background-image: url(http://image.wenzhihuai.com/backgroundimage.jpg);
background-size: 100% 100%;background-attachment: fixed;">
        <div style="text-indent:0px;">
            <h1 style="text-align: center;margin: 0;background: transparent;color: white">个人简介</h1>
            <p><img src="http://image.wenzhihuai.com/66.jpg" style="border-radius:50%;width:100px"></p>
            <p style="text-align: center;font-size:16px;color: white">温志怀</p>
            <p style="text-align: center;color: white">爱音乐、爱编程。</p>
            <p style="text-align: center;color: white">人生百态，笑口常开，秉承自我，谨慎独行。</p>
            <p style="text-align: center;color: white">专注高并发、高可用、分布式计算</p>
            <p style="text-align: center;color: white">
                本站源码：<a href="https://github.com/Zephery/newblog" style="color: white">https://github.com/Zephery/newblog</a>
            </p>

            <p style="text-align: center;">
            </p>
            <h2 style="text-align: center;margin: 0;background: transparent;color: white">与我联系</h2>
            <div class="icon-contact">
                <div class="col" id="icon">
                    <a href="http://www.weibo.com/1925306000/profile" target="_blank"
                       class="social-icon tool-tip sinaweibo"
                       title="" data-placement="top" data-original-title="新浪微博"><i class="fa fa-weibo"></i></a>
                </div>
                <div class="col" id="icon">
                    <a href="http://t.qq.com/w1570631036?preview" target="_blank"
                       class="social-icon tool-tip tencentweibo" title="" data-placement="top"
                       data-original-title="腾讯微博"><i class="fa fa-tencent-weibo"></i></a>
                </div>
                <div class="col" id="icon">
                    <a title="1570631036" href="http://wpa.qq.com/msgrd?v=3&uin=1570631036&site=qq&menu=yes"
                       target="_blank" class="social-icon tool-tip qq" data-placement="top"
                       data-original-title="1570631036"><i class="fa fa-qq"></i></a>
                </div>
                <div class="col" id="icon">
                    <a href="https://github.com/Zephery" target="_blank" class="social-icon tool-tip github" title=""
                       data-placement="top" data-original-title="GitHub"><i class="fa fa-github"></i></a>
                </div>

                <div class="col" id="icon">
                    <a href="https://www.facebook.com/zephery.wen" target="_blank" class="social-icon tool-tip facebook"
                       title=""
                       data-placement="top" data-original-title="Facebook"><i class="fa fa-facebook"></i></a>
                </div>
                <div class="col colleft" id="icon">
                    <a href="http://image.wenzhihuai.com/mywechat.png" target="_blank"
                       class="social-icon tool-tip wechat" title=""
                       data-placement="top" data-original-title="WeChat" onmouseover="showwechat()"><i
                            class="fa fa-wechat"></i></a>
                </div>
                <%--<div class="wechat-qrcode" style="display: none"><h4>微信扫一扫：分享</h4>--%>
                <%--<div class="qrcode">--%>
                <%--<canvas width="100" height="100"></canvas>--%>
                <%--</div>--%>
                <%--</div>--%>
            </div>
            <p><!--end personal --></p>
            <p><!-- tech tree --></p>
            <h2 style="text-align: center;margin: 0;background: transparent;color: white">我的技能树</h2>
            <section class="tech">
                <div class="item">
                    <div class="describe" style="color: white">
                        Java
                    </div>
                    <div class="progress">
                        <span class="blue" style="width: 85%;"><span>85%</span></span>
                    </div>
                    <p></p>
                </div>
                <div class="item">
                    <div class="describe" style="color: white">
                        Python
                    </div>
                    <div class="progress">
                        <span class="green" style="width: 58%;"><span>58%</span></span>
                    </div>
                    <p></p>
                </div>
                <div class="item">
                    <div class="describe" style="color: white">
                        HTML/CSS/JS
                    </div>
                    <div class="progress">
                        <span class="green" style="width: 74%;"><span>74%</span></span>
                    </div>
                    <p></p>
                </div>
                <div class="item">
                    <div class="describe" style="color: white">
                        MySql
                    </div>
                    <div class="progress">
                        <span class="darkblue" style="width: 82%;"><span>82%</span></span>
                    </div>
                    <p></p>
                </div>
            </section>
            <p><!-- end tech --></p>
        </div>
        <%@include file="myreading.jsp" %>
    </div>
</section>
<br>
<%@include file="foot.jsp" %>
</body>
</html>