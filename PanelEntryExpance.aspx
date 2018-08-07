<%@ Page Title="" Language="VB" MasterPageFile="~/Panel.master" AutoEventWireup="false" CodeFile="PanelEntryExpance.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageTitle" Runat="Server">Expanse Entry</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main">
	<table border="0" class="table-custom" style="width:100%">

		<tr>
			<th width="10%">Date</th>
			<th width="60%">Particular</th>
			<th width="10%">Invoice No</th>
			<th width="10%">Amount</th>
			
			<th width=""></th>
		</tr>
		<tr class="ac-dr">
			<td><input type="text" class="ac-date"></td>
			<td><input type="text" class="ac-list" name="udhar"></td>
			<td><input type="text" class="ac-invoice"></td>
			<td><input type="number" class="ac-amount"></td>
			<td><a href="#" class="crp acp">+</a></td>
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
			<td><a href="#" class="btn btn-success">Submit</a></td>
			<td></td>
			
		</tr>
	</table>
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
    
   
    <script type="text/javascript" src="js/entry-helper.js"></script>
</asp:Content>