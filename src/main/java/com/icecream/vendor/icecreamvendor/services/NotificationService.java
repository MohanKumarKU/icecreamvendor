package com.icecream.vendor.icecreamvendor.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.icecream.vendor.icecreamvendor.entities.Notifier;

@Service
public class NotificationService {

	private JavaMailSender javaMailSender;

	@Autowired
	public NotificationService(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	public void sendDeliveredNotification(Notifier notifier, double temp) {
		
		SimpleMailMessage simpleMailMessage = prepareMailMessage(notifier);

		simpleMailMessage.setSubject("Icecream Delivery Notification !!!");

		simpleMailMessage.setText("Ice cream has been delivered! Successfully. And maintained temperature at delivery time is " +temp+ " degree" );

		javaMailSender.send(simpleMailMessage);
	}

	public void sendOrderNotification(Notifier notifier) {

		SimpleMailMessage simpleMailMessage = prepareMailMessage(notifier);

		simpleMailMessage.setSubject("Icecream Order Placed !!!");

		simpleMailMessage.setText("Ice cream order placed.");

		javaMailSender.send(simpleMailMessage);
	}
	
	private SimpleMailMessage prepareMailMessage(Notifier notifier) {
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setTo(notifier.getEmailId());
		simpleMailMessage.setFrom("mohanubdt@gmail.com");
		return simpleMailMessage;
	}

}
