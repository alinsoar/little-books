// -*- mode: java; buffer-read-only: t -*-

abstract class PointD {
    abstract int distanceToO();
    int x;
    int y;
    // abstract boolean closerTo(PointD p);
    PointD(int _x, int _y) {
        x = _x;
        y = _y;
    }
    // ----------------------------------------
    boolean closerTo(PointD p) {
        int d1 = distanceToO();
        int d2 = p.distanceToO();
        return (d1<d2);
    }    
}
class CartesianPt extends PointD {
    // int x;
    // int y;
    // CartesianPt(int _x, int _y) {
    //     x = _x;
    //     y = _y;
    // }
    CartesianPt(int _x, int _y) {
        super (_x, _y);
    }
    // ----------------------------------------
    int distanceToO() {
        return (int) Math.sqrt(x*x + y*y);
    }
    // boolean closerTo(PointD p) {
    //     int d1 = distanceToO();
    //     int d2 = p.distanceToO();
    //     return (d1<d2);
    // }
}
class ManhattanPt extends PointD {
    // int x;
    // int y;
    // ManhattanPt(int _x, int _y) {
    //     x = _x;
    //     y = _y;
    // }
    ManhattanPt(int _x, int _y) {
        super (_x, _y);
    }
    // ----------------------------------------
    int distanceToO() {
        return x+y;
    }
    // boolean closerTo(PointD p) {
    //     int d1 = distanceToO();
    //     int d2 = p.distanceToO();
    //     return (d1<d2);
    // }
}

abstract class ShishD {
    abstract boolean onlyOnions();
    abstract boolean isVegetarian();
}
class Skewer extends ShishD {
    boolean onlyOnions () {
        return true;
    }
    boolean isVegetarian () {
        return true;
    }
}
class Onion extends ShishD {
    ShishD s;
    Onion(ShishD _s) {
        s = _s;
    }
    // ----------------------------------------
    boolean onlyOnions () {
        return s.onlyOnions();
    }
    boolean isVegetarian () {
        return s.isVegetarian();
    }
}
class Lamb extends ShishD {
    ShishD s;
    Lamb(ShishD _s) {
        s = _s;
    }
    // ----------------------------------------
    boolean onlyOnions () {
        return false;
    }
    boolean isVegetarian () {
        return false;
    }
}
class Tomato extends ShishD {
    ShishD s;
    Tomato(ShishD _s) {
        s = _s;
    }
    // ----------------------------------------
    boolean onlyOnions () {
        return false;
    }
    boolean isVegetarian () {
        return s.isVegetarian();
    }
}

abstract class KebabD {
    abstract boolean isVeggie();
    abstract Object whatHolder();
}
class Holder extends KebabD {
    Object o;
    Holder (Object _o) {
        o = _o;
    }
    // ----------------------------------------
    boolean isVeggie() {
        return true;
    }
    Object whatHolder() {
        return o;
    }
}
class Shallot extends KebabD {
    KebabD k;
    Shallot(KebabD _k) {
        k = _k;
    }
    // ----------------------------------------
    boolean isVeggie() {
        return k.isVeggie();
    }
    Object whatHolder() {
        return k.whatHolder();
    }
}
class Shrimp extends KebabD {
    KebabD k;
    Shrimp (KebabD _k) {
        k = _k;
    }
    // ----------------------------------------
    boolean isVeggie() {
        return false;
    }
    Object whatHolder() {
        return k.whatHolder();
    }
}
class Radish extends KebabD {
    KebabD k;
    Radish(KebabD _k) {
        k = _k;
    }
    // ----------------------------------------
    boolean isVeggie() {
        return k.isVeggie();
    }
    Object whatHolder() {
        return k.whatHolder();
    }
}
class Pepper extends KebabD {
    KebabD k;
    Pepper(KebabD _k) {
        k = _k;
    }
    // ----------------------------------------
    boolean isVeggie() {
        return k.isVeggie();
    }
    Object whatHolder() {
        return k.whatHolder();
    }
}
class Zucchini extends KebabD {
    KebabD k;
    Zucchini(KebabD _k) {
        k = _k;
    }
    // ----------------------------------------
    boolean isVeggie() {
        return k.isVeggie();
    }
    Object whatHolder() {
        return k.whatHolder();
    }
}

abstract class RodD {}
class Dagger extends RodD {}
class Sabre extends RodD {}
class Sword extends RodD {}

abstract class PlateD {}
class Gold extends PlateD{}
class Silver extends PlateD{}
class Brass extends PlateD{}
class Copper extends PlateD{}
class Wood extends PlateD{}

class Test {
    static void p(Object... objs) {
        for(Object o:objs) {
            System.out.printf("%s ", o);
        }
    }
    static private void test1() {
        ManhattanPt m = new ManhattanPt(3,4);
        CartesianPt c = new CartesianPt(3,4);
        int d1 = m.distanceToO();
        int d2 = c.distanceToO();
        p(d1, d2);
    }
    static private void test2() {
        Skewer s = new Skewer();
        Onion o1 = new Onion(s);
        Onion o2 = new Onion(o1);
        Lamb l = new Lamb(o2);
        boolean x1 = o2.onlyOnions();
        boolean x2 = l.onlyOnions();
        boolean v1 = o2.isVegetarian();
        boolean v2 = l.isVegetarian();
        p(x1, x2);
        p("\n");
        p(v1, v2);
    }
    static private void test3() {
        ;
    }
    static public void main(String[] args) {
        p("\n", "---test1", "\n");
        test1();
        p("\n", "---test2", "\n");
        test2();
        p("\n", "---test3", "\n");
        test3();
        p ("\n", "--", "\n");
    }
}

