package service.manageUser;

import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.UnknownHostException;

public class ServiceIPAddress {
    public static String convertToIPv4(String ipv6Address) throws UnknownHostException {
        InetAddress inetAddress = InetAddress.getByName(ipv6Address);
        if (inetAddress instanceof Inet6Address) {
            byte[] bytes = inetAddress.getAddress();
            // Chỉ lấy 4 byte cuối từ địa chỉ IPv6 để tạo thành địa chỉ IPv4
            String ip = "unknown";
            try{
                ip = ipv6Address;
                if(ip.equals("0:0:0:0:0:0:0:1") ) {
                    InetAddress hostAddress = InetAddress.getLocalHost();
                    ip = hostAddress.getHostAddress();
                }
            } catch (UnknownHostException e) {
                ip = "unknown";
            }
            if(!ip.equals("unknown")){
                return ip;
            }
            return bytesToIPv4String(bytes, bytes.length - 4, 4);

        } else {
            return ipv6Address; // Đây đã là địa chỉ IPv4
        }
    }

    private static String bytesToIPv4String(byte[] bytes, int offset, int length) {
        StringBuilder sb = new StringBuilder();
        for (int i = offset; i < offset + length; i++) {
            int octet = bytes[i] & 0xff; // Chuyển byte âm thành dạng số dương
            sb.append(octet);
            if (i < offset + length - 1) {
                sb.append('.');
            }
        }
        return sb.toString();
    }

    public static void main(String[] args) throws UnknownHostException {
//        String ipv6Address = "0:0:0:0:0:0:0:1";
//        String ipv4Address = convertToIPv4(ipv6Address);
//        System.out.println("IPv4 Address: " + ipv4Address);
//        try {
//            File database = new File("/path/to/GeoLite2-City.mmdb"); // Đường dẫn đến tệp cơ sở dữ liệu GeoLite2-City.mmdb
//            DatabaseReader reader = new DatabaseReader.Builder(database).build();
//            InetAddress ipAddress = InetAddress.getByName(" 1.53.82.150"); // Thay thế địa chỉ IP cần truy vấn
//
//            CityResponse response = reader.city(ipAddress);
//            String countryName = response.getCountry().getName();
//            String cityName = response.getCity().getName();
//            System.out.println("Country: " + countryName);
//            System.out.println("City: " + cityName);
//        } catch (IOException | GeoIp2Exception e) {
//            e.printStackTrace();
//        }
    }

}
