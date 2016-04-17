package MyFlight;

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
		
		
	}
}
