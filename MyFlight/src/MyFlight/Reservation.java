package MyFlight;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.text.SimpleDateFormat;


public class Reservation {
	private String reservation_number;
	private Flight flight;
	private String email;
	private String [] names;
	private String classReserved;
	
	public Reservation(String r,Flight f, String e, String [] nam, String classR){
		reservation_number=r;
		flight=f;
		email=e;
		names=nam;
		classReserved=classR;
		
	}
	
	
	public Reservation(Flight f, String e, String [] nam, String classR){
		reservation_number=createReservationNumber();
		flight=f;
		email=e;
		names=nam;
		classReserved=classR;
		
	}
	public String getReservationNumber(){
		return reservation_number;
		
	}
	public Flight getFlight(){
		return flight;
	}
	public String getClassReserved(){
		return classReserved;
	}
	private String hashString(String cad){
		System.out.println("cad="+cad);
		if(cad==null) 
			return null;
		String hash=null;
		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.update(cad.getBytes(),0,cad.length());
			hash=new BigInteger(1,digest.digest()).toString(1);
			System.out.println("here");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return hash;

	}
	public String createReservationNumber(){ //missing 
		 Date dNow = new Date();
		 SimpleDateFormat ft = new SimpleDateFormat("yyMMddhhmmssMs");
		 String datetime = ft.format(dNow);
		 String reservation=hashString(datetime);
		 System.out.println("reservation: "+reservation);
		 return reservation;
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
			System.out.println(sql);
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
	public void Cancel(){
		Connection con = null;
		Statement st = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/frs","root","");
			st = con.createStatement();
	   String sql = "Delete from reservation_details Where reservation_number='"+reservation_number+"'";
	   st.executeUpdate(sql);
	   sql = "Delete from reservation Where reservation_number='"+reservation_number+"'";
	   System.out.println("SQL="+sql);
	   st.executeUpdate(sql);
	   sql = "Delete from reservation_users Where reservation_number='"+reservation_number+"'";
	   st.executeUpdate(sql);
	   flight.addCapacity(classReserved,names.length);
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
