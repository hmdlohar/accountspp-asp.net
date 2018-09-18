<%@ Page Title="" Language="VB" MasterPageFile="~/Panel.master" AutoEventWireup="false" CodeFile="PanelProfitAndLoss.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageTitle" Runat="Server">Profit and Loss Account</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="main">
	<table class="table table-striped" border="1">
		<caption style="text-align: center">Trading & Profit And Loss Account of Shree raju and prakash Company From 1 March, 2017 to  31 January, 2018 </caption>
		<tr>
			<th width="50%">Particulars <span class="ac_amount">Amount</span></th>
			<th width="50%">Particulars <span class="ac_amount">Amount</span></th>
		</tr>
        <tbody id="tableRecordss">
        
        </tbody>
		<tr>
			<td>Capital Account <span class="ac_amount">5000</span></td>
			<td>Capital Account <span class="ac_amount">3000</span></td>
		</tr>
        
        <tr>
			<td>Capital Account <span class="ac_amount">5000</span></td>
			<td>Capital Account <span class="ac_amount">3000</span></td>
		</tr><tr>
			<td>Capital Account <span class="ac_amount">5000</span></td>
			<td>Capital Account <span class="ac_amount">3000</span></td>
		</tr><tr>
			<td>Capital Account <span class="ac_amount">5000</span></td>
			<td>Capital Account <span class="ac_amount">3000</span></td>
		</tr>
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
			                    <td>Capital Account <span class="ac_amount">5000</span></td>\
			                    <td>Capital Account <span class="ac_amount">3000</span></td>\
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
