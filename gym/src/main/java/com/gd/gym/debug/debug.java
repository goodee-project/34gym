package com.gd.gym.debug;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class debug {
	public void debugging(String methodName, String name, String param) {
		log.debug("▶▷▶▷▶▷▶▷▶▷▶▷▶▷▶▷ " + methodName + " " + name + " : " + param + " ◀◁◀◁◀◁◀◁◀◁◀◁◀◁");
	}
	
	public void debugging(String methodName, String name, int param) {
		log.debug("▶▷▶▷▶▷▶▷▶▷▶▷▶▷▶▷ " + methodName + " " + name + " : " + param + " ◀◁◀◁◀◁◀◁◀◁◀◁◀◁");
	}
	
	public void debugging(String methodName, String param) {
		log.debug("▶▷▶▷▶▷▶▷▶▷▶▷▶▷▶▷ " + methodName + " : " + param + " ◀◁◀◁◀◁◀◁◀◁◀◁◀◁");
	}
	
	public void debugging(String methodName, int param) {
		log.debug("▶▷▶▷▶▷▶▷▶▷▶▷▶▷▶▷ " + methodName + " : " + param + " ◀◁◀◁◀◁◀◁◀◁◀◁◀◁");
	}
}
