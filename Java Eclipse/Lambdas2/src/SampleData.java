/* SampleData.java
 * 
 * Copyright 2016 Pierre <Pierre@SKULL>
 * 2016-10-07	PV	From C# in Depth - The Beauty of Closures
 */

import java.util.*;

public class SampleData {

    public static List<String> WORDS;

    // No static constructor in java, but static bloc plays same role
    static 
    {
        String s = "Hobbits are an unobtrusive but very ancient people more numerous formerly than they are today for they love peace and quiet and good tilled earth a well ordered and well farmed countryside was their favourite haunt";
        WORDS = Arrays.asList(s.split(" "));
    }
}

