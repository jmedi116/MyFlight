package MyFlight;

public class City {
	private int cityId;
	private String name;
	
	public City(int i,String n){
		cityId=i;
		name=n;
		
	}
	public String getDescr(){
		return name;
		
	}
	public int getId(){
		
			return cityId;
	}

}


