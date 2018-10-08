<%@include file="header.jsp" %>

<div class="row">
    <h3 class="heading-text">
        <span class="text-danger">
           <fmt:message key="cart.total"/>
            <fmt:formatNumber type="number" maxFractionDigits="2"
                              value="${sessionScope.cart.totalCost * currency_value}"/>
            <fmt:message key="currency"/>
        </span>
    </h3>
</div>

<div class="row">

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col"></th>
            <th scope="col"><fmt:message key="cart.name"/></th>
            <th scope="col"><fmt:message key="cart.each"/></th>
            <th scope="col"><fmt:message key="cart.quantity"/></th>
            <th scope="col"><fmt:message key="product.item_total"/></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sessionScope.cart.items}" var="product">
            <tr>
                <td class="align-middle"><img class="cart-thumbnail" src="image/${product.imageId}"></td>
                <td class="align-middle"><a href="view?product=${product.id}"><fmt:message key="product.view"/></a></td>
                <td class="align-middle">
                    <fmt:formatNumber type="number" maxFractionDigits="2" value="${product.cost * currency_value}"/>
                </td>
                <td class="align-middle">${product.count}</td>
                <td class="align-middle">
                    <fmt:formatNumber type="number" maxFractionDigits="2"
                                      value="${product.count * product.cost * currency_value}"/>
                </td>
                <td class="align-middle">
                    <form method="POST" action="cart" class="margin: 0px; padding: 0px;">
                        <input type="hidden" name="csrf" value="${sessionScope.csrf}">
                        <div class="text-danger">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="product" value="${product.id}">
                            <button type="submit" class="btn text-danger table-icon-button">
                                <i class="far fa-trash-alt"></i>
                            </button>
                        </div>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="row">
    <form method="POST" action="cart" class="col-5 offset-1 col-md-7 offset-md-1">
        <input type="hidden" name="csrf" value="${sessionScope.csrf}">
        <input type="hidden" name="action" value="order">
        <button class="btn btn-primary btn-block"><fmt:message key="cart.place_order"/></button>
    </form>

    <form method="POST" action="cart" class="col-5 col-md-3">
        <input type="hidden" name="csrf" value="${sessionScope.csrf}">
        <input type="hidden" name="action" value="clear">
        <button class="btn btn-danger btn-block"><fmt:message key="cart.clear"/></button>
    </form>
</div>

<%@include file="footer.jsp" %>