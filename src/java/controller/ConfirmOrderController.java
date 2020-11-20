/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Enumeration;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.OrderItems;
import model.OrderItemsTable;
import model.Orders;
import model.OrdersTable;
import model.Product;
import model.ProductTable;

/**
 *
 * @author 60050257
 */
public class ConfirmOrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InterruptedException {
        HttpSession session = request.getSession();
        EntityManager em = (EntityManager) session.getAttribute("entitymanager");
        if (request.getParameter("confirm") != null ) {
            Vector<Product> proList = ProductTable.findAllProduct(em);
            Collection<OrderItems> orderList =  new ArrayList<OrderItems>();
            Orders order = new Orders();
            order.setId(OrdersTable.findAllOrders(em).lastElement().getId() + 1);
            order.setCreateAt(new Date());
            order.setTotalPrice(0.0);
            order.setOrderItemsCollection(orderList);
            OrdersTable.insertOrders(em, order);
            Enumeration<String> attributes = request.getSession().getAttributeNames();
            while (attributes.hasMoreElements()) {
                String attribute = (String) attributes.nextElement();
                if(!(attribute.equals("WELD_S_HASH") || attribute.equals("entitymanager"))) {
                   Product product_item = (Product) request.getSession().getAttribute(attribute);
                   Product product = proList.get(Integer.parseInt(attribute)-1);
                   product.setQuantity(product.getQuantity() - product_item.getQuantity());
                   OrderItems item = new OrderItems();
                   item.setSeq(Integer.parseInt(order.getId().toString() + attribute));
                   item.setProId(product);
                   item.setOrderId(order);
                   item.setQuantity(product_item.getQuantity());
                   item.setTotalPrice(product_item.getPrice());
                   order.setTotalPrice(order.getTotalPrice() + product_item.getPrice());
                   OrderItemsTable.insertOrderItems(em, item);
                   orderList.add(item);
                }
            }
            order.setOrderItemsCollection(orderList);
            OrdersTable.updateOrders(em, order);
        }
        if (request.getParameter("cancel") != null )
            request.getRequestDispatcher("index.jsp").forward(request, response);
        request.getRequestDispatcher("OrderResult.jsp").forward(request, response);
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(ConfirmOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(ConfirmOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}