<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="OnlineFoodOrdering.MyOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="section pt-4 pb-4 osahan-account-page">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="osahan-account-page-left shadow-sm bg-white h-100">
                        <div class="border-bottom p-4">
                            <div class="osahan-user text-center">
                                <div class="osahan-user-media">
                                    <i class="fa fa-user-graduate fa-5x mb-3 rounded-pill shadow-sm mt-1"></i>
                                    <div class="osahan-user-media-body">

                                        <asp:GridView ID="GVUserDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="uId" DataSourceID="sdaUserDetails" ShowHeader="false" BorderWidth="0" Width="100%">
                                            <Columns>

                                                <asp:BoundField DataField="uId" HeaderText="uId" InsertVisible="False" ReadOnly="True" Visible="false" SortExpression="uId" />
                                                <asp:TemplateField ShowHeader="false">
                                                    <EditItemTemplate>
                                                        
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("firstName") %>'></asp:TextBox>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("lastName") %>'></asp:TextBox>
                                                            
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                                        <br /><br />
                                                        <asp:LinkButton CssClass="btn btn-success btn-sm" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"><i class="fa fa-save"></i></asp:LinkButton>
                                                        <asp:LinkButton CssClass="btn btn-warning btn-sm" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"><i class="fa fa-backward"></i></asp:LinkButton>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <h6 class="mb-2">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("firstName") %>'></asp:Label>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("lastName") %>'></asp:Label>
                                                            </h6>
                                                        <p class="mb-1">
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label><br/>
                                                        </p>
                                                        <p class="mb-1">
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("role") %>'></asp:Label>
                                                            </p>
                                                        <p class="mb-0 text-black font-weight-bold">
                                                            <asp:LinkButton CssClass="text-primary mr-3" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"> 
                                                                <i class="icofont-ui-edit"></i> EDIT
                                                            </asp:LinkButton>
                                                        </p>
                                                        
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="sdaUserDetails" runat="server" ConnectionString="<%$ ConnectionStrings:foodDBConnectionString %>" DeleteCommand="DELETE FROM [tbl_users] WHERE [uId] = @uId" InsertCommand="INSERT INTO [tbl_users] ([firstName], [lastName], [email], [role]) VALUES (@firstName, @lastName, @email, @role)" SelectCommand="SELECT [uId], [firstName], [lastName], [email], [role] FROM [tbl_users] WHERE ([uId] = @uId)" UpdateCommand="UPDATE [tbl_users] SET [firstName] = @firstName, [lastName] = @lastName, [email] = @email, [role] = @role WHERE [uId] = @uId">
                                            <DeleteParameters>
                                                <asp:Parameter Name="uId" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="firstName" Type="String" />
                                                <asp:Parameter Name="lastName" Type="String" />
                                                <asp:Parameter Name="email" Type="String" />
                                                <asp:Parameter Name="role" Type="String" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:SessionParameter Name="uId" SessionField="id" Type="Int32" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="firstName" Type="String" />
                                                <asp:Parameter Name="lastName" Type="String" />
                                                <asp:Parameter Name="email" Type="String" />
                                                <asp:Parameter Name="role" Type="String" />
                                                <asp:Parameter Name="uId" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <ul class="nav nav-tabs flex-column border-0 pt-4 pl-4 pb-4" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="orders-tab" data-toggle="tab" href="#orders" role="tab" aria-controls="orders" aria-selected="true"><i class="icofont-food-cart"></i>Orders</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="osahan-account-page-right shadow-sm bg-white p-4 h-100">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="orders" role="tabpanel" aria-labelledby="orders-tab">
                                <h4 class="font-weight-bold mt-0 mb-4">Past Orders</h4>

                                <asp:Repeater ID="rptrOrder" runat="server">
                                    <HeaderTemplate>
                                        <div class="bg-white card mb-4 order-list shadow-sm">
                                            <div class="gold-members">
                                                <div class="media-body">
                                                    <table class="w-100 table table-striped table-bordered mb-0">
                                                        <thead class="bg-dark text-white">
                                                            <tr>
                                                                <th>SL</th>
                                                                <th>Items</th>
                                                                <th>Subtotal</th>
                                                                <th>Charge</th>
                                                                <th>Total</th>
                                                                <th>Status</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.ItemIndex + 1 %>'></asp:Label>
                                            </td>
                                            <td>
                                               <%# Eval("Items").ToString() %>
                                            </td>
                                            <td>Tk. <%# Eval("Subtotal").ToString() %></td>
                                            <td>Tk. 50</td>
                                            <td>Tk. <%# Eval("Total").ToString() %></td>
                                            <td>Pending</td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </FooterTemplate>
                                </asp:Repeater>
                                <a href="Default.aspx" class="btn btn-warning float-right">+ Order More</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <!--edit profile modal-->
    <div class="modal fade" id="edit-profile-modal" tabindex="-1" role="dialog" aria-labelledby="edit-profile" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="edit-profile">Edit profile</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label>
                                    Phone number
                                </label>
                                <input type="text" value="+91 85680-79956" class="form-control" placeholder="Enter Phone number">
                            </div>
                            <div class="form-group col-md-12">
                                <label>
                                    Email id
                                </label>
                                <input type="text" value="iamosahan@gmail.com" class="form-control" placeholder="Enter Email id
                              ">
                            </div>
                            <div class="form-group col-md-12 mb-0">
                                <label>
                                    Password
                                </label>
                                <input type="password" value="**********" class="form-control" placeholder="Enter password
                              ">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn d-flex w-50 text-center justify-content-center btn-outline-primary" data-dismiss="modal">
                        CANCEL
                    </button>
                    <button type="button" class="btn d-flex w-50 text-center justify-content-center btn-primary">UPDATE</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
