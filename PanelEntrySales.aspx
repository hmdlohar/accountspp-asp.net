<%@ Page Title="" Language="VB" MasterPageFile="~/Panel.master" AutoEventWireup="false" CodeFile="PanelEntrySales.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageTitle" Runat="Server">Sales Entry</asp:Content>
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
        <input type="hidden" class="ac-list" id="acCredit">
		<tr class="ac-dr">
			<td><input type="text" class="ac-date" id="acDate"></td>
			<td><input type="text" class="ac-list" id="acDebit"></td>
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
    <br />
    <table class="table table-striped" border="1" >
				<caption style="text-align: center">Sale Book</caption>
		<thead>
        <tr>
			<th width="10%">Date</th>
            <th>Particulars</th>
            <th width="15%">Outward Invoice No.</th>
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
        $.ajax({
            url: "dataModel.aspx",
            type: "POST",
            data: {
                acByName: "Sales A/c",
                acType: "real"
            },
            success: function (data) {
                if (data != "notfound") {
                    $("#acCredit").data("id", data);
                    $("#acCredit").val(data);
                    window.acid = data;
                    loadRecords(data);
                    
                }

                console.log(data);
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
                            if (jData[i].ac_credit != id) {
                                continue;
                            }
                            var dt = new Date(parseInt(jData[i].date.split("(")[1].split(")")[0]));
                            $("#tableRecords").append("<tr>" +
                             "<td>" + dt.toLocaleDateString() + "</td>" +
                             "<td>" + jData[i].name_debit + "</td>" +
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