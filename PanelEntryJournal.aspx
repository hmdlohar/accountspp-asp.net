<%@ Page Title="" Language="VB" MasterPageFile="~/Panel.master" AutoEventWireup="false" CodeFile="PanelEntryJournal.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageTitle" Runat="Server">Journal Entry</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="notiePopup" style="height:40px;width:100%;position: fixed;top:-80px;left:0px;background: green;color:white;z-index:20;transition: top 0.3s;font-size:35px;text-align:center;font-weight:bold;padding:10px;">hello</div>
<body>
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
			<td><input type="number" id="acAmountDebit" class="ac-amount"></td>
			<td></td>
			<td><a href="#" class="crp acp" style="display:none">+</a></td>
		</tr>
		<tr class="ac-cr">
			<td></td>
			<td></td>
			<td><input type="text" id="acCredit" class="ac-list"></td>
			<td></td>
			<td><input type="number" id="acAmountCredit" class="ac-amount" disabled></td>
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
    
    <script src="js/notie.js"></script>
    <script type="text/javascript" src="js/entry-helper.js"></script>
</asp:Content>