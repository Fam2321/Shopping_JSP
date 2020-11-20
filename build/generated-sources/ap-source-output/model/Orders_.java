package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.OrderItems;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-11-20T16:55:56")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SingularAttribute<Orders, Double> totalPrice;
    public static volatile CollectionAttribute<Orders, OrderItems> orderItemsCollection;
    public static volatile SingularAttribute<Orders, Integer> id;
    public static volatile SingularAttribute<Orders, Date> createAt;

}