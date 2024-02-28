// -*- mode: java; buffer-read-only: t -*-


abstract class SeasoningD {}
class Salt extends SeasoningD {}
class Pepper extends SeasoningD {}
class Thyme extends SeasoningD {}
class Sage extends SeasoningD {}

abstract class PointD {}
class CartesianPt extends PointD {
    int x;
    int y;
    CartesianPt(int _x, int _y) {
        x = _x;
        y = _y;
    }
    // ----------------------------------------
}
class ManhattanPt extends PointD {
    int x;
    int y;
    ManhattanPt(int _x, int _y) {
        x = _x;
        y = _y;
    }
    // ----------------------------------------
}

abstract class NumD {}
class Zero extends NumD {}
class OneMoreThan extends NumD {
    NumD predecessor;
    OneMoreThan (NumD _p) {
        predecessor = _p;
    }
    // ----------------------------------------
}

abstract class LayerD {}
class Base extends LayerD {
    Object o;
    Base (Object _o) {
        o = _o;
    }
    // ----------------------------------------
}
class Slice extends LayerD {
    LayerD l;
    Slice (LayerD _l) {
        l = _l;
    }
    // ----------------------------------------
}


class Test {
    
    private static void test1() {
        Salt s = new Salt();
        Pepper p = new Pepper();
        Thyme t = new Thyme();
        Sage s0 = new Sage();
    }

    private static void test2() {
        NumD z = new Zero();
        NumD one = new OneMoreThan(z);
        NumD two = new OneMoreThan(one);
        System.out.println(z);
        System.out.println(one);
        System.out.println(two);
    }

    private static void test3() {
        new Base(new Zero());
        new Base(new Salt());
    }
    
    public static void main(String[] args) {
        test1();
        test2();
        test3();
    }
}



