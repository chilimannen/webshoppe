<%@include file="header.jsp" %>
<jsp:useBean id="order" class="com.codingchili.webshoppe.model.Order" scope="request"/>

<div class="card row col-8 offset-2 margin-top">
    <c:if test="${!empty order.account}">

        <div class="panel panel-default margin-top-1">
            <div class="panel-heading">
                <h4><fmt:message key="process.shipping.title"/></h4>
            </div>
            <div class="panel-body col-6 offset-3">
                <p>
                    <b><fmt:message key="account.username"/></b> <c:out value="${sessionScope.account.username}"/>
                </p>
                <p>
                    <b><fmt:message key="account.zip"/></b> <c:out value="${sessionScope.account.zip}"/>
                </p>
                <p>
                    <b><fmt:message key="account.street"/></b> <c:out value="${sessionScope.account.street}"/>
                </p>
            </div>
        </div>

        <div class="row">
            <table class="table table-striped table-hover ">
                <thead>
                <tr>
                    <th><fmt:message key="product.name"/></th>
                    <th><fmt:message key="product.each"/></th>
                    <th><fmt:message key="product.quantity"/></th>
                    <th></th>
                    <th><fmt:message key="product.item_total"/></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${order.products}" var="product">
                    <tr>
                        <td class="align-middle">
                            <a href="view?product=${product.id}">
                                <c:out value="${product.name}"/>
                            </a>
                        </td>
                        <td class="align-middle"> <c:out value="${product.cost}"/></td>
                        <td class="align-middle"> <c:out value="${product.count}"/></td>
                        <td class="align-middle"><a href="view?product=${product.id}"><fmt:message
                                key="product.view"/></a></td>
                        <td class="align-middle">
                            <fmt:formatNumber type="number" maxFractionDigits="2"
                                              value="${product.count * product.cost * currency_value}"/>
                            <fmt:message key="currency"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="row">
            <h3 class="text-center">
                <fmt:message key="process.order_total"/>
                <span class="text-danger">
                    <fmt:formatNumber type="number" maxFractionDigits="2" value="${order.orderTotal * currency_value}"/>
                    <fmt:message key="currency"/>
                </span>
            </h3>
        </div>

        <div class="row">
            <div class="col-10 offset-1">
                <form method="POST" action="process">
                    <input type="hidden" name="csrf" value="${sessionScope.csrf}">
                    <input type="hidden" name="action" value="getOrder">
                    <button class="btn btn-lg btn-primary btn-block"><fmt:message key="process.next_order"/></button>
                </form>
            </div>
        </div>
    </c:if>

    <c:if test="${empty order.account}">
        <h4><fmt:message key="process.manager.instruction.title"/></h4>
        <p>
            <fmt:message key="process.manager.instructions"/>
        </p>
        <div class="row">
            <div class="col-10 offset-1">
                <form method="POST" action="process" class="col-12">
                    <input type="hidden" name="csrf" value="${sessionScope.csrf}">
                    <input type="hidden" name="action" value="getOrder">

                    <div class="form-group">
                        <fmt:message key="process.order_id.placeholder" var="orderIdPlaceholder"/>
                        <input type="text" class="form-control" name="order-id" id="order-id"
                               placeholder="${orderIdPlaceholder}" autofocus="true">
                    </div>

                    <button class="btn btn-lg btn-primary btn-block">
                        <fmt:message key="process.get.order"/>
                    </button>
                </form>
            </div>
        </div>

        <%-- todo: show some orders / products that needs to be restocked?--%>
        <%-- todo: reject order packing if order is already packed. --%>

    </c:if>
</div>

<%@include file="footer.jsp" %>