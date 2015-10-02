<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HP.master" CodeFile="VirtualCard.aspx.cs" Inherits="VirtualCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="Popup_1/Js/function.js"></script>
    <link rel="stylesheet" type="text/css" href="Popup_1/Css/styles.css" /> 

        <script type="text/javascript">
            function enableordisable() {
                if (document.getElementById('ContentPlaceHolder1_chkAgree').checked == true) {
                    document.getElementById('ContentPlaceHolder1_btnAgree').disabled = false;
                }
                else {
                    document.getElementById('ContentPlaceHolder1_btnAgree').disabled = true;
                }
            }

            function makeVisible() {
                if (document.getElementById('ContentPlaceHolder1_chkAgree').checked == true) {
                    document.getElementById('ContentPlaceHolder1_btnAgree').disabled = false;
                }
                else {
                    document.getElementById('ContentPlaceHolder1_btnAgree').disabled = true;
                }
            }
            </script>
    <div class="selectlocation l_popup">
            <div class="close_l_popup">
            </div>
        </div>   

        <script type="text/javascript">
           
           
        </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">	
    <div class="divider">
    </div>
    <div id="divSliderContent" runat="server">
    </div>
    <section class="text_container">
		<div class="grid_8 eq_hgt">
			<section class="tabset_top">			
                <div id="divCenterTabsList" runat="server"></div>	
			    <section class="tab_content_main">
			        <div id="divCenterTabsContent" runat="server" style="width:600px;">

                        <asp:RadioButtonList ID="rdoList" runat="server" Enabled="false">
                            <asp:ListItem Value="New Virtual card" Selected="true"></asp:ListItem>
                            <asp:ListItem Value="Configure Existing Virtual Card"></asp:ListItem>
                        </asp:RadioButtonList>
                        <div id="divAgree" runat="server" visible ="false" >
                            Virtual Card is a feature enabled for all customers who can attach all their Credit / Debit cards for making the payment in  secure way and without providing the details for each & every transaction.

                            By providing this feature to the customers, Verizon ensures to strengthen the security and not sharing the customer card details to any Third party. By agreeing to this terms & conditions, you are allowing Verizon to process for product purchase / payment services using your cards.
                            <Br />
                            <asp:CheckBox ID="chkAgree" runat="server" onchange="enableordisable();"  /> I agree to the above terms and conditions.

                            <BR />
                            <asp:Button id="btnAgree" runat="server" Text="I Agree" OnClick="btnAgree_Click" Enabled="false"/>
                        </div>
			        </div>            
                    <div >
                        <hr />
                        <div id="divCardList" runat="server" >
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" style="width:100%;" ForeColor="#333333" GridLines="None"
                                PageSize="500" Font-Size="Medium" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField HeaderText="Card Number" SortExpression="PhysicalCard" DataField ="PhysicalCard"/>
                                    <asp:BoundField HeaderText="Name on Card" SortExpression="NameonCard" DataField ="NameonCard" />
                                    <asp:BoundField HeaderText="Account Type" SortExpression="AccountType" DataField ="AccountType" />
                                    <asp:BoundField HeaderText="Status" SortExpression="Verified" DataField ="Verified" />
                                    <asp:BoundField HeaderText="Bank Name" SortExpression="BankCode" DataField ="BankCode" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDelete" Text="Delete" CommandName="delRecord" runat="server" OnClientClick="return confirm('Are you sure want to delete this card?'); ">
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#CC0000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#CC0000" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <PagerStyle BackColor="#CC0000" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" Font-Size="Small" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        </div>
                        <div><asp:Button ID="btnAddNew" runat="server" OnClick="btnAddNew_Click" Text ="Add New Card"/></div>
                        <div class="panel panel-info" >
                        <div class="panel-heading panel-heading" runat="server" id="divAddCard">
                            <table border="1" width="80%">
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                    <td>
                                        <label class="col-md-9 control-label"> Card  Number : </label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCardNumber" runat="server" class="form-control" ></asp:TextBox>
                                    </td>
                                    <td>
                                        <label class="col-md-9 control-label">Name on Card : </label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNameonCard" runat="server" class="form-control" ></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                    <td>
                                        <label class="col-md-9 control-label">Bank :</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rdoBankList" runat="server" TextAlign ="Left">
                                            <asp:ListItem Text="HDFC" Selected="true" Value ="1"></asp:ListItem>
                                            <asp:ListItem Text="CITIBANK" Value="2"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                        <label class="col-md-9 control-label">Card Type :</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rdoCardType" runat="server" >
                                                <asp:ListItem Text="MAESTRO" Selected="true" Value ="1"></asp:ListItem>
                                                <asp:ListItem Text="VISA" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="AMEX" Value="3"></asp:ListItem>
                                            </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">&nbsp;</td>
                                </tr>

                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                    <td>
                                        <label class="col-md-9 control-label">Card Priority :</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPriority" runat="server" class="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <label class="col-md-9 control-label">Share Percentage :</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPercentage" runat ="server" class="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">&nbsp;</td>
                                </tr>

                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                    <td>
                                        <label class="col-md-9 control-label">Account Type :</label>
                                    </td>
                                    <td>
                                         <asp:RadioButtonList ID="rdoAccountType" runat="server" OnSelectedIndexChanged="rdoAccountType_SelectedIndexChanged1">
                                                    <asp:ListItem Text="CREDIT" Selected="true" Value ="3"></asp:ListItem>
                                                    <asp:ListItem Text="DEBIT" Value="4"></asp:ListItem>
                                                </asp:RadioButtonList>
                                    </td>
                                    <td>
                                       <label class="col-md-9 control-label"> AutoPay :</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rdoAutoPay" runat="server">
                                                    <asp:ListItem Text="YES" Selected="true" Value ="1"></asp:ListItem>
                                                    <asp:ListItem Text="NO" Value="2"></asp:ListItem>
                                                </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>

                            <div id="divConfirmation" runat ="server" >
                            For the Credit card, you can also use the feature of paying the Due amount from your attached Debit card / Savings Account. For this, there is service charge applicable as 0.5% of your transaction. <br />
                            <asp:CheckBox ID="chkConfirm" runat="server" /> I agree to the above terms and conditions.
                            </div>

                            <br /><br />
                            <asp:Button id="btnSubmit" runat="server" text="Submit" OnClick="btnSubmit_Click" />
                        </div>
                        </div>
                    </div>
			    </section>
			</section>
		</div>
		<!--Main Column-->
   </section>
</asp:Content>
