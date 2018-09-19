<%@ Page Title="" Language="VB" MasterPageFile="~/Panel.master" AutoEventWireup="false" CodeFile="PanelProfitAndLoss.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pageTitle" Runat="Server">Profit and Loss Account</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="main">
	<table class="table table-striped" border="1">
		<caption style="text-align: center">Trading & Profit And Loss Account of <% Response.Write(Session("userData")("company_name"))%> </caption>
		<tr>
			<th width="50%">Particulars <span class="ac_amount">Amount</span></th>
			<th width="50%">Particulars <span class="ac_amount">Amount</span></th>
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
                window.drArray = [];
                window.crArray = [];

                for (i in jData) {
                    var bcr = "";
                    var bdr = "";
                    if (jData[i].ac_name == "Sales A/c") {
                        crArray.unshift(jData[i]);
                        continue;
                    }
                    else if (jData[i].ac_name == "Purchase A/c") {
                        drArray.unshift(jData[i]);
                        continue
                    }
                    else if (jData[i].ac_name == "Purchase Return A/c") {
                        crArray.unshift(jData[i]);
                        continue
                    }
                    else if (jData[i].ac_name == "Sales Return A/c") {
                        drArray.unshift(jData[i]);
                        continue
                    }
                    else {
                        if (jData[i].ac_type == "nominal") {
                            if (jData[i].ac_balance < 0) {
                                crArray.push(jData[i]);
                                bcr = Math.abs(jData[i].ac_balance);
                                totalCr += bcr;
                            }
                            else if (jData[i].ac_balance > 0) {
                                drArray.push(jData[i]);
                                bdr = jData[i].ac_balance;
                                totalDr += bdr;
                            }
                            else {
                                continue;
                            }
                        }
                    }
                }
                loadPNL(crArray, drArray);


            },
            error: function (err) {
                console.log(err.responseText);
            }
        });

        function loadPNL(crArray,drArray) {
            var totalCr = 0;
            var totalDr = 0;
            for(var i=0;i <crArray.length || i<drArray.length;i++){
                var d = "<tr>";
                if (drArray[i]) {
                    d += '<td>' + drArray[i].ac_name + '<span class="ac_amount">' + Math.abs(drArray[i].ac_balance) + '</span></td>'
                    totalDr += Math.abs(drArray[i].ac_balance);
                }
                else {
                    d += "<td></td>";
                }
                if (crArray[i]) {
                    d += '<td>' + crArray[i].ac_name + '<span class="ac_amount">' + Math.abs(crArray[i].ac_balance) + '</span></td>'
                    totalCr += Math.abs(crArray[i].ac_balance);
                }
                else {
                    d += "<td></td>";
                }
                d += "</tr>";
                $("#tableRecords").append(d);
            }
            if (totalCr >= totalDr) {
                console.log("profit");
                var d = '<tr><td> Profit<span class="ac_amount">' + Math.abs(totalCr-totalDr) + '</span></td><td> <span class="ac_amount"></span></td></tr>';
                $("#tableRecords").append(d);
                totalDr += Math.abs(totalCr - totalDr) 
            }
            else {
                console.log("loss");
                var d = '<tr><td><span class="ac_amount"></span></td><td>Loss <span class="ac_amount">' + Math.abs(totalCr - totalDr) + '</span></td></tr>';
                $("#tableRecords").append(d);
                totalCr+= Math.abs(totalCr - totalDr) 
            }

            var d = '<tr><th> Total<span class="ac_amount">' + totalDr + '</span></th><th> Total<span class="ac_amount">' + totalCr + '</span></th></tr>';
            $("#tableRecords").append(d);
        }

    </script>
</asp:Content>
