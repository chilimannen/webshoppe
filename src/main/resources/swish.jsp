<%@include file="header.jsp" %>
<jsp:useBean id="order" class="com.codingchili.webshoppe.model.Order" scope="session"/>

<div class="row">
    <div class="col-12 margin-top text-center">
        <span class="badge badge-info"><fmt:message key="swish.paying_with"/></span>
    </div>
</div>

<div class="row">
    <div class="col-10 offset-1 swish-qr">
        <a href="swish://payment?data={'version':1,'payee':{'value':'${requestScope.swish}'},'amount':{'value': ${order.orderTotal}},message:{'value':'order ${order.orderId}'}}">
            <img alt="Loading QR image from swish.." src="swish?orderId=${order.orderId}">
        </a>
    </div>

    <form method="POST" action="swish" class="col-8 offset-2 margin-top">
        <input type="hidden" name="csrf" value="${sessionScope.csrf}">
        <button class="btn btn-primary btn-block"><fmt:message key="swish.sent_funds"/></button>
    </form>

</div>

<%@include file="footer.jsp" %>