<%-- 
    Document   : ConfirmOrder
    Created on : Nov 19, 2020, 10:31:25 PM
    Author     : 60050257
--%>

<%@page import="model.ProductTable"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.emptyType"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Enumeration"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Order</title>
        <style>
            th, td {
                padding: 10px;
            }
        </style>
    </head>
    <jsp:useBean id="pro" class="model.Product" scope="request"/>
    <%
        EntityManager em = (EntityManager) session.getAttribute("entitymanager");
        Enumeration<String> attributes = request.getSession().getAttributeNames();
        Vector<Product> proList = new Vector<Product>();
        while (attributes.hasMoreElements()) {
            String attribute = (String) attributes.nextElement();
            if(!(attribute.equals("WELD_S_HASH") || attribute.equals("entitymanager")))
                proList.add((Product) request.getSession().getAttribute(attribute));
        }
        Iterator<Product> itr = proList.iterator();
    %>
    <body>
        <center>
            <form name="confirm" action="ConfirmOrderController">
                <table padding: 10px;>
                    <tr>
                        <th>DVD NAME</th>
                        <th>RATE</th>
                        <th>YEAR</th>
                        <th>PRICE</th>
                        <th>QUANTITY</th>
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
                            out.println("<tr>");
                        }
                    %>
                </table>
                <button class="btn btn-light" type="submit" name="cancel" value="Cancel">Cancel</button>
                <button class="btn btn-success" type="submit" name="confirm" value="Confirm">Confirm</button>
<!--                <input type="submit" value="Delete" name="delete" />
                <input type="submit" value="Cancel" name="cancel" />-->
            </form>
        </center>
    </body>
</html>
