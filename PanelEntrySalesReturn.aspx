<%@ Page Title="" Language="VB" MasterPageFile="~/Panel.master" AutoEventWireup="false" CodeFile="PanelEntrySalesReturn.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageTitle" Runat="Server">Sales Return Entry</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main">
	<table border="0" class="table-custom" style="width:100%">

		<tr>
			<th width="10%">Date</th>
			<th width="60%">Particular</th>
			<th width="10%">Invoice No</th>
			<th width="10%">Amount</th>
			
			
		</tr>
        <input type="hidden" class="ac-list" id="acAmountCredit">
        <input type="hidden" class="ac-list" id="acDebit">
		<tr class="ac-dr">
			<td><input type="text" class="ac-date" id="acDate"></td>
			<td><input type="text" class="ac-list" id="acCredit"></td>
			<td><input type="text" class="ac-invoice" id="acInvoice"></td>
			<td><input type="number" class="ac-amount" id="acAmountDebit"></td>
			
		</tr>
		
		<tr>
			<td colspan="5"></td>
			
			
		</tr>
		<tr>
			<td colspan="5"></td>	
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td><a href="#" class="btn btn-success" id="btnEntry">Submit</a></td>
			<td></td>
			
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
                acByName: "Sales Return A/c",
                acType: "real"
            },
            success: function (data) {
                if (data != "notfound") {
                    $("#acDebit").data("id", data);
                    $("#acDebit").val(data);
                }
                console.log(data);
            },
            error: function (err) {
                console.log(err.responseText);
            }
        });
    </script>
</asp:Content>