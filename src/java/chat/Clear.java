package chat;

import java.io.File;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionEvent;


public class Clear implements HttpSessionListener {

	private static int activeSessions = 0;

    @Override
	public void sessionCreated(HttpSessionEvent se) {
		activeSessions++;
	}

    @Override
	public void sessionDestroyed(HttpSessionEvent se) {
		if(activeSessions > 0)
			activeSessions--;
                
	}

	public static int getActiveSessions() {
		return activeSessions;
	}
}

