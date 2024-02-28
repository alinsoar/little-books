
interface PieVisitorI {
    PieD forBot();
    PieD forTop(Object t, PieD r);
}

abstract class SubstD implements PieVisitorI {
    Object n;
    Object o;
    SubstD (Object _n, Object _o) {
        n = _n;
        o = _o;
    }
    // ----------------------------------------
    public PieD forBot() {
        return new Bot();
    };
    abstract public PieD forTop(Object t, PieD r);
}
class SubstV extends SubstD {
    SubstV(Object _n, Object _o) {
        super(_n, _o);
    }
    public PieD forTop(Object t, PieD r) {
        if (o.equals(t))
            return new Top(n, r.accept(this));
        else
            return new Top(t, r.accept(this));
    }
}
class LtdSubstV extends SubstD {
    int c;
    LtdSubstV(int _c, Object _n, Object _o) {
        super(_n, _o);
        c = _c;
    }
    // ----------------------------------------
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
    }
    static public void main(String[] args) {
        p("\n", "---test1", "\n");
        test1();
        p ("\n", "--", "\n");
    }
}


