package com.care.root;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@Configuration
@EnableScheduling //스케줄러 설정할 때 이 두가지를 넣어주면 됩니다.
public class MyScheduler {
	//@Scheduled(cron="*/10 * * * * *") //10초마다 한번씩 실행
	public void testsc() {
		System.out.println("실행");
	}
	

}
