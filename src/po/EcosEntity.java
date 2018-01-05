package po;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by Rose on 2017/10/10.
 */
@Entity
//@Table(name = "ecos", schema = "BotanyPark", catalog = "")
public class EcosEntity {
    private Date day;
    private String temperature;
    private String humidity;
    private String pm;
    private String wind;
    private String clothes;

    @Id
    @Column(name = "day")
    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    @Basic
    @Column(name = "temperature")
    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    @Basic
    @Column(name = "humidity")
    public String getHumidity() {
        return humidity;
    }

    public void setHumidity(String humidity) {
        this.humidity = humidity;
    }

    @Basic
    @Column(name = "pm")
    public String getPm() {
        return pm;
    }

    public void setPm(String pm) {
        this.pm = pm;
    }

    @Basic
    @Column(name = "wind")
    public String getWind() {
        return wind;
    }

    public void setWind(String wind) {
        this.wind = wind;
    }

    @Basic
    @Column(name = "clothes")
    public String getClothes() {
        return clothes;
    }

    public void setClothes(String clothes) {
        this.clothes = clothes;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EcosEntity that = (EcosEntity) o;

        if (day != null ? !day.equals(that.day) : that.day != null) return false;
        if (temperature != null ? !temperature.equals(that.temperature) : that.temperature != null) return false;
        if (humidity != null ? !humidity.equals(that.humidity) : that.humidity != null) return false;
        if (pm != null ? !pm.equals(that.pm) : that.pm != null) return false;
        if (wind != null ? !wind.equals(that.wind) : that.wind != null) return false;
        if (clothes != null ? !clothes.equals(that.clothes) : that.clothes != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = day != null ? day.hashCode() : 0;
        result = 31 * result + (temperature != null ? temperature.hashCode() : 0);
        result = 31 * result + (humidity != null ? humidity.hashCode() : 0);
        result = 31 * result + (pm != null ? pm.hashCode() : 0);
        result = 31 * result + (wind != null ? wind.hashCode() : 0);
        result = 31 * result + (clothes != null ? clothes.hashCode() : 0);
        return result;
    }
}
