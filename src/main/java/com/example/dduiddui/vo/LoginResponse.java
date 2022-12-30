package com.example.dduiddui.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginResponse {
    userVO loginMember;
    boolean isSuccess;
    String message;
}
