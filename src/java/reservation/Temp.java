/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;
import java.util.Arrays;
import java.sql.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

/**
 *
 * @author DELL
 */
public class Temp {
    public static void main(String[] args) {
        String to = "uditha1003@gmail.com";
        String from = "ishanksen@gmail.com";
        //String host = "localhost";
        //Properties properties = System.getProperties();
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.startls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.host", 587);
        
        Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("ishanksen@gmail.com", "fbg+149mghimym27!pl");
            }
});
        
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Hello...this is a message from Ishan");
            message.setText("This is a testing message");
            
            Transport.send(message);
            System.out.println("message sent successfully");
        }
        catch (MessagingException ex) {
            //System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        
        
    }
}
