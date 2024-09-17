package service.manageAdmin.manageSummary;

import dao.adminDAO.summaryAdmin.SummaryAdminDAO;
import model.modelAdmin.AdminSummary;
import model.modelAdmin.AdminSummary_fixed;

import java.sql.SQLException;
import java.util.ArrayList;

public class GetSummaryService {
    public ArrayList<AdminSummary_fixed> getList() throws SQLException {
        SummaryAdminDAO summaryAdminDAO = new SummaryAdminDAO();
        return summaryAdminDAO.getAllSummary();
    }
}
