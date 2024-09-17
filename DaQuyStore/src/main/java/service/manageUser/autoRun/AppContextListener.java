package service.manageUser.autoRun;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@WebListener
public class AppContextListener implements ServletContextListener {
    private ScheduledExecutorService scheduler;
    public void contextInitialized(ServletContextEvent event) {
        scheduler = Executors.newScheduledThreadPool(1);

        Runnable task = new MyTask();

        long initialDelay = computeInitialDelay();
        long period = 24 * 60 * 60; // 24 giờ (trong giây)

        scheduler.scheduleAtFixedRate(task, initialDelay, period, TimeUnit.SECONDS);
    }
    @Override
    public void contextDestroyed(ServletContextEvent event) {
        scheduler.shutdownNow();
    }
    private long computeInitialDelay() {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime nextRun = now.withHour(0).withMinute(0).withSecond(0);

        // Nếu thời gian hiện tại đã qua 14h35, tính đến 14h35 ngày mai
        if (now.compareTo(nextRun) > 0) {
            nextRun = nextRun.plusDays(1);
        }
        return ChronoUnit.SECONDS.between(now, nextRun);
    }
}
