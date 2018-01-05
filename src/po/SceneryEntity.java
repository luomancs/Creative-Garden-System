package po;

import javax.persistence.*;

/**
 * Created by Rose on 2017/10/10.
 */
@Entity
//@Table(name = "scenery", schema = "BotanyPark", catalog = "")
public class SceneryEntity {
    private int id;
    private String name;
    private String context;
    //private int coordinate_x;
    //private int coordinate_y;
    //private String style;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "context")
    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

   /* @Basic
    @Column(name = "coordinate_x")
    public int getCoordinate_x() {
        return coordinate_x;
    }

    public void setCoordinate_x(int coordinate_x) {
        this.coordinate_x = coordinate_x;
    }

    @Basic
    @Column(name = "coordinate_y")
    public int getCoordinate_y() {
        return coordinate_y;
    }

    public void setCoordinate_y(int coordinate_y) {
        this.coordinate_y = coordinate_y;
    }

    @Basic
    @Column(name = "style")
    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }*/


//    @Override
//    public boolean equals(Object o) {
//        if (this == o) return true;
//        if (o == null || getClass() != o.getClass()) return false;
//
//        SceneryEntity that = (SceneryEntity) o;
//
//        if (id != that.id) return false;
//        if (name != null ? !name.equals(that.name) : that.name != null) return false;
//        if (context != null ? !context.equals(that.context) : that.context != null) return false;
//
//        return true;
//    }
//
//    @Override
//    public int hashCode() {
//        int result = id;
//        result = 31 * result + (name != null ? name.hashCode() : 0);
//        result = 31 * result + (context != null ? context.hashCode() : 0);
//        return result;
//    }
}
