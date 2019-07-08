// User.java
// A simple class to test Streams
// 2019-07-08   PV

public class User {
    public int Id;
    public String Name;
    public boolean IsMale;

    public User(int id, String name, boolean isMale) {
        this.Id = id;
        this.Name = name;
        this.IsMale=isMale;
    }

	public void Print() {
		System.out.printf("%d: %s %b\n", Id, Name, IsMale);
	}
}
