package com.koneko.consulting.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class MITUser {
	private String userId;
	private String userName;
	private String userPassword;
	private String userEmail;
	private Integer userPrivilege;
	private Date createAt;
	private Date updateAt;
	private String loginCode;
}
