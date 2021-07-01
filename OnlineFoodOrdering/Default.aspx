<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineFoodOrdering._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="pt-5 pb-5 homepage-search-block position-relative">
        <div class="banner-overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="owl-carousel owl-carousel-four owl-theme owl-loaded owl-drag">

                        <div class="owl-stage-outer">
                            <div class="owl-stage" style="transform: translate3d(-1110px, 0px, 0px); transition: all 0s ease 0s; width: 3608px;">

                                <asp:Repeater ID="RepterDetails" runat="server">
                                    <ItemTemplate>
                                        <div class="owl-item">
                                            <div class="item">
                                                <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
                                                    <div class="list-card-image">
                                                        <div class="star position-absolute"><span class="badge badge-warning"><i class="icofont-star"></i>3.1 (300+)</span></div>
                                                        <div class="favourite-heart text-danger position-absolute"><a href="detail.html"><i class="icofont-heart"></i></a></div>
                                                        <a href='/restaurant?id=<%# Eval("r_id") %>'>
                                                            <img src='<%# "/admin/restaurantImages/" + Eval("r_banner_img") %>' class="img-fluid item-img">
                                                        </a>
                                                    </div>
                                                    <div class="p-3 position-relative">
                                                        <div class="list-card-body">
                                                            <h6 class="mb-1"><a href='/restaurant?id=<%# Eval("r_id") %>' class="text-black"><%# Eval("r_name") %></a></h6>
                                                            <p class="text-gray mb-3"><%# Eval("l_address") %> • <%# Eval("l_city") %> • <%# Eval("l_zip") %></p>
                                                            <p class="text-gray mb-3 time"><%# Eval("r_desc") %></p>
                                                        </div>
                                                        <div class="list-card-badge text-center">
                                                            <a class="btn btn-warning btn-sm" href='/restaurant?id=<%# Eval("r_id") %>'>View Menus</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                        <div class="owl-nav">
                            <button type="button" role="presentation" class="owl-prev"><i class="icofont-thin-left"></i></button>
                            <button type="button" role="presentation" class="owl-next"><i class="icofont-thin-right"></i></button>
                        </div>
                        <div class="owl-dots disabled"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
