package com.jason.push;

import org.directwebremoting.Container;  
import org.directwebremoting.ServerContextFactory;  
import org.directwebremoting.event.ScriptSessionEvent;  
import org.directwebremoting.event.ScriptSessionListener;  
import org.directwebremoting.extend.ScriptSessionManager;  
import org.directwebremoting.servlet.DwrServlet;  
/** 
 * 加载页面时，获取在线用户 
 * @author jason 
 * 
 */  
public class DwrScriptSessionManagerUtil extends DwrServlet{  
  
    private static final long serialVersionUID = 1L;  
  
    public void init(){  
        Container container = ServerContextFactory.get().getContainer();  
        ScriptSessionManager manager = container.getBean(ScriptSessionManager.class);  
        ScriptSessionListener listener = new ScriptSessionListener() {  
              
            @Override  
            public void sessionDestroyed(ScriptSessionEvent ev) {  
                System.out.println("a ScriptSession sessionDestroyed！");  
                  
            }  
              
            @Override  
            public void sessionCreated(ScriptSessionEvent ev) {  
                System.out.println("a ScriptSession sessionCreated");  
                //ev.getSession().setAttribute("userId", userId);  
                  
            }  
        };  
        manager.addScriptSessionListener(listener);  
    }  
  
}
