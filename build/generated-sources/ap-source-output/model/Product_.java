package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.OrderItems;
import model.Rate;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-11-20T16:55:56")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile SingularAttribute<Product, Integer> quantity;
    public static volatile SingularAttribute<Product, Double> price;
    public static volatile CollectionAttribute<Product, OrderItems> orderItemsCollection;
    public static volatile SingularAttribute<Product, Integer> id;
    public static volatile SingularAttribute<Product, String> dvdName;
    public static volatile SingularAttribute<Product, String> years;
    public static volatile SingularAttribute<Product, Rate> rateId;

}