package com.gokkiri.member;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {

	public PasswordAuthentication getPasswordAuthentication() { 
		return new PasswordAuthentication("gokkiri.master@gmail.com","po12341234");
	}
}
