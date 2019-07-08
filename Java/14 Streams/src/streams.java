import java.util.*;

// optional.java
// Play with Java8 Optional class
// 2019-07-05   PV

public class streams {
    public static void main(String[] args) {
        User u1 = new User(1, "Pierre", true);
        User u2 = new User(2, "Claude", true);
        User u3 = new User(3, "Sophie", false);
        User u4 = new User(4, "Denise", false);
     
        List<User> lu = Arrays.asList(u1, u2, u3, u4);  // immutable
        Set<User> su = new HashSet<User>();
        su.add(u1);
        su.add(u2);
        su.add(u3);
        su.add(u4);
    }
}
