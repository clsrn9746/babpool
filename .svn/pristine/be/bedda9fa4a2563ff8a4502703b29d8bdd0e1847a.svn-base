package com.babpool.common.util;

import java.io.IOException;

import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class StartupFile {
	 @EventListener(ContextRefreshedEvent.class)
    public void contextRefreshedEvent() {
       System.out.println("5454 port open =================================");
       Runtime rt = Runtime.getRuntime();
       Runtime rt2 = Runtime.getRuntime();
		try {
			// 운영 반영시 수정			
//			Process proc = rt.exec("/home/pc94/anaconda3/envs/class1/bin/python /home/pc11/jsp-workspace/rice/src/main/resources/lib/sim_api.py"); // server
			Process proc = rt.exec("/home/pc11/anaconda3/envs/class1/bin/python /home/pc11/jsp-workspace/rice/src/main/resources/lib/sim_api.py"); // dev
			System.out.println(proc.toString());
			
		} catch (IOException e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
    }
	 @EventListener(ContextRefreshedEvent.class)
	    public void contextRefreshedEvent2() {
	       System.out.println("cloud start =================================");
	       Runtime rt = Runtime.getRuntime();
			try {
				// 운영 반영시 수정			
				Process proc = rt.exec("/home/pc11/anaconda3/envs/class1/bin/python /home/pc11/jsp-workspace/rice/src/main/resources/lib/wordsCloud.py");
				System.out.println(proc.toString());
				
			} catch (IOException e) {
				System.out.println(e.toString());
				e.printStackTrace();
			}
	    }
}
