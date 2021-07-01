<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="EditRestaurant.aspx.cs" Inherits="OnlineFoodOrdering.admin.EditRestaurant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="layoutSidenav_content">
        <main id="main" runat="server">
            <div class="container-fluid">
                <h1 class="mt-4">Add Restaurant</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item">
                        <a href="Default.aspx">Dashboard</a></li>
                    <li class="breadcrumb-item active">Add Restaurant</li>
                </ol>
                <asp:Panel runat="server" ID="showMsg" role="alert">
                    <asp:Label runat="server" ID="aspMsg" CssClass="d-flex"></asp:Label>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </asp:Panel>
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card mb-4">
                            <div class="card-header">
                                Basic info
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Name</label>
                                            <asp:TextBox ID="txtRestaurantId" runat="server" CssClass="d-none"></asp:TextBox>
                                            <asp:TextBox ID="txtName1" runat="server" CssClass="form-control" placeholder="ex. star kabab"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Category</label>
                                            <asp:DropDownList CssClass="custom-select" ID="ddlCategory1" runat="server">
                                                <asp:ListItem>--Select Category--</asp:ListItem>
                                                <asp:ListItem>Thai</asp:ListItem>
                                                <asp:ListItem>Italian</asp:ListItem>
                                                <asp:ListItem>Japanese</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>Short Description</label>
                                            <asp:TextBox CssClass="form-control" ID="txtDesc1" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group col-md-5 float-left">
                                            <label>Banner Photo </label>
                                            <br />
                                            <asp:FileUpload ID="fileBanner" runat="server" onchange="document.getElementById('ContentPlaceHolder1_bannerPreview').src = window.URL.createObjectURL(this.files[0])" />
                                            <br />
                                            <small>Upload photo with size 1920x595 pixel</small>
                                            <span runat="server" id="oldBannerImageName" class="d-none"></span>
                                        </div>
                                        <div class="form-group col-md-7 float-left">
                                            <img runat="server" class="img-fluid img-thumbnail bannerPreview" id="bannerPreview" style="max-height: 180px;" src="../img/placeholder/1.jpg" alt="banner image preview" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group col-md-5 float-left">
                                            <label>Logo</label>
                                            <asp:FileUpload ID="ImgLogo" runat="server" onchange="document.getElementById('ContentPlaceHolder1_logoPreview').src = window.URL.createObjectURL(this.files[0])" />
                                            <br />
                                            <small>Upload photo with size 300x300 pixel</small>
                                            <span runat="server" id="oldLogoImageName" class="d-none"></span>
                                        </div>
                                        <div class="form-group col-md-7 float-left">
                                            <img runat="server" class="img-fluid img-thumbnail" style="max-height: 180px;" id="logoPreview" src="../img/placeholder/1.jpg" alt="logo image preview" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-12">
                        <div class="card mb-4">
                            <div class="card-header">
                                Location
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Select City</label>
                                            <div class="styled-select">
                                                <asp:DropDownList ID="ddlCity1" runat="server" CssClass="custom-select">
                                                    <asp:ListItem>--Select City--</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <span class="d-none" runat="server" id="lid"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Address</label>
                                            <asp:TextBox ID="txtAddress1" CssClass="form-control" placeholder="ex. 250, Fifth Avenue..." runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>State (optional)</label>
                                            <asp:TextBox ID="txtState1" CssClass="form-control" runat="server" placeholder="ex. DHK"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Zip Code</label>
                                            <asp:TextBox ID="txtZip1" CssClass="form-control" runat="server" placeholder="ex. 1205"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-right mb-4">
                            <asp:Button CssClass="btn btn-lg btn-success " ID="btnUpdate" runat="server" Text="Save" OnClick="btnUpdate_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
