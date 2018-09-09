<%@ Page Title="" Language="VB" MasterPageFile="~/Panel.master" AutoEventWireup="false" CodeFile="PanelExpanceReport.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageTitle" Runat="Server">Expance Report</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="main">
	<table class="table table-striped" border="1">
		<caption style="text-align: center">Expance Report </caption>
		<thead>
        <tr>
			<th width="15%">Date</th>
            <th>Particulars</th>
            <th>Voucher No.</th>
            <th width="10%">Amount</th>
		</tr>
        </thead>
        <tbody id="tableRecords">
            
        </tbody>
	</table>
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
    
   
    <script type="text/javascript" src="js/entry-helper.js"></script>
     <script>
         $.ajax({
             url: "dataModel.aspx",
             type: "POST",
             data: {
                 acByName: "Expance A/c",
                 acType: "real"
             },
             success: function (data) {
                 if (data != "notfound") {
                     loadRecords(data);
                 }
                 else {
                     notie.error("Could not load Transactions");
                 }

             },
             error: function (err) {
                 console.log(err.responseText);
             }
         });
         function loadRecords(id) {
             $("#tableRecords").empty();
             $.ajax({
                 url: "dataModel.aspx",
                 type: "POST",
                 data: {
                     listTransaction: id
                 },
                 success: function (data) {
                     if (data) {
                         jData = JSON.parse(data);
                         for (var i in jData) {
                             $("#tableRecords").append("<tr>" +
                             "<td>" + jData[i].id + "</td>" +
                             "<td>" + jData[i].name_credit + "</td>" +
                             "<td>" + jData[i].invoice + "</td>" +
                             "<td>" + jData[i].amount + "</td>" +
                             "</tr>");
                         }
                     }
                     else {
                         notie.error("Could not load Transactions");
                     }

                 },
                 error: function (err) {
                     console.log(err.responseText);
                 }
             });
         }
    </script>
</asp:Content>
