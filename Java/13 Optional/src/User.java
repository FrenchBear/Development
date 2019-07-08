// User.java
// A simple class to test Optional
// 2019-07-05   PV

public class User {
    public int Id;
    public String Name;

    public User(int id, String name) {
        this.Id = id;
        this.Name = name;
    }

	public void Print() {
		System.out.printf("%d: %s\n", Id, Name);
	}
}
