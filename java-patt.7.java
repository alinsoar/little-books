
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

interface tTreeVisitorI {
    TreeD forBud();
    TreeD forFlat(FruitD f, TreeD t);
    TreeD forSplit(TreeD l, TreeD r);
}
interface bTreeVisitorI {
    boolean forBud();
    boolean forFlat(FruitD f, TreeD t);
    boolean forSplit(TreeD l, TreeD r);
}
interface iTreeVisitorI {
    int forBud();
    int forFlat(FruitD f, TreeD t);
    int forSplit(TreeD l, TreeD r);
}

abstract class TreeD {
    abstract boolean accept(bTreeVisitorI ask);
    abstract int     accept(iTreeVisitorI ask);
    abstract TreeD   accept(tTreeVisitorI ask);
    abstract public String toString();
}
class Bud extends TreeD {
    boolean accept(bTreeVisitorI ask) {
        return ask.forBud();
    }
    int accept(iTreeVisitorI ask) {
        return ask.forBud();
    }
    TreeD accept(tTreeVisitorI ask) {
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
    boolean accept(bTreeVisitorI ask) {
        return ask.forFlat(f, t);
    }
    int accept(iTreeVisitorI ask) {
        return ask.forFlat(f, t);
    }
    TreeD accept(tTreeVisitorI ask) {
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
    boolean accept(bTreeVisitorI ask) {
        return ask.forSplit(l, r);
    }
    int accept(iTreeVisitorI ask) {
        return ask.forSplit(l, r);
    }
    TreeD accept(tTreeVisitorI ask) {
        return ask.forSplit(l, r);
    }
    public String toString() {
        return String.format( "(Split %s %s)", l, r);
    }
}

class blsSplitV implements bTreeVisitorI {
    public boolean forBud() {
        return true;
    }
    public boolean forFlat(FruitD f, TreeD t) {
        return false;
    }
    public boolean forSplit(TreeD l, TreeD r) {
        return l.accept(this) && r.accept(this);
    }
}
class blsFlatV implements bTreeVisitorI {
    public boolean forBud() {
        return true;
    }
    public boolean forFlat(FruitD f, TreeD t) {
        return t.accept(this);
    }
    public boolean forSplit(TreeD l, TreeD r) {
        return false;
    }
}
class bHasFruitV implements bTreeVisitorI {
    public boolean forBud() {
        return false;
    }
    public boolean forFlat(FruitD f, TreeD t) {
        return true;
    }
    public boolean forSplit(TreeD l, TreeD r) {
        return l.accept(this) || r.accept(this);
    }
}

class iHeightV implements iTreeVisitorI {
    public int forBud() {
        return 0;
    }
    public int forFlat(FruitD f, TreeD t) {
        return 1+t.accept(this);
    }
    public int forSplit(TreeD l, TreeD r) {
        return 1+Math.max(l.accept(this), r.accept(this));
    }
}
class iOccursV implements iTreeVisitorI {
    FruitD f;
    iOccursV (FruitD _f) {
        f = _f;
    }
    public int forBud() {
        return 0;
    }
    public int forFlat(FruitD w, TreeD t) {
        if (f.equals(w))
            return 1+t.accept(this);
        else
            return t.accept(this);
    }
    public int forSplit(TreeD l, TreeD r) {
        return l.accept(this)+r.accept(this);
    }
}

class tSubstV implements tTreeVisitorI {
    FruitD o;
    FruitD n;
    tSubstV(FruitD _n, FruitD _o) {
        o = _o;
        n = _n;
    }
    public TreeD forBud() {
        return new Bud();
    }
    public TreeD forFlat(FruitD w, TreeD t) {
        if (o.equals(w))
            return new Flat(n, t.accept(this));
        else
            return new Flat(w, t.accept(this));
    }
    public TreeD forSplit(TreeD l, TreeD r) {
        return new Split(l.accept(this), r.accept(this));
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
        p(x.accept(new blsFlatV()), "\n");
        p(x.accept(new blsSplitV()), "\n");
        p(x.accept(new bHasFruitV()), "\n");
        p(x.accept(new iHeightV()), "\n");
        p(x.accept(new iOccursV(new Fig())), "\n");
    }
    static private void test2() {
        TreeD x = new Split ( new Split (new Bud(),
                                         new Split(new Bud(),
                                                   new Bud())),
                              new Split (new Bud(),
                                         new Flat(new Fig(),
                                                  new Bud())));
        p(x.accept(new blsFlatV()), "\n");
        p(x.accept(new blsSplitV()), "\n");
        p(x.accept(new bHasFruitV()), "\n");
        p(x.accept(new iHeightV()), "\n");
        p(x.accept(new iOccursV(new Fig())), "\n");
    }
    static private void test3() {
        TreeD x = new Split (new Bud(),
                             new Flat(new Fig(),
                                      new Bud()));
        TreeD x1 = new Flat(new Fig(),
                           new Bud());
        p(x.accept(new blsFlatV()), "\n");
        p(x.accept(new blsSplitV()), "\n");
        p(x.accept(new bHasFruitV()), "\n");
        p(x.accept(new iHeightV()), "\n");
        p(x1.accept(new iHeightV()), "\n");
        p(x.accept(new iOccursV(new Fig())), "\n");
        p(x1.accept(new iOccursV(new Fig())), "\n");
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
        p(x.accept(new tSubstV(new Apple(), new Fig())), "\n");
        p(x.accept(new iOccursV(new Fig())), "\n");
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


