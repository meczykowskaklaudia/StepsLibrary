package pl.meczykowska.stepslibrary.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

@Entity
public class Step {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String name;
    String creator;
    Date creationDate;
    Double difficultyLevel;

    public Step(String name, String creator, Date creationDate, Double difficultyLevel){
        this.name = name;
        this.creator = creator;
        this.creationDate = creationDate;
        this.difficultyLevel = difficultyLevel;
    }

    public Step() {
        
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Double getDifficultyLevel() {
        return difficultyLevel;
    }

    public void setDifficultyLevel(Double difficultyLevel) {
        this.difficultyLevel = difficultyLevel;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
