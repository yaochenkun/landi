package org.ld.app;

/**
 * Created by ken on 2017/6/21.
 */
public class SubThread extends Thread{

	private ParentThread pt = null;


	SubThread(ParentThread pt){
		this.pt= pt;

		pt.setSt(this);
	}


	@Override
	public void run() {
		super.run();

		System.out.println("开始处理");

		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println("执行完毕");

		pt.callback();
		try {
			this.wait();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		this.notify();

	}
}
