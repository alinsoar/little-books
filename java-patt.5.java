// -*- mode: java; buffer-read-only: t -*-

abstract class NumD {}
class Zero extends NumD {
    public boolean equals(Object o) {
        return o instanceof Zero;
    }
}
class OneMoreThan extends NumD {
    NumD predecessor;
    OneMoreThan (NumD _p) { predecessor = _p; }
}

class RemFishV {
    PieD forBot() {
        return new Bot();
    }
    PieD forTop(FishD fish, Object t, PieD r) {
        if (fish.equals(t))
            return r.remFish(fish);
        else
            return new Top(t, r.remFish(fish));
    }
}
class RemIntV {
    PieD forBot() {
        return new Bot();
    }
    PieD forTop(Integer x, Object t, PieD r) {
        if (x.equals(t))
            return r.remInt(x);
        else
            return new Top(t, r.remInt(x));
    }
}
class RemAV {
    PieD forBot() {
        return new Bot();
    }
    PieD forTop(Object t, PieD r) {
        if (new Anchovy().equals(t))
            return r.remA();
        else return new Top(t, r.remA());
    }
}

class RemV {
    PieD forBot() {
        return new Bot();
    };
    PieD forTop(Object w, Object t, PieD r) {
        if (w.equals(t))
            return r.rem(w);
        else
            return new Top(t, r.rem(w));
    }
}

abstract class PieD {
    RemAV rafn = new RemAV();
    RemFishV rffn = new RemFishV();
    RemIntV rifn = new RemIntV();
    RemV remfn = new RemV();
    abstract PieD remA();
    abstract PieD remFish(FishD fish);
    abstract PieD remInt(Integer x);
    abstract PieD rem(Object w);
}
class Bot extends PieD {
    PieD remA() { return rafn.forBot(); }
    PieD remFish(FishD fish) { return rffn.forBot(); }
    PieD remInt(Integer x) { return rifn.forBot(); }
    PieD rem(Object x) { return remfn.forBot(); }
    public String toString() {
        return String.format("Bottom");
    }
}
class Top extends PieD {
    Object t;
    PieD r;
    Top(Object _t, PieD _r) {
        t = _t;
        r = _r;
    }
    public String toString() {
        return String.format("%s %s", t, r);
    }
    // ----------------------------------------
    PieD remA() { return rafn.forTop(t, r); }
    PieD remFish(FishD fish) { return rffn.forTop(fish, t, r); }
    PieD remInt(Integer x) { return rifn.forTop(x, t, r); }
    PieD rem(Object x) { return remfn.forTop(x, t, r); }
}

abstract class FishD {}
class Anchovy extends FishD {
    public boolean equals(Object o) {
        return o instanceof Anchovy;
    }
}
class Salmon extends FishD {
    public boolean equals(Object o) {
        return (o instanceof Salmon);
    }
}
class Tuna extends FishD {
    public boolean equals(Object o) {
        return (o instanceof Tuna);
    }
}

class Test {
    static void p(Object... objs) {
        for(Object o:objs)
            System.out.printf("%s ", o);
    }
    static private void test1() {
        PieD x = (new Top(new Salmon(),
                         new Top(new Tuna(),
                                 new Top(new Anchovy(),
                                         new Bot())))
                  .remA()
                  .remFish(new Salmon())
                  .remFish(new Tuna())
                  .remFish(new Anchovy()));
        p(x, ";\n");
    }
    static private void test2() {
        PieD x = (new Top(new Integer(1),
                         new Top(new Integer(3),
                                 new Top(new Anchovy(),
                                         new Bot())))
                  .remA()
                  .remFish(new Anchovy())
                  .remFish(new Tuna())
                  .remInt(1)
                  .remInt(5)
                  .remInt(3));
        p(x, ";\n");
    }
    static private void test3() {
        PieD x = (new Top(new Integer(1),
                         new Top(new Integer(3),
                                 new Top(new Anchovy(),
                                         new Top(new Tuna(),
                                                 new Bot()))))
                  .rem(new Anchovy())
                  .rem(new Tuna())
                  .rem(1)
                  .rem(5)
                  .rem(3));
        p(x, ";\n");
    }
    static private void test4() {
        PieD x = (new Top(new Integer(1),
                         new Top(new Integer(3),
                                 new Top(new Anchovy(),
                                         new Top(new Zero(),
                                                 new Top(new OneMoreThan(new Zero()),
                                                         new Bot())))))
                  .rem(new Anchovy())
                  .rem(new Tuna())
                  .rem(new Zero())
                  .rem(new OneMoreThan(new Zero()))
                  .rem(1)
                  .rem(5)
                  .rem(3));
        p(x, ";\n");
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


