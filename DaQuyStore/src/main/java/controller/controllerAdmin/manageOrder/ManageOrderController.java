package controller.controllerAdmin.manageOrder;

import com.google.gson.Gson;
import model.LogLevel;
import model.modelAdmin.AdminLog;
import model.modelAdmin.AdminOrderDetail;
import service.manageAdmin.manageLog.LogService;
import service.manageAdmin.manageOrder.DeleteOrderService;
import service.manageAdmin.manageOrder.GetOrderService;
import service.manageAdmin.manageOrder.UpdateOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(name = "ManageOrderController", urlPatterns = {"/deleteorder", "/getorder_waiting", "/updateorder", "/getorder_giving", "/getorder_waitinggiving", "/getorder_gived", "/getorder_canceled"})
public class ManageOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getRequestURI();
        resp.setContentType("text/html;charset=UTF-8");
        if (action.endsWith("/getorder_waiting")) {
            GetOrderService getOrderService = new GetOrderService();
            try {
                AdminLog adminLog = new AdminLog();
                adminLog.setLevel(LogLevel.INFORM.toString());
                adminLog.setIpaddress(req.getRemoteAddr());
                adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                adminLog.setPrevValue("Chưa lấy dữ liệu" + new Time(new Date().getTime()));
                adminLog.setCurrentValue("Đã lấy dữ liệu" + new Time(new Date().getTime()));
                LogService<AdminOrderDetail> adminLogService = new LogService<>();
                adminLogService.addLogInform(adminLog, new AdminOrderDetail());
                resp.getWriter().println(getOrderService.getAsJsonArrayStatusWaiting());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (action.endsWith("/getorder_waitinggiving")) {
            GetOrderService getOrderService = new GetOrderService();
            try {
                AdminLog adminLog = new AdminLog();
                adminLog.setLevel(LogLevel.INFORM.toString());
                adminLog.setIpaddress(req.getRemoteAddr());
                adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                adminLog.setPrevValue("Chưa lấy dữ liệu" + new Time(new Date().getTime()));
                adminLog.setCurrentValue("Đã lấy dữ liệu" + new Time(new Date().getTime()));
                LogService<AdminOrderDetail> adminLogService = new LogService<>();
                adminLogService.addLogInform(adminLog, new AdminOrderDetail());
                resp.getWriter().println(getOrderService.getAsJsonArrayStatusForWaitingGiving());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (action.endsWith("/getorder_giving")) {
            GetOrderService getOrderService = new GetOrderService();
            try {
                AdminLog adminLog = new AdminLog();
                adminLog.setLevel(LogLevel.INFORM.toString());
                adminLog.setIpaddress(req.getRemoteAddr());
                adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                adminLog.setPrevValue("Chưa lấy dữ liệu" + new Time(new Date().getTime()));
                adminLog.setCurrentValue("Đã lấy dữ liệu" + new Time(new Date().getTime()));
                LogService<AdminOrderDetail> adminLogService = new LogService<>();
                adminLogService.addLogInform(adminLog, new AdminOrderDetail());
                resp.getWriter().println(getOrderService.getAsJsonArrayStatusGiving());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (action.endsWith("/getorder_gived")) {
            GetOrderService getOrderService = new GetOrderService();
            try {
                AdminLog adminLog = new AdminLog();
                adminLog.setLevel(LogLevel.INFORM.toString());
                adminLog.setIpaddress(req.getRemoteAddr());
                adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                adminLog.setPrevValue("Chưa lấy dữ liệu" + new Time(new Date().getTime()));
                adminLog.setCurrentValue("Đã lấy dữ liệu" + new Time(new Date().getTime()));
                LogService<AdminOrderDetail> adminLogService = new LogService<>();
                adminLogService.addLogInform(adminLog, new AdminOrderDetail());
                resp.getWriter().println(getOrderService.getAsJsonArrayStatusGived());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (action.endsWith("/getorder_canceled")) {
            GetOrderService getOrderService = new GetOrderService();
            try {
                AdminLog adminLog = new AdminLog();
                adminLog.setLevel(LogLevel.INFORM.toString());
                adminLog.setIpaddress(req.getRemoteAddr());
                adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                adminLog.setPrevValue("Chưa lấy dữ liệu" + new Time(new Date().getTime()));
                adminLog.setCurrentValue("Đã lấy dữ liệu" + new Time(new Date().getTime()));
                LogService<AdminOrderDetail> adminLogService = new LogService<>();
                adminLogService.addLogInform(adminLog, new AdminOrderDetail());
                resp.getWriter().println(getOrderService.getAsJsonArrayStatusCanceled());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (action.endsWith("/deleteorder")) {
            int id = Integer.parseInt(req.getParameter("id"));
            DeleteOrderService deleteOrderService = new DeleteOrderService();
            try {
                if (deleteOrderService.deleteOrder(id)) {
                    Gson gson = new Gson();
                    String result = "Xoa thanh cong";
                    String json = gson.toJson(result);
                    AdminLog adminLog = new AdminLog();
                    adminLog.setLevel(LogLevel.DANGER.toString());
                    adminLog.setIpaddress(req.getRemoteAddr());
                    adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                    adminLog.setPrevValue("Chưa xóa" + new Time(new Date().getTime()));
                    adminLog.setCurrentValue("Đã xóa" + new Time(new Date().getTime()));
                    LogService<AdminOrderDetail> adminLogService = new LogService<>();
                    adminLogService.addLogDanger(adminLog, new AdminOrderDetail());
                    resp.getWriter().println(json);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getRequestURI();
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        if (action.endsWith("/updateorder")) {
            int id = Integer.parseInt(req.getParameter("id"));
            //giá trị lấy ra từ ajax
            String selected_status = req.getParameter("select");
            UpdateOrderService updateOrderService = new UpdateOrderService();

            try {
                if (selected_status.equals("waiting")) {
                    String translated_status = "chờ xác nhận";
                    updateOrderService.updateStatusOrder(id, translated_status);
                    Gson gson = new Gson();
                    String result = "Cập nhật thành công";
                    String json = gson.toJson(result);
                    AdminLog adminLog = new AdminLog();
                    adminLog.setLevel(LogLevel.DANGER.toString());
                    adminLog.setIpaddress(req.getRemoteAddr());
                    adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                    adminLog.setPrevValue("Chưa cập nhật" + new Time(new Date().getTime()) + "đơn hàng có id" + id);
                    adminLog.setCurrentValue("Đã xóa" + new Time(new Date().getTime()) + "đơn hàng có id" + id);
                    LogService<AdminOrderDetail> adminLogService = new LogService<>();
                    adminLogService.addLogDanger(adminLog, new AdminOrderDetail());
                    resp.getWriter().println(json);
                } else if (selected_status.equals("cancelled")) {
                    String translated_status = "hủy";
                    updateOrderService.updateStatusOrder(id, translated_status);
                    Gson gson = new Gson();
                    String result = "Cập nhật thành công";
                    String json = gson.toJson(result);
                    AdminLog adminLog = new AdminLog();
                    adminLog.setLevel(LogLevel.DANGER.toString());
                    adminLog.setIpaddress(req.getRemoteAddr());
                    adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                    adminLog.setPrevValue("Chưa cập nhật" + new Time(new Date().getTime()) + "đơn hàng có id" + id);
                    adminLog.setCurrentValue("Đã xóa" + new Time(new Date().getTime()) + "đơn hàng có id" + id);
                    LogService<AdminOrderDetail> adminLogService = new LogService<>();
                    adminLogService.addLogDanger(adminLog, new AdminOrderDetail());
                    resp.getWriter().println(json);
                } else if (selected_status.equals("waiting_giving")) {
                    String translated_status = "chờ giao";
                    updateOrderService.updateStatusOrder(id, translated_status);
                    Gson gson = new Gson();
                    String result = "Cập nhật thành công";
                    String json = gson.toJson(result);
                    AdminLog adminLog = new AdminLog();
                    adminLog.setLevel(LogLevel.DANGER.toString());
                    adminLog.setIpaddress(req.getRemoteAddr());
                    adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                    adminLog.setPrevValue("Chưa cập nhật" + new Time(new Date().getTime()) + "đơn hàng có id" + id);
                    adminLog.setCurrentValue("Đã xóa" + new Time(new Date().getTime()) + "đơn hàng có id" + id);
                    LogService<AdminOrderDetail> adminLogService = new LogService<>();
                    adminLogService.addLogDanger(adminLog, new AdminOrderDetail());
                    resp.getWriter().println(json);
                } else if (selected_status.equals("giving")) {
                    String translated_status = "đang giao";
                    updateOrderService.updateStatusOrder(id, translated_status);
                    Gson gson = new Gson();
                    String result = "Cập nhật thành công";
                    String json = gson.toJson(result);
                    AdminLog adminLog = new AdminLog();
                    adminLog.setLevel(LogLevel.DANGER.toString());
                    adminLog.setIpaddress(req.getRemoteAddr());
                    adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                    adminLog.setPrevValue("Chưa cập nhật" + new Time(new Date().getTime()) + "đơn hàng có id" + id);
                    adminLog.setCurrentValue("Đã xóa" + new Time(new Date().getTime()) + "đơn hàng có id" + id);
                    LogService<AdminOrderDetail> adminLogService = new LogService<>();
                    adminLogService.addLogDanger(adminLog, new AdminOrderDetail());
                    resp.getWriter().println(json);

                } else if (selected_status.equals("gived")) {
                    String translated_status = "Đã giao";
                    updateOrderService.updateStatusOrder(id, translated_status);
                    Gson gson = new Gson();
                    String result = "Cập nhật thành công";
                    String json = gson.toJson(result);
                    AdminLog adminLog = new AdminLog();
                    adminLog.setLevel(LogLevel.DANGER.toString());
                    adminLog.setIpaddress(req.getRemoteAddr());
                    adminLog.setCreated_at(new Timestamp(new Date().getTime()));
                    adminLog.setPrevValue("Chưa cập nhật" + new Time(new Date().getTime()) + "đơn hàng có id" + id);
                    adminLog.setCurrentValue("Đã xóa" + new Time(new Date().getTime()) + "đơn hàng có id" + id);
                    LogService<AdminOrderDetail> adminLogService = new LogService<>();
                    adminLogService.addLogDanger(adminLog, new AdminOrderDetail());
                    resp.getWriter().println(json);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }

        }
    }
}
