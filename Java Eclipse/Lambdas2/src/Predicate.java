/* Predicate.java
 * 
 * Copyright 2016 Pierre <Pierre@SKULL>
 * 2016-10-07	PV	From C# in Depth - The Beauty of Closures
 */

// boolean match(T item)
public interface Predicate<T>
{
	boolean match(T item);
}

