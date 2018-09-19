<%@ Page Title="" Language="VB" MasterPageFile="~/Front.master" AutoEventWireup="false" CodeFile="About.aspx.vb" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main-area">
               
            <div class="discription-background">
                <div class="discription-title">
                    About Accounts++
                </div>
                <div class="discription-content">
                    Accounts++ is simple online accounting application. It is useful for companies to record their account. It allows different types of accounting entries eg. Sales,purchase,cash,Journal entries... etc. User can see final status of their origination using final accounting statements like Balance sheet and Profit & Loss account.
                </div>
                <hr>
                <div class="discription-title">
                    Features
                </div>
                <div class="discription-content">
                   Accounts++ is web application built with ASP.NET Framework. User can register their company and then he/she can record their companies accounts securely. It provide accounting in same way as it was being done traditionally. Accounts++ provides different types of transaction entries which fulfill all the requirements of financial accounting system.<br />
&nbsp;&nbsp;&nbsp; 1. Sale Entry<br />
&nbsp;&nbsp;&nbsp; 2. Purchase Entry<br />
&nbsp;&nbsp;&nbsp; 3. Sale Return Entry<br />
&nbsp;&nbsp;&nbsp; 4. Purchase Return Entry<br />
&nbsp;&nbsp;&nbsp; 5. Income Entry<br />
&nbsp;&nbsp;&nbsp; 6. Expanse Entry<br />
&nbsp;&nbsp;&nbsp; 7. Cash Transaction Entry<br />
&nbsp;&nbsp;&nbsp; 8. Journal Entry (All other types of entries)<br />
                    It also provide following reports which are very useful for analysis.
                    <br />
                    <br />
                    1. Sale Book<br />
                    2. Purchase Book<br />
                    3. Sale Return Book<br />
                    4. Purchase Return Book<br />
                    5. Cash Book<br />
                    6. Income/Expanse Report<br />
                    7. Ledger Reports<br />
                    <br />
                    It also provide final account reports.
                    <br />
                    <br />
                    1. Trial Balance<br />
                    2. Trading and Profit &amp; Loss Account<br />
                    3. Balance Sheet<br />

                </div>
                
            </div>  

            <div class="contact-form-background">
                <h3>Contact Us: </h3>
                <div class="contact-form">
                    <form action="" method="POST" onsubmit="return false;" name="contactForm">
                        <table>
                            <tbody id="contactFormTable">
                                <tr><td><span class="form-item-heading">Your Name: </span></td></tr>
                                <tr><td>
                                    <input type="text" name="name" placeholder="Full Name" required>
                                </td></tr>
                                <tr><td><span class="form-item-heading">Your Email: </span> </td></tr>
                                <tr><td>
                                    <input type="text" name="email" placeholder="abcd@example.com" required>
                                </td></tr>
                                <tr><td><span class="form-item-heading">Subject: </span> </td></tr>
                                <tr><td>
                                    <input type="text" name="Subject" placeholder="About Question/Query/Suggestion" required>
                                </td></tr>
                                <tr><td><span class="form-item-heading">Discription: </span></td></tr>
                                <tr><td>
                                    <textarea  name="discription" placeholder="Discription of your Question/Query/Suggestion" required></textarea>
                                </td></tr>
                                <tr><td>
                                    <input type="submit" name="submit" value="Send Message">
                                </td></tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>  
        </div>
</asp:Content>

