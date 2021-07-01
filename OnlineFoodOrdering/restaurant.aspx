<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="restaurant.aspx.cs" Inherits="OnlineFoodOrdering.restaurant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        img.img-fluid.item-img {
            width: 100%;
            height: 150px;
        }

        .allitemimg {
            width: 100%;
            height: 80px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="restaurant-detailed-banner">
        <div class="text-center">
            <img runat="server" id="resBanner" class="img-fluid cover" src="#">
        </div>
        <div class="restaurant-detailed-header">
            <div class="container">
                <div class="row d-flex align-items-end">
                    <div class="col-md-8">
                        <div class="restaurant-detailed-header-left">
                            <img runat="server" id="resImg" class="img-fluid mr-3 float-left" alt="" src="#">
                            <h2 class="text-white" runat="server" id="restaurantName"></h2>
                            <p class="text-white mb-1">
                                <i class="icofont-location-pin"></i><span runat="server" id="restaurantAddress"></span>
                            </p>
                            <p class="text-white mb-0">
                                <i class="icofont-food-cart"></i><span runat="server" id="cat"></span>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="restaurant-detailed-header-right text-right">
                            <button class="btn btn-success" type="button">
                                <i class="icofont-clock-time"></i>24 Hours Open
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="offer-dedicated-body pt-2 pb-2 mt-4 mb-4">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="offer-dedicated-body-left">
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade active show" id="pills-order-online" role="tabpanel" aria-labelledby="pills-order-online-tab">
                                <div class="row">
                                    <h5 class="mb-4 mt-3 col-md-6 col-sm-12 float-left">Best Sellers 
                                    </h5>
                                    <asp:UpdateProgress runat="server" ID="progress1" DisplayAfter="1000" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanel1" class="col-md-6 col-sm-12 alert alert-success">
                                        <ProgressTemplate>
                                            <i class="fa fa-check-circle"></i>Item added to cart
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:ListView ID="ListViewPopularMenu" runat="server" OnItemCommand="ListViewPopularMenu_ItemCommand">
                                                <ItemTemplate>
                                                    <div class="col-md-4 col-sm-6 mb-4 float-left">
                                                        <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
                                                            <div class="list-card-image">
                                                                <a href="#">
                                                                    <img src="<%# "/admin/restaurantImages/menuImg/"+Eval("Image") %>" class="img-fluid item-img">
                                                                </a>
                                                            </div>
                                                            <div class="p-3 position-relative">
                                                                <div class="list-card-body">
                                                                    <h6 class="mb-1"><%# Eval("Title") %></h6>
                                                                    <p class="text-gray time mb-0 overflow-hidden">
                                                                        <%# "Tk. "+string.Format("{0:0}", Convert.ToDecimal(Eval("Price"))) %> <span class="float-right">
                                                                            <asp:LinkButton runat="server" ID="btnAddCart" CommandArgument='<%# Eval("Id") %>' CommandName="AddToCart" CssClass="btn btn-outline-success btn-sm btnAddCart" Text="ADD"></asp:LinkButton>
                                                                        </span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:ListView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="row">
                                    <h5 class="mb-4 mt-3 col-md-6">All Items</h5>
                                    <asp:UpdateProgress runat="server" ID="UpdateProgress1" DisplayAfter="1000" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanel2" class="col-md-6 col-sm-12 alert alert-success">
                                        <ProgressTemplate>
                                            <i class="fa fa-check-circle"></i> Item added to cart
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                    <div class="col-md-12">
                                        <div class="bg-white rounded border shadow-sm mb-4">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <asp:ListView ID="LVAllMenuItems" runat="server" OnItemCommand="LVAllMenuItems_ItemCommand">
                                                        <ItemTemplate>
                                                            <div class="gold-members p-3 border-bottom">
                                                                <asp:LinkButton runat="server" ID="btnAddCart2" CommandArgument='<%# Eval("Id") %>' CommandName="AddToCart2" CssClass="btn btn-outline-secondary btn-sm  float-right btnAddCart2" Text="ADD"></asp:LinkButton>
                                                                <div class="media">
                                                                    <div class="mr-3"><i class="icofont-ui-press text-success food-item"></i></div>
                                                                    <div class="media-body">
                                                                        <h6 class="mb-1"><%# Eval("Title") %></h6>
                                                                        <p class="text-gray mb-0"><%# "Tk. "+string.Format("{0:0}", Convert.ToDecimal(Eval("Price"))) %></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="generator-bg rounded shadow-sm mb-4 p-4 osahan-cart-item">
                        <h5 class="mb-1 text-white">YOUR CART</h5>
                        <p class="mb-4 text-white"><span runat="server" id="CartCountNumber"></span> items in your cart.</p>
                        <div class="bg-white rounded shadow-sm mb-2">
                            <asp:GridView runat="server" ID="GVCart" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="100%" HorizontalAlign="Center" AutoGenerateColumns="false" OnRowCommand="GVCart_RowCommand">
                                <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F7DE" HorizontalAlign="Center" />
                                
                                <Columns>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <span><%# Eval("Title") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <span><%# string.Format("{0:C}", Convert.ToDecimal(Eval("Price"))) %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Qty">
                                        <ItemTemplate>
                                            <span><%# Eval("Quantity") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total">
                                        <ItemTemplate>
                                            <span><%# string.Format("{0:C}", Convert.ToDecimal(Eval("ItemTotal"))) %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" CssClass="btn btn-danger btn-sm" ID="BtnRemoveFromCart" CommandArgument='<%# Eval("Id") %>' CommandName="RemoveCartItem">
                                                <i class="fa fa-trash-alt"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div>No records found.</div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:ListView ID="LVCartItems" runat="server" style="display:none" DataSourceID="ObjectDataSource1" OnItemCommand="LVCartItems_ItemCommand">
                                <ItemTemplate>
                                    <div class="gold-members p-2 d-none">
                                        <span class="count-number float-right">
                                            <p class="btn btn-outline-secondary btn-sm left dec mb-0 mr-2">
                                                Tk. <%# string.Format("{0:0}", Convert.ToDecimal(Eval("Price"))) %>
                                            </p>
                                            <asp:LinkButton runat="server" ID="BtnRemoveFromCart" CommandArgument='<%# Eval("Id") %>' CommandName="RemoveFromCart" Text="Remove" CssClass="btn btn-outline-danger btn-sm left dec btnRemoveCart">
                                                <i class="fa fa-trash"></i>
                                            </asp:LinkButton>
                                        </span>
                                        <div class="media">
                                            <div class="mr-2"><i class="icofont-ui-press text-success food-item"></i></div>
                                            <div class="media-body">
                                                <p class="mt-1 mb-0 text-black"><%# Eval("Title") %></p>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <p class="alert alert-info">
                                        <i class="fa fa-info-circle"></i>Your cart is empty...
                                    </p>
                                </EmptyDataTemplate>
                            </asp:ListView>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetCartItems" TypeName="OnlineFoodOrdering.restaurant"></asp:ObjectDataSource>

                        </div>
                        <div class="mb-2 bg-white rounded p-2 clearfix">
                            <h6 class="font-weight-bold text-right mb-2">Subtotal : Tk. <span runat="server" id="rCarttotal" class="text-danger">Tk. 00</span></h6>
                            <p class="seven-color mb-1 text-right">Extra charges may apply</p>
                        </div>
                        <a href="Checkout.aspx" class="btn btn-success btn-block btn-lg">Checkout <i class="icofont-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

    <script type="text/javascript">
        (function () {
            const btnCartAdd = document.querySelectorAll('.btnAddCart');
            const btnCartAdd2 = document.querySelectorAll('.btnAddCart2');
            btnCartAdd.forEach(function (btn) {
                btn.addEventListener('click', function (event) {
                    btn.innerHTML = "Adding...";
                    setTimeout(
                        function () {
                            btn.innerHTML = "Added";
                        }, 1000);
                    btn.classList.toggle("btn-outline-danger");
                })
            });
            btnCartAdd2.forEach(function (btn2) {
                btn2.addEventListener('click', function (event) {
                    btn2.innerHTML = "Adding...";
                    setTimeout(
                        function () {
                            btn2.innerHTML = "Added";
                        }, 1000);
                    btn2.classList.toggle("btn-outline-danger");
                })
            });
        })();
    </script>
</asp:Content>
