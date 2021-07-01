<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="OnlineFoodOrdering.admin.Reports" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <h1 class="mt-4">Report</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item">
                        <a href="Default.aspx">Dashboard</a></li>
                    <li class="breadcrumb-item active">Report</li>
                </ol>
                <div class="col-md-12 d-block overflow-hidden mb-4">
                    <div class="form-group col-md-3 float-left">
                        <label>Select Customer</label>
                        <asp:DropDownList ID="ddlCustomer" runat="server" CssClass="form-control"></asp:DropDownList>
                        <span runat="server" id="ddlvalue"></span>
                    </div>
                    <div class="form-group col-md-6 float-left mt-4">
                        <asp:LinkButton runat="server" ID="btnShowReport" CssClass="btn btn-success" OnClick="btnShowReport_Click">Show Report</asp:LinkButton>
                    </div>
                </div>
                <div class="col-md-12">
                    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
                </div>
            </div>
        </main>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
