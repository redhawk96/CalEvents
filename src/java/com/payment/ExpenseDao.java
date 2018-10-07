/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment;

import com.payment.utils.Fmt;
import com.payment.utils.PaymentDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class ExpenseDao {

    private static String ID = "exp_id";
    private static String DEPT = "dept";
    private static String DESC = "description";
    private static String METHOD = "method";
    private static String AMOUNT = "amount";
    private static String DATE = "date_time";
    private static String CATEGORY = "category";
    private static String NOTES = "notes";

    public static boolean createExpense(Expense expense) throws SQLException {
        String query =
                "INSERT into expenses (dept, description, method, amount) "
                + "VALUES (?, ?, ?, ?)";

        Connection con = PaymentDB.getConnection();
        PreparedStatement ps = con.prepareStatement(query);

        ps.setString(1, expense.getDept());
        ps.setString(2, expense.getDesc());
        ps.setString(3, expense.getMethod());
        ps.setDouble(4, expense.getAmount());

        if (ps.executeUpdate() > 0) {
            return true;
        }
        return false;
    }

    public static boolean addFacilityExpense(Expense expense) throws SQLException {
        String query =
                "INSERT INTO expenses (dept, description, method, amount, category, notes) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        Connection con = PaymentDB.getConnection();
        PreparedStatement ps = con.prepareStatement(query);

        ps.setString(1, expense.getDept());
        ps.setString(2, expense.getDesc().toLowerCase());
        ps.setString(3, expense.getMethod());
        ps.setDouble(4, expense.getAmount());
        ps.setString(5, expense.getCategory().toLowerCase());
        ps.setString(6, expense.getNotes());

        if(ps.executeUpdate() > 0) {
            return true;
        }
        return false;
    }

    private static Expense getExpense(ResultSet rs) throws SQLException {
        Expense ex = new Expense();
        ex.setId(rs.getInt(ID));
        ex.setDept(rs.getString(DEPT));
        ex.setDesc(rs.getString(DESC));
        ex.setMethod(rs.getString(METHOD));
        ex.setAmount(rs.getDouble(AMOUNT));
        ex.setSQLDate(rs.getDate(DATE));
        ex.setCategory(rs.getString(CATEGORY));
        ex.setNotes(rs.getString(NOTES));

        return ex;
    }

    public static ArrayList<Expense> getAllExpenses() {
        ArrayList<Expense> expenses = new ArrayList<>();
        String query = "SELECT * FROM expenses";
        try {
            Connection con = PaymentDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet res = ps.executeQuery();

            while (res.next()) {
                expenses.add(getExpense(res));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExpenseDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return expenses;
    }

    public static Expense getExpense(String id) {
        Expense expense = null;
        String query = "SELECT * FROM expenses WHERE exp_id = ?";

        try {
            Connection con = PaymentDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            ResultSet res = ps.executeQuery();

            if (res.next()) {
                expense = getExpense(res);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExpenseDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return expense;
    }

    public static ArrayList<Expense> getExpensesSummary() {
        ArrayList<Expense> summary = new ArrayList<>();
        String query = "SELECT date_time, dept, sum(amount) as amount "
                + "FROM expenses "
                + "GROUP BY dept, date(date_time) "
                + "ORDER BY date_time";
        try {
            Connection con = PaymentDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Expense ex = new Expense();
                ex.setDept(rs.getString(DEPT));
                ex.setAmount(rs.getDouble(AMOUNT));
                ex.setSQLDate(rs.getDate(DATE));
                summary.add(ex);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExpenseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return summary;
    }

    public static ResultSet getAllExpensesSummary() throws ClassNotFoundException, SQLException {
        Connection con = PaymentDB.getConnection();
        String query = "SELECT year(date_time) as year, month(date_time) as month, count(amount) as count, sum(amount) as sum "
                + "FROM expenses "
                + "GROUP BY year(date_time), month(date_time)";
        PreparedStatement ps = con.prepareStatement(query);
        return ps.executeQuery();
    }
}