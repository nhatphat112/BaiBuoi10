package Model;

import java.io.Serializable;

public class Users implements Serializable {
    private String username;
    private int count = 0;
    private int randomValue;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Users(String username) {
        this.username = username;
    }

    public int getRandomValue() {
        return randomValue;
    }

    public void setRandomValue(int randomValue) {
        this.randomValue = randomValue;
    }

    public Users() {
    }
    public void increaseCount(){
        this.count++;
    }
}
