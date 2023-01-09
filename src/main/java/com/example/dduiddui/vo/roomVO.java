package com.example.dduiddui.vo;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class roomVO {
    int roomNumber;
    String roomName;

    @Override
    public String toString() {
        return "Room [roomNumber=" + roomNumber + ", roomName=" + roomName + "]";
    }

}
