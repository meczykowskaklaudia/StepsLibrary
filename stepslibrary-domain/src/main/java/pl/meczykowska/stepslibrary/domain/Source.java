package pl.meczykowska.stepslibrary.domain;

import com.sun.istack.NotNull;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import java.net.URL;

@Entity
public class Source {
    @Id
    int id;
    URL url;
    String comment;
    @ManyToOne
    Step step;

    public Source (URL url, String comment, Step step){
        this.url = url;
        this.comment = comment;
        this.step = step;
    }

    public Source() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public URL getUrl() {
        return url;
    }

    public void setUrl(URL url) {
        this.url = url;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Step getStep() {
        return step;
    }

    public void setStep(Step step) {
        this.step = step;
    }

}
