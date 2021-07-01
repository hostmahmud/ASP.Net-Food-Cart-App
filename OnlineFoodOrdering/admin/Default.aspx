<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineFoodOrdering.admin.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <h1 class="mt-4">Dashboard</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
                <div class="row">
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-primary text-white mb-4">
                            <div class="card-body" runat="server" id="totalRestaurant"></div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="allRestaurants.aspx">View Details</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-warning text-white mb-4">
                            <div class="card-body" runat="server" id="totalMenu"></div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="allMenus.aspx">View Details</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-success text-white mb-4">
                            <div class="card-body" runat="server" id="totalOrders"></div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="Orders.aspx">View Details</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-danger text-white mb-4">
                            <div class="card-body" runat="server" id="totalUsers"></div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="#">View Details</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table mr-1"></i>
                        RECENT 10 ORDER
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSource1" GridLines="Horizontal" CssClass="table table-bordered table-dark" AutoGenerateColumns="False" DataKeyNames="Id">
                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Order ID" ReadOnly="True" SortExpression="Id" />
                                    <asp:TemplateField HeaderText="firstName" SortExpression="Customer Name">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("firstName") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("firstName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Items" SortExpression="Items">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Items") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Items") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Charge" SortExpression="Charge">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Charge") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Charge") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total" SortExpression="Total">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton CssClass="btn btn-success btn-sm" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update">
                                                        <i class="fa fa-save"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton CssClass="btn btn-dark btn-sm" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel">
                                                        <i class="fa fa-backward"></i>
                                            </asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton CssClass="btn btn-dark btn-sm" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit">
                                                        <i class="fa fa-edit"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                <SortedDescendingHeaderStyle BackColor="#3E3277" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:foodDBConnectionString %>" DeleteCommand="DELETE FROM [tbl_orders] WHERE [Id] = @Id" SelectCommand="SELECT o.Id,u.firstName,o.Items,o.Charge,o.Total,o.Status FROM [tbl_orders] as o join tbl_users as u on u.uId=o.CustomerId" UpdateCommand="UPDATE [tbl_orders] SET [Status] = @Status WHERE [Id] = @Id" InsertCommand="INSERT INTO [tbl_orders] ([Id], [CustomerId], [Items], [Subtotal], [Charge], [Total], [PMethod], [OrderDate], [Street], [City], [Zip], [Status]) VALUES (@Id, @CustomerId, @Items, @Subtotal, @Charge, @Total, @PMethod, @OrderDate, @Street, @City, @Zip, @Status)">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Id" Type="String" />
                                    <asp:Parameter Name="CustomerId" Type="Int32" />
                                    <asp:Parameter Name="Items" Type="String" />
                                    <asp:Parameter Name="Subtotal" Type="String" />
                                    <asp:Parameter Name="Charge" Type="String" />
                                    <asp:Parameter Name="Total" Type="String" />
                                    <asp:Parameter Name="PMethod" Type="String" />
                                    <asp:Parameter Name="OrderDate" Type="DateTime" />
                                    <asp:Parameter Name="Street" Type="String" />
                                    <asp:Parameter Name="City" Type="String" />
                                    <asp:Parameter Name="Zip" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="Id" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </main>
</asp:Content>
