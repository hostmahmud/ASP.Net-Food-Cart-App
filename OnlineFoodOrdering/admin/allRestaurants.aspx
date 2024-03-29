﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="allRestaurants.aspx.cs" Inherits="OnlineFoodOrdering.admin.allRestaurants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" ID="updatepanel">
        <ContentTemplate>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">All Restaurants</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="Default.aspx">Dashboard</a></li>
                            <li class="breadcrumb-item active">Listings</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-table mr-1"></i>
                                        All Restaurants
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <table class="table table-bordered dataTable no-footer" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                                            <thead>
                                                                <tr class="text-uppercase" role="row">
                                                                    <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="ID: activate to sort column ascending" style="width: 20px;">ID</th>
                                                                    <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Image" style="width: 40px;">Image</th>
                                                                    <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending" style="width: 200px;">Name</th>
                                                                    <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Category" style="width: 100px;">Category</th>
                                                                    <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Menu List" style="width: 70px;">Menu</th>
                                                                    <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Action" style="width: 40px;">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%= getAllRestaurant() %>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
    <script type="text/javascript">
        (function () {
            const btnDelete = document.querySelectorAll(".btnDelete");
            btnDelete.forEach(function (btn) {
                btn.addEventListener("click", function (e) {
                    e.preventDefault();
                    console.log($(this).attr('data-id'));
                });
            });
        })();
    </script>

</asp:Content>
