package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Orders;
import model.Product;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-11-20T16:55:56")
@StaticMetamodel(OrderItems.class)
public class OrderItems_ { 

    public static volatile SingularAttribute<OrderItems, Integer> quantity;
    public static volatile SingularAttribute<OrderItems, Double> totalPrice;
    public static volatile SingularAttribute<OrderItems, Orders> orderId;
    public static volatile SingularAttribute<OrderItems, Product> proId;
    public static volatile SingularAttribute<OrderItems, Integer> seq;

}