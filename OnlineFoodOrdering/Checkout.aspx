<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="OnlineFoodOrdering.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="offer-dedicated-body mt-4 mb-4 pt-2 pb-2">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div runat="server" id="showMsgDiv" class="d-none" role="alert">
                        <strong><i class="fa fa-info-circle"></i> Oops!</strong> Something went wrong. Please double check all information.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="offer-dedicated-body-left">
                        <div class="bg-white rounded shadow-sm p-4 mb-4">
                            <h4 class="mb-1">Delivery address <span runat="server" id="datetimenow"></span></h4>
                            <h6 class="mb-3 text-black-50">Enter your address to deliver the food</h6>
                            <div class="">
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputPassword4">Street Address <span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <input runat="server" id="street" type="text" class="form-control" placeholder="e.g. house number, street name, panthapath">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="inputPassword4">
                                            City <span class="text-danger">*</span>
                                        </label>
                                        <input runat="server" id="city" type="text" class="form-control" placeholder="e.g. dhaka">
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="inputPassword4">
                                            Zip <span class="text-danger">*</span>
                                        </label>
                                        <input runat="server" id="zip" type="text" class="form-control" placeholder="e.g. 1205">
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="inputPassword4">
                                            Delivery Instruction
                                        </label>
                                        <textarea runat="server" id="deliveryInstruction" class="form-control" placeholder="Delivery Instructions e.g. deliver quickly"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pt-2"></div>
                        <div class="bg-white rounded shadow-sm p-4 osahan-payment">
                            <h4 class="mb-1">Choose payment method</h4>
                            <h6 class="mb-3 text-black-50">Credit/Debit Cards</h6>
                            <div class="row">
                                <div class="col-sm-4 pr-0">
                                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                        <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="false"><i class="icofont-credit-card"></i>Credit/Debit Cards</a>
                                        <a class="nav-link" id="v-pills-cash-tab" data-toggle="pill" href="#v-pills-cash" role="tab" aria-controls="v-pills-cash" aria-selected="true"><i class="icofont-money"></i>Pay on Delivery</a>
                                    </div>
                                </div>
                                <div class="col-sm-8 pl-0">
                                    <div class="tab-content" id="v-pills-tabContent">
                                        <div class="tab-pane active fade show" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                            <h6 class="mb-3 mt-0 mb-3">Add new card</h6>
                                            <p>
                                                WE ACCEPT <span class="osahan-card">
                                                    <i class="icofont-visa-alt"></i><i class="icofont-mastercard-alt"></i><i class="icofont-american-express-alt"></i><i class="icofont-payoneer-alt"></i><i class="icofont-apple-pay-alt"></i><i class="icofont-bank-transfer-alt"></i><i class="icofont-discover-alt"></i><i class="icofont-jcb-alt"></i>
                                                </span>
                                            </p>
                                            <div class="form-row">
                                                <div class="form-group col-md-12">
                                                    <label for="inputPassword4">Card number</label>
                                                    <div class="input-group">
                                                        <input runat="server" id="ccNumber" type="text" class="cc-number-input form-control" maxlength="19" placeholder="---- ---- ---- ----" style="font-size: 16px;">
                                                        <div class="input-group-append">
                                                            <button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="icofont-card"></i></button>
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="form-group col-md-8">
                                                    <label>
                                                        Valid through(MM/YY)
                                                    </label>
                                                    <input runat="server" id="ccExpire" type="text" class="cc-expiry-input form-control" maxlength="5" style="font-size: 16px;">
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label>
                                                        CVV
                                                    </label>
                                                    <input runat="server" id="cvv" type="text" class="cc-cvc-input form-control" placeholder="Enter CVV Number" maxlength="3" style="font-size: 16px;">
                                                </div>
                                                <div class="form-group col-md-12">
                                                    <label>
                                                        Name on card
                                                    </label>
                                                    <input runat="server" id="ccName" type="text" class="form-control" placeholder="Enter Card number">
                                                </div>
                                                <div class="form-group col-md-12 mb-0">
                                                    <asp:LinkButton runat="server" ID="btnCheckoutCC" CssClass="btn btn-success btn-block btn-lg" OnClick="btnCheckoutCC_Click">
                                                        PAY <span runat="server" id="checkoutPayTotalCC"></span>
                                                        <i class="icofont-long-arrow-right"></i>
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-cash" role="tabpanel" aria-labelledby="v-pills-cash-tab">
                                            <h6 class="mb-3 mt-0 mb-3">Cash</h6>
                                            <p>Please keep exact change handy to help us serve you better</p>
                                            <hr>
                                            <div class="form-group col-md-12 mb-0">
                                                <asp:LinkButton runat="server" ID="btnCheckout" CssClass="btn btn-success btn-block btn-lg" OnClick="btnCheckout_Click">
                                                    PAY <span runat="server" id="checkoutPayTotal"></span>
                                                    <i class="icofont-long-arrow-right"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="generator-bg rounded shadow-sm mb-4 p-4 osahan-cart-item">
                        <div class="d-flex mb-4 osahan-cart-item-profile">
                            <i class="fa fa-shopping-basket fa-3x mr-3 rounded-pill text-white" aria-hidden="true"></i>
                            <div class="d-flex flex-column">
                                <h6 class="mb-1 text-white">Items in your cart
                                </h6>
                                <p class="mb-0 text-white"><i class="icofont-info-circle"></i>Please double check items before placing order.</p>
                            </div>
                        </div>
                        <div class="bg-white rounded shadow-sm mb-2">
                            <asp:GridView runat="server" ID="GVCartCheckout" CssClass="cartTable" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="100%" HorizontalAlign="left" AutoGenerateColumns="false">
                                <AlternatingRowStyle BackColor="White" HorizontalAlign="left" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F7DE" HorizontalAlign="left" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <i class="icofont-ui-press text-danger food-item"></i> <span><%# Eval("Title") %></span>
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
                                </Columns>
                                <EmptyDataTemplate>
                                    <div>No records found.</div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>

                        <div class="mb-2 bg-white rounded p-2 clearfix">
                            <p class="mb-1">Item Total <span runat="server" id="CheckoutItemSubTotal" class="float-right text-dark">0</span></p>
                            <p class="mb-1">
                                Delivery Fee <span class="text-info" data-toggle="tooltip" data-placement="top" title="" data-original-title="Total delivery charge">
                                    <i class="icofont-info-circle"></i>
                                </span><span class="float-right text-dark">Tk. 50</span>
                            </p>
                            <hr>
                            <h6 class="font-weight-bold mb-0">TO PAY <span runat="server" id="CheckoutItemTotal" class="float-right"></span></h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        let ccNumberInput = document.querySelector('.cc-number-input'),
            ccNumberPattern = /^\d{0,16}$/g,
            ccNumberSeparator = " ",
            ccNumberInputOldValue,
            ccNumberInputOldCursor,

            ccExpiryInput = document.querySelector('.cc-expiry-input'),
            ccExpiryPattern = /^\d{0,4}$/g,
            ccExpirySeparator = "/",
            ccExpiryInputOldValue,
            ccExpiryInputOldCursor,

            ccCVCInput = document.querySelector('.cc-cvc-input'),
            ccCVCPattern = /^\d{0,3}$/g,

            mask = (value, limit, separator) => {
                var output = [];
                for (let i = 0; i < value.length; i++) {
                    if (i !== 0 && i % limit === 0) {
                        output.push(separator);
                    }

                    output.push(value[i]);
                }

                return output.join("");
            },
            unmask = (value) => value.replace(/[^\d]/g, ''),
            checkSeparator = (position, interval) => Math.floor(position / (interval + 1)),
            ccNumberInputKeyDownHandler = (e) => {
                let el = e.target;
                ccNumberInputOldValue = el.value;
                ccNumberInputOldCursor = el.selectionEnd;
            },
            ccNumberInputInputHandler = (e) => {
                let el = e.target,
                    newValue = unmask(el.value),
                    newCursorPosition;

                if (newValue.match(ccNumberPattern)) {
                    newValue = mask(newValue, 4, ccNumberSeparator);

                    newCursorPosition =
                        ccNumberInputOldCursor - checkSeparator(ccNumberInputOldCursor, 4) +
                        checkSeparator(ccNumberInputOldCursor + (newValue.length - ccNumberInputOldValue.length), 4) +
                        (unmask(newValue).length - unmask(ccNumberInputOldValue).length);

                    el.value = (newValue !== "") ? newValue : "";
                } else {
                    el.value = ccNumberInputOldValue;
                    newCursorPosition = ccNumberInputOldCursor;
                }

                el.setSelectionRange(newCursorPosition, newCursorPosition);

                highlightCC(el.value);
            },
            highlightCC = (ccValue) => {
                let ccCardType = '',
                    ccCardTypePatterns = {
                        amex: /^3/,
                        visa: /^4/,
                        mastercard: /^5/,
                        disc: /^6/,

                        genric: /(^1|^2|^7|^8|^9|^0)/,
                    };

                for (const cardType in ccCardTypePatterns) {
                    if (ccCardTypePatterns[cardType].test(ccValue)) {
                        ccCardType = cardType;
                        break;
                    }
                }

                let activeCC = document.querySelector('.cc-types__img--active'),
                    newActiveCC = document.querySelector(`.cc-types__img--${ccCardType}`);

                if (activeCC) activeCC.classList.remove('cc-types__img--active');
                if (newActiveCC) newActiveCC.classList.add('cc-types__img--active');
            },
            ccExpiryInputKeyDownHandler = (e) => {
                let el = e.target;
                ccExpiryInputOldValue = el.value;
                ccExpiryInputOldCursor = el.selectionEnd;
            },
            ccExpiryInputInputHandler = (e) => {
                let el = e.target,
                    newValue = el.value;

                newValue = unmask(newValue);
                if (newValue.match(ccExpiryPattern)) {
                    newValue = mask(newValue, 2, ccExpirySeparator);
                    el.value = newValue;
                } else {
                    el.value = ccExpiryInputOldValue;
                }
            };

        ccNumberInput.addEventListener('keydown', ccNumberInputKeyDownHandler);
        ccNumberInput.addEventListener('input', ccNumberInputInputHandler);

        ccExpiryInput.addEventListener('keydown', ccExpiryInputKeyDownHandler);
        ccExpiryInput.addEventListener('input', ccExpiryInputInputHandler);
    </script>
</asp:Content>
