package models;

import java.sql.Timestamp;
import java.util.Random;

/**
 * Represents a particular item with its details.
 *
 * This class contains information about an item including its quantity, cost,
 * total, and other metadata.
 *
 * @author edian
 */
public class Particular {

    public int pNo;
    public String item;
    public String unit;
    public double qty;
    public double cost;
    public double total;
    public Timestamp dateCreated;
    public Timestamp dateUpdated;
    public int accNo;
    public boolean voidflag;
    public boolean postflag;

    public Particular(int pNo, String item, String unit, double qty, double cost, double total, Timestamp dateCreated, Timestamp dateUpdated, int accNo, boolean voidflag, boolean postflag) {
        this.pNo = pNo;
        this.item = item;
        this.unit = unit;
        this.qty = qty;
        this.cost = cost;
        this.total = total;
        this.dateCreated = dateCreated;
        this.dateUpdated = dateUpdated;
        this.accNo = accNo;
        this.voidflag = voidflag;
        this.postflag = postflag;
    }

    public Particular(String item, String unit, double qty, double cost, double total, Timestamp dateCreated, Timestamp dateUpdated, int accNo) {
        this.pNo = new Random().nextInt(1000);
        this.item = item;
        this.unit = unit;
        this.qty = qty;
        this.cost = cost;
        this.total = total;
        this.dateCreated = dateCreated;
        this.dateUpdated = dateUpdated;
        this.accNo = accNo;
        this.voidflag = false;
        this.postflag = false;
    }
}
