/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supporting;

import facilities.event.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class Fetch {

    DBConnect dbcon;

    public Fetch() {
        dbcon = DBConnect.getInstance();
    }

    public ResultSet fetchEvents() throws SQLException, ClassNotFoundException {

        ResultSet result = null;
        PreparedStatement statement = null;

        if (dbcon.isConnected()) {
            Connection connect = dbcon.getCon();

            statement = connect.prepareStatement("SELECT * FROM private_events");

            result = statement.executeQuery();

        }

        return result;

    }

    public ResultSet fetch_FPackages_forE(String id) throws ClassNotFoundException, SQLException {

        ResultSet result = null;
        PreparedStatement statement = null;

        if (dbcon.isConnected()) {
            Connection connect = dbcon.getCon();

            statement = connect.prepareStatement("SELECT * FROM privaterequired where eventID = ?");
            statement.setString(1, id);

            result = statement.executeQuery();

        }

        return result;

    }

    public ResultSet fetch_Facilities_By_Name(String view_Name) throws SQLException, ClassNotFoundException {

        ResultSet result = null;
        PreparedStatement statement = null;

        if (dbcon.isConnected()) {
            Connection connect = dbcon.getCon();

            statement = connect.prepareStatement("SELECT * FROM "+view_Name);
//            statement.setString(1, view_Name);

            result = statement.executeQuery();

        }

        return result;

    }
}


