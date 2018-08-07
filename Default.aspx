<%@ Page Title="" Language="VB" MasterPageFile="~/Front.master" AutoEventWireup="false" CodeFile="About.aspx.vb" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main-area">
         
         



          <style>
        /*jssor slider loading skin spin css*/
        .jssorl-009-spin img {
            animation-name: jssorl-009-spin;
            animation-duration: 1.6s;
            animation-iteration-count: infinite;
            animation-timing-function: linear;
        }

        @keyframes jssorl-009-spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /*jssor slider bullet skin 052 css*/
        .jssorb052 .i {position:absolute;cursor:pointer;}
        .jssorb052 .i .b {fill:#000;fill-opacity:0.3;}
        .jssorb052 .i:hover .b {fill-opacity:.7;}
        .jssorb052 .iav .b {fill-opacity: 1;}
        .jssorb052 .i.idn {opacity:.3;}

        /*jssor slider arrow skin 053 css*/
        .jssora053 {display:block;position:absolute;cursor:pointer;}
        .jssora053 .a {fill:none;stroke:#fff;stroke-width:640;stroke-miterlimit:10;}
        .jssora053:hover {opacity:.8;}
        .jssora053.jssora053dn {opacity:.5;}
        .jssora053.jssora053ds {opacity:.3;pointer-events:none;}
    </style>
<script src="js/jssor.slider.min.js" type="text/javascript"></script>

<script type="text/javascript">
    jssor_1_slider_init = function () {

        var jssor_1_SlideoTransitions = [
              [{ b: 0, d: 600, y: -290, e: { y: 27}}],
              [{ b: 0, d: 1000, y: 185 }, { b: 1000, d: 500, o: -1 }, { b: 1500, d: 500, o: 1 }, { b: 2000, d: 1500, r: 360 }, { b: 3500, d: 1000, rX: 30 }, { b: 4500, d: 500, rX: -30 }, { b: 5000, d: 1000, rY: 30 }, { b: 6000, d: 500, rY: -30 }, { b: 6500, d: 500, sX: 1 }, { b: 7000, d: 500, sX: -1 }, { b: 7500, d: 500, sY: 1 }, { b: 8000, d: 500, sY: -1 }, { b: 8500, d: 500, kX: 30 }, { b: 9000, d: 500, kX: -30 }, { b: 9500, d: 500, kY: 30 }, { b: 10000, d: 500, kY: -30 }, { b: 10500, d: 500, c: { x: 125.00, t: -125.00} }, { b: 11000, d: 500, c: { x: -125.00, t: 125.00}}],
              [{ b: 0, d: 600, x: 535, e: { x: 27}}],
              [{ b: -1, d: 1, o: -1 }, { b: 0, d: 600, o: 1, e: { o: 5}}],
              [{ b: -1, d: 1, c: { x: 250.0, t: -250.0} }, { b: 0, d: 800, c: { x: -250.0, t: 250.0 }, e: { c: { x: 7, t: 7}}}],
              [{ b: -1, d: 1, o: -1 }, { b: 0, d: 600, x: -570, o: 1, e: { x: 6}}],
              [{ b: -1, d: 1, o: -1, r: -180 }, { b: 0, d: 800, o: 1, r: 180, e: { r: 7}}],
              [{ b: 0, d: 1000, y: 80, e: { y: 24} }, { b: 1000, d: 1100, x: 570, y: 170, o: -1, r: 30, sX: 9, sY: 9, e: { x: 2, y: 6, r: 1, sX: 5, sY: 5}}],
              [{ b: 2000, d: 600, rY: 30}],
              [{ b: 0, d: 500, x: -105 }, { b: 500, d: 500, x: 230 }, { b: 1000, d: 500, y: -120 }, { b: 1500, d: 500, x: -70, y: 120 }, { b: 2600, d: 500, y: -80 }, { b: 3100, d: 900, y: 160, e: { y: 24}}],
              [{ b: 0, d: 1000, o: -0.4, rX: 2, rY: 1 }, { b: 1000, d: 1000, rY: 1 }, { b: 2000, d: 1000, rX: -1 }, { b: 3000, d: 1000, rY: -1 }, { b: 4000, d: 1000, o: 0.4, rX: -1, rY: -1}]
            ];

        var jssor_1_options = {
            $AutoPlay: 1,
            $Idle: 2000,
            $CaptionSliderOptions: {
                $Class: $JssorCaptionSlideo$,
                $Transitions: jssor_1_SlideoTransitions,
                $Breaks: [
                  [{ d: 2000, b: 1000}]
                ]
            },
            $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
            },
            $BulletNavigatorOptions: {
                $Class: $JssorBulletNavigator$
            }
        };

        var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

        /*#region responsive code begin*/

        var MAX_WIDTH = 980;

        function ScaleSlider() {
            var containerElement = jssor_1_slider.$Elmt.parentNode;
            var containerWidth = containerElement.clientWidth;

            if (containerWidth) {

                var expectedWidth = Math.min(MAX_WIDTH || containerWidth, containerWidth);

                jssor_1_slider.$ScaleWidth(expectedWidth);
            }
            else {
                window.setTimeout(ScaleSlider, 30);
            }
        }

        ScaleSlider();

        $Jssor$.$AddEvent(window, "load", ScaleSlider);
        $Jssor$.$AddEvent(window, "resize", ScaleSlider);
        $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
        /*#endregion responsive code end*/
    };
    </script>
<div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:980px;height:380px;overflow:hidden;visibility:hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" class="jssorl-009-spin" style="position:absolute;top:0px;left:0px;width:100%;height:100%;text-align:center;background-color:rgba(0,0,0,0.7);">
            <img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="img/spin.svg" />
        </div>
        <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:980px;height:380px;overflow:hidden;">
            
            
            <div>
                <img data-u="image" src="Styles/img/background2.jpg" />
                <div data-u="caption" data-t="5" style="position:absolute;top:30px;left:600px;width:500px;height:40px;font-family:Oswald,sans-serif;font-size:32px;font-weight:200;line-height:1.2;text-align:center;background-color:rgba(255,188,5,0.8);">Easy to use</div>
            </div>
            <div>
                <img data-u="image" src="Styles/img/background3.jpg" />
                <div data-u="caption" data-t="6" style="position:absolute;top:30px;left:30px;width:500px;height:40px;font-family:Oswald,sans-serif;font-size:32px;font-weight:200;line-height:1.2;text-align:center;background-color:rgba(255,188,5,0.8);">Available Anywhere</div>
            </div>
            <div data-b="0">
                <img data-u="image" src="Styles/img/background4.jpg" />
                <div data-u="caption" data-t="7" style="position:absolute;top:-50px;left:30px;width:500px;height:40px;font-family:Oswald,sans-serif;font-size:32px;font-weight:200;line-height:1.2;text-align:center;background-color:rgba(255,188,5,0.8);">Wide Range of Reports</div>
            </div>
           
            
        </div>
        <!-- Bullet Navigator -->
        <div data-u="navigator" class="jssorb052" style="position:absolute;bottom:12px;right:12px;" data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
            <div data-u="prototype" class="i" style="width:16px;height:16px;">
                <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                    <circle class="b" cx="8000" cy="8000" r="5800"></circle>
                </svg>
            </div>
        </div>
        <!-- Arrow Navigator -->
        <div data-u="arrowleft" class="jssora053" style="width:55px;height:55px;top:0px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
            </svg>
        </div>
        <div data-u="arrowright" class="jssora053" style="width:55px;height:55px;top:0px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
            </svg>
        </div>
    </div>
    <script type="text/javascript">        jssor_1_slider_init();</script>
         
         <br /><br /><br />
         <div class="trending-album-area">
            <div class="home-trending-title">
                Features of Accounts++
                
            </div>
            <div class="trending-album-list" >
                <div class="feature-list-item">
                    <h3>Easy to use </h3>
                    <p> 
                        Accounts++ is easy to use web application. no need to install any software in your machine.Accounts++ is simple online accounting application. It is useful for companies to record their account. It allows different types of accounting entries eg. Sales,purchase,cash,Journal entries... etc. User can see final status of their origination using final accounting statements like Balance sheet and Profit & Loss account.
                    </p>
                </div>
                <div class="feature-list-item">
                    <h3>Suitable for small business </h3>
                    <p> 
                        Accounts++ is lightweight web application to record your day to day financial transactions. It is not loaded with high end libraries and other high end stuff. It is made for simple and lightweight enviroment. 
                    </p>
                </div>
                <div class="feature-list-item">
                    <h3>Available Anywhere </h3>
                    <p> 
                        Accounts++ is web application that means it will be available anywhere. One can use Accounts++ at office and same thing at home too it just need Username/password of user. 
                    </p>
                </div>
                 <div class="feature-list-item">
                    <h3>All type of Transactions are covered. </h3>
                    <p> 
                        With Accounts++ you can record any kind of business transaction. You can have following types of entries. and for other entries not listed here you can use Journal.
                        <ul> 
                            <li>Sales Entry </li>
                            <li>Sales Return Entry </li>
                            <li>Purchase Entry </li>
                            <li>Purchase Return Entry </li>
                            <li>Income Entry </li>
                            <li>Expance Entry </li>
                            <li>Journal Entry </li>
                        </ul>
                    </p>
                </div>
                 <div class="feature-list-item">
                    <h3>Wide types of reports. </h3>
                    <p> 
                        Accounts++ Generates many types of reports including final accounts. These reports contains following reports. 
                        <ul> 
                            <li>Sales Book </li>
                            <li>Sales Return Book</li>
                            <li>Purchase Book</li>
                            <li>Purchase Return Book</li>
                            <li>Income Report</li>
                            <li>Expance Report </li>
                            <li>Cash Book</li>
                            <li>Trial Balance</li>
                            <li>Profie & Loss Account</li>
                            <li>Balance Sheet</li>
                        </ul>
                    </p>
                </div>

            </div>
        </div>   
        
         
    </div>
</asp:Content>

