package com.koneko.consulting.pojo;

import lombok.Data;

@Data
public class User {
	private String userName;
	private String password;
	private String loginCode;
	private String locale;
}
