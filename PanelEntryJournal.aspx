<%@ Page Title="" Language="VB" MasterPageFile="~/Panel.master" AutoEventWireup="false" CodeFile="PanelEntryJournal.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageTitle" Runat="Server">Journal Entry</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main">
	<table border="0" class="table-custom" style="width:100%">
		<tr>
			<th width="10%">Date</th>
			<th width="40%">Ac From</th>
			<th width="40%">Ac To</th>
			<th width="10%">Amount Dr.</th>
			<th width="10%">Amount Cr.</th>
			<th width=""></th>
		</tr>
		<tr class="ac-dr">
			<td><input type="text" id="acDate" class="ac-date"></td>
			<td><input type="text" id="acDebit" class="ac-list"></td>
			<td></td>
			<td><input type="number" id="acAmount" class="ac-amount"></td>
			<td></td>
			<td><a href="#" class="crp acp" style="display:none">+</a></td>
		</tr>
		<tr class="ac-cr">
			<td></td>
			<td></td>
			<td><input type="text" id="acCredit" class="ac-list"></td>
			<td></td>
			<td><input type="number" class="ac-amount" disabled></td>
			<td><a href="#" class="drp acp" style="display:none">+</a></td>
			
		</tr>
		<tr>
			<td colspan="6"></td>
			
			
		</tr>
		<tr>
			<td colspan="6"></td>	
		</tr>
		<tr>
			<td></td>
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
</asp:Content>