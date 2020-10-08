package pl.meczykowska.stepslibrary.dto;


import javax.validation.constraints.NotNull;
import java.net.URL;

public class SourceDTO {

    @NotNull
    private URL url;

    private String comment;

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
}
