package MyFlight;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Flight {
	private String flightNumber;
	private String date;
	private String origin;
	private String destination;
	private String time;
	private int availableCoach;
	private int availableEconomyPlus;
	private int availableFirstClass;
	
	public Flight(String fNum, String dat, String orig, String destin, String tim, int aCoach, int aEcon, int aFirst){
			flightNumber=fNum;
			date=dat;
			origin=orig;
			destination=destin;
			time=tim;
			availableCoach=aCoach;
			availableEconomyPlus=aEcon;
			availableFirstClass=aFirst;
			
	}
	public String getFlightNumber(){
		return flightNumber;
		
	}
	public String getDate(){
		return date;
	}
	public String getOrigin(){
		return origin;
	}
	public String getDestination(){
		return destination;
	}
	public String getTime(){
		return time;
	}
	public int getAvailableCoach(){
		return availableCoach;
	}
	public int getAvailableEconomyPlus(){
		return availableEconomyPlus;
	}
	public int getAvailableFirstClass(){
		return availableFirstClass;
	}
	public void book(){
	/*	Connection con = null;
		Statement st = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/frs","root","");
			st = con.createStatement();
	   String sql = "INSERT INTO login VALUES ('"+email+"','"+hash+"')";
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
		*/
	}
}
