package com.jason.push;

import java.util.Collection;  

import org.directwebremoting.Browser;  
import org.directwebremoting.ScriptBuffer;  
import org.directwebremoting.ScriptSession;  
import org.directwebremoting.ScriptSessionFilter;  
import org.directwebremoting.WebContextFactory;  
  
public class DemoTest {  
      
    public void onPageLoad(String userId){  
        ScriptSession scriptSession = WebContextFactory.get().getScriptSession();  
        scriptSession.setAttribute("userId", userId);  //��¼��¼�û�  
        DwrScriptSessionManagerUtil dssm = new DwrScriptSessionManagerUtil();  
        dssm.init();  
    }  
      
    public void sendMsg(String userid, String message) {  
  
        final String userId = userid;  
  
        final String msg = message;  
  
        final String jsFunc = "receiveMsg";   //���͵�ҳ���JavaScript������  
        System.out.println("sendMsg");  
        Browser.withAllSessionsFiltered(new ScriptSessionFilter() {  
  
            public boolean match(ScriptSession session) {   //�������ͣ��ڴ˿���ʵ�־�׼����  
  
                if (session.getAttribute("userId")==null){  
  
                    return false;  
  
                }else {  
  
                    return (session.getAttribute("userId")).equals(userId);  
  
                }  
  
            }  
  
        },new Runnable() {  
  
            private ScriptBuffer script = new ScriptBuffer();  
  
            public void run() {  
  
                // ������Ϣ  
  
                script.appendCall(jsFunc,msg);  
  
                Collection<ScriptSession> sessions = Browser.getTargetSessions();  
  
                for (ScriptSession scriptSession : sessions) {  
  
                    scriptSession.addScript(script);  
  
                }  
  
            }  
  
        });  
  
    }  
  
}
