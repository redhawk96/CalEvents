package Security;

import java.security.MessageDigest;

public class HashPassword {
    
    private String password;
    
    public HashPassword(String password){
        this.password = password;
    }

    public String generatePassword() throws Exception {
        
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(password.getBytes());

        byte byteData[] = md.digest();

        //convert the byte to hex format
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < byteData.length; i++) {
            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }

        String newPassword = sb.toString();

        return newPassword;

    }
    
//    To generate new password for testing purposes    
//    public static void main(String args[]) throws Exception{
//        HashPassword h = new HashPassword("123456");
//        
//        System.out.print(h.generatePassword());
//    }
}
