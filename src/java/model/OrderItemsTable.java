/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Vector;
import javax.persistence.EntityManager;

/**
 *
 * @author 60050257
 */
public class OrderItemsTable {
    public static Vector<OrderItems> findAllOrderItems(EntityManager em) {
        Vector<OrderItems> empList = null;
        try {
            empList = (Vector<OrderItems>) em.createNamedQuery("OrderItems.findAll").getResultList();
            //em.close();
            
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
        return empList;
    }
    public static OrderItems findOrderItemsById(EntityManager em, int id) {
        OrderItems emp = null;
        try {
            emp = em.find(OrderItems.class, id);
            //em.close();
            
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
        return emp;
    }
     public static Vector<OrderItems> findOrderItemsByOrderId(EntityManager em, Orders id) {
        Vector<OrderItems> emp = null;
        try {
            emp = (Vector<OrderItems>) em.createNamedQuery("OrderItems.findByOrder").setParameter("orderId", id).getResultList();
            //em.close();
            
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
        return emp;
    }
    //public static int updateEmployee(EntityManager em, 
    //        UserTransaction utx, Employee emp) {
    public static int updateOrderItems(EntityManager em, OrderItems emp) {
        try {
            em.getTransaction().begin();
            OrderItems target = em.find(OrderItems.class, emp.getSeq());
            if (target == null) {
                return 0;
            }
            target.setProId(emp.getProId());
            target.setOrderId(emp.getOrderId());
            target.setQuantity(emp.getQuantity());
            target.setTotalPrice(emp.getTotalPrice());
            em.persist(target);
            em.getTransaction().commit();
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
            
        }
        return 1;
        
    }
    public static int removeOrderItems(EntityManager em, int id) {
        try {
            em.getTransaction().begin();
            OrderItems target = em.find(OrderItems.class, id);
            if (target == null) {
                return 0;
            }
            em.remove(target);
            em.getTransaction().commit();
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
            
        }
        return 1;
    }
    
    public static int insertOrderItems(EntityManager em, OrderItems emp) {
        try {
            em.getTransaction().begin();
            OrderItems target = em.find(OrderItems.class, emp.getSeq());
            if (target != null) {
                return 0;
            }
            em.persist(emp);
            em.getTransaction().commit();
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
            
        }
        return 1;
    }
}
