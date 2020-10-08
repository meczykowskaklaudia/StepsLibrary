package pl.meczykowska.stepslibrary.dto;

import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
public class StepDTO {

    @NotEmpty
    private String name;

    @NotEmpty
    private String creator;

    @Pattern(regexp="[0-1]?[0-9]-[1-2][0-9]{3}")
    private String creationDate;

    @NotNull
    @Range(min=0, max=10)
    private Double difficultyLevel;

    public String getName() {
        return this.name;
    }

    public String getCreator() {
        return this.creator;
    }

    public String getCreationDate() {
        return this.creationDate;
    }

    public Double getDifficultyLevel() {
        return this.difficultyLevel;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public void setCreationDate(String creationDate) {
        this.creationDate = creationDate;
    }

    public void setDifficultyLevel(Double difficultyLevel) {
        this.difficultyLevel = difficultyLevel;
    }
}
