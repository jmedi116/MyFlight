package MyFlight;

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
			
		
	}
}
