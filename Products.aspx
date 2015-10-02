<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HP.master" CodeFile="Products.aspx.cs" Inherits="Products" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="Popup_1/Js/function.js"></script>
    <link rel="stylesheet" type="text/css" href="Popup_1/Css/styles.css" /> 


    <div class="selectlocation l_popup">
            <div class="close_l_popup">
            </div>
        </div>   

        <script type="text/javascript">
          
      function RadioCheck(rb) {

          var gv = document.getElementById("<%=GridView1.ClientID%>");

         var rbs = gv.getElementsByTagName("input");

 

         var row = rb.parentNode.parentNode;

         for (var i = 0; i < rbs.length; i++) {

             if (rbs[i].type == "radio") {

                 if (rbs[i].checked && rbs[i] != rb) {

                     rbs[i].checked = false;

                     break;

                 }

             }

         }

     }     

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
			        <div id="divCenterTabsContent" runat="server"></div>            
			    </section>
			</section>
		</div>
		<!--Main Column-->
		<!--Sidebar Right START-->
		<asp:SqlDataSource ID="DB" runat="server" ConnectionString="Data Source=113.128.163.245,1433;Initial Catalog=nextgenpaysecure;User ID=nextgen;Password=nextgen"
                        SelectCommand="select ProductID,ProductName,PDescription,PAmount from ProductDetails where Pstatus='Y' order by ProductName">
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataSourceID="DB" ForeColor="#333333" GridLines="None"
                        PageSize="500" Width="890px" Font-Size="Medium" DataKeyNames="ProductID" >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                        
                            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID" Visible="false"/>
                            <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                            <asp:BoundField DataField="PDescription" HeaderText="Description" SortExpression="PDescription" />
                            <asp:BoundField DataField="PAmount" HeaderText="Amount" SortExpression="PAmount"/>
                                <asp:TemplateField>
                        <ItemTemplate>
                            <asp:RadioButton ID="RadioButton1" runat="server" onclick = "RadioCheck(this);"/>
                    <asp:HiddenField ID="HiddenField1" runat="server"  Value = '<%#Eval("ProductID")%>' />
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

        <asp:Button ID="btnSubmit" Text="Proceed to Pay" runat="server" OnClick="btnSubmit_Click"/>
   </section>
</asp:Content>

