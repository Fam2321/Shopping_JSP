<%-- 
    Document   : index
    Created on : Nov 19, 2020, 9:52:41 PM
    Author     : 60050257
--%>

<%@page import="model.ProductTable"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Online</title>
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
    <jsp:useBean id="pro" class="model.Product" scope="request"/>
    <%
        EntityManager em = (EntityManager) session.getAttribute("entitymanager");
        Vector<Product> proList = ProductTable.findAllProduct(em);
        Iterator<Product> itr = proList.iterator();
     %>
    <body>
        <center>
            <form name="addCart" action="OrderController" method="POST" id="form">
                <br>
                <h1>DVD Catalog</h1>
                <br>
                <table padding: 10px;>
                    <tr>
                        <th>DVD NAME</th>
                        <th>RATE</th>
                        <th>YEAR</th>
                        <th>PRICE</th>
                        <th>REMAIN</th>
                        <th>ADD CART</th>
                        </tr>
                        <%
                            while(itr.hasNext()) {
                                pro = itr.next();
                                out.println("<tr>");
                                out.println("<td> "+ pro.getDvdName()+ "</td>");
                                out.println("<td> "+ pro.getRateId().getRateName()+ "</td>");
                                out.println("<td> "+ pro.getYears()+ "</td>");
                                out.println("<td> "+ pro.getPrice()+ "</td>");
                                out.println("<td> "+ pro.getQuantity()+ "</td>");
                                out.println("<td><input type='number' value='0' name='" + pro.getId() + "' min='0' max=" + pro.getQuantity() + "></td>");
                                out.println("<tr>");
                            }
                        %>
                </table>
            </form>
            <button class="btn btn-primary" type="submit" name="submit" value="Submit" form="form">Check Out</button>
            <br>
            <button class="btn btn-secondary" type="button" name="history" value="History"><a href="Order_history.jsp">Order History</a></button>
        </center>
    </body>
</html>
