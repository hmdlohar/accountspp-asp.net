<%@ Page Title="" Language="VB" MasterPageFile="~/Panel.master" AutoEventWireup="false" CodeFile="PanelTrialBalance.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageTitle" Runat="Server">Trial Balance</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main">
	<table class="table table-striped" border="1">
		<caption style="text-align: center">Trial Balance of <% Response.Write(Session("userData")("company_name"))%> </caption>
		<tr>
			<th width="10%">S. No.</th>
            <th>Ledger Accounts</th>
            <th width="15%">Debit(Rs.)</th>
			<th width="15%">Credit(Rs.)</th>
		</tr>
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
                all_accounts: "true"
            },
            success: function (data) {
                jData = JSON.parse(data);
                $("#tableRecords").empty();
                var totalCr = 0;
                var totalDr = 0;

                for (i in jData) {
                    var bcr = "";
                    var bdr = "";
                    if (jData[i].ac_balance < 0) {
                        bcr = Math.abs(jData[i].ac_balance);
                        totalCr += bcr;
                    }
                    else if (jData[i].ac_balance > 0) {
                        bdr = jData[i].ac_balance;
                        totalDr += bdr;
                    }
                    else {
                        continue;
                    }
                    var a = '<tr>\
			                    <td widtd="10%">' + ( parseInt(i) + 1 ) + '</td>\
                                <td>' + jData[i].ac_name + '</td>\
                                <td widtd="15%">' + bdr + '</td>\
			                    <td widtd="15%">' + bcr + '</td>\
		                    </tr>';
                    $("#tableRecords").append(a);
                }
                var total = '<tr>\
			                    <th widtd="10%"></t>\
                                <th>Total</th>\
                                <th widtd="15%">' + totalDr + '</th>\
			                    <th widtd="15%">' + totalCr + '</th>\
		                    </tr>';
                $("#tableRecords").append(total);
            },
            error: function (err) {
                console.log(err.responseText);
            }
        });

    </script>
</asp:Content>