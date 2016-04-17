package MyFlight;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Reservation {
	private String reservation_number;
	private Flight flight;
	private String email;
	private String [] names;
	private String classReserved;
	
	
	public Reservation(Flight f, String e, String [] nam, String classR){
		reservation_number=createReservationNumber();
		flight=f;
		email=e;
		names=nam;
		classReserved=classR;
		
	}
	public String createReservationNumber(){ //missing 
		return null;
		
	}
	public void book(){
		Connection con = null;
		Statement st = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/frs","root","");
			st = con.createStatement();
			String sql = "INSERT INTO reservation VALUES ('"+reservation_number+"','"+email+"')";
			st.executeUpdate(sql);
			for(int i=1;i<names.length;i++){ 
			sql = "INSERT INTO reservation_users VALUES ('"+reservation_number+"','"+names[i]+"')";
			st.executeUpdate(sql);			
			}
			sql = "INSERT INTO reservation_details VALUES ('"+reservation_number+"','"+flight.getDate()+"','"+flight.getFlightNumber()+"','"+classReserved+"')";
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
