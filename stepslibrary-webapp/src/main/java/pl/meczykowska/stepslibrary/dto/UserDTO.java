package pl.meczykowska.stepslibrary.dto;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotEmpty;

public class UserDTO {

    @NotEmpty
    @Length(min = 3, max = 15)
    private String username;

    @NotEmpty
    @Length(min = 3, max = 15)
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
