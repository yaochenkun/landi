package org.ld.app;

/**
 * Created by ken on 2017/6/21.
 */
public class ParentThread extends Thread{

	private SubThread st;

	public void setSt(SubThread st) {
		this.st =  st;
	}

	public void callback() {

		System.out.println("主线程已知道子线程处理完毕，重启该进程执行任务");

	}


	@Override
	public void run() {
		super.run();

		System.out.println("主线程开启");

		System.out.println("创建子线程");

		SubThread st = new SubThread(this);
		st.start();

	}

}
