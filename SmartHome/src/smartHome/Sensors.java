package smartHome;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
@Table(name="sensors")
public class Sensors {
	
	

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	protected int id;
	
	@Column(name="temp")
	protected String temp;

	@Column(name="humid")
	protected String humid;
	
	@Column(name="pressure")
	protected String pressure;
	
	@Column(name="airquality")
	protected String airquality;
	
	@Column(name="lux")
	protected String lux;
	
	@Column(name="motion")
	protected int motion;
	
	@Column(name="ts",columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP" )
	protected String ts;
	
	public Sensors(String temp, String humid, String pressure, String airquality, String lux,
			int motion) {
		super();
		
		this.temp = temp;
		this.humid = humid;
		this.pressure = pressure;
		this.airquality = airquality;
		this.lux = lux;
		this.motion = motion;
	}

	public Sensors() {
		
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public String getHumid() {
		return humid;
	}

	public void setHumid(String humid) {
		this.humid = humid;
	}

	public String getPressure() {
		return pressure;
	}

	public void setPressure(String pressure) {
		this.pressure = pressure;
	}

	public String getAirquality() {
		return airquality;
	}

	public void setAirquality(String airquality) {
		this.airquality = airquality;
	}

	public String getLux() {
		return lux;
	}

	public void setLux(String lux) {
		this.lux = lux;
	}

	public int getMotion() {
		return motion;
	}

	public void setMotion(int motion) {
		this.motion = motion;
	}

	public String getTs() {
		return ts;
	}

	public void setTs(String ts) {
		this.ts = ts;
	}
}
