package com.codecompilance.spring.controller;

public @interface MultipartConfig {

	int fileSizeThreshold();

	int maxFileSize();

	int maxRequestSize();

}
