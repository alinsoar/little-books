
interface PieVisitorI {
    PieD forBot();
    PieD forTop(Object t, PieD r);
}

class RemV implements PieVisitorI {
    Object o;
    RemV(Object _o) {
        o = _o;
    }
    public PieD forBot() {
        return new Bot();
    };
    public PieD forTop(Object t, PieD r) {
        if (o.equals(t))
            return r.accept(this);
        else
            return new Top(t, r.accept(this));
    }
}
class SubstV implements PieVisitorI {
    Object n;
    Object o;
    SubstV(Object _n, Object _o) {
        n = _n;
        o = _o;
    }
    public PieD forBot() {
        return new Bot();
    };
    public PieD forTop(Object t, PieD r) {
        if (o.equals(t))
            return new Top(n, r.accept(this));
        else
            return new Top(t, r.accept(this));
    }
}
class LtdSubstV implements PieVisitorI {
    int c;
    Object n;
    Object o;
    LtdSubstV(int _c, Object _n, Object _o) {
        c = _c;
        o = _o;
        n = _n;
    }
    // ----------------------------------------
    public PieD forBot() {
        return new Bot();
    }
    public PieD forTop(Object t, PieD r) {
        if (c==0)
            return new Top(t, r);
        else
            if (o.equals(t))
                return new Top(n, r.accept(new LtdSubstV(c-1, n, o)));
            else
                return new Top(t, r.accept(this));
    }
}

abstract class PieD {
    abstract PieD accept(PieVisitorI ask);
}
class Bot extends PieD {
    PieD accept(PieVisitorI ask) { return ask.forBot(); }
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
    // ----------------------------------------
    PieD accept(PieVisitorI ask) { return ask.forTop(t, r); }
    public String toString() {
        return String.format("%s %s", t, r);
    }
}

class Test {
    static void p(Object... objs) {
        for(Object o:objs)
            System.out.printf("%s ", o);
    }
    static private void test1() {
        PieD x = (new Top(new Integer(1),
                          new Top(new Integer(3),
                                  new Top(new Integer(3),
                                          new Bot())))
                  .accept(new SubstV(10, 3))
                  .accept(new RemV(1))
                  .accept(new RemV(5))
                  .accept(new RemV(3)));
        p(x, ";\n")
            ;
    }
    static private void test2() {
        PieD x = (new Top(new Integer(1),
                          new Top(new Integer(3),
                                  new Top(new Integer(3),
                                          new Top(new Integer(3),
                                                  new Bot()))))
                  .accept(new LtdSubstV(2, 10, 3)));
        p(x, ";\n")
            ;
    }
    static public void main(String[] args) {
        p("\n", "---test1", "\n");
        test1();
        p("\n", "---test2", "\n");
        test2();
        p ("\n", "--", "\n");
    }
}

