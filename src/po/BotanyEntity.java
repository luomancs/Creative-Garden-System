package po;

import javax.persistence.*;

/**
 * Created by Rose on 2017/10/10.
 */
@Entity
//@Table(name = "botany", schema = "BotanyPark", catalog = "")
public class BotanyEntity {
    private int id;
    private Integer sid;
    private String name;
    private String context;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "sid")
    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BotanyEntity that = (BotanyEntity) o;

        if (id != that.id) return false;
        if (sid != null ? !sid.equals(that.sid) : that.sid != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (context != null ? !context.equals(that.context) : that.context != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (sid != null ? sid.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (context != null ? context.hashCode() : 0);
        return result;
    }
}
