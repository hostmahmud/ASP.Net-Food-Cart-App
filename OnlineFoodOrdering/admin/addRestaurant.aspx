<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="addRestaurant.aspx.cs" Inherits="OnlineFoodOrdering.admin.addRestaurant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" ID="updatePanel1">
        <ContentTemplate>
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
                                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="ex. star kabab"></asp:TextBox>
                                                    <span runat="server" id="txtNameErr" style="color: red"></span>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Category</label>
                                                    <asp:DropDownList CssClass="custom-select" ID="ddlCategory" runat="server">
                                                        <asp:ListItem>--Select Category--</asp:ListItem>
                                                        <asp:ListItem>Thai</asp:ListItem>
                                                        <asp:ListItem>Italian</asp:ListItem>
                                                        <asp:ListItem>Japanese</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <span runat="server" id="ddlCategoryErr" style="color: red"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label>Short Description</label>
                                                    <asp:TextBox CssClass="form-control" ID="txtDesc" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                                    <span runat="server" id="txtDescErr" style="color: red"></span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group col-md-5 float-left">
                                                    <label>Banner Photo </label>
                                                    <br />
                                                    <asp:FileUpload ID="fileBanner" runat="server" onchange="document.getElementById('bannerPreview').src = window.URL.createObjectURL(this.files[0])" />
                                                    <br />
                                                    <small>Upload photo with size 1920x595 pixel</small>
                                                    <span runat="server" id="bannerErr" style="color: red"></span>
                                                </div>
                                                <div class="form-group col-md-7 float-left">
                                                    <img class="img-fluid img-thumbnail" id="bannerPreview" style="max-height: 180px;" src="../img/placeholder/1.jpg" alt="banner image preview" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group col-md-5 float-left">
                                                    <label>Logo</label>
                                                    <asp:FileUpload ID="ImgLogo" runat="server" onchange="document.getElementById('logoPreview').src = window.URL.createObjectURL(this.files[0])" />
                                                    <br />
                                                    <small>Upload photo with size 300x300 pixel</small>
                                                    <span runat="server" id="logoErr" style="color: red"></span>
                                                </div>
                                                <div class="form-group col-md-7 float-left">
                                                    <img class="img-fluid img-thumbnail" style="max-height: 180px;" id="logoPreview" src="../img/placeholder/1.jpg" alt="logo image preview" />
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
                                                        <asp:DropDownList ID="ddlCity" runat="server" CssClass="custom-select">
                                                            <asp:ListItem>--Select City--</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <span runat="server" id="ddlCityErr" style="color: red"></span>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <asp:TextBox ID="txtAddress" CssClass="form-control" placeholder="ex. 250, Fifth Avenue..." runat="server"></asp:TextBox>
                                                </div>
                                                <span runat="server" id="txtAddressErr" style="color: red"></span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>State (optional)</label>
                                                    <asp:TextBox ID="txtState" CssClass="form-control" runat="server" placeholder="ex. DHK"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Zip Code</label>
                                                    <asp:TextBox ID="txtZip" CssClass="form-control" runat="server" placeholder="ex. 1205"></asp:TextBox>
                                                </div>
                                                <span runat="server" id="txtZipErr" style="color: red"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-right mb-4">
                                    <asp:Button CssClass="btn btn-lg btn-success " ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CausesValidation="true" ValidationGroup="CustomValidation"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:CustomValidator ID="CustomValidator" runat="server" ValidationGroup="CustomValidation" OnServerValidate="CustomValidator_ServerValidate"></asp:CustomValidator>
                </main>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
