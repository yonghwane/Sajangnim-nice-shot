package com.ais.sajangnimniceshot.utilities;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Component;

@Component
public class SessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("**********************************************************************");
		System.out.println("session created");
		// Session created event
		se.getSession().setMaxInactiveInterval(1800);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("**********************************************************************");
		System.out.println("session destroyed");
		System.out.print("\u0007");
		// Session destroyed event
		List<String> tempImages = (List<String>) se.getSession().getAttribute("tempImages");
		if (tempImages != null) {
			System.out.println("tempImages attribute found");
			System.out.println(tempImages.size());
			// Perform actions when the session is destroyed, for example, print "abc".
			for (String tempImage : tempImages) {
				try {
					Files.delete(Path.of(tempImage));
					System.out.println("deleted: " + tempImage);
				} catch (Exception e) {
					System.out.println("failed to deleted: " + tempImage);
				}
			}
		}
	}
}
