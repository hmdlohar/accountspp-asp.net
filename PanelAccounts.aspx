<%@ Page Title="" Language="VB" MasterPageFile="~/Panel.master" AutoEventWireup="false" CodeFile="PanelAccounts.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageTitle" Runat="Server">Accounts</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="main">
	
			
				<div class="row">
					<div class="col">
						<button class="btn btn-primary" type="button" style="margin:10px;float:right;" onclick="addAccountDialog()">Add Account</button>
					</div>
				</div>
				<table class="table table-candenced">
					<thead style="background:white"> 
						<tr> 
							<th># </th>
							<th>Name</th>
							<th>Type</th>
							<th>Balance</th>
							<th width="20%">Action</th>
						</tr>
					</thead>
					<tbody id="acListBody"> 
					
					</tbody>
					
				</table>
			
		
		<div class="container add-ac" id="addAcDialog" style="display:none"> 
			<div class="close-btn btn btn-primary" onclick="$(this).parent().hide(500)" >
				X
			</div>
			<table class="table">
				<caption>Account Operation </caption>
				<tr>
					<td>Account Name:</td>
					<td><input type="text" name="ac-name" class="form-control" id="acName"> </td>
				</tr>
				<tr>
					<td>Account Type:</td>
					<td>
						<select class="form-control" name="ac-type" id="acType">
							<option value="personal"> Personal</option>
							<option value="real"> Real</option>
							<option value="nominal"> Nominal </option>
						</select>
					</td>
				</tr>
				<tr>
					<td></td>
					<td><input type="number" name="ac-balance" value="0" class="form-control" id="acBalance" style="
					    display:none"> </td>
				</tr>
				<tr>
					<td></td>
					<td><input type="button" name="ac-add" value="Add Account" id="addAcBtn" class="btn btn-primary"> </td>
				</tr>
			</table>
		</div>
		<script src="js/acManage.js"></script>
</div>
</asp:Content>

