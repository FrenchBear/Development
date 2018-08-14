/* FourLetterPredicate.java
 * 
 * Copyright 2016 Pierre <Pierre@SKULL>
 * 2016-10-07	PV	From C# in Depth - The Beauty of Closures
 */

public class FourLetterPredicate implements Predicate<String>
{	
    @Override
    public boolean match(String item)
    {
        return item.length() <= 4;
    }
}
