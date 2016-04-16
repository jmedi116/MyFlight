package MyFlight;
import java.sql.*;
import java.util.ArrayList;

public class SearchManager {
	public Flight searchSingleFlight(String flightNumber, String date){
		Flight f=null;
		Connection con = null;
		Statement st = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/frs","root","");
			st = con.createStatement();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		ResultSet rs=null;
	
		String query="SELECT * FROM flight WHERE flight_number='"+flightNumber+"' AND date='"+date+"'";
		System.out.println(query);
		try {
			rs=st.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(rs.toString());

		
		 try {
			while (rs.next())
			  {
				f=new Flight(rs.getString("flight_number"),rs.getString("date"),rs.getString("origin"),rs.getString("destination"),rs.getString("time"),rs.getInt("available_coach"),rs.getInt("available_economy"),rs.getInt("available_first"));
				
				/* results=results+"<tr><td>"+rs.getString("date")+"</td><td>"+rs.getString("origin")+"</td><td>"+rs.getString("destination")+"</td><td>"+rs.getString("time")+"</td><td>"+
			  			rs.getString("available_coach")+"</td><td>"+rs.getString("available_economy")+"</td><td>"+rs.getString("available_first")+"</td><td><a href='book.jsp' target='_blank'>Book</a></td></tr>";*/
			    
			  }
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	
}
	public ArrayList<Flight> searchFlight(String srchFromFlight, String srchToFlight, String date, int passengers, boolean nonstop){
		Connection con = null;
		Statement st = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/frs","root","");
			st = con.createStatement();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		ResultSet rs=null;
		if(nonstop){
		String query="SELECT * FROM flight WHERE origin='"+srchFromFlight+"' AND destination='"+srchToFlight+"' AND CAST(`date` as CHAR)='"+date+"'";
		System.out.println(query);
		try {
			rs=st.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(rs.toString());
		}
		ArrayList<Flight> list=new ArrayList<Flight>();
		 try {
			while (rs.next())
			  {
				Flight f=new Flight(rs.getString("flight_number"),rs.getString("date"),rs.getString("origin"),rs.getString("destination"),rs.getString("time"),rs.getInt("available_coach"),rs.getInt("available_economy"),rs.getInt("available_first"));
				list.add(f);
				/* results=results+"<tr><td>"+rs.getString("date")+"</td><td>"+rs.getString("origin")+"</td><td>"+rs.getString("destination")+"</td><td>"+rs.getString("time")+"</td><td>"+
			  			rs.getString("available_coach")+"</td><td>"+rs.getString("available_economy")+"</td><td>"+rs.getString("available_first")+"</td><td><a href='book.jsp' target='_blank'>Book</a></td></tr>";*/
			    
			  }
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public String getReservationsByUser(String email){
		Connection con = null;
		Statement st = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/frs","root","");
			st = con.createStatement();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		ResultSet rs=null;
		
		String query="SELECT a.reservation_number,b.date, c.Origin, c.end,b.class FROM reservation as A inner join reservation_details as B on a.reservation_number=b.reservation_number inner join intinerary_hdr as c on a.intinerary_id=c.intinerary_id WHERE a.email='"+email+"'";
		System.out.println(query);

		try {
			rs=st.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(rs.toString());
		String results="";
		 try {
			while (rs.next())
			  {
			  results=results+"<tr><td>"+rs.getString("reservation_number")+"</td><td>"+rs.getString("date")+"</td><td>"+rs.getString("Origin")+"</td><td>"+rs.getString("end")+"</td><td>"+rs.getString("class")+"</td></tr>";
			    
			  }
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return results;
	}
	
	
		
	}

