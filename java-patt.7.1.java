
abstract class FruitD { }
class Peach extends FruitD {
    public boolean equals(Object o) {
        return o instanceof Peach;
    }
}
class Apple extends FruitD {
    public boolean equals(Object o) {
        return o instanceof Apple;
    }
}
class Pear extends FruitD {
    public boolean equals(Object o) {
        return o instanceof Pear;
    }
}
class Lemon extends FruitD {
    public boolean equals(Object o) {
        return o instanceof Lemon;
    }
}
class Fig extends FruitD {
    public boolean equals(Object o) {
        return o instanceof Fig;
    }
}

interface TreeVisitorI {
    Object forBud();
    Object forFlat(FruitD f, TreeD t);
    Object forSplit(TreeD l, TreeD r);
}

abstract class TreeD {
    abstract Object accept(TreeVisitorI ask);
    abstract public String toString();
}
class Bud extends TreeD {
    Object accept(TreeVisitorI ask) {
        return ask.forBud();
    }
    public String toString() {
        return "Bud";
    }
}
class Flat extends TreeD {
    FruitD f;
    TreeD t;
    Flat (FruitD _f, TreeD _t) {
        f = _f;
        t = _t;
    }
    // ----------------------------------------
    Object accept(TreeVisitorI ask) {
        return ask.forFlat(f, t);
    }
    public String toString() {
        return String.format( "(Flat %s %s)", f, t);
    }
}
class Split extends TreeD {
    TreeD l;
    TreeD r;
    Split (TreeD _l, TreeD _r) {
        l = _l;
        r = _r;
    }
    // ----------------------------------------
    Object accept(TreeVisitorI ask) {
        return ask.forSplit(l, r);
    }
    public String toString() {
        return String.format( "(Split %s %s)", l, r);
    }
}

class iHeightV implements TreeVisitorI {
    public Integer forBud() {
        return 0;
    }
    public Integer forFlat(FruitD f, TreeD t) {
        return 1+(Integer) t.accept(this);
    }
    public Integer forSplit(TreeD l, TreeD r) {
        return 1+Math.max((Integer) l.accept(this),
                          (Integer) r.accept(this));
    }
}

class Test {
    static void p(Object... objs) {
        for(Object o:objs)
            System.out.printf("%s ", o);
    }
    static private void test1() {
        TreeD x = new Split ( new Split (new Bud(),
                                         new Split(new Bud(),
                                                   new Bud())),
                              new Split (new Bud(),
                                         new Split(new Bud(),
                                                   new Bud())));
        p(x.accept(new iHeightV()), "\n");
    }
    static private void test2() {
        TreeD x = new Split ( new Split (new Bud(),
                                         new Split(new Bud(),
                                                   new Bud())),
                              new Split (new Bud(),
                                         new Flat(new Fig(),
                                                  new Bud())));
        p(x.accept(new iHeightV()), "\n");
    }
    static private void test3() {
        TreeD x = new Split (new Bud(),
                             new Flat(new Fig(),
                                      new Bud()));
        TreeD x1 = new Flat(new Fig(),
                           new Bud());
        TreeD x2 = new Bud();
        p(x.accept(new iHeightV()), "\n");
        p(x1.accept(new iHeightV()), "\n");
        p(x2.accept(new iHeightV()), "\n");
    }
    static private void test4() {
        TreeD x = new Split ( new Split (new Bud(),
                                         new Split(new Bud(),
                                                   new Flat(new Fig(),
                                                            new Flat(new Fig(),
                                                                     new Bud())))),
                              new Split (new Bud(),
                                         new Split(new Bud(),
                                                   new Flat(new Fig(),
                                                            new Bud()))));
        p(x.accept(new iHeightV()), "\n");
    }
    static public void main(String[] args) {
        p("\n", "---test1", "\n");
        test1();
        p("\n", "---test2", "\n");
        test2();
        p("\n", "---test3", "\n");
        test3();
        p("\n", "---test4", "\n");
        test4();
        p ("\n", "--", "\n");
    }
}


