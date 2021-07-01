<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="AddMenu.aspx.cs" Inherits="OnlineFoodOrdering.admin.AddMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" ID="updatepanel"> 
        <ContentTemplate>
            <div id="layoutSidenav_content">
                <main runat="server" id="main">
                    <div class="container-fluid">
                        <h1 class="mt-4">Add Food Menu</h1>
                        <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item">
                            <a href="Default.aspx">Dashboard</a></li>
                            <li class="breadcrumb-item active">Add Menu list</li>
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
                                     Add Menu Item
                                  </div>
                                  <div class="card-body">
                                     <div class="box_general padding_bottom">
                                        <div class="wrapper_indent">
                                           <div class="form-group col-12">
                                              <label class="col-2 float-left">Restaurant</label>
                                               <asp:DropDownList ID="ddlRestaurantList" runat="server" CssClass="form-control col-4 ddlRestaurantList"></asp:DropDownList>
                                               <asp:CustomValidator CssClass="offset-2" ID="resError" runat="server" ErrorMessage="" OnServerValidate="resError_ServerValidate" ValidationGroup="insertValidation" ForeColor="Red"></asp:CustomValidator>
                                           </div>
                                           <div class="menu-item-section bg-light d-flex rounded p-3 mb-3 align-items-center">
                                              <h6 class="m-0">Item Details</h6>
                                              <div class="ml-auto">
                                         
                                              </div>
                                           </div>
                                           <div class="strip_menu_items">
                                              <div class="row">
                                                 <div class="col-sm-3 overflow-hidden">
                                                    <asp:FileUpload ID="foodItemImage" runat="server" CssClass="foodItemImage" onchange="document.getElementById('imgPreview').src = window.URL.createObjectURL(this.files[0])" />
                                                     <br />
                                                    <small>Upload photo with size 300x300 pixel</small>
                                                    <span runat="server" id="menuLogoErr" style="color: red"></span>
                                                     <img id="imgPreview" width="150" class="imgPreview mt-2"/>
                                                 </div>
                                                 <div class="col-sm-9">
                                                    <div class="row">
                                                       <div class="col-md-8">
                                                          <label>Title</label>
                                                          <div class="input-group">
                                                              <div class="input-group-prepend">
                                                                <span class="input-group-text"><i class="fas fa-utensils"></i></span>
                                                              </div>
                                                              <asp:TextBox ID="txtTitle" CssClass="form-control h-auto" runat="server"></asp:TextBox>
                                                          </div>
                                                           <asp:CustomValidator ID="titleError" runat="server" ErrorMessage="txtTitle" ValidationGroup="insertValidation" ForeColor="Red" OnServerValidate="titleError_ServerValidate"></asp:CustomValidator>
                                                       </div>
                                                       <div class="col-md-4">
                                                           <label>Price</label>
                                                          <div class="input-group">
                                                              <div class="input-group-prepend">
                                                                <span class="input-group-text">&#2547;</span>
                                                              </div>
                                                              <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control h-auto"></asp:TextBox>
                                                          </div>
                                                           <asp:CustomValidator ID="priceError" runat="server" ValidationGroup="insertValidation" ForeColor="Red" OnServerValidate="priceError_ServerValidate"></asp:CustomValidator>
                                                       </div>
                                                    </div>
                                                    <div class="form-group">
                                                       <label>Short description</label>
                                                        <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" TextMode="MultiLine" Height="100px"></asp:TextBox>
                                                        <asp:CustomValidator ID="descError" runat="server" ValidationGroup="insertValidation" ForeColor="Red" OnServerValidate="descError_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                 </div>
                                              </div>
                                           </div>
                                        </div>
                                     </div>
                                  </div>
                               </div>
                               <div class="text-right mb-4">
                                   <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" CausesValidation="true" ValidationGroup="insertValidation"/>
                               </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    
</asp:Content>
