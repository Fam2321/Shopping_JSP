<%-- 
    Document   : OrderResult
    Created on : Nov 20, 2020, 10:41:48 AM
    Author     : 60050257
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.OrderItemsTable"%>
<%@page import="java.util.Vector"%>
<%@page import="model.OrderItems"%>
<%@page import="model.Orders"%>
<%@page import="model.OrdersTable"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Result</title>
        <style>
            th, td {
                padding: 10px;
            }
            A {
                color: white;
                text-decoration: none;
            }
            input.submit {}
        </style>
    </head>
    <jsp:useBean id="item" class="model.OrderItems" scope="request"/>
    <%
        EntityManager em = (EntityManager) session.getAttribute("entitymanager");
        int id = OrdersTable.findAllOrders(em).lastElement().getId();
        Orders order = OrdersTable.findOrdersById(em, id);
        Vector<OrderItems> itemList = OrderItemsTable.findOrderItemsByOrderId(em, order);
        Iterator<OrderItems> itr = itemList.iterator();
     %>
    <body>
        <center>
                <br>
                <h1>BILL</h1>
                <br>
                <%
                    out.println("<h3>Order Number: "+ order.getId() + "</h3>");
                %>
                <h6>Item List</h6>
                <table padding: 10px;>
                    <tr>
                        <th>DVD NAME</th>
                        <th>RATE</th>
                        <th>YEAR</th>
                        <th>PRICE</th>
                        <th>Quantity</th>
                    </tr>
                    <%
                        while(itr.hasNext()) {
                            item = itr.next();
                            out.println("<tr>");
                            out.println("<td> "+ item.getProId().getDvdName()+ "</td>");
                            out.println("<td> "+ item.getProId().getRateId().getRateName()+ "</td>");
                            out.println("<td> "+ item.getProId().getYears()+ "</td>");
                            out.println("<td> "+ item.getTotalPrice()+ "</td>");
                            out.println("<td> "+ item.getQuantity()+ "</td>");
                            out.println("<tr>");
                        }
                    %>
                </table>
                <br>
                <%
                    out.println("<h5>Total Amount: "+ order.getTotalPrice() + "</h5>");
                %>
                <br>
                <br>
            <button class="btn btn-primary" type="button"><a href="index.jsp">Back to home</a></button>
        </center>
    </body>
</html>
