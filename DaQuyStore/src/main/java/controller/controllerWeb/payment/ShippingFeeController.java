package controller.controllerWeb.payment;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/getshippingfee")
public class ShippingFeeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String city = req.getParameter("city");
//        String district = req.getParameter("district");
//        String ward = req.getParameter("ward");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
//        URL url = new URL("");
//        HttpURLConnection con = (HttpURLConnection) url.openConnection();
//        con.setRequestMethod("GET");
//        con.setRequestProperty("Token", "8e0806eb-e910-11ee-983e-5a49fc0dd8ec");
//        int responseCode = con.getResponseCode();
//        if (responseCode == HttpURLConnection.HTTP_OK) {
//            InputStream in = con.getInputStream();
//            BufferedReader reader = new BufferedReader(new InputStreamReader(in));
//            StringBuilder response = new StringBuilder();
//            String inputLine;
//            while ((inputLine = reader.readLine()) != null) {
//                response.append(inputLine);
//            }
//            reader.close();
//            Gson gson = new Gson();
//            JsonObject jsonObject = gson.fromJson(response.toString(), JsonObject.class);
//            con.disconnect();
//        }else{
//            resp.getWriter().println("Khong the ket noi den dich vu");
//            con.disconnect();
//        }
        //truong hop dat hang trong tinh
        if (city.equals("Binh duong")) {
            if (session != null) {
                session.setAttribute("shippingfee", Integer.parseInt("20.000VND"));
                resp.getWriter().println("Thoi gian giao trong vong 1 ngay");
            }
        } else {
            if (session != null) {
                session.setAttribute("shippingfee", Integer.parseInt("40.000VND"));
                resp.getWriter().println("Thoi gian giao trong vong tu 2-3 ngay");
            }
        }
    }
}
