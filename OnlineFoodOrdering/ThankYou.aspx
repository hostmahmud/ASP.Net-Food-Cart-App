<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="OnlineFoodOrdering.ThankYou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="section pt-5 pb-5 osahan-not-found-page">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center pt-5 pb-5">
                    <img class="img-fluid mb-2" src="img/thanks.png" alt="404">
                    <h1 class="mt-2 mb-2 text-success">Congratulations!</h1>
                    <p class="mb-5">You have successfully placed your order</p>
                    <a class="btn btn-primary btn-lg" href="MyOrders.aspx">View Order :)</a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
