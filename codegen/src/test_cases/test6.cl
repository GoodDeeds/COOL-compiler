class A {
    e : Int <- 100;
    a : Object <- while b loop e <- e+1 pool ;
    b : Bool <- true;
    test(): Int {
        99
    };
};

class B inherits A {
    c : String <- "This is a string";
    d : A;
};


class Main {
    a : Int;
    b : Bool;
    x : A <- new A;
    main() : Int {
        (new A)@A.test()
    };
    xyz(x:Int, y:Int, z:Int, v:A) : A {
        {
            x+y+z;
            v;
        }
    };
};