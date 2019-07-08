// optional.java
// Play with Java8 Optional class
// 2019-07-05   PV

import java.util.Optional;

public class optional {
    public static void main(String[] args) {
        User u1 = new User(1, "Pierre");
        Optional<User> ou1 = Optional.of(u1);
        User u2 = null;
        Optional<User> ou2 = Optional.ofNullable(u2);

        System.out.println(ou1);
        System.out.println(ou2);
        ou1.ifPresent(u -> u.Print()); // ifPresent unwraps object and use ut as a lambra parameter

        User u3 = ou2.orElse(u1); // orElse unwraps object and returns it if present, else return parameter
        u3.Print();

        User u4 = ou1.orElseThrow(() -> new IllegalArgumentException());
        u4.Print();

        Optional<Integer> oi = Optional.empty();
        int n3 = oi.orElse(3);
        System.out.println(n3);
        int n4 = oi.orElseGet(() -> 4); // .orElse arg is always evaluated, but orElseGet lambda is executed only if
                                        // Optional source is empty
        System.out.println(n4);

        var z = ou2.map(u -> u.Name);       // Gets an Optional<String>
        String name = ou2.map(u -> u.Name).orElse("John Doe");  // Add unwrapping+default with .orElse

        Optional<User> ou5 = ou1.filter(u -> u.Id>2);

        Optional<User> ou6 = ou2.or(() -> ou1);     // Java 9 and later, or returns an Optional<T> whereas orElse returns a T
        

    }
}
