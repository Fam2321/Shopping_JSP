<%-- 
    Document   : Order_history
    Created on : Nov 20, 2020, 4:25:52 PM
    Author     : 60050257
--%>

<%@page import="model.OrderItems"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@page import="model.Orders"%>
<%@page import="model.OrdersTable"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
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
    <jsp:useBean id="order" class="model.Orders" scope="request"/>
    <jsp:useBean id="item" class="model.OrderItems" scope="request"/>
    <%
        EntityManager em = (EntityManager) session.getAttribute("entitymanager");
        Vector<Orders> orderList = OrdersTable.findAllOrders(em);
        int index = orderList.size();
//        orderList.subList(index-5, index);
//        Orders order = OrdersTable.findOrdersById(em, id);
//        Vector<OrderItems> itemList = OrderItemsTable.findOrderItemsByOrderId(em, order);
        Iterator<Orders> itr = orderList.subList(index-5, index).iterator();
     %>
    <body>
        <button class="btn btn-primary" type="button"><a href="index.jsp">Back to home</a></button>
        <center>
            <%
                while(itr.hasNext()) {
                    order = itr.next();
                    Iterator<OrderItems> i = order.getOrderItemsCollection().iterator();
                    out.println("<table padding: 10px;>");
                    out.println("<tr>");
                    out.println("<th>DVD NAME</th>");
                    out.println("<th>RATE</th>");
                    out.println("<th>YEAR</th>");
                    out.println("<th>PRICE</th>");
                    out.println(" <th>Quantity</th>");
                    out.println("</tr>");
                    while(i.hasNext()){
                        item = i.next();
                        out.println("<tr>");
                        out.println("<td> "+ item.getProId().getDvdName() + "</td>");
                        out.println("<td> "+ item.getProId().getRateId().getRateName() + "</td>");
                        out.println("<td> "+ item.getProId().getYears() + "</td>");
                        out.println("<td> "+ item.getTotalPrice() + "</td>");
                        out.println("<td> "+ item.getQuantity()+ "</td>");
                        out.println("<tr>");    
                    }
                    out.println("<h6>Order Number: "+ order.getId() + " " + order.getCreateAt() + "</h6>");
                }
            %>
        </center>
    </body>
</html>
