package MyFlight;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public abstract class Person {
	protected String email;
	protected String name;
	protected String phoneNumber;
	protected int role;
	public Person(String eml, String nam, String phone, int rol){
			email=eml;
			name=nam;
			phoneNumber=phone;
			role=rol;
		
	}
	public String getName(){
			return name;
		
	}
	public String getEmail(){
		return email;
	}	

	public abstract int getRole();
	public void save(){
		Connection con = null;
		Statement st = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/frs","root","");
			st = con.createStatement();
	   String sql = "INSERT INTO user VALUES ('"+email+"','"+name+"','"+phoneNumber+"',"+role+")";
	   System.out.println("SQL="+sql);
			st.executeUpdate(sql);
		
		con.close();

		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}
