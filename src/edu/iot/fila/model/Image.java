package edu.iot.fila.model;

import java.util.Date;

import lombok.Data;

@Data
public class Image {
	private String title;
	private String description;
	private String fileName;
	private String thumbName;
	private int size;
	private String mimeType;
	private Date regDate;
}
