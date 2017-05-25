package com.hi.funfund.fundlist.controller;

import java.io.*;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownloadView extends AbstractView{
	public FileDownloadView(){
		setContentType("application/download; charset=utf-8");
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String root = req.getSession().getServletContext().getRealPath("/");
		//System.out.println("root : " + root);
		String[] roots = root.split("\\\\");
		String marger="";
		for(int i=0 ; i<roots.length-3; i++){
			marger += roots[i] + "\\";
		}
		System.out.println("marger : " + marger);
		File file = new File(marger + model.get("downloadFile"));
		//System.out.println(file.toString());
		//System.out.println("오니11111111");
		res.setContentType(getContentType());
		   res.setContentLength((int) file.length());

	        res.setHeader("Content-Disposition", "attachment; filename=\"" + 

	                java.net.URLEncoder.encode(file.getName(), "utf-8") + "\";");

	        res.setHeader("Content-Transfer-Encoding", "binary");

	        

	        OutputStream out = res.getOutputStream();

	        FileInputStream fis = null;
	        try {
	        	//System.out.println("오니2222222");
	            

	            fis = new FileInputStream(file);

	            FileCopyUtils.copy(fis, out);

	            

	        } catch (Exception e) {

	            e.printStackTrace();

	        } finally {

	            if(fis != null) {

	                try { 

	                    fis.close(); 

	                }catch (IOException e) {

	                    e.printStackTrace();

	                }

	            }

	        }
	        out.flush();
	}
}
