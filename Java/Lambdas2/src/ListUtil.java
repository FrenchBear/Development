/* ListUtil.java
 * 
 * Copyright 2016 Pierre <Pierre@SKULL>
 * 2016-10-07	PV	From C# in Depth - The Beauty of Closures
 */

import java.util.*;

public class ListUtil {

    public static <T> List<T> filter(List<T> source, Predicate<T> predicate)
    {
        ArrayList<T> ret = new ArrayList<T>();
        for (T item : source)
        {
            if (predicate.match(item))
            {
                ret.add(item);
            }
        }
        return ret;
    }

    public static <T> void dump(List<T> source)
    {
        boolean first = true;
        for (T item: source)
        {
            if (first)
            {
                System.out.print("{");
                first = false;
            }
            else
            {
                System.out.print(", ");
            }
            System.out.print(item);
        }
        System.out.println("}");
    }
}
