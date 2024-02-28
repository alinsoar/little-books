
interface ExprVisitorI {
    Object forPlus(ExprD l, ExprD r);
    Object forDiff(ExprD l, ExprD r);
    Object forProd(ExprD l, ExprD r);
    Object forConst(Object c);
}

abstract class ExprD {
    abstract Object accept (ExprVisitorI ask);
    abstract public String toString();
}
class Plus extends ExprD {
    ExprD l;
    ExprD r;
    Plus(ExprD _l, ExprD _r) {
        l = _l;
        r = _r;
    }
    // ----------------------------------------
    Object accept (ExprVisitorI ask) {
        return ask.forPlus(l, r);
    }
    public String toString() {
        return String.format("(%s) + (%s)", l, r);
    }
}
class Diff extends ExprD {
    ExprD l;
    ExprD r;
    Diff(ExprD _l, ExprD _r) {
        l = _l;
        r = _r;
    }
    // ----------------------------------------
    Object accept (ExprVisitorI ask) {
        return ask.forDiff(l, r);
    }
    public String toString() {
        return String.format("(%s) - (%s)", l, r);
    }
}
class Prod extends ExprD {
    ExprD l;
    ExprD r;
    Prod(ExprD _l, ExprD _r) {
        l = _l;
        r = _r;
    }
    // ----------------------------------------
    Object accept (ExprVisitorI ask) {
        return ask.forProd(l, r);
    }
    public String toString() {
        return String.format("(%s) * (%s)", l, r);
    }
}
class Const extends ExprD {
    Object c;
    Const(Object _c) {
        c = _c;
    }
    // ----------------------------------------
    Object accept (ExprVisitorI ask) {
        return ask.forConst(c);
    }
    public String toString() {
        return String.format("%s", c);
    }
}

abstract class SetD {
    SetD add (Integer i) {
        if (mem(i))
            return this;
        else
            return new Add(i, this);
    }
    abstract boolean mem(Integer i);
    abstract SetD plus(SetD s);
    abstract SetD diff(SetD s);
    abstract SetD prod(SetD s);
    abstract public String toString();
}
class Empty extends SetD {
    boolean mem(Integer i) {
        return false;
    }
    SetD plus(SetD s) {
        return s;
    }
    SetD diff(SetD s) {
        return new Empty();
    }
    SetD prod(SetD s) {
        return new Empty();
    }
    public String toString() {
        return "";
    }
}
class Add extends SetD {
    Integer i;
    SetD rest;
    Add(Integer _i, SetD _r) {
        i = _i;
        rest = _r;
    }
    // ----------------------------------------
    boolean mem(Integer j) {
        if (j.equals(i))
            return true;
        else
            return rest.mem(j);
    }
    SetD plus(SetD x) {
        return rest.plus(x.add(i));
    }
    SetD diff(SetD x) {
        if (!x.mem(i))
            return (rest.diff(x)).add(i);
        else
            return rest.diff(x);
    }
    SetD prod(SetD x) {
        if (x.mem(i))
            return rest.prod(x).add(i);
        else
            return rest.prod(x);
    }
    public String toString() {
        return String.format("%d %s", i, rest);
    }
}

class IntEvalV implements ExprVisitorI {
    public Object forPlus(ExprD l, ExprD r) {
        return plus (l.accept(this), r.accept(this));
    }
    public Object forDiff(ExprD l, ExprD r) {
        return diff (l.accept(this), r.accept(this));
    }
    public Object forProd(ExprD l, ExprD r) {
        return prod (l.accept(this), r.accept(this));
    }
    public Object forConst(Object c) {
        return c;
    }
    Object plus(Object x, Object y) {
        return (Object) ((Integer) x + (Integer) y);
    }
    Object diff(Object x, Object y) {
        return (Object) ((Integer) x - (Integer) y);
    }
    Object prod(Object x, Object y) {
        return (Object) ((Integer) x * (Integer) y);
    }
}

class SetEvalV extends IntEvalV {
    Object plus(Object x, Object y) {
        return ((SetD) x).plus ((SetD) y);
    }
    Object diff(Object x, Object y) {
        return ((SetD) x).diff ((SetD) y);
    }
    Object prod(Object x, Object y) {
        return ((SetD) x).prod ((SetD) y);
    }
}

class Test {
    static void p(Object... objs) {
        for(Object o:objs)
            System.out.printf("%s ", o);
    }
    static private void test1() {
        ExprD x = new Const(new Integer(10));
        ExprD p = new Plus (x, x);
        ExprD w = new Prod (p, p);
        p (x, ";\n", p, ";\n", w, ";\n");
        p (w.accept (new IntEvalV()));
    }
    static private void test2() {
        SetD s = new Empty().add(100).add(200);
        SetD s0 = new Empty().add(1).add(2).add(3);
        SetD su0 = s.plus(s0);
        SetD d = su0.diff(s0);
        p (s, ":",
           s0, ":",
           su0, ":",
           d, ":",
           su0.prod(s).prod(d), ":",
           su0.prod(s).prod(d).prod(s0), ":"
           );
    }
    static private void test3() {
        ExprD x = new Prod(new Const (new Empty().add(7)),
                           new Const (new Empty().add(3)));
        ExprD y = new Plus(new Const (new Empty().add(7)),
                           new Const (new Empty().add(3)));
        Object v1 = x.accept(new SetEvalV());
        Object v2 = y.accept(new SetEvalV());
        p(x, "\n", y, "\n");
        p(":", v1, ":", v2, ":");
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


