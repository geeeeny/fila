package edu.iot.fila.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private String userId;
	private String name;
	private String password;
	private String cellPhone;
	private String email;
	private String address;
	private int grade;
	private Date regDate;
	private Date updateDate;

}
