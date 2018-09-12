<%@ Page Title="" Language="VB" MasterPageFile="~/Panel.master" AutoEventWireup="false" CodeFile="PanelLedger.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageTitle" Runat="Server">Cash Book</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="main">
    <table class="table table-striped" border="1" >
		 <caption style="text-align: center" id="acTitle"> </caption>
		<thead>
       
		
        <tr>
			<th width="10%">Date</th>
            <th>A/c Debit</th>
            <th>A/c Credit</th>
            <th width="15%">Voucher No.</th>
			<th width="15%">Amount</th>
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
        $(document).ready(function () {
            loadRecords(window.acid);
            $("#acTitle").text(window.acname);
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
                            
                            var dt = new Date(parseInt(jData[i].date.split("(")[1].split(")")[0]));
                            $("#tableRecords").append("<tr>" +
                             "<td>" + dt.toLocaleDateString() + "</td>" +
                             "<td>" + jData[i].name_debit + "</td>" +
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