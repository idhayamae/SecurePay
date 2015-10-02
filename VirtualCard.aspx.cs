using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using IntranetDL;
using IntranetBL;
using Intranet.Utilities;

public partial class VirtualCard : BasePage
{
    private string strUserName =  "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if(Session["UserName"] != null)
                strUserName = Session["UserName"] + "";

            //strUserName = "Verizon";

                Label lblPageHeading = (Label)Master.FindControl("lblPageHeading");
                lblPageHeading.Text = "SecurePay";

                Label lblBreadCrumb = (Label)Master.FindControl("lblBreadCrumb");
                lblBreadCrumb.Text = "Home / VirtualCard";

                BL_VirtualCard objVirtCard = new BL_VirtualCard();
                string strResult = objVirtCard.CheckVirtualCard(strUserName);
                divAddCard.Visible = false;

                if (strResult == "1")
                {
                    rdoList.SelectedIndex = 1;
                    LoadExistingCards(strUserName);
                }
                else
                {
                    rdoList.SelectedIndex = 0;
                    divAgree.Visible = true;
                }


        }
        catch (Exception ex)
        {
            if (!ex.Message.ToString().Trim().Equals("Thread was being aborted."))
            {
                Util.WriteToLog("Index_Page_Load", ex.Message.ToString(), UserSession.EmpID);
                Response.Redirect(FindLink.ToNotAuthorised("Error"), true);
            }
        }
    }

    private void LoadExistingCards(string strUserName)
    {
        BL_VirtualCard objVC = new BL_VirtualCard();
        GridView1.DataSource = objVC.GetCards(strUserName);
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //Set logged user session
        //SetUserSession(Convert.ToInt64(TextBox1.Text));
        if (UserSession.EmpEID != null)
        {
            Response.Redirect("Index.aspx");
        }
    }
    protected void btnAgree_Click(object sender, EventArgs e)
    {
        BL_VirtualCard objVirtual = new BL_VirtualCard();
        if (rdoList.SelectedValue == "New Virtual card")
        {
            objVirtual.CreateVirtualCard(strUserName.Trim());
        }
        else
        {
            //option to modify virtual card
        }
    }
    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        divAddCard.Visible = true;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strMessage = "";
        BL_VirtualCard objVirtual = new BL_VirtualCard();
        int intResult = objVirtual.AddNewCard(txtCardNumber.Text, Convert.ToInt32(rdoBankList.SelectedValue), Convert.ToInt32(rdoCardType.SelectedValue), Convert.ToInt32(rdoAccountType.SelectedValue), Convert.ToInt32(txtPriority.Text), Convert.ToInt32(txtPercentage.Text), Convert.ToInt32(rdoAutoPay.SelectedIndex) , strUserName, txtNameonCard.Text);

        if (intResult > 0)
            strMessage = "Card created successfully";
        else
            strMessage = "Card not created. Please recheck the value and try again";

        divAddCard.Visible = false;
        LoadExistingCards(strUserName);
    }
    protected void rdoAccountType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdoAccountType.SelectedValue == "1")
            divConfirmation.Visible = true;
        else
            divConfirmation.Visible = false;
    }
    protected void rdoAccountType_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (rdoAccountType.SelectedValue == "1")
            divConfirmation.Visible = true;
        else
            divConfirmation.Visible = false;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
