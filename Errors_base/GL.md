

What:
tail -f $DOMAIN/logs/wls_granite_core.log

<Apr 27, 2018 7:52:42 AM EDT> <Error> <HTTP> <BEA-101017> <[ServletContext@56436822[app:proxy module:proxy path:null spec-version:3.0]] Root cause of ServletException.
java.lang.NumberFormatException: For input string: "88888888290"
        at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
        at java.lang.Integer.parseInt(Integer.java:583)
        at java.lang.Integer.parseInt(Integer.java:615)
        at weblogic.servlet.proxy.HttpClusterServlet$Server.parsePorts(HttpClusterServlet.java:2038)
        at weblogic.servlet.proxy.HttpClusterServlet$Server.<init>(HttpClusterServlet.java:1898)
        Truncated. see log file for complete stacktrace
When:
        LEIS-NP:
        Any opening of main window at LEIS-NP Web-page on the clustered WL env with proxy installed.
So:
        Re-deploy of "proxy".
What:
tail -f $DOMAIN/logs/wls_granite_core.log
Exception in thread "[ACTIVE] ExecuteThread: '186' for queue: 'weblogic.kernel.Default (self-tuning)'" java.lang.OutOfMemoryError: Metaspace
When:
            LEIS-NP:
            starting WL after it was hanging out during multiply re-deploy process of some APP.
So:
            Stop MWL/WL normally.
            Kill appropriate java processes (if any).
What:
tail -f $DOMAIN/servers/isgt_logs/error-gt.log

[] [13 Apr 2018 09:18:10,808] tranID=; [com.telcordia.intsol.common.exception.BaseException] [[ACTIVE] ExecuteThread: '5' for queue: 'weblogic.kernel.Default (self-tuning)'] [ERROR]
[ ConnectionPoolManager Constructor Exception]
com.telcordia.intsol.common.exception.GeneralException:
        at com.telcordia.intsol.common.db.access.ConnectionPoolManager.init(ConnectionPoolManager.java:97)
        at com.telcordia.intsol.common.db.access.ConnectionPoolManager.<init>(ConnectionPoolManager.java:37)
        at com.telcordia.db.DbUtil.getConnection(DbUtil.java:31)
        at com.telcordia.db.ActivationStatusDao.getActivationStatusRecords(ActivationStatusDao.java:60)
        at com.telcordia.web.action.ActivationStatusIndexAction.fillActivationStatusFiles(ActivationStatusIndexAction.java:133)
        at com.telcordia.web.action.ActivationStatusIndexAction.execute(ActivationStatusIndexAction.java:98)
        at org.apache.struts.action.RequestProcessor.processActionPerform(RequestProcessor.java:484)
        at org.apache.struts.action.RequestProcessor.process(RequestProcessor.java:274)
        at org.apache.struts.action.ActionServlet.process(ActionServlet.java:1482)
        at org.apache.struts.action.ActionServlet.doGet(ActionServlet.java:507)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:731)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:844)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254)
        at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:346)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:243)
        at weblogic.servlet.internal.RequestDispatcherImpl.invokeServlet(RequestDispatcherImpl.java:587)
        at weblogic.servlet.internal.RequestDispatcherImpl.forward(RequestDispatcherImpl.java:273)
        at weblogic.servlet.jsp.PageContextImpl.forward(PageContextImpl.java:158)
        at org.apache.struts.taglib.logic.ForwardTag.doEndTag(ForwardTag.java:170)
        at jsp_servlet.__index._jsp__tag2(__index.java:223)
        at jsp_servlet.__index._jspService(__index.java:119)
        at weblogic.servlet.jsp.JspBase.service(JspBase.java:35)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254)
        at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:346)
        at weblogic.servlet.internal.TailFilter.doFilter(TailFilter.java:25)
        at weblogic.servlet.internal.FilterChainImpl.doFilter(FilterChainImpl.java:79)
        at com.granite.web.filters.OpiAuthenticationFilter.doFilter(OpiAuthenticationFilter.java:96)
        at weblogic.servlet.internal.FilterChainImpl.doFilter(FilterChainImpl.java:79)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3436)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3402)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2285)
        at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2201)
        at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2179)
        at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1572)
        at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:255)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:311)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:263)
Caused by: java.sql.SQLException: ORA-28040: No matching authentication protocol
        at oracle.jdbc.dbaccess.DBError.throwSqlException(DBError.java:134)
        at oracle.jdbc.ttc7.TTIoer.processError(TTIoer.java:289)
        at oracle.jdbc.ttc7.O3log.receive1st(O3log.java:407)
        at oracle.jdbc.ttc7.TTC7Protocol.logon(TTC7Protocol.java:259)
        at oracle.jdbc.driver.OracleConnection.<init>(OracleConnection.java:346)
        at oracle.jdbc.driver.OracleDriver.getConnectionInstance(OracleDriver.java:468)
        at oracle.jdbc.driver.OracleDriver.connect(OracleDriver.java:314)
        at java.sql.DriverManager.getConnection(DriverManager.java:664)
        at java.sql.DriverManager.getConnection(DriverManager.java:208)
        at oracle.jdbc.pool.OracleDataSource.getConnection(OracleDataSource.java:169)
        at oracle.jdbc.pool.OracleConnectionPoolDataSource.getPhysicalConnection(OracleConnectionPoolDataSource.java:149)
        at oracle.jdbc.pool.OracleConnectionPoolDataSource.getPooledConnection(OracleConnectionPoolDataSource.java:95)
        at oracle.jdbc.pool.OracleConnectionPoolDataSource.getPooledConnection(OracleConnectionPoolDataSource.java:63)
        at oracle.jdbc.pool.OracleConnectionCacheImpl.getNewPoolOrXAConnection(OracleConnectionCacheImpl.java:547)
        at oracle.jdbc.pool.OracleConnectionCacheImpl.setMinLimit(OracleConnectionCacheImpl.java:787)
        at com.telcordia.intsol.common.db.access.ConnectionPoolManager.init(ConnectionPoolManager.java:90)


On the browser page:

The following error occurred in the OPI Framework:
Printing from html:errors
Finished printing from html:errors
printing implied exception object
Implicit Exception Message: Exception forwarding for name welcome: javax.servlet.ServletException: com.telcordia.intsol.common.exception.GeneralException:
OpiException Message key was null
ROOT Exception Message was NULL
•javax.servlet.jsp.JspException: Exception forwarding for name welcome: javax.servlet.ServletException: com.telcordia.intsol.common.exception.GeneralException: at org.apache.struts.taglib.logic.ForwardTag.doEndTag(ForwardTag.java:173) at jsp_servlet.__index._jsp__tag2(__index.java:223) at jsp_servlet.__index._jspService(__index.java:119) at weblogic.servlet.jsp.JspBase.service(JspBase.java:35) at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280) at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254) at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136) at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:346) at weblogic.servlet.internal.TailFilter.doFilter(TailFilter.java:25) at weblogic.servlet.internal.FilterChainImpl.doFilter(FilterChainImpl.java:79) at com.granite.web.filters.OpiAuthenticationFilter.doFilter(OpiAuthenticationFilter.java:96) at weblogic.servlet.internal.FilterChainImpl.doFilter(FilterChainImpl.java:79) at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3436) at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3402) at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321) at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120) at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57) at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2285) at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2201) at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2179) at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1572) at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:255) at weblogic.work.ExecuteThread.execute(ExecuteThread.java:311) at weblogic.work.ExecuteThread.run(ExecuteThread.java:263)

When:
    ISGT
    New ISGT (built with java8, ant1.9, oracle12, etc) doesn't allow to connect to WEB Opi Portal via GI client (but it works for direct connect to http://ironman.cc.telcordia.com:7532/OPI).
So:
The issue is caused by unsupported combination of JDBC/JDK/Database product components.
Upgrade the JDBC driver to 11g or JDBC 12c.
These releases can be downloaded from the JDBC/UCP Download Page.


Please make sure to use the appropriate JDBC 11g or JDBC 12c jar files based on the JDK version to be used.
For details, please refer to :

Document: 401934.1 Starting With Oracle JDBC Drivers 
Section : Which JDBC driver version goes with which JDK version ?
What:
tail -f $DOMAIN/logs/wls_isgt.log

<Apr 11, 2018 5:32:40 AM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB LoggingConfigurationMonitorEJB is unable to connect to the JMS destination isgt/jms/topic/core-services/dynamicLoggingConfigurationTopic. The Error was:
weblogic.jms.common.InvalidDestinationException: [JMSClientExceptions:055144]Destination must be a topic, isgtJMSModule!isgtJMSServer@dynamicLoggingConfigurationTopic>
<Apr 11, 2018 5:32:50 AM EDT> <Warning> <EJB> <BEA-010096> <The Message-Driven EJB LoggingConfigurationMonitorEJB is unable to connect to the JMS destination or bind to JCA resource adapter isgt/jms/topic/core-services/dynamicLoggingConfigurationTopic. The onnection failed after 2 attempts. The MDB will attempt to reconnect/rebind every 10 seconds. This log message will repeat every 600 seconds until the condition clears.>
<Apr 11, 2018 5:32:50 AM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB LoggingConfigurationMonitorEJB is unable to connect to the JMS destination isgt/jms/topic/core-services/dynamicLoggingConfigurationTopic. The Error was:
weblogic.jms.common.InvalidDestinationException: [JMSClientExceptions:055144]Destination must be a topic, isgtJMSModule!isgtJMSServer@dynamicLoggingConfigurationTopic>

When:
        ISGT: Re-starting all MWL after just created JMS module for isgt.
So:
        dynamicLoggingConfigurationTopic has been mistakely created as Distributed Queue instead of necessary Distributed Topic.
What:
    tail -f $DOMAIN/logs/wls_isgt.log   during OPI using
    
    java.io.InvalidClassException: com.granite.middle.helper.PrivilegeChecker; local class incompatible: stream classdesc serialVersionUID = -2716801493287427442, local class serialVersionUID = -4287219209967398851
            at java.io.ObjectStreamClass.initNonProxy(ObjectStreamClass.java:687)
            at java.io.ObjectInputStream.readNonProxyDesc(ObjectInputStream.java:1876)
            at java.io.ObjectInputStream.readClassDesc(ObjectInputStream.java:1745)
            at java.io.ObjectInputStream.readOrdinaryObject(ObjectInputStream.java:2033)
            at java.io.ObjectInputStream.readObject0(ObjectInputStream.java:1567)
            at java.io.ObjectInputStream.defaultReadFields(ObjectInputStream.java:2278)
            at java.io.ObjectInputStream.readSerialData(ObjectInputStream.java:2202)
            at java.io.ObjectInputStream.readOrdinaryObject(ObjectInputStream.java:2060)
            at java.io.ObjectInputStream.readObject0(ObjectInputStream.java:1567)
            at java.io.ObjectInputStream.defaultReadFields(ObjectInputStream.java:2278)
            at java.io.ObjectInputStream.defaultReadObject(ObjectInputStream.java:557)
            at com.granite.middle.session.ClientSession.readObject(ClientSession.java:117)
            at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
            at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
            at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
            at java.lang.reflect.Method.invoke(Method.java:498)
            at java.io.ObjectStreamClass.invokeReadObject(ObjectStreamClass.java:1158)
            at java.io.ObjectInputStream.readSerialData(ObjectInputStream.java:2169)
            at java.io.ObjectInputStream.readOrdinaryObject(ObjectInputStream.java:2060)
            at java.io.ObjectInputStream.readObject0(ObjectInputStream.java:1567)
            at java.io.ObjectInputStream.readObject(ObjectInputStream.java:427)
            at com.granite.opi.session.SessionToken.getBytesAsObject(SessionToken.java:202)
            at com.granite.opi.session.SessionToken.decrypt(SessionToken.java:173)
            at com.granite.opi.session.SessionToken.<init>(SessionToken.java:69)
            at com.granite.bdl.BDLSessionToken.<init>(BDLSessionToken.java:59)
            at com.granite.bdl.util.BDLSessionLocator.getBDLSessionToken(BDLSessionLocator.java:147)
            at com.granite.bdl.protocol.IIOP.adapter.Session.establish(Session.java:682)
            at com.granite.bdl.protocol.SessionBaseImpl.establish(SessionBaseImpl.java:49)
            at com.granite.bdl.protocol.FactoryImpl.initialize(FactoryImpl.java:72)
            at com.granite.bdl.protocol.FactoryImpl.startup(FactoryImpl.java:110)
            at com.granite.web.session.SessionValidationHelper.validate(SessionValidationHelper.java:117)
            at com.granite.web.filters.OpiAuthenticationFilter.doFilter(OpiAuthenticationFilter.java:95)
            at weblogic.servlet.internal.FilterChainImpl.doFilter(FilterChainImpl.java:79)
            at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3436)
            at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3402)
            at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
            at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
            at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
            at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2285)
            at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2201)
            at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2179)
            at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1572)
            at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:255)
            at weblogic.work.ExecuteThread.execute(ExecuteThread.java:311)
            at weblogic.work.ExecuteThread.run(ExecuteThread.java:263)
    [] [11 Apr 2018 04:34:43,528] [com.granite.web.session.SessionValidationHelper] [[ACTIVE] ExecuteThread: '15' for queue: 'weblogic.kernel.Default (self-tuning)'] [ERROR]
    [Caught BDLException Object com.granite.bdl.BDLForwardedException: com.granite.bdl.BDLForwardedException: ]
When:
    ISGT 9.0.1 after installation of the EAI 16.1
    Doesn't work WEB-OPI: Activation Plugin in the client reguires authentification.
So:
Few build scenarios weren't updated properly. Old core-services-client-stubs.jar (and probably some other libs) were included in final build.
This error was fixed after fixing of those build scenarios.
What:
java.lang.NoClassDefFoundError: com/ibm/mq/pcf/PCFMessageAgent
    at hermes.ext.mq.MQSeriesAdmin.discoverDestinationConfigs(MQSeriesAdmin.java:280)
    at hermes.impl.HermesAdminAdapter.discoverDestinationConfigs(HermesAdminAdapter.java:84)
    at hermes.impl.DefaultHermesImpl.discoverDestinationConfigs(DefaultHermesImpl.java:1358)
    at hermes.browser.tasks.DiscoverDestinationsTask.invoke(DiscoverDestinationsTask.java:76)
    at hermes.browser.tasks.TaskSupport.run(TaskSupport.java:175)
    at hermes.browser.tasks.ThreadPool.run(ThreadPool.java:170)
    at java.lang.Thread.run(Thread.java:745)
Caused by: java.lang.ClassNotFoundException: com.ibm.mq.pcf.PCFMessageAgent
    at java.net.URLClassLoader$1.run(URLClassLoader.java:366)
    at java.net.URLClassLoader$1.run(URLClassLoader.java:355)
    at java.security.AccessController.doPrivileged(Native Method)
    at java.net.URLClassLoader.findClass(URLClassLoader.java:354)
    at hermes.impl.LoaderSupport$DebugClassLoader.findClass(LoaderSupport.java:130)
    at java.lang.ClassLoader.loadClass(ClassLoader.java:425)
    at hermes.impl.LoaderSupport$DebugClassLoader.loadClass(LoaderSupport.java:99)
    at java.lang.ClassLoader.loadClass(ClassLoader.java:358)
    ... 7 more
When:
         ISGT:   
        Configuring Hermes to directly connect to IBM MQ.
So:
        If correct steps were done previosly (https://engineeernitesh.blogspot.com/2017/02/how-to-configure-hermesjms-in-soap-ui.html, for example), re-start will help
What:

When:

So:

What:

tail -f $DOMAIN/logs/wls_isgt.log

<Mar 18, 2018 1:05:30 PM EDT> <Warning> <EJB> <BEA-010096> <The Message-Driven EJB ActivationResponseMDB is unable to connect to the JMS destination or bind to JCA resource adapter telcordia.jms.GTResponseQueue. The onnection failed after 2 attempts. The MDB will attempt to reconnect/rebind every 10 seconds. This log message will repeat every 600 seconds until the condition clears.>
<Mar 18, 2018 1:05:30 PM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB ActivationResponseMDB is unable to connect to the JMS destination telcordia.jms.GTResponseQueue. The Error was:
com.ibm.msg.client.jms.DetailedInvalidDestinationException: JMSWMQ2008: Failed to open MQ queue 'rmmbr_response'.
JMS attempted to perform an MQOPEN, but WebSphere MQ reported an error.
Use the linked exception to determine the cause of this error. Check that the specified queue and queue manager are defined correctly.
Nested exception: com.ibm.mq.MQException: JMSCMQ0001: WebSphere MQ call failed with compcode '2' ('MQCC_FAILED') reason '2085' ('MQRC_UNKNOWN_OBJECT_NAME').>
When:
        ISGT:
        Starting ISGT managed server, which has been updated to connect with just created IBM MQ.
So:
        During IBM MQ creation following statement was used to create queues in lower case (and then such lowercase was used during WL configuration):
            def ql(rmmbr_request)
But actually queues with uppercase were created:
                     1 : display qlocal(*)
            AMQ8409: Display Queue details.
               QUEUE(RMMBR_REQUEST)

Whole process of queue creation should be re-done (for example, with upper case names), WL should be re-configured appropriatly.


What:

The following error occurred in the OPI Framework:
Printing from html:errors
Finished printing from html:errors
printing implied exception object
Implicit Exception Message: Exception forwarding for name welcome: javax.servlet.ServletException: com.telcordia.intsol.common.exception.GeneralException:
OpiException Message key was null
ROOT Exception Message was NULL
•javax.servlet.jsp.JspException: Exception forwarding for name welcome: javax.servlet.ServletException: com.telcordia.intsol.common.exception.GeneralException: at org.apache.struts.taglib.logic.ForwardTag.doEndTag(ForwardTag.java:173) at jsp_servlet.__index._jsp__tag2(__index.java:216) at jsp_servlet.__index._jspService(__index.java:114) at weblogic.servlet.jsp.JspBase.service(JspBase.java:34) at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280) at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254) at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136) at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:341) at weblogic.servlet.internal.TailFilter.doFilter(TailFilter.java:25) at weblogic.servlet.internal.FilterChainImpl.doFilter(FilterChainImpl.java:79) at com.granite.web.filters.OpiAuthenticationFilter.doFilter(OpiAuthenticationFilter.java:96) at weblogic.servlet.internal.FilterChainImpl.doFilter(FilterChainImpl.java:79) at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3367) at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3333) at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321) at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120) at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57) at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2220) at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2146) at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2124) at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1564) at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:254) at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295) at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
When:
        ISGT:
        Activation Plugin's webpage
So:
        DB accounts were expired.
What:
JMSWMQ2013: The security authentication was not valid that was supplied for QueueManager 'MQTest' with connection mode 'Client' and host name 'linad3.cc.telcordia.com(1515)'.
JMSCMQ0001: WebSphere MQ call failed with compcode '2' ('MQCC_FAILED') reason '2035' ('MQRC_NOT_AUTHORIZED').
When:
            ISGT
            Connecting to the IBM MQ queue MQTest via just created session in JMS client (Hermes).
So:
        Specify credentials.

    #Right click on the just created session in JMS client (Hermes) on the left panel -> Edit... -> Sessions tab -> Connection area -> ...
    
            ClientID:    mqm
            
            User  checkbox is selected
            
            User:        mqm
            Password:    mqm123

What:
tail -f $DOMAIN/logs/wls_isgt.log

<Warning> <EJB> <BEA-010061> <The Message-Driven EJB ActivationResponseMDB is unable to connect to the JMS destination ERROR_QUEUE_JNDI. The Errror was:
The destination for the MessageDrivenBean ErrorServiceMDB (Application: GTInterfaceApp, EJBComponent: ActivationService.jar) could not be resolved at this time. Please ensure the destination is available at the JNDI name ERROR_QUEUE_JNDI. The EJB container will periodically attempt to resolve this MessageDrivenBeand destination and additional warnings may be issued.>
<Warning> <EJB> <BEA-010061> <The Message-Driven EJB ActivationResponseMDB is unable to connect to the JMS destination RESPONSE_QUEUE_JNDI. The Errror was:...
When:
            Starting ISGT env after first installation, isgt management server.
So:
            GTInterfaceApp.ear deployed on the WL contains ActivationService.jar which contains, for example, this unupdated line from template:
                    <destination-jndi-name>RESPONSE_QUEUE_JNDI</destination-jndi-name>
            instead of this updated:
                    <destination-jndi-name>telcordia.jms.GTResponseQueue</destination-jndi-name>
            was not updated during ISGT repackaging process.
            Repackaging process have to be done once again.
What:
Error: SQL error -12154 received while connecting to database schema
        'planet_common'.

config_dts_tables
ORA-12154: TNS:could not resolve the connect identifier specified

cat /lhome/leis/PT90/files/dts/planet_common/wsmktables.out

SQL*Plus: Release 12.1.0.2.0 Production on Thu Feb 22 05:07:55 2018
Copyright (c) 1982, 2014, Oracle.  All rights reserved.
ERROR:
ORA-12154: TNS:could not resolve the connect identifier specified
Enter user-name: SP2-0306: Invalid option.
Usage: CONN[ECT] [{logon|/|proxy} [AS {SYSDBA|SYSOPER|SYSASM|SYSBACKUP|SYSDG|SYSKM}] [edition=value]]
where <logon> ::= <username>[/<password>][@<connect_identifier>]
      <proxy> ::= <proxyuser>[<username>][/<password>][@<connect_identifier>]
Enter user-name: SP2-0306: Invalid option.
Usage: CONN[ECT] [{logon|/|proxy} [AS {SYSDBA|SYSOPER|SYSASM|SYSBACKUP|SYSDG|SYSKM}] [edition=value]]
where <logon> ::= <username>[/<password>][@<connect_identifier>]
      <proxy> ::= <proxyuser>[<username>][/<password>][@<connect_identifier>]
SP2-0157: unable to CONNECT to ORACLE after 3 attempts, exiting SQL*Plus

When:
            LEIS-NP: configuring/starting of the DTS process
So:

What:
WL admin log:

<Apr 6, 2018 3:54:53 AM EDT> <Critical> <WebLogicServer> <BEA-000386> <Server subsystem failed. Reason: java.lang.AssertionError: java.lang.reflect.InvocationTargetException
java.lang.AssertionError: java.lang.reflect.InvocationTargetException
        at weblogic.descriptor.DescriptorManager$SecurityServiceImpl$SecurityProxy._invokeServiceMethod(DescriptorManager.java:179)
        at weblogic.descriptor.DescriptorManager$SecurityServiceImpl$SecurityProxy.decrypt(DescriptorManager.java:196)
        at weblogic.descriptor.DescriptorManager$SecurityServiceImpl.decrypt(DescriptorManager.java:118)
        at weblogic.descriptor.internal.AbstractDescriptorBean._decrypt(AbstractDescriptorBean.java:1188)
        at weblogic.management.configuration.SecurityConfigurationMBeanImpl.getCredential(SecurityConfigurationMBeanImpl.java:908)
        Truncated. see log file for complete stacktrace
Caused By: java.lang.reflect.InvocationTargetException
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke(Method.java:606)
        at weblogic.descriptor.DescriptorManager$SecurityServiceImpl$SecurityProxy._invokeServiceMethod(DescriptorManager.java:177)
        Truncated. see log file for complete stacktrace
Caused By: weblogic.security.internal.encryption.EncryptionServiceException
        at weblogic.security.internal.encryption.JSafeEncryptionServiceImpl.decryptBytes(JSafeEncryptionServiceImpl.java:137)
        at weblogic.security.internal.encryption.JSafeEncryptionServiceImpl.decryptString(JSafeEncryptionServiceImpl.java:185)
        at weblogic.security.internal.encryption.ClearOrEncryptedService.decrypt(ClearOrEncryptedService.java:99)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)
        Truncated. see log file for complete stacktrace
>


When:
    Starting WL admin server.
So:
    $DOMAIN/config/config.xml file for this WL Admin server has been incedentally replaced by such file from another env.
What:

ld.so.1: sqlplus: fatal: /opt/vendor/oracle/product/12.1.0.2_leisnp/lib/libsqlplus.so: Permission denied

When:
            sqlplus sys/oramanager as sysdba
So:
Permission Of $OH/LIB/LIBSQLPLUS.SO changes from 644 TO 640 on applying 11.2.0.4/12.1.0.2 DBPSU (Doc ID 2201729.1)
Database PSU  patch is being applied.
The PSU works fine.
Basically, genplusso within ins_sqlplus.mk is responsible for changing the file permission to 640.
In DBPSU, the file libsqlplus.a is being updated and hence during relinking phase, “genplusso” (within ins_sqlplus.mk) is executed as it needs to regenerate libsqlplus.so
            chmod 644 $ORACLE_HOME/lib/libsqlplus.so
What:

tail -f $DOMAIN/logs/wls_granite_core.log

<Dec 14, 2017 9:56:17 AM EST> <Error> <WebLogicServer> <BEA-000337> <[STUCK] ExecuteThread: '2' for queue: 'weblogic.kernel.Default (self-tuning)' has been busy for "623" seconds working on the request "Workmanager: default, Version: 0, Scheduled=true, Started=true, Started time: 623502 ms
", which is more than the configured time (StuckThreadMaxTime) of "600" seconds in "server-failure-trigger". Stack trace:
java.net.SocketInputStream.socketRead0(Native Method)
java.net.SocketInputStream.read(SocketInputStream.java:152)
java.net.SocketInputStream.read(SocketInputStream.java:122)
        java.io.BufferedInputStream.fill(BufferedInputStream.java:235)
        java.io.BufferedInputStream.read(BufferedInputStream.java:254)
        java.io.DataInputStream.readLine(DataInputStream.java:513)
        weblogic.servlet.proxy.GenericProxyServlet.readStatus(GenericProxyServlet.java:847)
        weblogic.servlet.proxy.HttpClusterServlet.sendResponse(HttpClusterServlet.java:1629)
        weblogic.servlet.proxy.HttpClusterServlet.service(HttpClusterServlet.java:409)
        javax.servlet.http.HttpServlet.service(HttpServlet.java:844)
        weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280)
        weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254)
        weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136)
        weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:341)
        weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:238)
        weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3363)
        weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3333)
        weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2220)
        weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2146)
        weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2124)
        weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1564)
        weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:254)
        weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        weblogic.work.ExecuteThread.run(ExecuteThread.java:254)


When:
       Working on new LEIS-NP env at web-part (weblogic).
So:
Unable to log into the EM console due to a stuck thread (Doc ID 2031827.1)
What:
tail -f $DOMAIN/logs/wls_granite_core.log

<Dec 14, 2017 9:24:04 AM EST> <Warning> <JTA> <BEA-110486> <Transaction BEA1-0111C18A3070CBE20601 cannot complete commit processing because resource [WLStore_retst90_xngJMSFileStore_2] is unavailable. The transaction will be abandoned after 84,210 seconds unless all resources acknowledge the commit decision.>
When:
        Starting WL managed instance in the just created env.
So:
Stop your server.
Go to [your domain]\servers\AdminServer\data\store\default.
Delete * _WLS_ADMINSERVER_[random number].DAT. Make sure to take a backup of the DAT file before deleting it.
Restart server.
What:
"TNSNames Editor" button is disabled in the TOAD, "Database:" dropdown list is empty.
When:
       First launch of just installed TOAD.
So:
        Check that:
        1) system/user env contains TNS_ADMIN variable;
        2) tnsnames.ora file exists in the directory to which TNS_ADMIN variable points.
What:
ORA-12520: TNS:listener could not find available handler for requested type of
server
When:
            During login process to the just created Oracle DB instance.
So:
            $ORACLE_HOME/network/admin/tnsnames.ora contains tns, but somehow it contained some unreadable symbols - so only re-creating of tns helped.
What:
Can't initialize OCI. Error -1
When:
            During login process via TOAD on just re-installed Windows 10 (previously it was Windows 7).
So:
        TOAD is used to use Oracle Client 11g on Windows 7, which no longer compatible with Windows 10.
        New Oracle Client 12c should be installed on the Windows 10 and selected as one that used by TOAD.
What:
Taper Code Already Locked
            Your userid already owns the Taper Code Management lock for Wire Center lp05test.
The lock was acquired at 11/30/2017 08:00:11
When:
      LEIS-NP Web page was locked (not single taper code).
So:
    Log off was made on the web page, it was written on the error message (c) Pasha
What:
    ...
    I used the command:
            /opt/SUNWspro/bin/cc -o try -O -I/usr/local/include -L/usr/lib -L/usr/ccs/lib -L/opt/solarisstudio12.3/prod/lib/sparc -L/opt/solarisstudio12.3/prod/lib -L/lib -L/usr/local/lib try.c -lpthread -lsocket -lnsl -lgdbm -ldl -lm -lc
             ./try
    and I got the following output:
    ld: warning: global symbol '_END_' has non-global binding:
            (file /usr/local/lib/libgdbm.so value=LOCL);
    ld: warning: global symbol '_START_' has non-global binding:
            (file /usr/local/lib/libgdbm.so value=LOCL);
    ld.so.1: try: fatal: libgdbm.so.4: open failed: No such file or directory
    Killed
    The program compiled OK, but exited with status 137.
    You have a problem.  Shall I abort Configure [y]
When:
    During first step of Perl installation:
        ./Configure -des -Dprefix=$DEST_PERL_LOC
So:
    Make sure necessary lib dir is in LD_LIBRARY_PATH and re-run installation command.
        export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
What:
 tail -200 $DOMAIN/logs/wls_granite_core.log

<Oct 27, 2017 10:31:05 AM EDT> <Error> <EJB> <BEA-010024> <Error occurred during passivation: java.io.NotSerializableException: com.granite.middle.discovery.Port$PortInfo
     at java.io.ObjectOutputStream.writeObject0(ObjectOutputStream.java:1184)
     at java.io.ObjectOutputStream.writeObject(ObjectOutputStream.java:348)
     at java.util.HashMap.internalWriteEntries(HashMap.java:1785)
     at java.util.HashMap.writeObject(HashMap.java:1362)
     at sun.reflect.GeneratedMethodAccessor24.invoke(Unknown Source)
     at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
     at java.lang.reflect.Method.invoke(Method.java:498)
     at java.io.ObjectStreamClass.invokeWriteObject(ObjectStreamClass.java:1028)
     at java.io.ObjectOutputStream.writeSerialData(ObjectOutputStream.java:1496)
     at java.io.ObjectOutputStream.writeOrdinaryObject(ObjectOutputStream.java:1432)
     at java.io.ObjectOutputStream.writeObject0(ObjectOutputStream.java:1178)
     at java.io.ObjectOutputStream.defaultWriteFields(ObjectOutputStream.java:1548)
     at java.io.ObjectOutputStream.writeSerialData(ObjectOutputStream.java:1509)
     at java.io.ObjectOutputStream.writeOrdinaryObject(ObjectOutputStream.java:1432)
     at java.io.ObjectOutputStream.writeObject0(ObjectOutputStream.java:1178)
     at java.io.ObjectOutputStream.defaultWriteFields(ObjectOutputStream.java:1548)
     at java.io.ObjectOutputStream.writeSerialData(ObjectOutputStream.java:1509)
     at java.io.ObjectOutputStream.writeOrdinaryObject(ObjectOutputStream.java:1432)
     at java.io.ObjectOutputStream.writeObject0(ObjectOutputStream.java:1178)
     at java.io.ObjectOutputStream.writeObject(ObjectOutputStream.java:348)
     at weblogic.ejb.container.swap.PassivationUtils.write(PassivationUtils.java:84)
     at weblogic.ejb.container.swap.ReplicatedMemorySwap$ByteLevelChecker.getDiff(ReplicatedMemorySwap.java:312)
     at weblogic.ejb.container.swap.ReplicatedMemorySwap.sendUpdate(ReplicatedMemorySwap.java:136)
     at weblogic.ejb.container.manager.ReplicatedStatefulSessionManager.replicate(ReplicatedStatefulSessionManager.java:235)
     at weblogic.ejb.container.manager.StatefulSessionManager.replicateAndRelease(StatefulSessionManager.java:1306)
     at weblogic.ejb.container.manager.StatefulSessionManager.afterCompletion(StatefulSessionManager.java:850)
     at weblogic.ejb.container.internal.TxManagerImpl$TxListener.inValidateAndAfterCompletion(TxManagerImpl.java:214)
     at weblogic.ejb.container.internal.TxManagerImpl$TxListener.afterCompletion(TxManagerImpl.java:205)
     at weblogic.transaction.internal.ServerSCInfo.doAfterCompletion(ServerSCInfo.java:1170)
     at weblogic.transaction.internal.ServerSCInfo.callAfterCompletions(ServerSCInfo.java:1143)
     at weblogic.transaction.internal.ServerTransactionImpl.callAfterCompletions(ServerTransactionImpl.java:3188)
     at weblogic.transaction.internal.ServerTransactionImpl.afterCommittedStateHousekeeping(ServerTransactionImpl.java:3086)
     at weblogic.transaction.internal.ServerTransactionImpl.setCommitted(ServerTransactionImpl.java:3131)
     at weblogic.transaction.internal.ServerTransactionImpl.globalRetryCommit(ServerTransactionImpl.java:2908)
     at weblogic.transaction.internal.ServerTransactionImpl.globalCommit(ServerTransactionImpl.java:2818)
     at weblogic.transaction.internal.ServerTransactionImpl.internalCommit(ServerTransactionImpl.java:312)
     at weblogic.transaction.internal.ServerTransactionImpl.commit(ServerTransactionImpl.java:260)
     at weblogic.ejb.container.internal.BaseRemoteObject.postInvoke1(BaseRemoteObject.java:369)
     at weblogic.ejb.container.internal.BaseRemoteObject.__WL_postInvokeTxRetry(BaseRemoteObject.java:223)
     at weblogic.ejb.container.internal.StatefulRemoteObject.__WL_postInvokeTxRetry(StatefulRemoteObject.java:28)
     at weblogic.ejb.container.internal.SessionRemoteMethodInvoker.invoke(SessionRemoteMethodInvoker.java:47)
     at com.granite.middle.session.ElementDiscoveryEJB_euibjn_EOImpl.isDiscoveryComplete(Unknown Source)
     at com.granite.middle.session.ElementDiscoveryEJB_euibjn_EOImpl_WLSkel.invoke(Unknown Source)
     at weblogic.rmi.internal.BasicServerRef.invoke(BasicServerRef.java:701)
     at weblogic.rmi.cluster.ClusterableServerRef.invoke(ClusterableServerRef.java:231)
     at weblogic.rmi.internal.BasicServerRef$1.run(BasicServerRef.java:527)
     at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:363)
     at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:146)
     at weblogic.rmi.internal.BasicServerRef.handleRequest(BasicServerRef.java:523)
     at weblogic.rmi.internal.wls.WLSExecuteRequest.run(WLSExecuteRequest.java:118)
     at weblogic.work.ExecuteThread.execute(ExecuteThread.java:311)
     at weblogic.work.ExecuteThread.run(ExecuteThread.java:263)
When:

So:

What:

          tail -200 $DOMAIN/logs/wls_wls_granite_core.log

[]|[]|[27 Oct 2017 10:54:39,753]|[com.granite.middle.util.XngClassicLogin]|[[ACTIVE] ExecuteThread: '10' for queue: 'weblogic.kernel.Default (self-tuning)']|[WARN]|[Passwords did not match for user sysadm]

[]|[]|[27 Oct 2017 10:54:39,766]|[com.granite.middle.util.XngClassicLogin]|[[ACTIVE] ExecuteThread: '10' for queue: 'weblogic.kernel.Default (self-tuning)']|[WARN]|[sysadm failed authentication.]

[]|[]|[27 Oct 2017 10:54:39,773]|[com.granite.middle.session.StatelessClientServiceBean]|[[ACTIVE] ExecuteThread: '10' for queue: 'weblogic.kernel.Default (self-tuning)']|[ERROR]|[Problem calling authentication adapter.]

com.granite.middle.plugin.authentication.AuthenticationException: (ffff0000000e0003) The password is not correct.
When:
          Login via the GI client.
So:
          Just incorrect password for sysadm (typo).
What:
tail -200 $DOMAIN/logs/wls_wls_granite_core.log

<Oct 27, 2017 9:19:44 AM EDT> <Warning> <JTA> <BEA-110484> <The JTA health state has changed from HEALTH_OK to HEALTH_WARN with reason codes: Resource leis-np4Admin_granite-pt90 declared unhealthy.>
[]|[]|[27 Oct 2017 09:20:05,635]|[com.granite.middle.session.PingBean]|[[ACTIVE] ExecuteThread: '3' for queue: 'weblogic.kernel.Default (self-tuning)']|[ERROR]|[update caught exception]

java.sql.SQLException: Unexpected exception while enlisting XAConnection java.sql.SQLException: XA error: XAResource.XAER_RMFAIL start() failed on resource 'leis-np4Admin_granite-pt90': XAER_RMFAIL : Resource manager is unavailable
javax.transaction.xa.XAException: Internal error: XAResource 'leis-np4Admin_granite-pt90' is unavailable
        at weblogic.transaction.internal.XAResourceDescriptor.checkResource(XAResourceDescriptor.java:1302)
        at weblogic.transaction.internal.XAResourceDescriptor.startResourceUse(XAResourceDescriptor.java:718)
        at weblogic.transaction.internal.XAServerResourceInfo.start(XAServerResourceInfo.java:1310)
        at weblogic.transaction.internal.XAServerResourceInfo.xaStart(XAServerResourceInfo.java:1244)
        at weblogic.transaction.internal.XAServerResourceInfo.enlist(XAServerResourceInfo.java:292)
        at weblogic.transaction.internal.ServerTransactionImpl.enlistResource(ServerTransactionImpl.java:585)
        at weblogic.transaction.internal.ServerTransactionImpl.enlistResource(ServerTransactionImpl.java:490)
        at weblogic.jdbc.jta.DataSource.enlist(DataSource.java:1739)
        at weblogic.jdbc.jta.DataSource.refreshXAConnAndEnlist(DataSource.java:1641)
        at weblogic.jdbc.jta.DataSource.getConnectionInternal(DataSource.java:517)
        at weblogic.jdbc.jta.DataSource.getConnection(DataSource.java:494)
        at weblogic.jdbc.common.internal.RmiDataSource.getConnectionInternal(RmiDataSource.java:565)
        at weblogic.jdbc.common.internal.RmiDataSource.getConnection(RmiDataSource.java:545)
        at weblogic.jdbc.common.internal.RmiDataSource.getConnection(RmiDataSource.java:538)
        at com.granite.middle.session.PingBean.getConnection(PingBean.java:312)
        at com.granite.middle.session.PingBean.update(PingBean.java:265)
        at com.granite.middle.session.PingEJB_dco825_EOImpl.__WL_invoke(Unknown Source)
        at weblogic.ejb.container.internal.SessionRemoteMethodInvoker.invoke(SessionRemoteMethodInvoker.java:34)
        at com.granite.middle.session.PingEJB_dco825_EOImpl.update(Unknown Source)
        at com.granite.middle.session.PingEJB_dco825_EOImpl_WLSkel.invoke(Unknown Source)
        at weblogic.rmi.internal.BasicServerRef.invoke(BasicServerRef.java:701)
        at weblogic.rmi.cluster.ClusterableServerRef.invoke(ClusterableServerRef.java:231)
        at weblogic.rmi.internal.BasicServerRef$1.run(BasicServerRef.java:527)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:363)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:146)
        at weblogic.rmi.internal.BasicServerRef.handleRequest(BasicServerRef.java:523)
        at weblogic.rmi.internal.wls.WLSExecuteRequest.run(WLSExecuteRequest.java:118)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:311)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:263)

[]|[]|[27 Oct 2017 09:20:05,635]|[com.granite.middle.session.PingBean]|[[ACTIVE] ExecuteThread: '3' for queue: 'weblogic.kernel.Default (self-tuning)']|[ERROR]|[update caught exception]

java.sql.SQLException: Unexpected exception while enlisting XAConnection java.sql.SQLException: XA error: XAResource.XAER_RMFAIL start() failed on resource 'leis-np4Admin_granite-pt90': XAER_RMFAIL : Resource manager is unavailable
javax.transaction.xa.XAException: Internal error: XAResource 'leis-np4Admin_granite-pt90' is unavailable


<Oct 27, 2017 9:20:08 AM EDT> <Error> <JDBC> <BEA-001112> <Test "SELECT 1 FROM DUAL" set up for pool "leis-np4Admin" failed with exception: "oracle.jdbc.xa.OracleXAException: OracleError = 17410; OracleSQLError = 0; XAError = -7".>
<Oct 27, 2017 9:20:08 AM EDT> <Error> <JDBC> <BEA-001112> <Test "SELECT 1 FROM DUAL" set up for pool "leis-np4Admin" failed with exception: "oracle.jdbc.xa.OracleXAException: OracleError = 17008; OracleSQLError = 0; XAError = -7".>
When:
          Working with LEIS-NP web just after DB has been restarted.
So:
          In LEIS-NP,  WL should be restarted after DB restart 
What:
Could not retrieve the user's query domain.
User has no query domains.
See your System Administrator or please try again.
When:
         LEIS-NP:
          Connecting via GI admin client as sysadm, with DB schema install.
So:
          Connect as sysadm via GI admin client, with other DB schema.
          Database line -> Necessary DB schema (install in this case) -> Domain link -> necessary Domain Name is chosen -> Domain Users link (left, bottom) -> Set all necessary permissions to necessary users.
What:
tail -f $DTS_FILESDIR/wsftmgr7005.log

Unable to register application: TLD002 LEISINT.  fterrno: -20 (bad database operation)

Wire center: sbc_clli  NPA/NXX: 206690  Wed Oct 25 12:08:11 2017
  DTS is currently unable to communicate with the LFACS machine.  TPR update transactions will be sent to LFACS after communication is established.
When:
          Sending data via DTS on the LEIS product.
So:
          Oleksandr Myrgorod (C++ dev on LEIS) made some changes in DTS.

On Monday, October 23, 2017, Oleksandr Myrgorod <oleksandr.myrgorod@globallogic.com> wrote:
I found the origin of the problem: it is a side effect of security changes for s-bit. During this activity, I have added substitute operation for WSFTDB variable. See function grantOracleAdminPermissions(). as soon as _sendUtilities was marked with s-bit the WSFTDB redefinition will be applied that in turn leads to string comparison mismatch inside DTS daemon. To fix the issue I'm going to rollback changes for WSFTDB  in grantOracleAdminPermissions().

What:
ZOP-51: The patch location is not valid for apply, because it doesn't have correct metadata, or it points to a patch directory.
Argument(s) Error... Patch location is not valid for apply

Please check the arguments and try again.

OPatch failed with error code 135
When:
          During patch installation.
So:
          cd 26635880
     instead of
cd 26635880/26717470
What:
OPatch failed with error code 73
When:
          During patch installation.
So:
          Another DB instance is running from current DB home. 
          Who is using?
               /usr/sbin/fuser -u /opt/vendor/oracle/product/12.1.0.2_leisnp/lib/libclntsh.so.12.1
           ps -ef | grep ...

          Stop it. Re-try patch installation.
What:

Invoking prereq "checkconflictagainstohwithdetail"

Prereq "checkConflictAgainstOHWithDetail" failed.

The details are:
The relation between 2 composites[24732088,26713565] are invalid.
Please contact SE team to regenerate the patches.
Summary of Conflict Analysis:

There are no patches that can be applied now.
When:
          During patch applying on the DB or during patch conflict checking prior patch applying.
So:
          Doc ID 2205299.1
           You cannot install ProActive BP and DB PSU in the same ORACLE_HOME.
           Rollback the DB PSU manually & apply the ProActive BP.
What:
LEIS-NP web:

Warning: The LEIS_NON_ASSIGNABLE_PLUGIN_TYPE_KEYS system setting is not available. The default value (na*) fro the setting will be used.
When:
          Running "F1 FACILITY UTILIZATION REPORT (f1fill)" report in LEIS-NP web.
So:
          Eventually $LEISDIR/lib/XngUtils.properties file contained wrong DB connection string.
          Looks like necessary variables weren't in they proper place because of the unavailability of the DB.
What:
LEIS-NP web:

          20171017 10:12:55,387[main]FATAL-Get connection Exception: The Network Adapter could not establish the connection
When:
          Running "Loop Qualification Data Check Report" on the LEIS-NP web.
So:
report on APP server ->
$LEISDIR/bin/qual.check on DB server ->
com.telcordia.leis.refresh.XngUtils ->
$LEISDIR/lib/XngUtils.properties          <== contains wrong information regarding DB connection
 
What:
tail -200 $DOMAIN/logs/wls_admin.log

<Oct 12, 2017 6:04:51 AM EDT> <Critical> <WebLogicServer> <BEA-000386> <Server subsystem failed. Reason: weblogic.security.SecurityInitializationException: Authentication denied: Boot identity not valid. The user name or password or both from the boot identity file (boot.properties) is not valid. The boot identity may have been changed since the boot identity file was created. Please edit and update the boot identity file with the proper values of username and password. The first time the updated boot identity file is used to start the server, these new values are encrypted.
weblogic.security.SecurityInitializationException: Authentication denied: Boot identity not valid. The user name or password or both from the boot identity file (boot.properties) is not valid. The boot identity may have been changed since the boot identity file was created. Please edit and update the boot identity file with the proper values of username and password. The first time the updated boot identity file is used to start the server, these new values are encrypted.
        at weblogic.security.service.CommonSecurityServiceManagerDelegateImpl.doBootAuthorization(CommonSecurityServiceManagerDelegateImpl.java:964)
        at weblogic.security.service.CommonSecurityServiceManagerDelegateImpl.initialize(CommonSecurityServiceManagerDelegateImpl.java:1058)
        at weblogic.security.service.SecurityServiceManager.initialize(SecurityServiceManager.java:873)
        at weblogic.security.SecurityService.start(SecurityService.java:148)
        at weblogic.t3.srvr.SubsystemRequest.run(SubsystemRequest.java:64)
        Truncated. see log file for complete stacktrace
Caused By: javax.security.auth.login.FailedLoginException: [Security:090303]Authentication Failed: User system weblogic.security.providers.authentication.LDAPAtnDelegateException: [Security:090295]caught unexpected exception
        at weblogic.security.providers.authentication.LDAPAtnLoginModuleImpl.login(LDAPAtnLoginModuleImpl.java:257)
        at com.bea.common.security.internal.service.LoginModuleWrapper$1.run(LoginModuleWrapper.java:110)
        at java.security.AccessController.doPrivileged(Native Method)
        at com.bea.common.security.internal.service.LoginModuleWrapper.login(LoginModuleWrapper.java:106)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        Truncated. see log file for complete stacktrace
When:
          First admin WL starting after creating new LEIS-NP env by copping the old one.
So:
          cd $DOMAIN/servers/admin/data
          mv ldap ldap.old
          start
What:
logs for DTS

APPERR: dbms error numbers -3114,0 component is wsftsnsel.sc 10.1 var_subs is -3114,0
APPERR: failed to find error description for 2020
APPERR: dbms error numbers -3114,0 component is wsftsnsel.sc 10.1 var_subs is select
APPERR: failed to find error description for 110
APPERR: dbms error numbers -3114,0 component is wsfthrecvr.c 1.1 var_subs is select from
APPERR: failed to find error description for 2010
APPERR: dbms error numbers -3114,0 component is wsftthind.c 1.1 var_subs is recovery
APPERR: failed to find error description for 2014
When:
          I've noticed that DTS is down, logs contained errors above.
So:
          dts/topcom have been restarted, dts has been started normally then

What:
          Windows error 2 occured while loading the Java VM
When:
          Error windows that appears during running of installer of the Granite Inventory Client that was made by InstallAnywhere
So:
          IA looks for Java to use in PATH variable, it doesn't care about JAVA_HOME variable.

          WORKAROUND (just tell IA which Java should be used during installation):

               xngcli_win.exe LAX_VM "D:\sburt\Installed\Java\JDK\bin\java.exe"


          FULL SOLUTION (make sure that necessary Java is first in the list in the PATH variable - not javapath, etc - fix if not):

               cmd
               set PATH
               C:\ProgramData\Oracle\Java\javapath;C:\Perl\bin\;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\;C:\Program Files      (x86)\Java\jre6_u24\bin;%USERPROFILE%\.dnx\bin;C:\Program Files\Microsoft DNX\Dnvm\;C:\Program Files\Microsoft SQL Server\120\Tools\Binn\;C:\Program Files (x86)\Silk\SilkTest;C:\Program Files\Java\jre1.8.0_144\bin
What:


<Oct 2, 2017 10:35:42 AM EDT> <Error> <Cluster> <BEA-000123> <Conflict start: You tried to bind an object under the name weblogic.messaging.dispatcher.S:granite_core in the JNDI tree. The object  from 2179922019238624859S:128.96.247.91:[6280,6280,-1,-1,-1,-1,-1]:lp805_4upgrd:granite_core is non-clusterable, and you have tried to bind more than once from two or more servers. Such objects can only be deployed from one server.>
<Oct 2, 2017 10:35:42 AM EDT> <Error> <Cluster> <BEA-000123> <Conflict start: You tried to bind an object under the name weblogic.transaction.coordinators.granite_core in the JNDI tree. The object  from 6706297754246802801S:128.96.247.91:lp805_4upgrd:granite_core is non-clusterable, and you have tried to bind more than once from two or more servers. Such objects can only be deployed from one server.>
<Oct 2, 2017 10:35:42 AM EDT> <Error> <Cluster> <BEA-000123> <Conflict start: You tried to bind an object under the name weblogic.transaction.coordinators.granite_core in the JNDI tree. The object  from 2179922019238624859S:128.96.247.91:[6280,6280,-1,-1,-1,-1,-1]:lp805_4upgrd:granite_core is non-clusterable, and you have tried to bind more than once from two or more servers. Such objects can only be deployed from one server.>
<Oct 2, 2017 10:35:42 AM EDT> <Error> <Cluster> <BEA-000123> <Conflict start: You tried to bind an object under the name weblogic.jms.backend.xngJMSServer in the JNDI tree. The object  from 6706297754246802801S:128.96.247.91:lp805_4upgrd:granite_core is non-clusterable, and you have tried to bind more than once from two or more servers. Such objects can only be deployed from one server.>
<Oct 2, 2017 10:35:42 AM EDT> <Error> <Cluster> <BEA-000123> <Conflict start: You tried to bind an object under the name weblogic.jms.backend.xngJMSServer in the JNDI tree. The object  from 2179922019238624859S:128.96.247.91:[6280,6280,-1,-1,-1,-1,-1]:lp805_4upgrd:granite_core is non-clusterable, and you have tried to bind more than once from two or more servers. Such objects can only be deployed from one server.>
<Oct 2, 2017 10:35:42 AM EDT> <Error> <Cluster> <BEA-000123> <Conflict start: You tried to bind an object under the name weblogic.jms.ServerSessionPoolFactory:xngJMSServer in the JNDI tree. The object  from 6706297754246802801S:128.96.247.91:lp805_4upgrd:granite_core is non-clusterable, and you have tried to bind more than once from two or more servers. Such objects can only be deployed from one server.>
<Oct 2, 2017 10:35:42 AM EDT> <Error> <Cluster> <BEA-000123> <Conflict start: You tried to bind an object under the name weblogic.jms.ServerSessionPoolFactory:xngJMSServer in the JNDI tree. The object  from 2179922019238624859S:128.96.247.91:[6280,6280,-1,-1,-1,-1,-1]:lp805_4upgrd:granite_core is non-clusterable, and you have tried to bind more than once from two or more servers. Such objects can only be deployed from one server.>
<Oct 2, 2017 10:35:43 AM EDT> <Notice> <Cluster> <BEA-000164> <Synchronized cluster JNDI tree from server granite_core.>
<Oct 2, 2017 10:35:44 AM EDT> <Notice> <WebLogicServer> <BEA-000365> <Server state changed to ADMIN.>
<Oct 2, 2017 10:35:45 AM EDT> <Notice> <WebLogicServer> <BEA-000365> <Server state changed to RESUMING.>
<Oct 2, 2017 10:35:45 AM EDT> <Emergency> <Security> <BEA-090087> <Server failed to bind to the configured administrator port. The port may already be in use by another process.>
<Oct 2, 2017 10:35:45 AM EDT> <Error> <Server> <BEA-002606> <The server is unable to create a server socket for listening on channel "Default[1]". The address 127.0.0.1 might be incorrect or another process is using port 6280: java.net.BindException: Address already in use>
<Oct 2, 2017 10:35:45 AM EDT> <Error> <Server> <BEA-002606> <The server is unable to create a server socket for listening on channel "Default". The address 128.96.247.91 might be incorrect or another process is using port 6280: java.net.BindException: Address already in use>
<Oct 2, 2017 10:35:45 AM EDT> <Notice> <Cluster> <BEA-000162> <Starting "async" replication service with remote cluster address "null">
<Oct 2, 2017 10:35:45 AM EDT> <Notice> <Cluster> <BEA-000163> <Stopping "async" replication service>
<Oct 2, 2017 10:35:45 AM EDT> <Critical> <WebLogicServer> <BEA-000362> <Server failed. Reason: Server failed to bind to any usable port. See preceeding log message for details.>
When:
          First starting of WL after Recreate Persistance filestore via WL admin console (previous error).
So:

stopMWL/WL
netstat -a | grep -i listen | grep 6280
ps -ef | grep java
startWL/MWL
What:
tail -200 $DOMAIN/logs/wls_granite_core.log

<Oct 2, 2017 9:55:24 AM EDT> <Emergency> <Store> <BEA-280060> <The store "xngJMSFileStore" encountered a fatal error, and it must be shut down: weblogic.store.PersistentStoreFatalException: [Store:280105]The persistent file store "xngJMSFileStore" cannot open file XNGJMSFILESTORE000000.DAT.
weblogic.store.PersistentStoreFatalException: [Store:280105]The persistent file store "xngJMSFileStore" cannot open file XNGJMSFILESTORE000000.DAT.
        at weblogic.store.io.file.BaseStoreIO.openInternal(BaseStoreIO.java:170)
        at weblogic.store.io.file.FileStoreIO.open(FileStoreIO.java:64)
        at weblogic.store.internal.PersistentStoreImpl.recoverStoreConnections(PersistentStoreImpl.java:476)
        at weblogic.store.internal.PersistentStoreImpl.open(PersistentStoreImpl.java:453)
        at weblogic.store.admin.AdminHandler.activate(AdminHandler.java:129)
        Truncated. see log file for complete stacktrace
Caused By: java.io.IOException: Error from fcntl() for file locking, Resource temporarily unavailable, errno=11
        at weblogic.store.io.file.direct.DirectIONative.openConsiderLock(Native Method)
        at weblogic.store.io.file.direct.DirectIONativeImpl.openConsiderLock(DirectIONativeImpl.java:35)
        at weblogic.store.io.file.direct.DirectFileChannel.<init>(DirectFileChannel.java:64)
        at weblogic.store.io.file.direct.DirectIOManager.openBasic(DirectIOManager.java:275)
        at weblogic.store.io.file.FileStoreIO.staticOpen(FileStoreIO.java:76)
        Truncated. see log file for complete stacktrace

<Oct 2, 2017 9:55:24 AM EDT> <Warning> <Management> <BEA-141197> <The deployment of xngJMSFileStore failed.
weblogic.management.DeploymentException: java.io.IOException: Error from fcntl() for file locking, Resource temporarily unavailable, errno=11
        at weblogic.store.admin.AdminHandler.activate(AdminHandler.java:132)
        at weblogic.store.admin.FileAdminHandler.activate(FileAdminHandler.java:221)
        at weblogic.management.utils.GenericManagedDeployment.activate(GenericManagedDeployment.java:158)
        at weblogic.management.utils.GenericDeploymentManager.activate(GenericDeploymentManager.java:184)
        at weblogic.management.utils.GenericManagedService.activateDeployment(GenericManagedService.java:211)
        Truncated. see log file for complete stacktrace
Caused By: java.io.IOException: Error from fcntl() for file locking, Resource temporarily unavailable, errno=11
        at weblogic.store.io.file.direct.DirectIONative.openConsiderLock(Native Method)
        at weblogic.store.io.file.direct.DirectIONativeImpl.openConsiderLock(DirectIONativeImpl.java:35)
        at weblogic.store.io.file.direct.DirectFileChannel.<init>(DirectFileChannel.java:64)
        at weblogic.store.io.file.direct.DirectIOManager.openBasic(DirectIOManager.java:275)
        at weblogic.store.io.file.FileStoreIO.staticOpen(FileStoreIO.java:76)
        Truncated. see log file for complete stacktrace

<Oct 2, 2017 9:55:24 AM EDT> <Error> <JMS> <BEA-040123> <Failed to start JMS Server "xngJMSServer" due to weblogic.management.DeploymentException: The persistent store "xngJMSFileStore" does not exist.
weblogic.management.DeploymentException: The persistent store "xngJMSFileStore" does not exist
        at weblogic.jms.deployer.BEAdminHandler.findPersistentStore(BEAdminHandler.java:347)
        at weblogic.jms.deployer.BEAdminHandler.activate(BEAdminHandler.java:219)
        at weblogic.management.utils.GenericManagedDeployment.activate(GenericManagedDeployment.java:158)
        at weblogic.management.utils.GenericDeploymentManager.activate(GenericDeploymentManager.java:184)
        at weblogic.management.utils.GenericManagedService.activateDeployment(GenericManagedService.java:211)
        Truncated. see log file for complete stacktrace
>
<Oct 2, 2017 9:55:24 AM EDT> <Warning> <Management> <BEA-141197> <The deployment of xngJMSServer failed.
weblogic.management.DeploymentException: Internal error activating the JMS Server xngJMSServer: weblogic.management.DeploymentException: The persistent store "xngJMSFileStore" does not exist
        at weblogic.jms.deployer.BEAdminHandler.activate(BEAdminHandler.java:234)
        at weblogic.management.utils.GenericManagedDeployment.activate(GenericManagedDeployment.java:158)
        at weblogic.management.utils.GenericDeploymentManager.activate(GenericDeploymentManager.java:184)
        at weblogic.management.utils.GenericManagedService.activateDeployment(GenericManagedService.java:211)
        at weblogic.management.utils.GenericServiceManager.activateDeployment(GenericServiceManager.java:131)
        Truncated. see log file for complete stacktrace
Caused By: weblogic.management.DeploymentException: The persistent store "xngJMSFileStore" does not exist
        at weblogic.jms.deployer.BEAdminHandler.findPersistentStore(BEAdminHandler.java:347)
        at weblogic.jms.deployer.BEAdminHandler.activate(BEAdminHandler.java:219)
        at weblogic.management.utils.GenericManagedDeployment.activate(GenericManagedDeployment.java:158)
        at weblogic.management.utils.GenericDeploymentManager.activate(GenericDeploymentManager.java:184)
        at weblogic.management.utils.GenericManagedService.activateDeployment(GenericManagedService.java:211)
        Truncated. see log file for complete stacktrace
When:
         This error has appeared during WL startup:
          <BEA-141297> <Could not get the server file lock. Ensure that another server is not running in the same directory. Retrying for another 60 seconds.>
          Then WL was shutdown.
          Then file granite-core.lok was removed.
          Then $DOMAIN/servers/granite_core/tmp and $DOMAIN/servers/granite_core/cache directories were re-created.
          Finally, first startup of WL was tried after those steps
So:
          Recreate Persistance filestore via WL admin console
What:
Notepad++ crashes, all data in open file lost.
When:
          Just editing *.txt file via Notepad++
So:
When that option is enabled (and it is by default), Notepad++ keeps a backup copy of files you edit.

You can find the backups in the directory below under the format filename@datetime.

     %APPDATA%\Notepad++\backup

Also
You can try to locate the dump files (and open with Notepad++) at

     C:\Users\{username}\AppData\Local\Temp\N++RECOV
What:
cat $LEISDIR/files/dts/wsftmgr7005.log

2017/09/28 11:06:04 Manager opening database planet_common/planet_common

Opening the planet_common database schema ...
2017/09/28 11:06:04 Purged log entries older than 1 day.
apname(0) = LEISNP7 on_function = LEISINT
inimgr: build session LFACS-3 new LEISNP4LNP4001
1 session handler(s) to create ...
ld.so.1: wsfttopsh: fatal: /lhome/leis/LP805_4UPGRD/topcom/180/til/libdbg.so: wrong ELF class: ELFCLASS64
When:
          First starting of DTS after LEIS-NP upgrade (when TOPCOM was upgraded)
So:
          In general:
               It means that you're trying to use 64-bit library (for ex) via your 32-bit app on your 64-bit OS.
          In case of LEIS-NP (which has 32-bit DTS):
               TOPCOM should be 32-bit, not 64-bit.
What:
cat $LEISDIR/files/dts/wsftmgr7005.log

2017/09/28 10:51:16 Manager opening database planet_common/planet_common

Opening the planet_common database schema ...
2017/09/28 10:51:17 Purged log entries older than 1 day.
apname(0) = LEISNP7 on_function = LEISINT
inimgr: build session LFACS-3 new LEISNP4LNP4001
The errno is 2
Closing the planet_common database schema ...
When:
          First starting of DTS after LEIS-NP upgrade (when DB was upgraded, directories were recreated)
So:
          This time: re-creating of DTS helped
create_dts_tables
config_dts_tables

    Please enter the LEIS machine name as known by LFACS: [LEISNP4] LEISNP7

          But in general, some files in $LEISDIR/files have been lost during re-creating of this files (they were not be copied from original env, so DTS didn't find them, so DTS should be re-configured or necessary files should be copied additionally)

 
What:
Multiple connections to a server or shared resource by the same user, using more than one user name, are not allowed. Disconnect all previous connections to the server or shared resource and try again.
When:
          During connection to the shared resources (after pwd changing of DTR account).
So:
          PC reboot.
What:
tail -200 $DOMAIN/logs/wls_granite_core.log

<Sep 25, 2017 3:40:25 AM EDT> <Error> <WebLogicServer> <BEA-000337> <[STUCK] ExecuteThread: '15' for queue: 'weblogic.kernel.Default (self-tuning)' has been busy for "653" seconds working on the request "Workmanager: weblogic.kernel.Default, Version: 0, Scheduled=false, Started=true, Started time: 653545 ms
", which is more than the configured time (StuckThreadMaxTime) of "600" seconds in "server-failure-trigger". Stack trace:
        weblogic.diagnostics.archive.wlstore.PersistentStoreDataArchive.insertRecord(PersistentStoreDataArchive.java:841)
        weblogic.diagnostics.archive.wlstore.PersistentStoreDataArchive.writeData(PersistentStoreDataArchive.java:1488)
        weblogic.diagnostics.harvester.internal.MetricArchiver.archive(MetricArchiver.java:581)
        weblogic.diagnostics.harvester.internal.MetricArchiver.access$000(MetricArchiver.java:54)
        weblogic.diagnostics.harvester.internal.MetricArchiver$1.run(MetricArchiver.java:612)
        weblogic.work.SelfTuningWorkManagerImpl$WorkAdapterImpl.run(SelfTuningWorkManagerImpl.java:548)
        weblogic.work.ExecuteThread.execute(ExecuteThread.java:311)
        weblogic.work.ExecuteThread.run(ExecuteThread.java:263)
When:
          Logs of WL.
So:
          Reboot of WL.
What:
tail -200 $DOMAIN/logs/wls_granite_core.log

No matching store mbean found for =WLS_DIAGNOSTICS, must be a default store.
<Sep 15, 2017 5:20:30 AM EDT> <Critical> <WebLogicServer> <BEA-000362> <Server failed. Reason:

There are 1 nested errors:

<Oct 2, 2017 9:08:48 AM EDT> <Emergency> <Store> <BEA-280060> <The store "WLS_DIAGNOSTICS" encountered a fatal error, and it must be shut down: weblogic.store.PersistentStoreFatalException: [Store:280105]The persistent file store "WLS_DIAGNOSTICS" cannot open file WLS_DIAGNOSTICS000000.DAT.
weblogic.diagnostics.lifecycle.DiagnosticComponentLifecycleException: weblogic.store.PersistentStoreFatalException: [Store:280105]The persistent file store "WLS_DIAGNOSTICS" cannot open file WLS_DIAGNOSTICS000000.DAT.
        at weblogic.diagnostics.lifecycle.ArchiveLifecycleImpl.initialize(ArchiveLifecycleImpl.java:97)
        at weblogic.diagnostics.lifecycle.DiagnosticFoundationService.start(DiagnosticFoundationService.java:108)
        at weblogic.t3.srvr.SubsystemRequest.run(SubsystemRequest.java:64)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
Caused by: weblogic.store.PersistentStoreFatalException: [Store:280105]The persistent file store "WLS_DIAGNOSTICS" cannot open file WLS_DIAGNOSTICS000000.DAT.
        at weblogic.store.io.file.FileStoreIO.open(FileStoreIO.java:156)
        at weblogic.store.internal.PersistentStoreImpl.recoverStoreConnections(PersistentStoreImpl.java:437)
        at weblogic.store.internal.PersistentStoreImpl.open(PersistentStoreImpl.java:425)
        at weblogic.store.xa.PersistentStoreManagerXA.createFileStore(PersistentStoreManagerXA.java:117)
        at weblogic.diagnostics.archive.DiagnosticStoreRepository.getStore(DiagnosticStoreRepository.java:91)
        at weblogic.diagnostics.lifecycle.ArchiveLifecycleImpl.initialize(ArchiveLifecycleImpl.java:94)
        ... 4 more
Caused by: java.io.IOException: Error from fcntl() for file locking, Resource temporarily unavailable, errno=11
        at weblogic.store.io.file.direct.DirectIONative.openConsiderLock(Native Method)
        at weblogic.store.io.file.direct.DirectFileChannel.<init>(DirectFileChannel.java:54)
        at weblogic.store.io.file.direct.DirectIOManager.open(DirectIOManager.java:179)
        at weblogic.store.io.file.StoreFile.openInternal(StoreFile.java:138)
        at weblogic.store.io.file.StoreFile.open(StoreFile.java:161)
        at weblogic.store.io.file.Heap.openStoreFile(Heap.java:449)
        at weblogic.store.io.file.Heap.open(Heap.java:373)
        at weblogic.store.io.file.FileStoreIO.open(FileStoreIO.java:145)
        ... 9 more

>
<Sep 15, 2017 5:20:30 AM EDT> <Critical> <Health> <BEA-310006> <Critical subsystem PersistentStore.WLS_DIAGNOSTICS has failed. Setting server state to FAILED.
Reason: weblogic.store.PersistentStoreFatalException: [Store:280105]The persistent file store "WLS_DIAGNOSTICS" cannot open file WLS_DIAGNOSTICS000000.DAT.>
***************************************************************************
The WebLogic Server encountered a critical failure
Reason: Assertion violated
***************************************************************************
Exception in thread "main" java.lang.NoClassDefFoundError: Could not initialize class weblogic.protocol.ServerIdentityManager$Initializer
        at weblogic.protocol.ServerIdentityManager.findServerIdentity(ServerIdentityManager.java:66)
        at weblogic.protocol.URLManager.findAdministrationURL(URLManager.java:174)
        at weblogic.server.ServerLifeCycleRuntime.getLifeCycleOperationsRemote(ServerLifeCycleRuntime.java:1124)
        at weblogic.t3.srvr.ServerRuntime.sendStateToAdminServer(ServerRuntime.java:432)
        at weblogic.t3.srvr.ServerRuntime.updateRunState(ServerRuntime.java:418)
        at weblogic.t3.srvr.T3Srvr.setState(T3Srvr.java:208)
        at weblogic.t3.srvr.T3Srvr.run(T3Srvr.java:484)
        at weblogic.Server.main(Server.java:74)
When:
         This error has appeared during WL startup:
          <BEA-141297> <Could not get the server file lock. Ensure that another server is not running in the same directory. Retrying for another 60 seconds.>
          Then WL was shutdown.
          Then file granite-core.lok was removed.
          Finally, first startup of WL was tried after those steps.
So:
          Just shutdown WL once again and startup it.
What:
tail -200 $DOMAIN/logs/wls_granite_core.log

<Error> <Deployer> <BEA-149205> <Failed to initialize the application "lnp2vm_region2_xsql" due to error weblogic.application.ModuleException: weblogic.common.ResourceException: weblogic.common.ResourceException: Could not create pool connection. The DBMS driver exception was: IO Error: The Network Adapter could not establish the connection
weblogic.application.ModuleException: weblogic.common.ResourceException: weblogic.common.ResourceException: Could not create pool connection. The DBMS driver exception was: IO Error: The Network Adapter could not establish the connection
        at weblogic.jdbc.module.JDBCModule.prepare(JDBCModule.java:338)
        at weblogic.application.internal.flow.ModuleListenerInvoker.prepare(ModuleListenerInvoker.java:100)
        at weblogic.application.internal.flow.ModuleStateDriver$1.next(ModuleStateDriver.java:172)
        at weblogic.application.internal.flow.ModuleStateDriver$1.next(ModuleStateDriver.java:167)
        at weblogic.application.utils.StateMachineDriver.nextState(StateMachineDriver.java:42)
        Truncated. see log file for complete stacktrace
Caused By: weblogic.common.ResourceException: weblogic.common.ResourceException: Could not create pool connection. The DBMS driver exception was: IO Error: The Network Adapter could not establish the connection
        at weblogic.jdbc.common.internal.ConnectionEnvFactory.createResource(ConnectionEnvFactory.java:349)
        at weblogic.common.resourcepool.ResourcePoolImpl.makeResources(ResourcePoolImpl.java:1309)
        at weblogic.common.resourcepool.ResourcePoolImpl.makeResources(ResourcePoolImpl.java:1226)
        at weblogic.common.resourcepool.ResourcePoolImpl.start(ResourcePoolImpl.java:240)
        at weblogic.jdbc.common.internal.ConnectionPool.doStart(ConnectionPool.java:1566)
        Truncated. see log file for complete stacktrace
>
weblogic.application.ModuleException: java.net.ConnectException: Connection refused
        at weblogic.jdbc.module.JDBCModule.prepare(JDBCModule.java:338)
        at weblogic.application.internal.flow.ModuleListenerInvoker.prepare(ModuleListenerInvoker.java:100)

<Sep 14, 2017 2:44:07 AM EDT> <Error> <Deployer> <BEA-149205> <Failed to initialize the application "planet_common" due to error weblogic.application.ModuleException: java.net.ConnectException: Connection refused
weblogic.application.ModuleException: java.net.ConnectException: Connection refused
        at weblogic.jdbc.module.JDBCModule.prepare(JDBCModule.java:338)
        at weblogic.application.internal.flow.ModuleListenerInvoker.prepare(ModuleListenerInvoker.java:100)
        at weblogic.application.internal.flow.ModuleStateDriver$1.next(ModuleStateDriver.java:172)
        at weblogic.application.internal.flow.ModuleStateDriver$1.next(ModuleStateDriver.java:167)
        at weblogic.application.utils.StateMachineDriver.nextState(StateMachineDriver.java:42)
        Truncated. see log file for complete stacktrace
Caused By: java.net.ConnectException: Connection refused
        at java.net.PlainSocketImpl.socketConnect(Native Method)
        at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:344)
        at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:200)
        at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:182)
        at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)
        Truncated. see log file for complete stacktrace

When:
          Starting WL in the Granite env/
So:
          Oracle listener didn't have appropriate DB registered.
What:
tail -200 $DOMAIN/logs/wls_granite_core.log

[]|[]|[13 Sep 2017 12:14:01,457]|[com.granite.opi.services.ejb.tool.OpiToolBox]|[[ACTIVE] ExecuteThread: '13' for queue: 'weblogic.kernel.Default (self-tuning)']|[WARN]|[You do not have access permissions to do this action]

[]|[]|[13 Sep 2017 12:17:06,794]|[com.granite.middle.util.MTaccess]|[[ACTIVE] ExecuteThread: '24' for queue: 'weblogic.kernel.Default (self-tuning)']|[WARN]|[Can't load client info for 17953766000011]

The authenticity of host 'nighthawk (128.96.247.91)' can't be established.
RSA key fingerprint is 4f:3d:27:0e:b8:79:ce:25:57:a9:0f:9b:da:05:95:14.
Are you sure you want to continue connecting (yes/no)? The authenticity of host 'nighthawk (128.96.247.91)' can't be established.
RSA key fingerprint is 4f:3d:27:0e:b8:79:ce:25:57:a9:0f:9b:da:05:95:14.
Are you sure you want to continue connecting (yes/no)? []|[]|[13 Sep 2017 12:19:35,071]|[com.granite.opi.services.ejb.tool.OpiToolBox]|[[ACTIVE] ExecuteThread: '6' for queue: 'weblogic.kernel.Default (self-tuning)']|[WARN]|[You do not have access permissions to do this action]
When:
         Only in clustered WL env:
           1) When "user" has been selected via admin client;
          2) Via client: when wcid list has been requested (one time it worked, next time it didn't);
          All was fine if only (any) 1 managed weblogic server has been started in the cluster.
So:
          GI license workaround was in use instead of full GI license.
What:
          tail -200 $LEISDIR/planetbg1/log/tcb.log

2017-09-13 06:52:53,203 0     [main] INFO          TCBProcessor - TaperCodeBackgroundProcessor starting
2017-09-13 06:52:56,631 3428  [main] ERROR         TCBProcessor - TaperCodeBGProcessor cannot retrieve pending wire centers - Pair Update processing cannot be done for region region2 - Exception is: com.granite.bdl.ExecutionException: IIOPAdapter.IIOPSiteAdapter.list.NonFatalException : You do not have access permissions to do this action


          cat $LEISDIR/planetbg1/log/tcbStdErr.log

com.granite.bdl.ExecutionException: IIOPAdapter.IIOPSiteAdapter.list.NonFatalException : You do not have access permissions to do this action
        at com.granite.bdl.protocol.IIOP.adapter.IIOPSiteAdapter.list(IIOPSiteAdapter.java:62)
        at com.granite.bdl.protocol.SiteImpl.list(SiteImpl.java:3084)
        at com.telcordia.planet.bdl.WireCenterBDL.getActiveWireCenters(WireCenterBDL.java:44)
        at com.telcordia.planet.tc.TaperCodeBGProcessor.checkForTCWork(TaperCodeBGProcessor.java:170)
        at com.telcordia.planet.tc.TaperCodeBGProcessor.process(TaperCodeBGProcessor.java:139)
        at com.telcordia.planet.tc.TaperCodeBGProcessor.main(TaperCodeBGProcessor.java:112)
Caused by: You do not have access permissions to do this action
        at weblogic.utils.StackTraceDisabled.unknownMethod()
Caused by: You do not have access permissions to do this action
When:
          First starting of tcb process at the just installed LEIS-NP env.
So:
          GI license workaround was in use instead of full GI license.
What:
tail -f $DOMAIN/logs/wls_granite_core-2.log

<BEA-141297> <Could not get the server file lock. Ensure that another server is not running in the same directory. Retrying for another 60 seconds.>
When:
          Starting MWL management server at WebLogic.
So:
          The error means that there is a file lock that could not be released, as the server was previously not shut down correctly.
log as weblogic on the APP server (appropriate env)
cd $DOMAIN
find . -name tmp
     ./servers/admin/tmp
     ./servers/granite_core/tmp
     ./servers/granite_core-2/tmp
     ./tmp
go to the tmp dir of necessary MWL
cd ./servers/granite_core-2/tmp
rm granite_core-2.lok
restart necessary MWL
What:
tail -f $DOMAIN/logs/wls_granite_core.log

[]|[]|[11 Sep 2017 11:13:08,727]|[com.granite.util.cache.JMSDistributedCache]|[[ACTIVE] ExecuteThread: '9' for queue: 'weblogic.kernel.Default (self-tuning)']|[ERROR]|[Could not lookup xng/jms/topic/common-utility/udc-cache]

com.granite.util.locator.ServiceLocatorException: While trying to lookup 'xng.jms.topic.common-utility.udc-cache' didn't find subcontext 'common-utility'. Resolved 'xng.jms.topic'
        at com.granite.util.locator.AbstractServiceLocator.getRemoteObject(AbstractServiceLocator.java:409)
        at com.granite.util.locator.AbstractServiceLocator.doCachedLookup(AbstractServiceLocator.java:605)
        at com.granite.util.locator.TopicLocator.lookUpTopic(TopicLocator.java:154)
        at com.granite.util.locator.XNGServiceLocator.lookUpTopic(XNGServiceLocator.java:509)
        at com.granite.util.cache.JMSDistributedCache.<init>(JMSDistributedCache.java:67)
        at com.granite.udc.services.cache.UDCCache.<init>(UDCCache.java:70)
        at com.granite.udc.services.cache.UDCCache.<clinit>(UDCCache.java:53)
        at com.granite.udc.services.registry.UDCSupportRegistryCache.registerEntry(UDCSupportRegistryCache.java:50)
        at com.granite.udc.services.ejb.UDCSupportRegistryBean.addEntry(UDCSupportRegistryBean.java:44)
        at com.granite.udc.services.ejb.UDCSupportRegistryEJB_2qowj7_EOImpl.__WL_invoke(Unknown Source)
        at weblogic.ejb.container.internal.SessionRemoteMethodInvoker.invoke(SessionRemoteMethodInvoker.java:34)
        at com.granite.udc.services.ejb.UDCSupportRegistryEJB_2qowj7_EOImpl.addEntry(Unknown Source)
        at com.granite.udc.services.registry.UDCSupportRegistryTool.addEntry(UDCSupportRegistryTool.java:65)
        at com.granite.udc.services.registry.UDCRegistryInitializationServlet.init(UDCRegistryInitializationServlet.java:321)
        at javax.servlet.GenericServlet.init(GenericServlet.java:240)
        at weblogic.servlet.internal.StubSecurityHelper$ServletInitAction.run(StubSecurityHelper.java:337)
        at weblogic.servlet.internal.StubSecurityHelper$ServletInitAction.run(StubSecurityHelper.java:288)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        at weblogic.servlet.internal.StubSecurityHelper.initServletInstance(StubSecurityHelper.java:98)
        at weblogic.servlet.internal.StubSecurityHelper.createServlet(StubSecurityHelper.java:86)
        at weblogic.servlet.internal.StubLifecycleHelper.createOneInstance(StubLifecycleHelper.java:74)
        at weblogic.servlet.internal.StubLifecycleHelper.<init>(StubLifecycleHelper.java:60)
        at weblogic.servlet.internal.StubLifecycleHelper.<init>(StubLifecycleHelper.java:34)
        at weblogic.servlet.internal.ServletStubImpl.initStubLifecycleHelper(ServletStubImpl.java:652)
        at weblogic.servlet.internal.ServletStubImpl.prepareServlet(ServletStubImpl.java:593)
        at weblogic.servlet.internal.WebAppServletContext.preloadServlet(WebAppServletContext.java:1924)
        at weblogic.servlet.internal.WebAppServletContext.loadServletsOnStartup(WebAppServletContext.java:1901)
        at weblogic.servlet.internal.WebAppServletContext.preloadResources(WebAppServletContext.java:1791)
        at weblogic.servlet.internal.WebAppServletContext.start(WebAppServletContext.java:2807)
        at weblogic.servlet.internal.WebAppModule.startContexts(WebAppModule.java:1661)
        at weblogic.servlet.internal.WebAppModule.start(WebAppModule.java:822)
        at weblogic.application.internal.ExtensibleModuleWrapper$StartStateChange.next(ExtensibleModuleWrapper.java:360)
        at weblogic.application.internal.ExtensibleModuleWrapper$StartStateChange.next(ExtensibleModuleWrapper.java:356)
        at weblogic.application.utils.StateMachineDriver.nextState(StateMachineDriver.java:42)
        at weblogic.application.internal.ExtensibleModuleWrapper.start(ExtensibleModuleWrapper.java:138)
        at weblogic.application.internal.flow.ModuleListenerInvoker.start(ModuleListenerInvoker.java:124)
        at weblogic.application.internal.flow.ModuleStateDriver$3.next(ModuleStateDriver.java:213)
        at weblogic.application.internal.flow.ModuleStateDriver$3.next(ModuleStateDriver.java:208)
        at weblogic.application.utils.StateMachineDriver.nextState(StateMachineDriver.java:42)
        at weblogic.application.internal.flow.ModuleStateDriver.start(ModuleStateDriver.java:70)
        at weblogic.application.internal.flow.StartModulesFlow.activate(StartModulesFlow.java:24)
        at weblogic.application.internal.BaseDeployment$2.next(BaseDeployment.java:729)
        at weblogic.application.utils.StateMachineDriver.nextState(StateMachineDriver.java:42)
        at weblogic.application.internal.BaseDeployment.activate(BaseDeployment.java:258)
        at weblogic.application.internal.EarDeployment.activate(EarDeployment.java:61)
        at weblogic.application.internal.DeploymentStateChecker.activate(DeploymentStateChecker.java:165)
        at weblogic.deploy.internal.targetserver.AppContainerInvoker.activate(AppContainerInvoker.java:80)
        at weblogic.deploy.internal.targetserver.operations.AbstractOperation.activate(AbstractOperation.java:586)
        at weblogic.deploy.internal.targetserver.operations.ActivateOperation.activateDeployment(ActivateOperation.java:148)
        at weblogic.deploy.internal.targetserver.operations.ActivateOperation.doCommit(ActivateOperation.java:114)
        at weblogic.deploy.internal.targetserver.operations.StartOperation.doCommit(StartOperation.java:151)
        at weblogic.deploy.internal.targetserver.operations.AbstractOperation.commit(AbstractOperation.java:339)
        at weblogic.deploy.internal.targetserver.DeploymentManager.handleDeploymentCommit(DeploymentManager.java:846)
        at weblogic.deploy.internal.targetserver.DeploymentManager.activateDeploymentList(DeploymentManager.java:1275)
        at weblogic.deploy.internal.targetserver.DeploymentManager.handleCommit(DeploymentManager.java:442)
        at weblogic.deploy.internal.targetserver.DeploymentServiceDispatcher.commit(DeploymentServiceDispatcher.java:176)
        at weblogic.deploy.service.internal.targetserver.DeploymentReceiverCallbackDeliverer.doCommitCallback(DeploymentReceiverCallbackDeliverer.java:195)
        at weblogic.deploy.service.internal.targetserver.DeploymentReceiverCallbackDeliverer.access$100(DeploymentReceiverCallbackDeliverer.java:13)
        at weblogic.deploy.service.internal.targetserver.DeploymentReceiverCallbackDeliverer$2.run(DeploymentReceiverCallbackDeliverer.java:68)
        at weblogic.work.SelfTuningWorkManagerImpl$WorkAdapterImpl.run(SelfTuningWorkManagerImpl.java:550)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
Caused by: javax.naming.NameNotFoundException: While trying to lookup 'xng.jms.topic.common-utility.udc-cache' didn't find subcontext 'common-utility'. Resolved 'xng.jms.topic'; remaining name 'common-utility/udc-cache'
        at weblogic.jndi.internal.BasicNamingNode.newNameNotFoundException(BasicNamingNode.java:1180)
        at weblogic.jndi.internal.BasicNamingNode.lookupHere(BasicNamingNode.java:265)
        at weblogic.jndi.internal.ServerNamingNode.lookupHere(ServerNamingNode.java:187)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:210)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.WLEventContextImpl.lookup(WLEventContextImpl.java:253)
        at weblogic.jndi.internal.WLContextImpl.lookup(WLContextImpl.java:426)
        at javax.naming.InitialContext.lookup(InitialContext.java:411)
        at com.granite.util.locator.AbstractServiceLocator.getRemoteObject(AbstractServiceLocator.java:370)
        ... 63 more

[]|[]|[11 Sep 2017 11:13:13,631]|[com.granite.util.session.JMSUtilityBean]|[[ACTIVE] ExecuteThread: '9' for queue: 'weblogic.kernel.Default (self-tuning)']|[WARN]|[Unable to publish to topic.]

javax.naming.NameNotFoundException: While trying to lookup 'xng.jms.topic.core-services.pingMonitor' didn't find subcontext 'core-services'. Resolved 'xng.jms.topic'; remaining name 'core-services/pingMonitor'
        at weblogic.jndi.internal.BasicNamingNode.newNameNotFoundException(BasicNamingNode.java:1180)
        at weblogic.jndi.internal.BasicNamingNode.lookupHere(BasicNamingNode.java:265)
        at weblogic.jndi.internal.ServerNamingNode.lookupHere(ServerNamingNode.java:187)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:210)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.WLEventContextImpl.lookup(WLEventContextImpl.java:253)
        at weblogic.jndi.internal.WLContextImpl.lookup(WLContextImpl.java:426)
        at javax.naming.InitialContext.lookup(InitialContext.java:411)
        at com.granite.util.jms.JMSConnectionHelper.findDestination(JMSConnectionHelper.java:79)
        at com.granite.util.jms.JMSConnectionHelper.createProducer(JMSConnectionHelper.java:240)
        at com.granite.util.jms.JMSConnectionHelper.sendMessage(JMSConnectionHelper.java:269)
        at com.granite.util.session.JMSUtilityBean.doPublishTopicMessage(JMSUtilityBean.java:169)
        at com.granite.util.session.JMSUtilityBean.publishTopicMessageInNewTransaction(JMSUtilityBean.java:183)
        at com.granite.util.session.JMSUtilityEJB_g8yb77_EOImpl.__WL_invoke(Unknown Source)
        at weblogic.ejb.container.internal.SessionRemoteMethodInvoker.invoke(SessionRemoteMethodInvoker.java:34)
        at com.granite.util.session.JMSUtilityEJB_g8yb77_EOImpl.publishTopicMessageInNewTransaction(Unknown Source)
        at com.granite.middle.logic.JMSPublisherLogic.publishMessage(JMSPublisherLogic.java:129)
        at com.granite.middle.util.MTaccess.sendMsg(MTaccess.java:1429)
        at com.granite.middle.util.MTaccess.<clinit>(MTaccess.java:389)
        at com.granite.middle.management.GraniteMTSessions.preRegister(GraniteMTSessions.java:335)
        at com.sun.jmx.interceptor.DefaultMBeanServerInterceptor.preRegister(DefaultMBeanServerInterceptor.java:1007)
        at com.sun.jmx.interceptor.DefaultMBeanServerInterceptor.registerDynamicMBean(DefaultMBeanServerInterceptor.java:919)
        at com.sun.jmx.interceptor.DefaultMBeanServerInterceptor.registerObject(DefaultMBeanServerInterceptor.java:900)
        at com.sun.jmx.interceptor.DefaultMBeanServerInterceptor.registerMBean(DefaultMBeanServerInterceptor.java:324)
        at com.sun.jmx.mbeanserver.JmxMBeanServer.registerMBean(JmxMBeanServer.java:522)
        at weblogic.management.jmx.mbeanserver.WLSMBeanServerInterceptorBase$27.run(WLSMBeanServerInterceptorBase.java:714)
        at java.security.AccessController.doPrivileged(Native Method)
        at weblogic.management.jmx.mbeanserver.WLSMBeanServerInterceptorBase.registerMBean(WLSMBeanServerInterceptorBase.java:709)
        at weblogic.management.mbeanservers.internal.JMXContextInterceptor.registerMBean(JMXContextInterceptor.java:445)
        at weblogic.management.jmx.mbeanserver.WLSMBeanServerInterceptorBase$27.run(WLSMBeanServerInterceptorBase.java:712)
        at java.security.AccessController.doPrivileged(Native Method)
        at weblogic.management.jmx.mbeanserver.WLSMBeanServerInterceptorBase.registerMBean(WLSMBeanServerInterceptorBase.java:709)
        at weblogic.management.jmx.mbeanserver.WLSMBeanServer.registerMBean(WLSMBeanServer.java:462)
        at com.telcordia.granite.platform.management.framework.deployer.MBeanServerResourceDeployer.deployResource(MBeanServerResourceDeployer.java:66)
        at com.telcordia.granite.platform.management.framework.manager.ResourceManagerImpl.deployResource(ResourceManagerImpl.java:118)
        at com.telcordia.granite.platform.management.framework.control.ManagementControlImpl.startMBean(ManagementControlImpl.java:152)
        at com.telcordia.granite.platform.management.framework.control.ManagementControlImpl.start(ManagementControlImpl.java:109)
        at com.telcordia.granite.platform.management.framework.control.ManagementControlImpl.start(ManagementControlImpl.java:78)
        at com.telcordia.granite.platform.management.framework.control.ManagementServletContextListener.contextInitialized(ManagementServletContextListener.java:86)
        at weblogic.servlet.internal.EventsManager$FireContextListenerAction.run(EventsManager.java:661)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        at weblogic.servlet.internal.EventsManager.executeContextListener(EventsManager.java:241)
        at weblogic.servlet.internal.EventsManager.notifyContextCreatedEvent(EventsManager.java:198)
        at weblogic.servlet.internal.EventsManager.notifyContextCreatedEvent(EventsManager.java:183)
        at weblogic.servlet.internal.WebAppServletContext.preloadResources(WebAppServletContext.java:1783)
        at weblogic.servlet.internal.WebAppServletContext.start(WebAppServletContext.java:2807)
        at weblogic.servlet.internal.WebAppModule.startContexts(WebAppModule.java:1661)
        at weblogic.servlet.internal.WebAppModule.start(WebAppModule.java:822)
        at weblogic.application.internal.ExtensibleModuleWrapper$StartStateChange.next(ExtensibleModuleWrapper.java:360)
        at weblogic.application.internal.ExtensibleModuleWrapper$StartStateChange.next(ExtensibleModuleWrapper.java:356)
        at weblogic.application.utils.StateMachineDriver.nextState(StateMachineDriver.java:42)
        at weblogic.application.internal.ExtensibleModuleWrapper.start(ExtensibleModuleWrapper.java:138)
        at weblogic.application.internal.flow.ModuleListenerInvoker.start(ModuleListenerInvoker.java:124)
        at weblogic.application.internal.flow.ModuleStateDriver$3.next(ModuleStateDriver.java:213)
        at weblogic.application.internal.flow.ModuleStateDriver$3.next(ModuleStateDriver.java:208)
        at weblogic.application.utils.StateMachineDriver.nextState(StateMachineDriver.java:42)
        at weblogic.application.internal.flow.ModuleStateDriver.start(ModuleStateDriver.java:70)
        at weblogic.application.internal.flow.StartModulesFlow.activate(StartModulesFlow.java:24)
        at weblogic.application.internal.BaseDeployment$2.next(BaseDeployment.java:729)
        at weblogic.application.utils.StateMachineDriver.nextState(StateMachineDriver.java:42)
        at weblogic.application.internal.BaseDeployment.activate(BaseDeployment.java:258)
        at weblogic.application.internal.EarDeployment.activate(EarDeployment.java:61)
        at weblogic.application.internal.DeploymentStateChecker.activate(DeploymentStateChecker.java:165)
        at weblogic.deploy.internal.targetserver.AppContainerInvoker.activate(AppContainerInvoker.java:80)
        at weblogic.deploy.internal.targetserver.operations.AbstractOperation.activate(AbstractOperation.java:586)
        at weblogic.deploy.internal.targetserver.operations.ActivateOperation.activateDeployment(ActivateOperation.java:148)
        at weblogic.deploy.internal.targetserver.operations.ActivateOperation.doCommit(ActivateOperation.java:114)
        at weblogic.deploy.internal.targetserver.operations.StartOperation.doCommit(StartOperation.java:151)
        at weblogic.deploy.internal.targetserver.operations.AbstractOperation.commit(AbstractOperation.java:339)
        at weblogic.deploy.internal.targetserver.DeploymentManager.handleDeploymentCommit(DeploymentManager.java:846)
        at weblogic.deploy.internal.targetserver.DeploymentManager.activateDeploymentList(DeploymentManager.java:1275)
        at weblogic.deploy.internal.targetserver.DeploymentManager.handleCommit(DeploymentManager.java:442)
        at weblogic.deploy.internal.targetserver.DeploymentServiceDispatcher.commit(DeploymentServiceDispatcher.java:176)
        at weblogic.deploy.service.internal.targetserver.DeploymentReceiverCallbackDeliverer.doCommitCallback(DeploymentReceiverCallbackDeliverer.java:195)
        at weblogic.deploy.service.internal.targetserver.DeploymentReceiverCallbackDeliverer.access$100(DeploymentReceiverCallbackDeliverer.java:13)
        at weblogic.deploy.service.internal.targetserver.DeploymentReceiverCallbackDeliverer$2.run(DeploymentReceiverCallbackDeliverer.java:68)
        at weblogic.work.SelfTuningWorkManagerImpl$WorkAdapterImpl.run(SelfTuningWorkManagerImpl.java:550)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)

<Sep 12, 2017 4:23:50 AM EDT> <Warning> <EJB> <BEA-010202> <Call-by-reference is not enabled for EJB WorkflowEJB. The server will have better performance if it is enabled. To enable call-by-reference, set the enable-call-by-reference element to True in the weblogic-ejb-jar.xml deployment descriptor or corresponding annotation for this EJB.>
<Sep 12, 2017 4:23:50 AM EDT> <Warning> <EJB> <BEA-010202> <Call-by-reference is not enabled for EJB ObjSyncTxManagerEJB. The server will have better performance if it is enabled. To enable call-by-reference, set the enable-call-by-reference element to True in the weblogic-ejb-jar.xml deployment descriptor or corresponding annotation for this EJB.>
<Sep 12, 2017 4:26:32 AM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB ImportWorkflowMDB is unable to connect to the JMS destination xng/jms/queue/obj-sync/import-workflow. The Error was:
The destination for the MessageDrivenBean ImportWorkflowMDB(Application: XNG-bea-weblogic-12.1, EJBComponent: obj-sync-services-ejb.jar) could not be resolved at this time. Please ensure the destination is  available at the JNDI name xng/jms/queue/obj-sync/import-workflow.  The EJB container will periodically attempt to resolve this MessageDrivenBean destination and additional warnings may be issued.>
<Sep 12, 2017 4:26:32 AM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB MailSenderEJB is unable to connect to the JMS destination xng/jms/queue/core-services/mail-sender. The Error was:
The destination for the MessageDrivenBean MailSenderEJB(Application: XNG-bea-weblogic-12.1, EJBComponent: core-services-ejb.jar) could not be resolved at this time. Please ensure the destination is  available at the JNDI name xng/jms/queue/core-services/mail-sender.  The EJB container will periodically attempt to resolve this MessageDrivenBean destination and additional warnings may be issued.>
<Sep 12, 2017 4:26:32 AM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB AdapterMonitorEJB is unable to connect to the JMS destination xng/jms/topic/core-services/adapterMonitor. The Error was:
The destination for the MessageDrivenBean AdapterMonitorEJB(Application: XNG-bea-weblogic-12.1, EJBComponent: core-services-ejb.jar) could not be resolved at this time. Please ensure the destination is  available at the JNDI name xng/jms/topic/core-services/adapterMonitor.  The EJB container will periodically attempt to resolve this MessageDrivenBean destination and additional warnings may be issued.>
<Sep 12, 2017 4:26:32 AM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB XngEventsMDBean2 is unable to connect to the JMS destination xng/jms/queue/core-services/events-driver2. The Error was:
The destination for the MessageDrivenBean XngEventsMDBean2(Application: XNG-bea-weblogic-12.1, EJBComponent: event-services2-ejb.jar) could not be resolved at this time. Please ensure the destination is  available at the JNDI name xng/jms/queue/core-services/events-driver2.  The EJB container will periodically attempt to resolve this MessageDrivenBean destination and additional warnings may be issued.>
<Sep 12, 2017 4:26:32 AM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB JMSDistributedCacheEJB is unable to connect to the JMS destination xng/jms/topic/common-utility/udc-cache. The Error was:
The destination for the MessageDrivenBean JMSDistributedCacheEJB(Application: XNG-bea-weblogic-12.1, EJBComponent: common-ejb.jar) could not be resolved at this time. Please ensure the destination is  available at the JNDI name xng/jms/topic/common-utility/udc-cache.  The EJB container will periodically attempt to resolve this MessageDrivenBean destination and additional warnings may be issued.>
<Sep 12, 2017 4:26:32 AM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB SynchronizationEJB is unable to connect to the JMS destination xng/jms/topic/core-services/pingMonitor. The Error was:
The destination for the MessageDrivenBean SynchronizationEJB(Application: XNG-bea-weblogic-12.1, EJBComponent: core-services-ejb.jar) could not be resolved at this time. Please ensure the destination is  available at the JNDI name xng/jms/topic/core-services/pingMonitor.  The EJB container will periodically attempt to resolve this MessageDrivenBean destination and additional warnings may be issued.>
<Sep 12, 2017 4:26:32 AM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB ImportWorkunitMDB is unable to connect to the JMS destination xng/jms/queue/obj-sync/import-workunit. The Error was:
The destination for the MessageDrivenBean ImportWorkunitMDB(Application: XNG-bea-weblogic-12.1, EJBComponent: obj-sync-services-ejb.jar) could not be resolved at this time. Please ensure the destination is  available at the JNDI name xng/jms/queue/obj-sync/import-workunit.  The EJB container will periodically attempt to resolve this MessageDrivenBean destination and additional warnings may be issued.>
<Sep 12, 2017 4:26:32 AM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB LoggingConfigurationMonitorEJB is unable to connect to the JMS destination xng/jms/topic/core-services/dynamicLoggingConfigurationTopic. The Error was:
The destination for the MessageDrivenBean LoggingConfigurationMonitorEJB(Application: XNG-bea-weblogic-12.1, EJBComponent: core-services-ejb.jar) could not be resolved at this time. Please ensure the destination is  available at the JNDI name xng/jms/topic/core-services/dynamicLoggingConfigurationTopic.  The EJB container will periodically attempt to resolve this MessageDrivenBean destination and additional warnings may be issued.>
<Sep 12, 2017 4:26:32 AM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB PluginTimerExecutionEJB is unable to connect to the JMS destination xng/jms/queue/core-services/plugin-timer-execution. The Error was:
The destination for the MessageDrivenBean PluginTimerExecutionEJB(Application: XNG-bea-weblogic-12.1, EJBComponent: core-services-ejb.jar) could not be resolved at this time. Please ensure the destination is  available at the JNDI name xng/jms/queue/core-services/plugin-timer-execution.  The EJB container will periodically attempt to resolve this MessageDrivenBean destination and additional warnings may be issued.>
<Sep 12, 2017 4:26:32 AM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB QueuedUpdateEJB is unable to connect to the JMS destination xng/jms/queue/core-services/queuedUpdate. The Error was:
The destination for the MessageDrivenBean QueuedUpdateEJB(Application: XNG-bea-weblogic-12.1, EJBComponent: core-services-ejb.jar) could not be resolved at this time. Please ensure the destination is  available at the JNDI name xng/jms/queue/core-services/queuedUpdate.  The EJB container will periodically attempt to resolve this MessageDrivenBean destination and additional warnings may be issued.>
<Sep 12, 2017 4:26:32 AM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB UDCChangeEventEJB is unable to connect to the JMS destination xng/jms/queue/core-services/udc-change-event. The Error was:
The destination for the MessageDrivenBean UDCChangeEventEJB(Application: XNG-bea-weblogic-12.1, EJBComponent: core-services-ejb.jar) could not be resolved at this time. Please ensure the destination is  available at the JNDI name xng/jms/queue/core-services/udc-change-event.  The EJB container will periodically attempt to resolve this MessageDrivenBean destination and additional warnings may be issued.>
<Sep 12, 2017 4:26:32 AM EDT> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB XngEventsMDBean is unable to connect to the JMS destination xng/jms/queue/core-services/events-driver. The Error was:
The destination for the MessageDrivenBean XngEventsMDBean(Application: XNG-bea-weblogic-12.1, EJBComponent: event-services-ejb.jar) could not be resolved at this time. Please ensure the destination is  available at the JNDI name xng/jms/queue/core-services/events-driver.  The EJB container will periodically attempt to resolve this MessageDrivenBean destination and additional warnings may be issued.>
When:
                    Starting just deployed XNG-bea-weblogic-12.1.ear on the new CLUSTERED LEIS-NP env.
So:
                    Make sure that:
                       1) This subdeployment is present 
                          JMS Modules link -> xngJMSModule link -> Subdeployments tab ->  xngJMSSubdeployment
                        2) All necessary resources are present (compare to other env):
                          JMS Modules link -> xngJMSModule link
                         3) Both this files are present for clustered env:
ls -la $DOMAIN | grep Xng
drwxrwxr-x   2 weblogic granite      512 Sep 12 04:11 Xng_config
drwxr-xr-x   2 weblogic granite      512 Sep 12 05:17 Xng_config2
4) Cluster is multicast, not unicast
What:
Output of the Ingres utility that delets rows from DB:

E_US1262 Your transaction has been aborted, because of a transaction log
    limit being reached, or because of administrator action (query cancel).


ingprenv  | grep II_CONFIG
II_CONFIG=/opt/ingres10.2_regr/ingres/files
tail -200 /opt/ingres10.2_regr/ingres/files/errlog.log
         
          E_QE0024_TRANSACTION_ABORTED  The transaction log file is full.  The transaction will be aborted.
          E_DM9059_TRAN_FORCE_ABORT     The transaction (00005943, 5A6F78D7) in database txhba is being force aborted.

When:
          Deleting of rows from the Ingres DB was tried. No result.
So:
Ingres size of transaction logs.
     #In essential: old transaction logs (both primary and dual) should be destroyed and re-created.   
ingstop
cbf
     Transaction Log (II_LOG_FILE) -> Configure -> Destroy -> Yes -> End    
     Transaction Log (II_DUAL_LOG) -> Configure -> Destroy -> Yes -> Create -> ...    
          Please enter the size (in megabytes)...
          500       
     ... -> End 
     Transaction Log (II_LOG_FILE) -> Configure -> Create -> End -> Quit           
ingstart
What:
proc  code=ANSI_C include=/lhome/bldadm/R9.0/include iname=db_funcs.pc
Pro*C/C++: Release 12.1.0.2.0 - Production on Wed Aug 30 11:13:04 2017
Copyright (c) 1982, 2014, Oracle and/or its affiliates.  All rights reserved.
System default option values taken from: /opt/vendor/oracle/product/12.1.0.2_leisnp_32c/precomp/admin/pcscfg.cfg
dbgc_init_all failed with ORA-48141
ORA-00600: internal error code, arguments: [17998], [2], [], [], [], [], [], [], [], [], [], []
ORA-00600: internal error code, arguments: [17998], [2], [], [], [], [], [], [], [], [], [], []
When:
          Building uplifted code for LEIS-NP (C-part) with just created DB 12.1.0.2 as user bldadm.
So:
          Bug 20406840 - PROC 12.1.0.2 THROWS ORA-600 [17998] WHEN PRECOMPILING BY 'OTHER' USER
          As per this bug, the ADR base returned by Diag doesn't allow users to write (wrong permission).
          There's patch.
          There's workaround:

Log as oracle on the DB server
bash
export ADR_BASE=$ORACLE_BASE ; echo $echo $ADR_BASE
mkdir -p $ADR_BASE/diag/plsql
chmod 777 $ADR_BASE/diag/plsql
ls -la $ADR_BASE/diag/plsql
What:
[WARNING] [INS-32008] Oracle base location cant be same as the user home directory.
   CAUSE: The specified Oracle base is same as the user home directory.
   ACTION: Provide an Oracle base location other than the user home directory.
When:
          ./runInstaller -ignorePrereq -showProgress -silent -responseFile $DWNLD_SOFT/unzip/db/database/response/db_install.rsp
So:
          Can be ignored: progress should go further.
What:
[FATAL] [INS-32025] The chosen installation conflicts with software already installed in the given Oracle home.
   CAUSE: The chosen installation conflicted with software already installed in the given Oracle home.
   ACTION: Install into a different Oracle home.
[WARNING] [INS-32008] Oracle base location cant be same as the user home directory.
   CAUSE: The specified Oracle base is same as the user home directory.
   ACTION: Provide an Oracle base location other than the user home directory.
When:
          ./runInstaller -ignorePrereq -showProgress -silent -responseFile $DWNLD_SOFT/unzip/db/database/response/db_install.rsp
So:
If <oraInventory path>=/opt/vendor/oracle
cp /opt/vendor/oracle/oraInventory/ContentsXML/inventory.xml /opt/vendor/oracle/oraInventory/ContentsXML/inventory.xml.$(date +%Y%m%d_%H%M)
vi /opt/vendor/oracle/oraInventory/ContentsXML/inventory.xml.$(date +%Y%m%d_%H%M)
Remove the line that contain the new ORACLE Home
Exit and re-run the installer.
What:
Testcase: testSetupForPath(com.granite.bdl.qa.mainobjects.PathTests): Caused an ERROR
IIOPAdapter.IIOPCardAdapter.insert.NonFatalException : The card is not valid for the specified piece of equipment
com.granite.bdl.ExecutionException: IIOPAdapter.IIOPCardAdapter.insert.NonFatalException : The card is not valid for the specified piece of equipment
at com.granite.bdl.protocol.IIOP.adapter.IIOPCardAdapter.insert(IIOPCardAdapter.java:125)
at com.granite.bdl.protocol.BaseCardImpl.insert(BaseCardImpl.java:3193)
at com.granite.bdl.protocol.BaseCardImpl.insert(BaseCardImpl.java:3185)
at com.granite.bdl.qa.mainobjects.AbstractMainObjectsTest.SetCardForObjTest(AbstractMainObjectsTest.java:362)
at com.granite.bdl.qa.mainobjects.PathTests.testSetupForPath(PathTests.java:72)
Caused by: The card is not valid for the specified piece of equipment
at weblogic.utils.StackTraceDisabled.unknownMethod()
Caused by: The card is not valid for the specified piece of equipment
When:
          Running automated GI test cases on just installed GI (withour any LEIS-NP).
So:
What:
The domain ID xcom_domain2 is not valid
When:
          Sveta's Granite tests use configs below to connect to the DB, each test raises error above.
junit.db.url=jdbc:oracle:thin:@lnp2vm.cc.telcordia.com:1522:xcom
junit.ejb.host=nighthawk.cc.telcordia.com
junit.ejb.port=7280
junit.ejb.dbhost=lnp2vm
junit.ejb.dbschema=install
junit.ejb.username=sysadm
junit.ejb.password=
So:
          Connect to the necessary Granite via admin client -> check User directory -> check sysadm user (which used by tests) -> click Domain Access -> See list of Assigned Domains. 
          Remove unnecessary domains which have been mentioned in the error.
What:
ORA-04092: cannot COMMIT in a trigger
ORA-06512: at "REGION2.AFT_INS_UDC_ATTR_DEF_TRIG", line 66
ORA-04088: error during execution of trigger 'REGION2.AFT_INS_UDC_ATTR_DEF_TRIG'
When:
          New trigger has been created on the table, where "Alter table" statement is present.
So:
          In general case commit cannot be raised withing trigger. "Alter table" initiates commit, so it can not be done in trigger.
          If "alter table" (or other commit initiator) still should be used, add this part to the trigger:

DECLARE
...
    pragma AUTONOMOUS_TRANSACTION;
BEGIN
...
END;
What:

tail -200 $LEISWEBDIR/logs/catalina.out

sh: /leis/test/R33.0/leis.att1/bin/simulate.exp: not found
When:
          Logging via Chrome to LEISWEB of just configured LEISWEB for LEIS 34.0 (LEIS 33.0 was installed on the same server previously)
So:
          It works fine in IE browser.
What:

tail -200 $LEISWEBDIR/logs/LeisWebModule.log

[ERROR][17/06/30 08:33:53] Failed to connect to database: IO Error: Invalid number format for port number in thread "http-bio-5081-exec-10"
java.sql.SQLRecoverableException: IO Error: Invalid number format for port number
        at oracle.jdbc.driver.T4CConnection.logon(T4CConnection.java:743)
        at oracle.jdbc.driver.PhysicalConnection.connect(PhysicalConnection.java:662)
        at oracle.jdbc.driver.T4CDriverExtension.getConnection(T4CDriverExtension.java:32)
        at oracle.jdbc.driver.OracleDriver.connect(OracleDriver.java:560)
        at java.sql.DriverManager.getConnection(DriverManager.java:664)
        at java.sql.DriverManager.getConnection(DriverManager.java:247)
        at com.telcordia.leis.jdbc.DBConnectionManager.getConnection(DBConnectionManager.java:85)
        at com.telcordia.leis.data.LeisHost.checkOutDBConnection(LeisHost.java:241)
        at com.telcordia.leis.data.LeisHost.loadWireCenterContexts(LeisHost.java:306)
        at com.telcordia.leis.data.LeisHost.<init>(LeisHost.java:99)
        at com.telcordia.leis.data.LeisHost.createInstance(LeisHost.java:50)
        at com.telcordia.leis.data.LeisHost.getInstance(LeisHost.java:37)
        at com.telcordia.leis.security.SecurityBean.verifyOnHost(SecurityBean.java:189)
        at com.telcordia.leis.security.SecurityBean.verify(SecurityBean.java:174)
        at org.apache.jsp.jsp.LoginControl_jsp._jspService(LoginControl_jsp.java:100)
        at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:731)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
        at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
        at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
        at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:220)
        at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:122)
        at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:505)
        at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:169)
        at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:103)
        at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116)
        at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:436)
        at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1078)
        at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:625)
        at org.apache.tomcat.util.net.JIoEndpoint$SocketProcessor.run(JIoEndpoint.java:316)
        at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
        at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
        at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
        at java.lang.Thread.run(Thread.java:745)
Caused by: oracle.net.ns.NetException: Invalid number format for port number
        at oracle.net.resolver.AddrResolution.resolveSimple(AddrResolution.java:615)
        at oracle.net.resolver.AddrResolution.resolveAndExecute(AddrResolution.java:482)
        at oracle.net.ns.NSProtocol.establishConnection(NSProtocol.java:595)
        at oracle.net.ns.NSProtocol.connect(NSProtocol.java:230)
        at oracle.jdbc.driver.T4CConnection.connect(T4CConnection.java:1452)
        at oracle.jdbc.driver.T4CConnection.logon(T4CConnection.java:496)
        ... 35 more
[ERROR][17/06/30 08:33:53] Exception in LeisHost.checkOutDBConnection(), dbname=leisadmin/LEISADMIN@RLOATT1 in thread "http-bio-5081-exec-10"
[ERROR][17/06/30 08:33:53] java.sql.SQLRecoverableException: IO Error: Invalid number format for port number in thread "http-bio-5081-exec-10"
[ERROR][17/06/30 08:33:53] LeisHost can't be initialized. in thread "http-bio-5081-exec-10"
[ERROR][17/06/30 08:33:53] Exception during login session: java.lang.NullPointerException in thread "http-bio-5081-exec-10"
When:
          Starting of just configured LEISWEB for LEIS 34.0
So:
          LEISWEB config file below wasn't updated:

                  $LEISWEBDIR/conf/leis.properties
< DBURL=jdbc:oracle:thin:@<HOST>:<JDBC PORT>:<Oracle SID>
> DBURL=jdbc:oracle:thin:@leis-np3:1522:RLOATT1
What:
ORA-00704: bootstrap process failure ORA-39700: database must be opened with UPGRADE option
When:
          There's DB nhwkpt (11.2.0.3), it has the backup.
          There's DB fiapt (11.2.0.4) that should be re-created from the backup of nhwkpt (11.2.0.3).
          Error appears during first startup of DB fiapt after it's restoring and recovering (because version of new DB differs from backup version).
So:
          After restoring and recovering from backup new DB is in the mount state.
          Proceed with steps below:

cd $ORACLE_HOME/rdbms/admin
sqlplus / as sysdba
startup upgrade
exit
nohup sqlplus / as sysdba @catupgrd.sql > /tmp/catupgrd.log 2>&1 &
startup
nohup sqlplus / as sysdba @utlrp.sql > /tmp/utlrp.log 2>&1 &
shutdown immediate
startup
What:
Xlib: connection to "128.96.247.53:0.0" refused by server
Xlib: No protocol specified
When:
          Starting any graphical utility (dbca, netca) on leis-np3 server (OS Solaris) with Xming graphical x-server on win8 virtual PC (OS Windows).
So:
          Xming has file X0 that contains list of the allowed servers.
          Add IP of leis-np3 to that list on the win8.
          Then restart Xming on the win8 server.
What:
BUILD FAILED
/app/build/build_granite_cvs/granite/xng/build.xml:500: The following error occurred while executing this line:
/app/build/build_granite_cvs/granite/xng/build.xml:654: The following error occurred while executing this line:
/app/build/build_granite_cvs/granite/xng/projects/core-services/build.xml:449: The following error occurred while executing this line:
/app/build/build_granite_cvs/granite/xng/projects/core-services/build.xml:651: The following error occurred while executing this line:
/app/build/build_granite_cvs/granite/xng/management.xml:18: taskdef A class needed by class com.telcordia.granite.platform.management.sdk.support.AptWithUpToDateTask cannot be found: org/apache/tools/ant/taskdefs/Apt
using the classloader AntClassLoader[/app/build/build_granite_cvs/granite/xng/build/archives/third-party/ant.jar:/app/build/build_granite_cvs/granite/xng/build/archives/third-party/velocity.jar:/app/build/build_granite_cvs/granite/xng/build/archives/third-party/eclipse-apt.jar:/app/build/build_granite_cvs/granite/xng/build/archives/third-party/commons-lang.jar:/app/build/build_granite_cvs/granite/xng/build/archives/third-party/commons-collections-3.1.jar:/app/build/build_granite_cvs/granite/xng/build/archives/third-party/log4j.jar:/app/build/build_granite_cvs/granite/xng/build/archives/third-party/granite-management-sdk.jar]
When:
          first GRANITE building with java 1.8 and ant 1.10
So:
          Cause:
          Changes from Ant 1.9.7 TO Ant 1.10.0:
                Changes that could break older environments:
          * The <apt> task has been removed since apt itself has been removed with Java8.
What:
LEIS-NP Web:

Error 500--Internal Server Error
From RFC 2068 Hypertext Transfer Protocol -- HTTP/1.1:
10.5.1 500 Internal Server Error
The server encountered an unexpected condition which prevented it from fulfilling the request.


tail -50 $DOMAIN/logs/wls_granite_core.log

<May 18, 2017 5:35:48 AM EDT> <Error> <HTTP> <BEA-101017> <[ServletContext@487454254[app:planet-bs module:planet-bs path:null spec-version:3.0]] Root cause of ServletException.
java.sql.SQLException: Could not rollback with auto-commit set on
        at oracle.jdbc.driver.PhysicalConnection.rollback(PhysicalConnection.java:2427)
        at oracle.jdbc.OracleConnectionWrapper.rollback(OracleConnectionWrapper.java:148)
        at weblogic.jdbc.wrapper.XAConnection.rollback(XAConnection.java:902)
        at weblogic.jdbc.wrapper.JTAConnection.rollback(JTAConnection.java:426)
        at com.telcordia.planet.leim.wirecenter.Project.list(Project.java:400)
        Truncated. see log file for complete stacktrace
When:
          LEIS-NP Web: Functions -> View WC Copy Projects
So:
          Autocommit behavior was changed in JDBC 12.1 to be compliant with the JDBC specification.
          Flag  -Doracle.jdbc.autoCommitSpecCompliant=false should be used to work with Oracle 12c.
          So edit WL start script:

               vi $DOMAIN/bin/setXngEnv.sh

                    JAVA_OPTIONS="${JAVA_OPTIONS} -Doracle.jdbc.autoCommitSpecCompliant=false -Dxng.log.server=${SERVER_NAME}"


What:

tail -f /leis/DATA/granite/PT805/lp05test/log/refresh.out

Add of new taper codes ...
20170512 10:33:31,373[main]INFO -       >>initBDL()
                              20170512 10:33:31,375[main]INFO -DB name:region2
                              20170512 10:33:33,577[main]FATAL-BDL startup Exception: IIOPAdapter.Session.makeClientService.InitializeSessionFailed : (ffff0000000e0003) The password is not correct.
                              20170512 10:33:33,577[main]FATAL-BDL startup Exception: IIOPAdapter.Session.makeClientService.InitializeSessionFailed : (ffff0000000e0003) The password is not correct.
                              Error: Add of new taper codes failed.
When:
          Running refresh (lfacs.refresh) for WC lp05test on the PT805 env on leis-np3 server (LEIS-NP 8.0.5)
So:
          Root cause: password for sysadm GRANITE user.
          Before this refresh it has been changed from standard "sysadm1!" to "".
          Refresh has been fixed after rolling back old password - it has been changed back from "" to "sysadm1!"
What:
java.lang.ArrayIndexOutOfBoundsException: 0
When:
          Some dev's GRANITE tests for LEIS-NP failed.
So:
         Sometimes it helps, sometime - it doesn't. !!! BUT IT DAMAGES CUSTOMER DATA: some vlr tables will be empty !!!
          There's script for VLR creation:

               /opt/vendor/telcordia/stage-dev2/dbscripts/install_rpt.ksh

                 *** VLR Creation Menu ***
                             (nhwkdev2 region2)

                --------- Common Schemas ---------
                1  = Create Users
                2  = Create Common Objects
                --------- Regional Schema --------
                3  = Load MetaData
                4  = Create VLR Tables  Completed
                5  = Create Tables
                6  = Create Indexes
                7  = Create Objects
                8  = Set Regional User
                --------- ESM Schema --------
                9  = ESM

          The error fixes after creation of VLR tables with this script (step 4 in menu above).

What:

LEIS-NP Web:

Error 500--Internal Server Error
From RFC 2068 Hypertext Transfer Protocol -- HTTP/1.1:
10.5.1 500 Internal Server Error
The server encountered an unexpected condition which prevented it from fulfilling the request.


tail -50 $DOMAIN/logs/wls_granite_core.log

<May 11, 2017 7:22:20 AM EDT> <Error> <HTTP> <BEA-101020> <[ServletContext@1025415295[app:planet-bs module:planet-bs path:null spec-version:3.0]] Servlet failed with an Exception
java.lang.NullPointerException
        at com.telcordia.planet.bdl.WireCenterBDL.isRefreshRunning(WireCenterBDL.java:140)
        at com.telcordia.planet.bean.BeanManager.getTaperCodeLock(BeanManager.java:60)
        at com.telcordia.planet.bean.TaperCodeAttrsBean.init(TaperCodeAttrsBean.java:75)
        at jsp_servlet._jsp.__tapercodeattrs._jspService(__tapercodeattrs.java:398)
        at weblogic.servlet.jsp.JspBase.service(JspBase.java:35)
        Truncated. see log file for complete stacktrace
When:
          LEIS-NP web:
               Taper code -> Taper code attributes attributes report.
So:
          Function below returns null ...

               udas.getAttribute(Wire Center Info, LFACS Refresh Msg)

          ... because appropriate granite table vlr_attr_group doesn't contain necessary value.

          This tables at region2 contains same data as appropriate table in region1, for instant.
          So let's just copy data between this tables:

               insert into region2.VAL_ATTR_GROUP select * from region1.VAL_ATTR_GROUP ;
               commit;
     
What:
Web LEIS-NP

F1 FACILITY UTILIZATION ERROR REPORT (f1fill)
null


tail -50 $DOMAIN/logs/wls_granite_core.log

2017-May-10 11:07:34 DEBUG MiddleTierCaller.java:189 -- runF1Fill started
LEISInvoker - System property PLANETBGENV not set - defaulting to leis@nighthawk
LEISInvoker - Environment Variable PLANETBGDIR not set - defaulting to /home/leis/planetbg
LEISInvoker - Moving file: /tmp/f1FillInput_sysadm_1494428854504 to env leis@nighthawk
The authenticity of host 'nighthawk (128.96.247.91)' can't be established.
RSA key fingerprint is 4f:3d:27:0e:b8:79:ce:25:57:a9:0f:9b:da:05:95:14.
Are you sure you want to continue connecting (yes/no)? LEISInvoker - File /tmp/f1FillInput_sysadm_1494428854504 moved
LEISInvoker - Starting remote processing: leis@nighthawk , /home/leis/planetbg/bin/leisInvoker.sh , f1fill , null , /tmp/f1FillInput_sysadm_1494428854504 at Wed May 10 11:07:35 EDT 2017
The authenticity of host 'nighthawk (128.96.247.91)' can't be established.
RSA key fingerprint is 4f:3d:27:0e:b8:79:ce:25:57:a9:0f:9b:da:05:95:14.
Are you sure you want to continue connecting (yes/no)? The authenticity of host 'nighthawk (128.96.247.91)' can't be established.
RSA key fingerprint is 4f:3d:27:0e:b8:79:ce:25:57:a9:0f:9b:da:05:95:14.
Are you sure you want to continue connecting (yes/no)? LEISInvoker - Finished processing: leis@nighthawk , /home/leis/planetbg/bin/leisInvoker.sh , f1fill , null , /tmp/f1FillInput_sysadm_1494428854504 at Wed May 10 11:07:36 EDT 2017
LEISInvoker - Removing workfile /tmp/f1FillInput_sysadm_1494428854504 from env leis@nighthawk
LEISInvoker - Finished removing workfile
2017-May-10 11:07:36 DEBUG MiddleTierCaller.java:199 -- runF1Fill finished
2017-May-10 11:07:36 DEBUG F1FillBean.java:282 -- run - null output
2017-May-10 11:07:36 FATAL F1FillBean.java:264 -- Cannot create the document
2017-May-10 11:07:41 DEBUG AppSession.java:395 -- Number of CSP cookies found = 1
2017-May-10 11:07:41 DEBUG AppSession.java:414 -- Bypassing cookie check
When:
          Running " F1 FACILITY UTILIZATION REPORT (f1fill)" for just created LEIS-NP env.
So:
          
         PLANETBGENV is not included in WL during startup - add it to standard startWebLogic.sh

stopMWL.sh
stopWL.sh

     #Update WL start script
    
          #take it from other env
         
cp $DOMAIN/bin/startWebLogic.sh $DOMAIN/bin/startWebLogic.sh.orig    
cp /app2/bea/user_projects/domains/granite-pt/bin/startWebLogic.sh $DOMAIN/bin/startWebLogic.sh

vi $DOMAIN/bin/startWebLogic.sh

     <     DOMAIN_HOME="/app2/bea/user_projects/domains/granite-pt"
     >     DOMAIN_HOME="/app2/bea/user_projects/domains/granite-dev2"


          #OR edit manually

         
vi $DOMAIN/bin/startWebLogic.sh

          > echo "PID is:  " $$
          >
          173,174c175,176
          <        echo "Starting WLS with line:"
          <       echo "${JAVA_HOME}/bin/java ${JAVA_VM} ${MEM_ARGS} -Dweblogic.Name=${SERVER_NAME} -Djava.security.policy=${WLS_POLICY_FILE} ${JAVA_OPTIONS} ${PROXY_SETTINGS} ${SERVER_CLASS}"
          <       ${JAVA_HOME}/bin/java ${JAVA_VM} ${MEM_ARGS} -Dweblogic.Name=${SERVER_NAME} -Djava.security.policy=${WLS_POLICY_FILE} ${JAVA_OPTIONS} ${PROXY_SETTINGS} ${SERVER_CLASS}
          ---
          >        echo "Starting WLS with line:"
          >       echo "${JAVA_HOME}/bin/java ${JAVA_VM} ${MEM_ARGS} -Dweblogic.Name=${SERVER_NAME} -Djava.security.policy=${WLS_POLICY_FILE} -DPLANETBGENV=${PLANETBGENV} -DPLANETBGDIR=${PLANETBGDIR} ${JAVA_OPTIONS} ${PROXY_SETTINGS} ${SERVER_CLASS}"
          >       ${JAVA_HOME}/bin/java ${JAVA_VM} ${MEM_ARGS} -Dweblogic.Name=${SERVER_NAME} -Djava.security.policy=${WLS_POLICY_FILE} -DPLANETBGENV=${PLANETBGENV} -DPLANETBGDIR=${PLANETBGDIR} ${JAVA_OPTIONS} ${PROXY_SETTINGS} ${SERVER_CLASS}

start
What:
The login attempt was unsuccessful.
Reason: Region install is not configured properly - cannot login

Select a Region.

When:
          First login to the LEIS-NP web page as sysadm, which has "install" as a default schema.
So:
          LEIS-NP was configured for region2 using. And sysadm had install as default DB.
          So default value "install" had been used during loggin, but there were no such configured regional shemas.

          Default regional shema for sysadm (install) has been changed via GRANITE admin client to one of those that where configured for LEIS-NP (region2).
What:
tail -100 $DOMAIN/logs/wls_granite-core.log

2017-04-24 11:44:21,429 WARN  com.granite.util.Configuration - WARNING: unable to load configuration parameters. Default settings will be used.
2017-04-24 11:44:21,430 WARN  com.granite.util.Configuration - File Not Found: granite-config.xml
When:
          Starting MWL after upgrade appropriate domain.
So:
          Update WL env domain file:

             vi $DOMAIN/bin/setDomainEnv.sh                   

                    . ${DOMAIN_HOME}/bin/setXngEnv.sh          <== add to the end
What:

report at web-part "CABLE TRANSFER FILL SUMMARY REPORT"

Failed to parse the command output - SAXException: org.xml.sax.SAXParseException; lineNumber: 1; columnNumber: 1; Content is not allowed in prolog.

tail -100 $DOMAIN/logs/wls_granite-core.log

2017-Apr-11 09:08:44 DEBUG AppSession.java:395 -- Number of CSP cookies found = 1
2017-Apr-11 09:08:44 DEBUG AppSession.java:414 -- Bypassing cookie check
2017-Apr-11 09:08:44 DEBUG BeanManager.java:175 -- Checking for taper code lock release - session id = XNZdIIkVlCvmUXQrYve1nwZeibAm4UwWo3_ZK5UuNQsQO3DL9KL_!-1670657334!1491916065045
2017-Apr-11 09:08:44 DEBUG AppSession.java:159 -- Setting wire center to lp05test
2017-Apr-11 09:08:48 DEBUG AppSession.java:395 -- Number of CSP cookies found = 1
2017-Apr-11 09:08:49 DEBUG AppSession.java:414 -- Bypassing cookie check
2017-Apr-11 09:08:49 DEBUG MiddleTierCaller.java:231 -- runCaxFillReport started
LEISInvoker - Moving file: /tmp/caxFillInput_lp05test_1491916129017 to env leis@leis-np4.cc.telcordia.com
LEISInvoker - File /tmp/caxFillInput_lp05test_1491916129017 moved
LEISInvoker - Starting remote processing: leis@leis-np4.cc.telcordia.com , /lhome/leis/DEV90_2/planetbg1/bin/leisInvoker.sh , cax.fill , null , /tmp/caxFillInput_lp05test_1491916129017 at Tue Apr 11 09:08:50 EDT 2017
LEISInvoker - Finished processing: leis@leis-np4.cc.telcordia.com , /lhome/leis/DEV90_2/planetbg1/bin/leisInvoker.sh , cax.fill , null , /tmp/caxFillInput_lp05test_1491916129017 at Tue Apr 11 09:09:01 EDT 2017
Reading output from file /tmp/cax.fill.lp05test.7593.err
Reading error from file null
LEISInvoker - Getting file: /tmp/cax.fill.lp05test.7593.err from env leis@leis-np4.cc.telcordia.com
LEISInvoker - File /tmp/cax.fill.lp05test.7593.err moved
LEISInvoker - Removing workfile /tmp/caxFillInput_lp05test_1491916129017 from env leis@leis-np4.cc.telcordia.com
LEISInvoker - Finished removing workfile
LEISInvoker - Removing workfile /tmp/cax.fill.lp05test.7593.err from env leis@leis-np4.cc.telcordia.com
LEISInvoker - Finished removing workfile
2017-Apr-11 09:09:04 DEBUG MiddleTierCaller.java:241 -- runCaxFillReport finished
2017-Apr-11 09:09:04 DEBUG CaxFillBean.java:311 -- CaxFillBean - Cannot parse xml output - SAXException: org.xml.sax.SAXParseException; lineNumber: 1; columnNumber: 1; Content is not allowed in prolog.
2017-Apr-11 09:09:04 DEBUG AppSession.java:395 -- Number of CSP cookies found = 1
2017-Apr-11 09:09:04 DEBUG AppSession.java:414 -- Bypassing cookie check
When:
          Just deployed LEIS-NP env.
So:
          Backend (uplifted code) can't parse/generate some xml.
          Re-builded and then re-deployed Uplifted part of Backend helped with this error.
What:
tail -13 $DOMAIN/logs/wls_granite_core.log

<Apr 14, 2017 4:33:16 AM EDT> <Error> <HTTP> <BEA-101017> <[ServletContext@1906656447[app:planet-bs module:planet-bs path:null spec-version:3.0]] Root cause of ServletException.
weblogic.servlet.jsp.CompilationException: Failed to compile JSP /jsp/Login.jsp
Login.jsp:10:28: The type java.util.Map$Entry cannot be resolved. It is indirectly referenced from required .class files
    String loginStrategy = PlanetProperties.getInstance().getProperty("loginStrategy");
                           ^--------------------------------------------------------^

        at weblogic.servlet.jsp.JavelinxJSPStub.reportCompilationErrorIfNeccessary(JavelinxJSPStub.java:243)
        at weblogic.servlet.jsp.JavelinxJSPStub.compilePage0(JavelinxJSPStub.java:179)
        at weblogic.servlet.jsp.JavelinxJSPStub.access$000(JavelinxJSPStub.java:50)
        at weblogic.servlet.jsp.JavelinxJSPStub$1.run(JavelinxJSPStub.java:108)
        at java.security.AccessController.doPrivileged(Native Method)
        Truncated. see log file for complete stacktrace
>
When:
          Trying to get to LEIS-NP app (http://nighthawk.cc.telcordia.com:7280/planet-bs/) after it has been builded with Java 1.8 and deployed at WL also started with 1.8
So:
          WL certified to work on Java 8 only from 12.1.3 version.
          Current WL version is 12.1.2
WL should be upgraded.
What:
Message icon - Error An error occurred during activation of changes, please see the log for details.
Message icon - Error weblogic.ejb.container.deployer.DeploymentDescriptorException: [EJB:015025]Unable to load a class that is specified in your ejb-jar.xml: Class, com.telcordia.planet.alq.ALQProcessorBean, was compiled with an incompatible version of Java. Make sure that all the classes needed by the application have been compiled with a compatible java version..
Message icon - Error Substituted for the exception weblogic.ejb.container.deployer.DeploymentDescriptorException which lacks a String contructor, original message - [EJB:015025]Unable to load a class that is specified in your ejb-jar.xml: Class, com.telcordia.planet.alq.ALQProcessorBean, was compiled with an incompatible version of Java. Make sure that all the classes needed by the application have been compiled with a compatible java version..
When:
          Deploying LEIS-NP app builded with Java 1.8 on WL, started with Java 1.7
So:
          WL has been re-started with Java 1.8
What:
At LEIS-NP web page after running report "CABLE TRANSFER FILL SUMMARY REPORT ":

Empty error string returned from the backend process. Please contact the System Administrator.


cat $DOMAIN/logs/wls_granite-core.log`

LEISInvoker - System property PLANETBGENV not set - defaulting to leis@nighthawk
LEISInvoker - Environment Variable PLANETBGDIR not set - defaulting to /home/leis/planetbg
LEISInvoker - Moving file: /tmp/caxFillInput_lp05test_1491900238814 to env leis@nighthawk
LEISInvoker - File /tmp/caxFillInput_lp05test_1491900238814 moved
LEISInvoker - Starting remote processing: leis@nighthawk , /home/leis/planetbg/bin/leisInvoker.sh , cax.fill , null , /tmp/caxFillInput_lp05test_1491900238814 at Tue Apr 11 04:43:59 EDT 2017
LEISInvoker - Finished processing: leis@nighthawk , /home/leis/planetbg/bin/leisInvoker.sh , cax.fill , null , /tmp/caxFillInput_lp05test_1491900238814 at Tue Apr 11 04:44:00 EDT 2017
LEISInvoker - Removing workfile /tmp/caxFillInput_lp05test_1491900238814 from env leis@nighthawk
LEISInvoker - Finished removing workfile
When:
          Running "CABLE TRANSFER FILL SUMMARY REPORT" LEIS-NP report.
So:
         PLANETBGENV is not included in WL during startup - add it to standard startWebLogic.sh

stopMWL.sh
stopWL.sh

     #Update WL start script
    
          #take it from other env
         
cp $DOMAIN/bin/startWebLogic.sh $DOMAIN/bin/startWebLogic.sh.orig    
cp /app2/bea/user_projects/domains/granite-pt/bin/startWebLogic.sh $DOMAIN/bin/startWebLogic.sh

vi $DOMAIN/bin/startWebLogic.sh

     <     DOMAIN_HOME="/app2/bea/user_projects/domains/granite-pt"
     >     DOMAIN_HOME="/app2/bea/user_projects/domains/granite-dev2"


          #OR edit manually

         
vi $DOMAIN/bin/startWebLogic.sh

          > echo "PID is:  " $$
          >
          173,174c175,176
          <        echo "Starting WLS with line:"
          <       echo "${JAVA_HOME}/bin/java ${JAVA_VM} ${MEM_ARGS} -Dweblogic.Name=${SERVER_NAME} -Djava.security.policy=${WLS_POLICY_FILE} ${JAVA_OPTIONS} ${PROXY_SETTINGS} ${SERVER_CLASS}"
          <       ${JAVA_HOME}/bin/java ${JAVA_VM} ${MEM_ARGS} -Dweblogic.Name=${SERVER_NAME} -Djava.security.policy=${WLS_POLICY_FILE} ${JAVA_OPTIONS} ${PROXY_SETTINGS} ${SERVER_CLASS}
          ---
          >        echo "Starting WLS with line:"
          >       echo "${JAVA_HOME}/bin/java ${JAVA_VM} ${MEM_ARGS} -Dweblogic.Name=${SERVER_NAME} -Djava.security.policy=${WLS_POLICY_FILE} -DPLANETBGENV=${PLANETBGENV} -DPLANETBGDIR=${PLANETBGDIR} ${JAVA_OPTIONS} ${PROXY_SETTINGS} ${SERVER_CLASS}"
          >       ${JAVA_HOME}/bin/java ${JAVA_VM} ${MEM_ARGS} -Dweblogic.Name=${SERVER_NAME} -Djava.security.policy=${WLS_POLICY_FILE} -DPLANETBGENV=${PLANETBGENV} -DPLANETBGDIR=${PLANETBGDIR} ${JAVA_OPTIONS} ${PROXY_SETTINGS} ${SERVER_CLASS}

start

What:
[]|[]|[10 Apr 2017 11:15:44,224]|[com.granite.middle.session.StatelessClientServiceBean]|[[ACTIVE] ExecuteThread: '11' for queue: 'weblogic.kernel.Default (self-tuning)']|[ERROR]|[No authentication plugin for payload type: java.lang.String]

[]|[]|[10 Apr 2017 11:15:44,224]|[com.granite.middle.session.StatelessClientServiceBean]|[[ACTIVE] ExecuteThread: '11' for queue: 'weblogic.kernel.Default (self-tuning)']|[ERROR]|[No authentication plugin for payload type: java.lang.String]

[]|[]|[10 Apr 2017 11:15:44,232]|[com.granite.middle.session.StatelessClientServiceBean]|[[ACTIVE] ExecuteThread: '11' for queue: 'weblogic.kernel.Default (self-tuning)']|[ERROR]|[Problem loading authentication adapter.]

javax.ejb.EJBException: No authentication plugin for payload type: java.lang.String
        at com.granite.middle.session.StatelessClientServiceBean.getAuthenticator(StatelessClientServiceBean.java:733)
        at com.granite.middle.session.StatelessClientServiceBean.doLogin(StatelessClientServiceBean.java:399)
        at com.granite.middle.session.StatelessClientServiceBean.login(StatelessClientServiceBean.java:126)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.__WL_invoke(Unknown Source)
        at weblogic.ejb.container.internal.SessionRemoteMethodInvoker.invoke(SessionRemoteMethodInvoker.java:34)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.login(Unknown Source)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_WLSkel.invoke(Unknown Source)
        at weblogic.rmi.internal.ServerRequest.sendReceive(ServerRequest.java:202)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:463)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:274)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_12120_WLStub.login(Unknown Source)
        at com.granite.bdl.protocol.IIOP.adapter.Session.doSSOLogin(Session.java:534)
        at com.granite.bdl.protocol.IIOP.adapter.Session.makeClientService(Session.java:226)
        at com.granite.bdl.protocol.IIOP.adapter.Session.establish(Session.java:743)
        at com.granite.bdl.protocol.SessionBaseImpl.establish(SessionBaseImpl.java:49)
        at com.granite.bdl.protocol.FactoryImpl.initialize(FactoryImpl.java:72)
        at com.granite.bdl.protocol.FactoryImpl.startup(FactoryImpl.java:110)
        at com.telcordia.planet.bdl.AppSession.login(AppSession.java:526)
        at com.telcordia.planet.servlet.LoginServlet.doPost(LoginServlet.java:83)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:751)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:844)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254)
        at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:341)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:238)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3363)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3333)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2220)
        at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2146)
        at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2124)
        at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1564)
        at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:254)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
[]|[]|[10 Apr 2017 11:15:44,232]|[com.granite.middle.session.StatelessClientServiceBean]|[[ACTIVE] ExecuteThread: '11' for queue: 'weblogic.kernel.Default (self-tuning)']|[ERROR]|[Problem loading authentication adapter.]

javax.ejb.EJBException: No authentication plugin for payload type: java.lang.String
        at com.granite.middle.session.StatelessClientServiceBean.getAuthenticator(StatelessClientServiceBean.java:733)
        at com.granite.middle.session.StatelessClientServiceBean.doLogin(StatelessClientServiceBean.java:399)
        at com.granite.middle.session.StatelessClientServiceBean.login(StatelessClientServiceBean.java:126)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.__WL_invoke(Unknown Source)
        at weblogic.ejb.container.internal.SessionRemoteMethodInvoker.invoke(SessionRemoteMethodInvoker.java:34)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.login(Unknown Source)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_WLSkel.invoke(Unknown Source)
        at weblogic.rmi.internal.ServerRequest.sendReceive(ServerRequest.java:202)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:463)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:274)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_12120_WLStub.login(Unknown Source)
        at com.granite.bdl.protocol.IIOP.adapter.Session.doSSOLogin(Session.java:534)
        at com.granite.bdl.protocol.IIOP.adapter.Session.makeClientService(Session.java:226)
        at com.granite.bdl.protocol.IIOP.adapter.Session.establish(Session.java:743)
        at com.granite.bdl.protocol.SessionBaseImpl.establish(SessionBaseImpl.java:49)
        at com.granite.bdl.protocol.FactoryImpl.initialize(FactoryImpl.java:72)
        at com.granite.bdl.protocol.FactoryImpl.startup(FactoryImpl.java:110)
        at com.telcordia.planet.bdl.AppSession.login(AppSession.java:526)
        at com.telcordia.planet.servlet.LoginServlet.doPost(LoginServlet.java:83)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:751)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:844)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254)
        at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:341)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:238)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3363)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3333)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2220)
        at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2146)
        at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2124)
        at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1564)
        at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:254)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
2017-Apr-10 11:15:44 ERROR AppSession.java:528 -- Cannot log into Xng - Exception: com.granite.bdl.ProtocolException: IIOPAdapter.Session.makeClientService.InitializeSessionFailed : (ffff0000000e000d) The user name or password is incorrect.
com.granite.bdl.ProtocolException: IIOPAdapter.Session.makeClientService.InitializeSessionFailed : (ffff0000000e000d) The user name or password is incorrect.
        at com.granite.bdl.protocol.IIOP.adapter.Session.doSSOLogin(Session.java:556)
        at com.granite.bdl.protocol.IIOP.adapter.Session.makeClientService(Session.java:226)
        at com.granite.bdl.protocol.IIOP.adapter.Session.establish(Session.java:743)
        at com.granite.bdl.protocol.SessionBaseImpl.establish(SessionBaseImpl.java:49)
        at com.granite.bdl.protocol.FactoryImpl.initialize(FactoryImpl.java:72)
        at com.granite.bdl.protocol.FactoryImpl.startup(FactoryImpl.java:110)
        at com.telcordia.planet.bdl.AppSession.login(AppSession.java:526)
        at com.telcordia.planet.servlet.LoginServlet.doPost(LoginServlet.java:83)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:751)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:844)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254)
        at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:341)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:238)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3363)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3333)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2220)
        at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2146)
        at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2124)
        at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1564)
        at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:254)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
Caused by: (ffff0000000e000d) The user name or password is incorrect.
        at weblogic.rmi.internal.ServerRequest.sendReceive(ServerRequest.java:234)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:463)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:274)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_12120_WLStub.login(Unknown Source)
        at com.granite.bdl.protocol.IIOP.adapter.Session.doSSOLogin(Session.java:534)

2017-Apr-10 11:22:31 DEBUG LoginServlet.java:105 -- Login failed - Error is: com.granite.bdl.ProtocolException: IIOPAdapter.Session.makeClientService.InitializeSessionFailed : (ffff0000000e000d) The user name or password is incorrect.

When:
               Login on the just created LEIS-NP env
                    http://nighthawk.cc.telcordia.com:8280/planet-bs/jsp/Login.jsp
So:
              Possible Reason #1:
               There's no ability to connect via SSO to GI, because
               there's no enabled Inventory Plug-In on the GI side: go as sysadm via GI Admin client and check that "CSP" attribut at Inventory Plug-In is configured and enabled, radiobutton "All allowd" selected.

               Possible Reason #2:
               When GI's XNG-bea-weblogic-12.1.ear created, LEIS-NP's authentication plugin planet-csp.jar is added to it.
               There was a case, when to XNG-bea-weblogic-12.1.ear (built with Java8, setup on WL 12.1.3), planet-csp.jar (built with Java8, for WL 12.1.2) has been added - and then web login was broken.
               In this case planet-csp.jar had to be re-built and added to XNG-bea-weblogic-12.1.ear (built with Java8, setup on WL 12.1.3) as:
                    - or built with Java7 for WL 12.1.2;
                    - or built with Java8 for WL 12.1.3;
               (it might be that it due to the fact of incompability of old WL 12.1.2 and new Java8)

                Possible Reason #3:
            Just re-install (make de-install and install) XNG-bea-weblogic-12.1.ear.
What:

          []|[]|[10 Apr 2017 10:34:38,635]|[com.granite.util.locator.AbstractServiceLocator]|[[ACTIVE] ExecuteThread: '2' for queue: 'weblogic.kernel.Default (self-tuning)']|[WARN]|[Unable to locate item via JNDI name: xng/jdbc/granite-serverAdmin]

javax.naming.NameNotFoundException: Unable to resolve 'xng.jdbc.granite-serverAdmin'. Resolved 'xng.jdbc'; remaining name 'granite-serverAdmin'
        at weblogic.jndi.internal.BasicNamingNode.newNameNotFoundException(BasicNamingNode.java:1180)
        at weblogic.jndi.internal.BasicNamingNode.lookupHere(BasicNamingNode.java:270)
        at weblogic.jndi.internal.ServerNamingNode.lookupHere(ServerNamingNode.java:187)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:210)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.WLEventContextImpl.lookup(WLEventContextImpl.java:253)
        at weblogic.jndi.internal.WLContextImpl.lookup(WLContextImpl.java:426)
        at javax.naming.InitialContext.lookup(InitialContext.java:411)
        at com.granite.util.locator.AbstractServiceLocator.getRemoteObject(AbstractServiceLocator.java:370)
        at com.granite.util.locator.AbstractServiceLocator.doCachedLookup(AbstractServiceLocator.java:605)
        at com.granite.util.locator.StandardDataSourceLocator.lookUpDataSource(StandardDataSourceLocator.java:110)
        at com.granite.util.locator.XNGServiceLocator.lookUpDataSource(XNGServiceLocator.java:307)
        at com.granite.middle.util.JndiResolver.resolveDataSource(JndiResolver.java:146)
        at com.granite.middle.helper.jdbc.ConnectionJDBC.<init>(ConnectionJDBC.java:104)
        at com.granite.middle.session.StatelessClientServiceBean.createAdminConnection(StatelessClientServiceBean.java:1069)
        at com.granite.middle.session.StatelessClientServiceBean.doLogin(StatelessClientServiceBean.java:392)
        at com.granite.middle.session.StatelessClientServiceBean.login(StatelessClientServiceBean.java:126)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.__WL_invoke(Unknown Source)
        at weblogic.ejb.container.internal.SessionRemoteMethodInvoker.invoke(SessionRemoteMethodInvoker.java:34)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.login(Unknown Source)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_WLSkel.invoke(Unknown Source)
        at weblogic.rmi.internal.ServerRequest.sendReceive(ServerRequest.java:202)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:463)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:274)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_12120_WLStub.login(Unknown Source)
        at com.granite.bdl.protocol.IIOP.adapter.Session.doSSOLogin(Session.java:534)
        at com.granite.bdl.protocol.IIOP.adapter.Session.makeClientService(Session.java:226)
        at com.granite.bdl.protocol.IIOP.adapter.Session.establish(Session.java:743)
        at com.granite.bdl.protocol.SessionBaseImpl.establish(SessionBaseImpl.java:49)
        at com.granite.bdl.protocol.FactoryImpl.initialize(FactoryImpl.java:72)
        at com.granite.bdl.protocol.FactoryImpl.startup(FactoryImpl.java:110)
        at com.telcordia.planet.bdl.AppSession.login(AppSession.java:526)
        at com.telcordia.planet.servlet.LoginServlet.doPost(LoginServlet.java:83)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:751)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:844)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254)
        at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:341)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:238)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3363)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3333)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2220)
        at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2146)
        at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2124)
        at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1564)
        at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:254)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
[]|[]|[10 Apr 2017 10:34:38,639]|[com.granite.util.locator.ServiceLocatorException]|[[ACTIVE] ExecuteThread: '2' for queue: 'weblogic.kernel.Default (self-tuning)']|[ERROR]|[JNDI Problem: Unable to resolve 'xng.jdbc.granite-serverAdmin'. Resolved 'xng.jdbc']

javax.naming.NameNotFoundException: Unable to resolve 'xng.jdbc.granite-serverAdmin'. Resolved 'xng.jdbc'; remaining name 'granite-serverAdmin'
        at weblogic.jndi.internal.BasicNamingNode.newNameNotFoundException(BasicNamingNode.java:1180)
        at weblogic.jndi.internal.BasicNamingNode.lookupHere(BasicNamingNode.java:270)
        at weblogic.jndi.internal.ServerNamingNode.lookupHere(ServerNamingNode.java:187)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:210)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.WLEventContextImpl.lookup(WLEventContextImpl.java:253)
        at weblogic.jndi.internal.WLContextImpl.lookup(WLContextImpl.java:426)
        at javax.naming.InitialContext.lookup(InitialContext.java:411)
        at com.granite.util.locator.AbstractServiceLocator.getRemoteObject(AbstractServiceLocator.java:370)
        at com.granite.util.locator.AbstractServiceLocator.doCachedLookup(AbstractServiceLocator.java:605)
        at com.granite.util.locator.StandardDataSourceLocator.lookUpDataSource(StandardDataSourceLocator.java:110)
        at com.granite.util.locator.XNGServiceLocator.lookUpDataSource(XNGServiceLocator.java:307)
        at com.granite.middle.util.JndiResolver.resolveDataSource(JndiResolver.java:146)
        at com.granite.middle.helper.jdbc.ConnectionJDBC.<init>(ConnectionJDBC.java:104)
        at com.granite.middle.session.StatelessClientServiceBean.createAdminConnection(StatelessClientServiceBean.java:1069)
        at com.granite.middle.session.StatelessClientServiceBean.doLogin(StatelessClientServiceBean.java:392)
        at com.granite.middle.session.StatelessClientServiceBean.login(StatelessClientServiceBean.java:126)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.__WL_invoke(Unknown Source)
        at weblogic.ejb.container.internal.SessionRemoteMethodInvoker.invoke(SessionRemoteMethodInvoker.java:34)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.login(Unknown Source)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_WLSkel.invoke(Unknown Source)
        at weblogic.rmi.internal.ServerRequest.sendReceive(ServerRequest.java:202)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:463)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:274)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_12120_WLStub.login(Unknown Source)
        at com.granite.bdl.protocol.IIOP.adapter.Session.doSSOLogin(Session.java:534)
        at com.granite.bdl.protocol.IIOP.adapter.Session.makeClientService(Session.java:226)
        at com.granite.bdl.protocol.IIOP.adapter.Session.establish(Session.java:743)
        at com.granite.bdl.protocol.SessionBaseImpl.establish(SessionBaseImpl.java:49)
        at com.granite.bdl.protocol.FactoryImpl.initialize(FactoryImpl.java:72)
        at com.granite.bdl.protocol.FactoryImpl.startup(FactoryImpl.java:110)
        at com.telcordia.planet.bdl.AppSession.login(AppSession.java:526)
        at com.telcordia.planet.servlet.LoginServlet.doPost(LoginServlet.java:83)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:751)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:844)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254)
        at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:341)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:238)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3363)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3333)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2220)
        at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2146)
        at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2124)
        at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1564)
        at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:254)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
[]|[]|[10 Apr 2017 10:34:38,639]|[com.granite.util.locator.ServiceLocatorException]|[[ACTIVE] ExecuteThread: '2' for queue: 'weblogic.kernel.Default (self-tuning)']|[ERROR]|[JNDI Problem: Unable to resolve 'xng.jdbc.granite-serverAdmin'. Resolved 'xng.jdbc']

javax.naming.NameNotFoundException: Unable to resolve 'xng.jdbc.granite-serverAdmin'. Resolved 'xng.jdbc'; remaining name 'granite-serverAdmin'
        at weblogic.jndi.internal.BasicNamingNode.newNameNotFoundException(BasicNamingNode.java:1180)
        at weblogic.jndi.internal.BasicNamingNode.lookupHere(BasicNamingNode.java:270)
        at weblogic.jndi.internal.ServerNamingNode.lookupHere(ServerNamingNode.java:187)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:210)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.WLEventContextImpl.lookup(WLEventContextImpl.java:253)
        at weblogic.jndi.internal.WLContextImpl.lookup(WLContextImpl.java:426)
        at javax.naming.InitialContext.lookup(InitialContext.java:411)
        at com.granite.util.locator.AbstractServiceLocator.getRemoteObject(AbstractServiceLocator.java:370)
        at com.granite.util.locator.AbstractServiceLocator.doCachedLookup(AbstractServiceLocator.java:605)
        at com.granite.util.locator.StandardDataSourceLocator.lookUpDataSource(StandardDataSourceLocator.java:110)
        at com.granite.util.locator.XNGServiceLocator.lookUpDataSource(XNGServiceLocator.java:307)
        at com.granite.middle.util.JndiResolver.resolveDataSource(JndiResolver.java:146)
        at com.granite.middle.helper.jdbc.ConnectionJDBC.<init>(ConnectionJDBC.java:104)
        at com.granite.middle.session.StatelessClientServiceBean.createAdminConnection(StatelessClientServiceBean.java:1069)
        at com.granite.middle.session.StatelessClientServiceBean.doLogin(StatelessClientServiceBean.java:392)
        at com.granite.middle.session.StatelessClientServiceBean.login(StatelessClientServiceBean.java:126)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.__WL_invoke(Unknown Source)
        at weblogic.ejb.container.internal.SessionRemoteMethodInvoker.invoke(SessionRemoteMethodInvoker.java:34)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.login(Unknown Source)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_WLSkel.invoke(Unknown Source)
        at weblogic.rmi.internal.ServerRequest.sendReceive(ServerRequest.java:202)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:463)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:274)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_12120_WLStub.login(Unknown Source)
        at com.granite.bdl.protocol.IIOP.adapter.Session.doSSOLogin(Session.java:534)
        at com.granite.bdl.protocol.IIOP.adapter.Session.makeClientService(Session.java:226)
        at com.granite.bdl.protocol.IIOP.adapter.Session.establish(Session.java:743)
        at com.granite.bdl.protocol.SessionBaseImpl.establish(SessionBaseImpl.java:49)
        at com.granite.bdl.protocol.FactoryImpl.initialize(FactoryImpl.java:72)
        at com.granite.bdl.protocol.FactoryImpl.startup(FactoryImpl.java:110)
        at com.telcordia.planet.bdl.AppSession.login(AppSession.java:526)
        at com.telcordia.planet.servlet.LoginServlet.doPost(LoginServlet.java:83)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:751)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:844)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254)
        at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:341)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:238)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3363)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3333)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2220)
        at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2146)
        at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2124)
        at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1564)
        at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:254)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
2017-Apr-10 10:34:38 ERROR AppSession.java:528 -- Cannot log into Xng - Exception: com.granite.bdl.ProtocolException: IIOPAdapter.Session.makeClientService.InitializeSessionFailed : (ffff0000000e000b) The administration database name has not been configured.
com.granite.bdl.ProtocolException: IIOPAdapter.Session.makeClientService.InitializeSessionFailed : (ffff0000000e000b) The administration database name has not been configured.
        at com.granite.bdl.protocol.IIOP.adapter.Session.doSSOLogin(Session.java:556)
        at com.granite.bdl.protocol.IIOP.adapter.Session.makeClientService(Session.java:226)
        at com.granite.bdl.protocol.IIOP.adapter.Session.establish(Session.java:743)
        at com.granite.bdl.protocol.SessionBaseImpl.establish(SessionBaseImpl.java:49)
        at com.granite.bdl.protocol.FactoryImpl.initialize(FactoryImpl.java:72)
        at com.granite.bdl.protocol.FactoryImpl.startup(FactoryImpl.java:110)
        at com.telcordia.planet.bdl.AppSession.login(AppSession.java:526)
        at com.telcordia.planet.servlet.LoginServlet.doPost(LoginServlet.java:83)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:751)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:844)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254)
        at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:341)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:238)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3363)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3333)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2220)
        at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2146)
        at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2124)
        at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1564)
        at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:254)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
Caused by: (ffff0000000e000b) The administration database name has not been configured.
        at weblogic.rmi.internal.ServerRequest.sendReceive(ServerRequest.java:234)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:463)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:274)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_12120_WLStub.login(Unknown Source)
        at com.granite.bdl.protocol.IIOP.adapter.Session.doSSOLogin(Session.java:534)
        ... 26 more
2017-Apr-10 10:34:38 DEBUG LoginServlet.java:105 -- Login failed - Error is: com.granite.bdl.ProtocolException: IIOPAdapter.Session.makeClientService.InitializeSessionFailed : (ffff0000000e000b) The administration database name has not been configured.
2017-Apr-10 10:34:38 DEBUG BeanManager.java:175 -- Checking for taper code lock release - session id = ITFYSEUZE16qK57zSSprlL3ioaJcif6RJ097qYobe34Tth3qj6b0!186202378!1491834799871
2017-Apr-10 10:34:38 DEBUG AppSession.java:395 -- Number of CSP cookies found = 1
2017-Apr-10 10:34:38 DEBUG AppSession.java:414 -- Bypassing cookie check
2017-Apr-10 10:34:38 DEBUG DBConnectionManager.java:198 -- Data Source Name=xng/jdbc/leis-np4Admin
2017-Apr-10 10:34:38 DEBUG DBConnectionManager.java:200 -- Pass initCtx.lookup()
2017-Apr-10 10:34:38 DEBUG DBConnectionManager.java:202 -- Pass ds.getConnection()
2017-Apr-10 10:34:38 DEBUG DBConnectionManager.java:204 -- Pass c.setAutoCommit(false)
2017-Apr-10 10:34:38 DEBUG AppSession.java:588 -- Default region for user xoksale is region2




          cat $DOMAIN/granite/logs/telcordia.granite.inventory/granite_core/error.log

[]|[]|[10 Apr 2017 10:34:38,639]|[com.granite.util.locator.ServiceLocatorException]|[[ACTIVE] ExecuteThread: '2' for queue: 'weblogic.kernel.Default (self-tuning)']|[ERROR]|[JNDI Problem: Unable to resolve 'xng.jdbc.granite-serverAdmin'. Resolved 'xng.jdbc']

javax.naming.NameNotFoundException: Unable to resolve 'xng.jdbc.granite-serverAdmin'. Resolved 'xng.jdbc'; remaining name 'granite-serverAdmin'
        at weblogic.jndi.internal.BasicNamingNode.newNameNotFoundException(BasicNamingNode.java:1180)
        at weblogic.jndi.internal.BasicNamingNode.lookupHere(BasicNamingNode.java:270)
        at weblogic.jndi.internal.ServerNamingNode.lookupHere(ServerNamingNode.java:187)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:210)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.WLEventContextImpl.lookup(WLEventContextImpl.java:253)
        at weblogic.jndi.internal.WLContextImpl.lookup(WLContextImpl.java:426)
        at javax.naming.InitialContext.lookup(InitialContext.java:411)
        at com.granite.util.locator.AbstractServiceLocator.getRemoteObject(AbstractServiceLocator.java:370)
        at com.granite.util.locator.AbstractServiceLocator.doCachedLookup(AbstractServiceLocator.java:605)
        at com.granite.util.locator.StandardDataSourceLocator.lookUpDataSource(StandardDataSourceLocator.java:110)
        at com.granite.util.locator.XNGServiceLocator.lookUpDataSource(XNGServiceLocator.java:307)
        at com.granite.middle.util.JndiResolver.resolveDataSource(JndiResolver.java:146)
        at com.granite.middle.helper.jdbc.ConnectionJDBC.<init>(ConnectionJDBC.java:104)
        at com.granite.middle.session.StatelessClientServiceBean.createAdminConnection(StatelessClientServiceBean.java:1069)
        at com.granite.middle.session.StatelessClientServiceBean.doLogin(StatelessClientServiceBean.java:392)
        at com.granite.middle.session.StatelessClientServiceBean.login(StatelessClientServiceBean.java:126)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.__WL_invoke(Unknown Source)
        at weblogic.ejb.container.internal.SessionRemoteMethodInvoker.invoke(SessionRemoteMethodInvoker.java:34)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.login(Unknown Source)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_WLSkel.invoke(Unknown Source)
        at weblogic.rmi.internal.ServerRequest.sendReceive(ServerRequest.java:202)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:463)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:274)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_12120_WLStub.login(Unknown Source)
        at com.granite.bdl.protocol.IIOP.adapter.Session.doSSOLogin(Session.java:534)
        at com.granite.bdl.protocol.IIOP.adapter.Session.makeClientService(Session.java:226)
        at com.granite.bdl.protocol.IIOP.adapter.Session.establish(Session.java:743)
        at com.granite.bdl.protocol.SessionBaseImpl.establish(SessionBaseImpl.java:49)
        at com.granite.bdl.protocol.FactoryImpl.initialize(FactoryImpl.java:72)
        at com.granite.bdl.protocol.FactoryImpl.startup(FactoryImpl.java:110)
        at com.telcordia.planet.bdl.AppSession.login(AppSession.java:526)
        at com.telcordia.planet.servlet.LoginServlet.doPost(LoginServlet.java:83)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:751)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:844)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254)
        at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:341)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:238)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3363)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3333)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2220)
        at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2146)
        at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2124)
        at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1564)
        at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:254)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
When:
               Login on the just created LEIS-NP env
                    http://nighthawk.cc.telcordia.com:8280/planet-bs/jsp/Login.jsp
So:
               File $DOMAIN/Xng_config/granite-config.xml points to default server name as "granite-serverAdmin".
               Update it:
     <         <attribute name="enableDecorators" value="true"/>                    <== A value of true turns on the JDBC logging
     ---
     >         <attribute name="enableDecorators" value="false"/>
     95c95
     <             <attribute name="defaultDbHostName" value="leis-np4"/>
     ---
     >             <attribute name="defaultDbHostName" value="granite-server"/>
What:
               Error
               Invalid session parameters
When:
          First LEIS-NP web log in:
               http://nighthawk.cc.telcordia.com:8280/SSO/login.jsp
So:
        This link should be used instead:
http://nighthawk.cc.telcordia.com:8280/planet-bs
What:
Database "region1" references a non-existent Privilege Profile "1020". Please contact Technical Support for assistance.
When:
          Accessisng just created GI app user region1 via Admin client.
So:
          DB has been created as copy of another env.          
profile_inst_id  in the region1.user_profile_domain_map contains non-existing in
xperadmin.profile_inst value.
     Remove that non-existing value:
delete from region1.user_profile_domain_map where user_inst_id not in (999, 1001);
deletefrom region1.user_profile_domain_map where profile_inst_id in(1020);
commit;
What:
cat $LEISDIR/planetbg1/log/tcb.log

2017-04-09 08:39:03,568 0     [main] INFO          TCBProcessor - TaperCodeBackgroundProcessor starting
2017-04-09 08:39:05,988 2420  [main] ERROR    ConnectionManager - Could not establish a BDL Session with region region1 - no processing can occur for this region
2017-04-09 08:39:05,991 2423  [main] ERROR    ConnectionManager - The configured Xng user name for region region1 is invalid
2017-04-09 08:39:05,991 2423  [main] ERROR                WCBDL - Cannot retrieve factory for region region1
2017-04-09 08:39:06,033 2465  [main] ERROR    ConnectionManager - Could not establish a BDL Session with region region2 - no processing can occur for this region
2017-04-09 08:39:06,035 2467  [main] ERROR    ConnectionManager - The configured Xng user name for region region2 is invalid
2017-04-09 08:39:06,036 2468  [main] ERROR                WCBDL - Cannot retrieve factory for region region2


cat $LEISDIR/planetbg1/log/tcbStdErr.log

com.granite.bdl.ProtocolException: IIOPAdapter.Session.makeClientService.InitializeSessionFailed : (ffff0000000e000d) The user name or password is incorrect.
        at com.granite.bdl.protocol.IIOP.adapter.Session.doStandardLogin(Session.java:620)
        at com.granite.bdl.protocol.IIOP.adapter.Session.makeClientService(Session.java:252)
        at com.granite.bdl.protocol.IIOP.adapter.Session.establish(Session.java:743)
        at com.granite.bdl.protocol.SessionBaseImpl.establish(SessionBaseImpl.java:49)
        at com.granite.bdl.protocol.FactoryImpl.initialize(FactoryImpl.java:72)
        at com.granite.bdl.protocol.FactoryImpl.startup(FactoryImpl.java:110)
        at com.telcordia.planet.util.ConnectionManager.getRegionBDLConnection(ConnectionManager.java:70)
        at com.telcordia.planet.bdl.WireCenterBDL.getActiveWireCenters(WireCenterBDL.java:33)
        at com.telcordia.planet.tc.TaperCodeBGProcessor.checkForTCWork(TaperCodeBGProcessor.java:170)
        at com.telcordia.planet.tc.TaperCodeBGProcessor.process(TaperCodeBGProcessor.java:139)
        at com.telcordia.planet.tc.TaperCodeBGProcessor.main(TaperCodeBGProcessor.java:112)
Caused by: (ffff0000000e000d) The user name or password is incorrect.
        at weblogic.rjvm.ResponseImpl.unmarshalReturn(ResponseImpl.java:237)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:464)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:272)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_12120_WLStub.login(Unknown Source)
        at com.granite.bdl.protocol.IIOP.adapter.Session.doStandardLogin(Session.java:601)
        ... 10 more
Caused by: (0) (ffff0000000e000d) The user name or password is incorrect.
        at weblogic.utils.StackTraceDisabled.unknownMethod()
com.granite.bdl.ProtocolException: IIOPAdapter.Session.makeClientService.InitializeSessionFailed : (ffff0000000e000d) The user name or password is incorrect.
        at com.granite.bdl.protocol.IIOP.adapter.Session.doStandardLogin(Session.java:620)
        at com.granite.bdl.protocol.IIOP.adapter.Session.makeClientService(Session.java:252)
        at com.granite.bdl.protocol.IIOP.adapter.Session.establish(Session.java:743)
        at com.granite.bdl.protocol.SessionBaseImpl.establish(SessionBaseImpl.java:49)
        at com.granite.bdl.protocol.FactoryImpl.initialize(FactoryImpl.java:72)
        at com.granite.bdl.protocol.FactoryImpl.startup(FactoryImpl.java:110)
        at com.telcordia.planet.util.ConnectionManager.getRegionBDLConnection(ConnectionManager.java:70)
        at com.telcordia.planet.bdl.WireCenterBDL.getActiveWireCenters(WireCenterBDL.java:33)
        at com.telcordia.planet.tc.TaperCodeBGProcessor.checkForTCWork(TaperCodeBGProcessor.java:170)
        at com.telcordia.planet.tc.TaperCodeBGProcessor.process(TaperCodeBGProcessor.java:139)
        at com.telcordia.planet.tc.TaperCodeBGProcessor.main(TaperCodeBGProcessor.java:112)
Caused by: (ffff0000000e000d) The user name or password is incorrect.
        at weblogic.rjvm.ResponseImpl.unmarshalReturn(ResponseImpl.java:237)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:464)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:272)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_12120_WLStub.login(Unknown Source)
        at com.granite.bdl.protocol.IIOP.adapter.Session.doStandardLogin(Session.java:601)
        ... 10 more
Caused by: (0) (ffff0000000e000d) The user name or password is incorrect.
        at weblogic.utils.StackTraceDisabled.unknownMethod()
When:
               Starting of tcb process.
So:
               Check that:
          1) This files ARE up-to-date:
               $LEISDIR/planetbg1/config/Reg*jndi.properties
               $LEISDIR/planetbg1/config/planet.properties
           2) There ARE specified users (region1, region2, etc) with specified passwords at the APP level of GRANITE (via GI Client, for instance) 
What:
Exception in thread "main" java.lang.UnsupportedClassVersionError: com/telcordia/leis/refresh/XngUtils : Unsupported major.minor version 52.0          <== required Java number
        at java.lang.ClassLoader.defineClass1(Native Method)
        at java.lang.ClassLoader.defineClass(ClassLoader.java:800)
        at java.security.SecureClassLoader.defineClass(SecureClassLoader.java:142)
        at java.net.URLClassLoader.defineClass(URLClassLoader.java:449)
        at java.net.URLClassLoader.access$100(URLClassLoader.java:71)
        at java.net.URLClassLoader$1.run(URLClassLoader.java:361)
        at java.net.URLClassLoader$1.run(URLClassLoader.java:355)
        at java.security.AccessController.doPrivileged(Native Method)
        at java.net.URLClassLoader.findClass(URLClassLoader.java:354)
        at java.lang.ClassLoader.loadClass(ClassLoader.java:425)
        at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:308)
        at java.lang.ClassLoader.loadClass(ClassLoader.java:358)
        at sun.launcher.LauncherHelper.checkAndLoadMain(LauncherHelper.java:482)
When:
               Any java code. This time it was:
                    java com.telcordia.leis.refresh.XngUtils
So:
                  Happens because of a higher JDK during compile time and lower JDK during runtime.
                  The reported major numbers are:
Java SE 9 = 53,
Java SE 8 = 52,     <== Error says that java expects to see this Java runtime env
Java SE 7 = 51,
Java SE 6.0 = 50,
Java SE 5.0 = 49,
JDK 1.4 = 48,
JDK 1.3 = 47,
JDK 1.2 = 46,
JDK 1.1 = 45
What:
Insufficient Privileges
You do not have permission to access database kokos.
See your System Administrator or please try again.
When:
          User Name:                    sysadm
Password:                    sysadm1!
Application Server:          t3://nighthawk.cc.telcordia.com:8280
Database Server:          xburser
Database Name:               kokos
So:
          There IS appropriate Data Source "Database Server"_"Database Name" configured on the WL,
there IS such "Database Name" regional schema at Granite Inventory,
BUT GI user "User Name" doesn't have permission to access specified "Database Name".
What:
          A non fatal Middle Tier error has occurred. Continue at your own risk. Database kokos cannot be accessed.  Check the JDBC datasource configuration on the server.
          See your System Administrator or please try again.
When:     
          User Name:                    sysadm
Password:                    sysadm1!
Application Server:          t3://nighthawk.cc.telcordia.com:8280
Database Server:          xburser
Database Name:               kokos
So:
          There IS appropriate Data Source "Database Server"_"Database Name" configured on the WL,
          BUT there IS NO such "Database Name" regional schema at Granite Inventory (appropriate line in xperadmin.xpercom_db_inst DB table is being checked here).
What:
Could not logon to the application server.
(ffff0000000e000c) No database of that name is known, it may not be configured.
See your System Administrator or please try again.
When:
          User Name:                    sysadm
Password:                    sysadm1!
Application Server:          t3://nighthawk.cc.telcordia.com:8280
Database Server:          xburser
Database Name:               kokos
So:
          There IS NO appropriate Data Source on the WL side configured as
               "Database Server"_"Database Name"
What:
Could not logon to the application server.
(ffff0000000e000b) The administration database name has not been configured.
See your System Administrator or please try again.
When:
          User Name:                    sysadm
Password:                    sysadm1!
Application Server:          t3://nighthawk.cc.telcordia.com:8280
Database Server:          xburser
Database Name:               kokos
So:
          There IS NO appropriate Data Source on the WL side configured as:
                "Database Server"Admin
What:
<Apr 4, 2017 6:33:08 AM EDT> <Critical> <Security> <BEA-090402> <Authentication denied: Boot identity not valid. The user name or password or both from the boot identity file (boot.properties) is not valid. The boot identity may have been changed since the boot identity file was created. Please edit and update the boot identity file with the proper values of username and password. The first time the updated boot identity file is used to start the server, these new values are encrypted.>
<Apr 4, 2017 6:33:08 AM EDT> <Critical> <WebLogicServer> <BEA-000386> <Server subsystem failed. Reason: weblogic.security.SecurityInitializationException: Authentication denied: Boot identity not valid. The user name or password or both from the boot identity file (boot.properties) is not valid. The boot identity may have been changed since the boot identity file was created. Please edit and update the boot identity file with the proper values of username and password. The first time the updated boot identity file is used to start the server, these new values are encrypted.
weblogic.security.SecurityInitializationException: Authentication denied: Boot identity not valid. The user name or password or both from the boot identity file (boot.properties) is not valid. The boot identity may have been changed since the boot identity file was created. Please edit and update the boot identity file with the proper values of username and password. The first time the updated boot identity file is used to start the server, these new values are encrypted.
        at weblogic.security.service.CommonSecurityServiceManagerDelegateImpl.doBootAuthorization(CommonSecurityServiceManagerDelegateImpl.java:964)
        at weblogic.security.service.CommonSecurityServiceManagerDelegateImpl.initialize(CommonSecurityServiceManagerDelegateImpl.java:1058)
        at weblogic.security.service.SecurityServiceManager.initialize(SecurityServiceManager.java:873)
        at weblogic.security.SecurityService.start(SecurityService.java:148)
        at weblogic.t3.srvr.SubsystemRequest.run(SubsystemRequest.java:64)
        Truncated. see log file for complete stacktrace
Caused By: javax.security.auth.login.FailedLoginException: [Security:090303]Authentication Failed: User system weblogic.security.providers.authentication.LDAPAtnDelegateException: [Security:090295]caught unexpected exception
        at weblogic.security.providers.authentication.LDAPAtnLoginModuleImpl.login(LDAPAtnLoginModuleImpl.java:257)
        at com.bea.common.security.internal.service.LoginModuleWrapper$1.run(LoginModuleWrapper.java:110)
        at java.security.AccessController.doPrivileged(Native Method)
        at com.bea.common.security.internal.service.LoginModuleWrapper.login(LoginModuleWrapper.java:106)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        Truncated. see log file for complete stacktrace
>
<Apr 4, 2017 6:33:08 AM EDT> <Notice> <WebLogicServer> <BEA-000365> <Server state changed to FAILED.>
<Apr 4, 2017 6:33:08 AM EDT> <Error> <WebLogicServer> <BEA-000383> <A critical service failed. The server will shut itself down.>
<Apr 4, 2017 6:33:08 AM EDT> <Notice> <WebLogicServer> <BEA-000365> <Server state changed to FORCE_SHUTTING_DOWN.>
When:
          First starting of MWL after $DOMAIN/servers/granite_core/security/boot.properties file configuration.
So:
          It's ok for first time. Just re-boot once again.
What:
ld.so.1: _db_setup: fatal: libyatvo.so.1: open failed: No such file or directory
Killed
When:
          First deploying of LEIS-NP backend code with Oracle 12c.
          This script gives that result:
               _db_setup setup.admin.tables
So:
          Mistakely BAE has not been installed yet.
          Failed script needs BAE to be installed prior (libyatvo.so.1 is BAE library).
What:
ORA-08002: sequence CIRC_PATH_INST_ID.CURRVAL is not yet defined in this session
When:
          First run of the sequence at the session.
So:
          A message is signalled when the sequence CURRVAL has been selected before sequence NEXTVAL.
*Cause:    sequence CURRVAL has been selected before sequence NEXTVAL
*Action:   select NEXTVAL from the sequence before selecting CURRVAL


What:
2017-Feb-16 08:55:09 DEBUG AppSession.java:395 -- Number of CSP cookies found = 0
2017-Feb-16 08:55:09 DEBUG AppSession.java:465 -- Redirecting to CSP - request URL = http://fia.att.com:9280/planet-bs/jsp/Login.jsp
2017-Feb-16 08:55:09 DEBUG AppSession.java:482 -- retURL = http://fia.att.com:9280/planet-bs/jsp/Login.jsp
2017-Feb-16 08:55:09 DEBUG AppSession.java:502 -- Forwarding to CSP URL: https://webtest.csp.att.com/empsvcs/hrpinmgt/pagLogin/?retURL=http%3A%2F%2Ffia.att.com%3A9280%2Fplanet-bs%2Fjsp%2FLogin.jsp&sysName=leisnp
<Feb 16, 2017 8:55:19 AM EST> <Warning> <Socket> <BEA-000449> <Closing the socket, as no data read from it on 128.96.247.93:61,798 during the configured idle timeout of 5 seconds.>
When:
          LEIS-NP CSP testing, all configuration steps was done from our side.
          WL's log file, during pointing to the LEIS-NP welcome page http://fia.att.com:9280/planet-bs on the QA test machines, nothing is displayed at the browser.
So:
          On the QA test machine   C:\Windows\System32\drivers\etc\hosts.txt   file contains expired information:

125.25.122.60    webtest.csp.att.com     <== this is ATT's server and it's IP no longer works for necessary task. 
128.96.247.91    nighthawk.att.com
128.96.247.87   fia.att.com

          ATT should provide new (up-to-date) IP for webtest.csp.att.com server.
What:
SQL> startup
ORA-03113: end-of-file on communication channel
SQL> startup nomount
ORA-24324: service handle not initialized
ORA-01041: internal error. hostdef extension doesn't exist
When:
          During startup after manually edited env.
So:
          Parameter $LD_LIBRARY_PATH was not correct (it was pointing to the old ORACLE_HOME)
What:


[]|[]|[18 Jan 2017 09:15:34,565]|[com.granite.sql.failures]|[[ACTIVE] ExecuteThread: '8' for queue: 'weblogic.kernel.Default (self-tuning)']|[WARN]|[Operation INSERT IN                                        TO UDC_INSTANCE ( UDC_INST_ID, UDC_NAME, UDC_DEF_ID, LAST_MOD_BY, LAST_MOD_TS, IS_TEMPLATE ) VALUES ( udc_inst_id.nextval, 'AUTOUDC011817091507', 1527, 'sysadm', ( sele                                        ct sysdate from dual ), 'N' ) failed.]

java.sql.SQLException: ORA-20515: 3 -942 ORA-00942: table or view does not exist isrt_str insert into VLR_AUTOUDC011817091045(udc_inst_id,udc_name) values(:a,:b)
ORA-06512: at "REGION2.RPTS_ON_UDC_INSTANCE_AFTR", line 93
ORA-04088: error during execution of trigger 'REGION2.RPTS_ON_UDC_INSTANCE_AFTR'

        at oracle.jdbc.driver.T4CTTIoer.processError(T4CTTIoer.java:445)
        at oracle.jdbc.driver.T4CTTIoer.processError(T4CTTIoer.java:396)
        at oracle.jdbc.driver.T4C8Oall.processError(T4C8Oall.java:879)
        at oracle.jdbc.driver.T4CTTIfun.receive(T4CTTIfun.java:450)
        at oracle.jdbc.driver.T4CTTIfun.doRPC(T4CTTIfun.java:192)
        at oracle.jdbc.driver.T4C8Oall.doOALL(T4C8Oall.java:531)
        at oracle.jdbc.driver.T4CPreparedStatement.doOall8(T4CPreparedStatement.java:207)
        at oracle.jdbc.driver.T4CPreparedStatement.executeForRows(T4CPreparedStatement.java:1044)
        at oracle.jdbc.driver.OracleStatement.doExecuteWithTimeout(OracleStatement.java:1329)
        at oracle.jdbc.driver.OraclePreparedStatement.executeInternal(OraclePreparedStatement.java:3594)
        at oracle.jdbc.driver.OraclePreparedStatement.executeUpdate(OraclePreparedStatement.java:3675)
        at oracle.jdbc.driver.OraclePreparedStatementWrapper.executeUpdate(OraclePreparedStatementWrapper.java:1354)
        at weblogic.jdbc.wrapper.PreparedStatement.executeUpdate(PreparedStatement.java:174)
        at sun.reflect.GeneratedMethodAccessor353.invoke(Unknown Source)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke(Method.java:606)
        at com.granite.util.ProxyTools.invokeMethod(ProxyTools.java:147)
        at com.granite.util.database.PreparedStatementDecorator$PreparedStatementInvocationHandler.invoke(PreparedStatementDecorator.java:164)
        at com.sun.proxy.$Proxy68.executeUpdate(Unknown Source)
        at com.granite.middle.helper.jdbc.UtilityHelperJDBC.bindUpdate(UtilityH
        at com.granite.middle.helper.jdbc.UtilityHelperJDBC.doUpdateQuery(Utili
        at com.granite.udc.services.dao.oracle.AbstractOracleDAO.executeUpdate(
        at com.granite.udc.services.dao.oracle.AbstractOracleDAO.executeInsert(
        at com.granite.udc.services.dao.oracle.OracleUDCInstanceDAO.create(Orac
        at com.granite.udc.services.dao.UDCInstanceRoutingDAO.create(UDCInstanc
        at com.granite.udc.services.utility.UDCInstanceUtility.executeCreate(UD
        at com.granite.udc.services.utility.AbstractGroupInstanceUtility.proces
        at com.granite.udc.services.utility.UDCInstanceUtility.proxyCreateReque
        at com.granite.udc.services.utility.UDCInstanceUtility.create(UDCInstan
        at com.granite.udc.services.ejb.ClientUDCInstanceBean$1.doWork(ClientUD
        at com.granite.udc.services.ejb.ToolBox.doWork(ToolBox.java:871)
        at com.granite.udc.services.ejb.AbstractClientUDCInstanceBean.executeCo
        at com.granite.udc.services.ejb.ClientUDCInstanceBean.add(ClientUDCInst
        at com.granite.udc.services.ejb.XingClientUDCEJB_t6sxbk_EOImpl.__WL_inv
        at weblogic.ejb.container.internal.SessionRemoteMethodInvoker.invoke(Se
        at com.granite.udc.services.ejb.XingClientUDCEJB_t6sxbk_EOImpl.add(Unkn
        at com.granite.udc.services.ejb.XingClientUDCEJB_t6sxbk_EOImpl_WLSkel.i
        at weblogic.rmi.internal.BasicServerRef.invoke(BasicServerRef.java:693)
        at weblogic.rmi.cluster.ClusterableServerRef.invoke(ClusterableServerRe
        at weblogic.rmi.internal.BasicServerRef$1.run(BasicServerRef.java:519)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(Authenticat
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java
        at weblogic.rmi.internal.BasicServerRef.handleRequest(BasicServerRef.ja
        at weblogic.rmi.internal.wls.WLSExecuteRequest.run(WLSExecuteRequest.ja
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
When:
                  After some tests running at duplicated LEIS-NP 8.0.4 env. At weblogic logs.
                    Testers try to create new UDC instance.
So:
               VLR table for just created UDC definition is missing.               
               So instead of this list of steps for UDC instance creation ...

                    1) make new UDC definition;
                    2) make new UDC instance, based on just created UDC definition;

               ... this list of steps should be done:

                    1) make new UDC definition;
                    2) make VLR tables for all UDC definitions (see appropriate JobAid);
                    3) make new UDC instance, based on just created UDC definition;
                                   
What:
Upload starting

Uploading wire center ------------> lp05 <------------
Cannot obtain JDBC Connection for region region2 - Exception: java.sql.SQLException: Listener refused the connection with the following error:
ORA-12505, TNS:listener does not currently know of SID given in connect descriptor

java.sql.SQLException: Listener refused the connection with the following error:
ORA-12505, TNS:listener does not currently know of SID given in connect descriptor

        at oracle.jdbc.driver.T4CConnection.logon(T4CConnection.java:458)
        at oracle.jdbc.driver.PhysicalConnection.<init>(PhysicalConnection.java:546)
        at oracle.jdbc.driver.T4CConnection.<init>(T4CConnection.java:236)
        at oracle.jdbc.driver.T4CDriverExtension.getConnection(T4CDriverExtension.java:32)
        at oracle.jdbc.driver.OracleDriver.connect(OracleDriver.java:521)
        at java.sql.DriverManager.getConnection(DriverManager.java:571)
        at java.sql.DriverManager.getConnection(DriverManager.java:215)
        at com.telcordia.planet.upload.TaskCaller.getConnection(TaskCaller.java:226)
        at com.telcordia.planet.upload.TaskCaller.init(TaskCaller.java:58)
        at com.telcordia.planet.upload.RunRefresh.start(RunRefresh.java:33)
        at com.telcordia.planet.upload.Initiate.main(Initiate.java:55)
Caused by: oracle.net.ns.NetException: Listener refused the connection with the following error:
ORA-12505, TNS:listener does not currently know of SID given in connect descriptor

        at oracle.net.ns.NSProtocol.connect(NSProtocol.java:395)
        at oracle.jdbc.driver.T4CConnection.connect(T4CConnection.java:1102)
        at oracle.jdbc.driver.T4CConnection.logon(T4CConnection.java:320)
        ... 10 more

Upload failed
Error: The upload processing has failed.

Update LFACS Refresh message for failure ...
20170105 11:42:42,312[main]INFO -       >>initBDL()
                              20170105 11:42:42,314[main]INFO -DB name:region2
                              20170105 11:42:44,543[main]FATAL-BDL startup Exception: IIOPAdapter.Session.makeClientService.InitializeSessionFailed : (ffff0000000e000b) The administration database name has not been configured.
                              20170105 11:42:44,543[main]FATAL-BDL startup Exception: IIOPAdapter.Session.makeClientService.InitializeSessionFailed : (ffff0000000e000b) The administration database name has not been configured.
                              Trace file: stderr, mode a.
Opening file /lhome/leis/PT804/lib/dblist (r, 3) ...
When:
          lfacs.refresh at new LEIS-NP env
          Check for errors: /leis/DATA/granite/PT804/lp05test/log/refresh.out

So:
          Incorrect connection string below at the file $LEISDIR/planetbg1/config/planet.properties:
               ...
               region2JdbcUrl=jdbc:oracle:thin:@leis-np3.cc.telcordia.com:1521:fiapt
               ...
What:
cat $LEISDIR/planetbg1/log/tcb.log

2016-12-26 09:03:23,269 0     [main] INFO          TCBProcessor - TaperCodeBackgroundProcessor starting
2016-12-26 09:03:25,429 2160  [main] ERROR    ConnectionManager - Could not establish a BDL Session with region region2 - no processing can occur for this region
2016-12-26 09:03:25,432 2163  [main] ERROR    ConnectionManager - The following Xng login exception occurred: com.granite.bdl.ProtocolException: IIOPAdapter.Session.makeClientService.InitializeSessionFailed : (ffff0000000e000b) The administration database name has not been configured.
2016-12-26 09:03:25,433 2164  [main] ERROR                WCBDL - Cannot retrieve factory for region region2

cat $LEISDIR/planetbg1/log/tcbStdErr.log

com.granite.bdl.ProtocolException: IIOPAdapter.Session.makeClientService.InitializeSessionFailed : (ffff0000000e000b) The administration database name has not been configured.
        at com.granite.bdl.protocol.IIOP.adapter.Session.doStandardLogin(Session.java:620)
        at com.granite.bdl.protocol.IIOP.adapter.Session.makeClientService(Session.java:252)
        at com.granite.bdl.protocol.IIOP.adapter.Session.establish(Session.java:743)
        at com.granite.bdl.protocol.SessionBaseImpl.establish(SessionBaseImpl.java:49)
        at com.granite.bdl.protocol.FactoryImpl.initialize(FactoryImpl.java:72)
        at com.granite.bdl.protocol.FactoryImpl.startup(FactoryImpl.java:110)
        at com.telcordia.planet.util.ConnectionManager.getRegionBDLConnection(ConnectionManager.java:70)
        at com.telcordia.planet.bdl.WireCenterBDL.getActiveWireCenters(WireCenterBDL.java:33)
        at com.telcordia.planet.tc.TaperCodeBGProcessor.checkForTCWork(TaperCodeBGProcessor.java:170)
        at com.telcordia.planet.tc.TaperCodeBGProcessor.process(TaperCodeBGProcessor.java:139)
        at com.telcordia.planet.tc.TaperCodeBGProcessor.main(TaperCodeBGProcessor.java:112)
Caused by: (ffff0000000e000b) The administration database name has not been configured.
        at weblogic.rjvm.ResponseImpl.unmarshalReturn(ResponseImpl.java:237)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:464)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:272)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_12120_WLStub.login(Unknown Source)
        at com.granite.bdl.protocol.IIOP.adapter.Session.doStandardLogin(Session.java:601)
        ... 10 more
Caused by: (0) (ffff0000000e000b) The administration database name has not been configured.
        at weblogic.utils.StackTraceDisabled.unknownMethod()
When:
          starttcb.sh at just installed LEIS-NP env
So:
          Some of this files aren't up-to-date:
               $LEISDIR/planetbg1/config/Reg*jndi.properties
               $LEISDIR/planetbg1/config/planet.properties
What:
ld.so.1: wsftckcfg: fatal: /opt/vendor/oracle11g2/product/11.2.0.3/lib/libclntsh.so.11.1: wrong ELF class: ELFCLASS64
/lhome/leis/PT804/bin/wsftstart[85]: 1736 Killed
When:
          wsftstart -f
          On just installed LEIS-NP env.
So:
          In general:
               It means that you're trying to use 64-bit library (for ex) via your 32-bit app on your 64-bit OS.
          In case of LEIS-NP (which is on 64-bit OS):
               cat $LEISDIR/bin/leis_envfile_PT804
                         #This should link to 64-bit Oracle DB installation
ORACLE_HOME=/opt/vendor/oracle11g2/product/11.2.0.3;        export ORACLE_HOME
     #This should link to 32-bit Oracle client installation
DBMS_DIR=/opt/vendor/oracle11g2/product/11.2.0.3_32c;          export DBMS_DIR
...
What:
[]|[]|[23 Dec 2016 09:57:38,432]|[com.granite.util.locator.AbstractServiceLocator]|[[ACTIVE] ExecuteThread: '9' for queue: 'weblogic.kernel.Default (self-tuning)']|[WARN]|[Unable to locate item via JNDI name: xng/jdbc/leis-np3_region2]

javax.naming.NameNotFoundException: Unable to resolve 'xng.jdbc.leis-np3_region2'. Resolved 'xng.jdbc'; remaining name 'leis-np3_region2'
        at weblogic.jndi.internal.BasicNamingNode.newNameNotFoundException(BasicNamingNode.java:1180)
        at weblogic.jndi.internal.BasicNamingNode.lookupHere(BasicNamingNode.java:270)
        at weblogic.jndi.internal.ServerNamingNode.lookupHere(ServerNamingNode.java:187)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:210)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.WLEventContextImpl.lookup(WLEventContextImpl.java:253)
        at weblogic.jndi.internal.WLContextImpl.lookup(WLContextImpl.java:426)
        at javax.naming.InitialContext.lookup(InitialContext.java:411)
        at com.granite.util.locator.AbstractServiceLocator.getRemoteObject(AbstractServiceLocator.java:370)
        at com.granite.util.locator.AbstractServiceLocator.doCachedLookup(AbstractServiceLocator.java:605)
        at com.granite.util.locator.StandardDataSourceLocator.lookUpDataSource(StandardDataSourceLocator.java:110)
        at com.granite.util.locator.XNGServiceLocator.lookUpDataSource(XNGServiceLocator.java:307)
        at com.granite.middle.util.JndiResolver.resolveDataSource(JndiResolver.java:146)
        at com.granite.middle.helper.jdbc.ConnectionJDBC.<init>(ConnectionJDBC.java:104)
        at com.granite.middle.session.StatelessClientServiceBean.createRegionalConnection(StatelessClientServiceBean.java:1101)
        at com.granite.middle.session.StatelessClientServiceBean.doLogin(StatelessClientServiceBean.java:484)
        at com.granite.middle.session.StatelessClientServiceBean.login(StatelessClientServiceBean.java:126)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.__WL_invoke(Unknown Source)
        at weblogic.ejb.container.internal.SessionRemoteMethodInvoker.invoke(SessionRemoteMethodInvoker.java:34)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.login(Unknown Source)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_WLSkel.invoke(Unknown Source)
        at weblogic.rmi.internal.ServerRequest.sendReceive(ServerRequest.java:202)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:463)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:274)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_12120_WLStub.login(Unknown Source)
        at com.granite.bdl.protocol.IIOP.adapter.Session.doSSOLogin(Session.java:534)
        at com.granite.bdl.protocol.IIOP.adapter.Session.makeClientService(Session.java:226)
        at com.granite.bdl.protocol.IIOP.adapter.Session.establish(Session.java:743)
        at com.granite.bdl.protocol.SessionBaseImpl.establish(SessionBaseImpl.java:49)
        at com.granite.bdl.protocol.FactoryImpl.initialize(FactoryImpl.java:72)
        at com.granite.bdl.protocol.FactoryImpl.startup(FactoryImpl.java:110)
        at com.telcordia.planet.bdl.AppSession.login(AppSession.java:526)
        at com.telcordia.planet.servlet.LoginServlet.doPost(LoginServlet.java:83)
        at com.telcordia.planet.servlet.LoginServlet.doGet(LoginServlet.java:146)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:731)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:844)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254)
        at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:341)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:238)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3363)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3333)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2220)
        at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2146)
        at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2124)
        at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1564)
        at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:254)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
[]|[]|[23 Dec 2016 09:57:38,448]|[com.granite.util.locator.ServiceLocatorException]|[[ACTIVE] ExecuteThread: '9' for queue: 'weblogic.kernel.Default (self-tuning)']|[ERROR]|[JNDI Problem: Unable to resolve 'xng.jdbc.leis-np3_region2'. Resolved 'xng.jdbc']

javax.naming.NameNotFoundException: Unable to resolve 'xng.jdbc.leis-np3_region2'. Resolved 'xng.jdbc'; remaining name 'leis-np3_region2'
        at weblogic.jndi.internal.BasicNamingNode.newNameNotFoundException(BasicNamingNode.java:1180)
        at weblogic.jndi.internal.BasicNamingNode.lookupHere(BasicNamingNode.java:270)
        at weblogic.jndi.internal.ServerNamingNode.lookupHere(ServerNamingNode.java:187)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:210)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.BasicNamingNode.lookup(BasicNamingNode.java:224)
        at weblogic.jndi.internal.WLEventContextImpl.lookup(WLEventContextImpl.java:253)
        at weblogic.jndi.internal.WLContextImpl.lookup(WLContextImpl.java:426)
        at javax.naming.InitialContext.lookup(InitialContext.java:411)
        at com.granite.util.locator.AbstractServiceLocator.getRemoteObject(AbstractServiceLocator.java:370)
        at com.granite.util.locator.AbstractServiceLocator.doCachedLookup(AbstractServiceLocator.java:605)
        at com.granite.util.locator.StandardDataSourceLocator.lookUpDataSource(StandardDataSourceLocator.java:110)
        at com.granite.util.locator.XNGServiceLocator.lookUpDataSource(XNGServiceLocator.java:307)
        at com.granite.middle.util.JndiResolver.resolveDataSource(JndiResolver.java:146)
        at com.granite.middle.helper.jdbc.ConnectionJDBC.<init>(ConnectionJDBC.java:104)
        at com.granite.middle.session.StatelessClientServiceBean.createRegionalConnection(StatelessClientServiceBean.java:1101)
        at com.granite.middle.session.StatelessClientServiceBean.doLogin(StatelessClientServiceBean.java:484)
        at com.granite.middle.session.StatelessClientServiceBean.login(StatelessClientServiceBean.java:126)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.__WL_invoke(Unknown Source)
        at weblogic.ejb.container.internal.SessionRemoteMethodInvoker.invoke(SessionRemoteMethodInvoker.java:34)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl.login(Unknown Source)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_WLSkel.invoke(Unknown Source)
        at weblogic.rmi.internal.ServerRequest.sendReceive(ServerRequest.java:202)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:463)
        at weblogic.rmi.cluster.ClusterableRemoteRef.invoke(ClusterableRemoteRef.java:274)
        at com.granite.middle.session.ClientServiceEJB_x0olvn_EOImpl_12120_WLStub.login(Unknown Source)
        at com.granite.bdl.protocol.IIOP.adapter.Session.doSSOLogin(Session.java:534)
        at com.granite.bdl.protocol.IIOP.adapter.Session.makeClientService(Session.java:226)
        at com.granite.bdl.protocol.IIOP.adapter.Session.establish(Session.java:743)
        at com.granite.bdl.protocol.SessionBaseImpl.establish(SessionBaseImpl.java:49)
        at com.granite.bdl.protocol.FactoryImpl.initialize(FactoryImpl.java:72)
        at com.granite.bdl.protocol.FactoryImpl.startup(FactoryImpl.java:110)
        at com.telcordia.planet.bdl.AppSession.login(AppSession.java:526)
        at com.telcordia.planet.servlet.LoginServlet.doPost(LoginServlet.java:83)
        at com.telcordia.planet.servlet.LoginServlet.doGet(LoginServlet.java:146)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:731)
        at javax.servlet.http.HttpServlet.service(HttpServlet.java:844)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254)
        at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:341)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:238)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3363)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3333)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2220)
        at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2146)
        at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2124)
        at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1564)
        at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:254)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
When:
          Ability to connect as sysadm to the LEIS-NP application on mutant GI env (where new DB has been inserted in the old GI env)
So:
          Data source for region2 (which is default for sysadm user) was missing.
          Has been added via WL admin console.
What:
<Dec 22, 2016 4:46:41 AM EST> <Error> <Deployer> <BEA-149205> <Failed to initialize the application "leis-np3Admin" due to error weblogic.application.ModuleException: java.net.ConnectException: Connection refused
weblogic.application.ModuleException: java.net.ConnectException: Connection refused
        at weblogic.jdbc.module.JDBCModule.prepare(JDBCModule.java:338)
        at weblogic.application.internal.flow.ModuleListenerInvoker.prepare(ModuleListenerInvoker.java:100)
        at weblogic.application.internal.flow.ModuleStateDriver$1.next(ModuleStateDriver.java:172)
        at weblogic.application.internal.flow.ModuleStateDriver$1.next(ModuleStateDriver.java:167)
        at weblogic.application.utils.StateMachineDriver.nextState(StateMachineDriver.java:42)
        Truncated. see log file for complete stacktrace
Caused By: java.net.ConnectException: Connection refused
        at java.net.PlainSocketImpl.socketConnect(Native Method)
        at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:339)
        at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:200)
        at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:182)
        at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)
        Truncated. see log file for complete stacktrace
When:
          Startup of MWL, where just created DB has been used.
So:
          Check MWL -> DB     connection string. It's not correct right now (DB used another listener port, then it was defined at MWL)
What:
ORA-01547: warning: RECOVER succeeded but OPEN RESETLOGS would get error below
ORA-01152: file 1 was not restored from a sufficiently old backup
ORA-01110: data file 1: '/u02/oradata/lnp1vmtr/system01.dbf'

RMAN-03002: failure of recover command at 12/20/2016 09:48:44
RMAN-06054: media recovery requesting unknown archived log for thread 1 with sequence 1 and starting SCN of 20479
When:
          DB restore/recover from bu (during cloning of original DB at the another server).
So:     
           
     ARCHIVE LOG DEST (see script below) contained value from original DB and didn't exist at the new server.
set linesize 160 pagesize 99
col DESTINATION forma a19
col NAME format a9
col VALID_NOW format a10
col VALID_ROLE format a12
col LOG_SEQ for 9999999
col error format a15
col PROC for a4
col sync for a4
select substr(DEST_NAME, 13) as NAME, DESTINATION, STATUS, TARGET, LOG_SEQUENCE as LOG_SEQ, VALID_NOW,  error, VALID_TYPE, VALID_role, PROCESS as proc, substr(TRANSMIT_MODE,1,4) as sync from V$ARCHIVE_DEST
where status !='INACTIVE';
Edit ARCHIVE LOG DEST to point to the existing place and re-run recovery of the DB:
run
{
SET UNTIL SCN 85013704;
RECOVER DATABASE;
}
OR

Find out, which exactly DF is newer

set linesize 90 pagesize 50
col name for a50
select checkpoint_change#, status, file#, name  from v$datafile order by file#;
set linesize 90 pagesize 50
col name for a40
select checkpoint_change#, status, fuzzy, file#, name from v$datafile_header order by file#;

Restore that DF once again
run
{
SET NEWNAME FOR DATAFILE 11 TO '/u03/oradata/lnp1vmtr/leis_indx04.dbf';
RESTORE DATAFILE 11;
SWITCH DATAFILE ALL;
}
Make sure, that there's no such newer DF this time.
Recover whole DB
run
{
SET UNTIL SEQUENCE 1032;
RECOVER DATABASE;
}


What:
2016-12-15 09:59:02,082 0     [main] INFO          TCBProcessor - TaperCodeBackgroundProcessor starting
2016-12-15 09:59:07,588 5506  [main] INFO            CmuChgJDBC - wcID=rs5; wcName=rswlgam5
2016-12-15 09:59:07,776 5694  [main] INFO            CmuChgJDBC - wcID=ndt; wcName=chrlncde
2016-12-15 09:59:07,797 5715  [main] INFO          TCBProcessor - CMUBGProcessor - Starting processing for wire center rswlgam5 at Thu Dec 15 09:59:07 EST 2016
2016-12-15 09:59:12,247 10165 [main] INFO          TCBProcessor - CMUBGProcessor - Finished processing for wire center rswlgam5 at Thu Dec 15 09:59:12 EST 2016
2016-12-15 09:59:12,248 10166 [main] INFO          TCBProcessor - CMUBGProcessor - Starting processing for wire center chrlncde at Thu Dec 15 09:59:12 EST 2016
2016-12-15 09:59:15,928 13846 [main] ERROR         TCBProcessor - CMUBGProcessor - command /lhome/leis/PT802/bin/send.changes failed - command error output is: Error: The NPA/NXX for wire center chrlncde in the leis_dts_map table is blank.
The send environment is not properly set up.  CMU updates cannot be
        sent to LFACS.
When:
          After LEIS-NP->LFACS connection re-configuration, while sending taper code:
               tail -25 $LEISDIR/planetbg1/log/tcb.log
So:
          Information at the table below contains incorrect info at NPA_NXX column (duplicated values, for ex):
               planet_common.leis_dts_map
          Try to delete line or rename it's NPA_NXX.
What:
Wire center: lp05test  NPA/NXX: 206690  Thu Dec 15 08:00:42 2016
  Unable to register application: LEISNP7 LEISINT.  fterrno: -12 (invalid function name)

Wire center: lp05test  NPA/NXX: 206690  Thu Dec 15 08:00:42 2016
  DTS is currently unable to communicate with the LFACS machine.  TPR update transactions will be sent to LFACS after communication is established.
When:
          LEIS-NP testers try to send tpr contract on just re-configured to the new LFACS instance:
               tail -30 $DTS_FILESDIR/sendtpr/error.log
So:
          Information at the table below doesn't contain information up-to-date (LEIS_MACH column):
               planet_common.leis_dts_map
What:
<Nov 25, 2016 10:02:29 AM EST> <Info> <WebLogicServer> <BEA-000377> <Starting WebLogic Server with Java HotSpot(TM) 64-Bit Server VM Version 24.91-b03 from Oracle Corporation.>
<Nov 25, 2016 10:02:34 AM EST> <Info> <Management> <BEA-141297> <Could not get the server file lock. Ensure that another server is not running in the same directory. Retrying for another 60 seconds.>
<Nov 25, 2016 10:03:34 AM EST> <Info> <Management> <BEA-141297> <Could not get the server file lock. Ensure that another server is not running in the same directory. Retrying for another 60 seconds.>
<Nov 25, 2016 10:04:34 AM EST> <Info> <Management> <BEA-141297> <Could not get the server file lock. Ensure that another server is not running in the same directory. Retrying for another 60 seconds.>
<Nov 25, 2016 10:05:34 AM EST> <Critical> <WebLogicServer> <BEA-000362> <Server failed. Reason:
There are 1 nested errors:
weblogic.management.ManagementException: Unable to obtain lock on /app/bea/user_projects/domains/granite/servers/granite_core/tmp/granite_core.lok. Server may already be running
        at weblogic.management.internal.ServerLocks.getServerLock(ServerLocks.java:213)
        at weblogic.management.internal.ServerLocks.getServerLock(ServerLocks.java:69)
        at weblogic.management.internal.DomainDirectoryService.start(DomainDirectoryService.java:85)
        at weblogic.t3.srvr.ServerServicesManager.startService(ServerServicesManager.java:461)
        at weblogic.t3.srvr.ServerServicesManager.startInStandbyState(ServerServicesManager.java:166)
        at weblogic.t3.srvr.T3Srvr.initializeStandby(T3Srvr.java:895)
        at weblogic.t3.srvr.T3Srvr.startup(T3Srvr.java:572)
        at weblogic.t3.srvr.T3Srvr.run(T3Srvr.java:471)
        at weblogic.Server.main(Server.java:74)
When:
          Starting WL managed server
So:
          Stop that WL managed server once more. Then try to start it again.
What:
E_QE0024_TRANSACTION_ABORTED  The transaction log file is full.  The transaction will be aborted.
E_DM9059_TRAN_FORCE_ABORT     The transaction (000056C5, 579F11D3) in database txhbasp is being force aborted.
When:
          Error from Ingres 10.2 error.log when this operation of many rows deletion is being run:
               /ntools.sccs/leis/TOOLS/bin/pruneSvc_histData txhbasp     
So:
          Increase transaction log size (both logs should be destroyed prior this).
What:
10/17 06:20:29: TOPCOM Session #3 (LEIS003) On Handler (Hdl1)
  States: (Session Level: *** unknown code ***, Application Level: Closed)
  Session down, rejecting connects
  Error code 6: unknown session number
  Inputs Received = -559038739    Outputs Sent = 18
  Inputs Waiting For Receive Request = 0
  Outputs Waiting To Be Sent = 78584
When:
          New TOPCOM configuration and starting.
So:
          Ключ org для сессии и ключ org для группы совпадали между собой. они хоть и рандомные, но должны быть уникальны между собой
What:
x ././@LongLink, 108 bytes, 1 tape blocks
x xng/projects/web-access-toolkit/source/java/neutral/com/telcordia/granite/webaccess/toolkit/mapping, 0 bytes, 0 tape blocks
tar: ././@LongLink: typeflag 'L' not recognized, converting to regular file
x ././@LongLink, 131 bytes, 1 tape blocks
x xng/projects/web-access-toolkit/source/java/neutral/com/telcordia/granite/webaccess/toolkit/mapping, 0 bytes, 0 tape blocks
tar: directory checksum error
When:
          tar xvf Granite_901.tar
So:
          When tar is extracted using the native tar present on Solaris, it fails to extract properly as the native tar cannot process long file names.
          Use not native tar:
               /usr/sfw/bin/gtar xvf Granite_901.tar

What:
leimq: cannot create spool file (/usr/spool/leimq/sleep.07811b): No such file or directory
When:
          leimq sleep 10
So:
export QNAME=leim
sudo mkdir /usr/spool/$QNAMEq
sudo chmod 777 /usr/spool/$QNAMEq
sudo touch /usr/spool/$QNAMEq/.lock
sudo chmod 666 /usr/spool/$QNAMEq/.lock
What:
Something is wrong with the Permission File.
Check with your LEIS Coordinator.
sorry, not permitted
When:
          Running leisadmin command during loading of common database
          OR
          q sleep 10
          OR
          running some reports on OS level (wctr, for ex)

So:
          > Something is wrong with the Permission File
          > Check with your LEIS Coordinator
          Make sure that this file is available:

               ls -la $LEISDIR/lib/.qsetup/.perm
               -rw-r--r--   1 leis     leis        1051 Jul 29 04:51 /leis/test/R33.0/leis/lib/.qsetup/.perm

          >  sorry, not permitted
          Make sure that you are among users, which can run the queuer (listed in the $LEISDIR/lib/.qsetup/.perm file)

          Make sure that no old processes of qsched are running :

               ps -ef | grep qsched
                    root 11374     1   0   Apr 21 ?           0:23 /leis/test/R33.0/leis/lib/qsched q          <== this is old process from wrong env that handles all requests

What:
[ERROR][16/08/29 03:06:29] Failed to connect to database: Unable to establish connection due to communications error. in thread "localhost-startStop-1"
ca.edbc.util.EdbcEx: Unable to establish connection due to communications error.
        at ca.edbc.util.EdbcEx.get(EdbcEx.java:190)
        at ca.edbc.util.EdbcEx.get(EdbcEx.java:221)
        at ca.edbc.util.EdbcEx.get(EdbcEx.java:258)
        at ca.edbc.io.DbConnIo.<init>(DbConnIo.java:157)
        at ca.edbc.io.DbConnOut.<init>(DbConnOut.java:160)
        at ca.edbc.io.DbConnIn.<init>(DbConnIn.java:186)
        at ca.edbc.io.DbConn.<init>(DbConn.java:270)
        at ca.edbc.jdbc.EdbcConnect.server_connect(EdbcConnect.java:464)
        at ca.edbc.jdbc.EdbcConnect.<init>(EdbcConnect.java:353)
        at ca.edbc.jdbc.EdbcDriver.connect(EdbcDriver.java:444)
        at java.sql.DriverManager.getConnection(DriverManager.java:664)
        at java.sql.DriverManager.getConnection(DriverManager.java:247)
        at com.telcordia.leis.jdbc.DBConnectionManager.getConnection(DBConnectionManager.java:83)
        at com.telcordia.leis.jdbc.DBConnectionManager.getConnection(DBConnectionManager.java:70)
        at com.telcordia.leis.data.LeisHost.checkOutDBConnection(LeisHost.java:235)
        at com.telcordia.leis.data.LeisHost.createInstance(LeisHost.java:52)
        at com.telcordia.leis.data.LeisHost.getInstance(LeisHost.java:32)
        at com.telcordia.leis.servlet.DataInitServlet.init(DataInitServlet.java:36)
        at javax.servlet.GenericServlet.init(GenericServlet.java:160)
        at org.apache.catalina.core.StandardWrapper.initServlet(StandardWrapper.java:1280)
        at org.apache.catalina.core.StandardWrapper.loadServlet(StandardWrapper.java:1193)
        at org.apache.catalina.core.StandardWrapper.load(StandardWrapper.java:1088)
        at org.apache.catalina.core.StandardContext.loadOnStartup(StandardContext.java:5176)
        at org.apache.catalina.core.StandardContext.startInternal(StandardContext.java:5460)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:150)
        at org.apache.catalina.core.ContainerBase$StartChild.call(ContainerBase.java:1559)
        at org.apache.catalina.core.ContainerBase$StartChild.call(ContainerBase.java:1549)
        at java.util.concurrent.FutureTask.run(FutureTask.java:266)
        at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
        at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
        at java.lang.Thread.run(Thread.java:745)
[ERROR][16/08/29 03:06:29] Exception in LeisHost.checkOutDBConnection(), dbname=leadlts in thread "localhost-startStop-1"
[ERROR][16/08/29 03:06:29] ca.edbc.util.EdbcEx: Unable to establish connection due to communications error. in thread "localhost-startStop-1"
[ERROR][16/08/29 03:06:29] LeisHost can't be initilized. in thread "localhost-startStop-1"
When:
          Tomcat startup.
So:
          This file contained wrong DBPort value (because was copied from env where there is Ingres instance IB):
                    $LEISWEBDIR/conf/leis.properties
             Our Ingres instance is II, so use this...
                    DBPort=II7
               ...instead of this...
                    DBPort=IB7
What:
[ERROR][16/08/26 08:38:16] Error message=cat: cannot open /appl/R33.0/leis/lib/wctrdb
in thread "localhost-startStop-1"
[ERROR][16/08/26 08:38:16] Error file - /tmp/WEB_GETWCLIST1.err contains null in thread "localhost-startStop-1"
[ERROR][16/08/26 08:38:16] LocalConnection:Exception=java.lang.Exception: Error occurred at "08:38:16". Please contact your System Administrator to investigate the error in the system log file. in thread "localhost-startStop-1"
When:
          During first Tomcat start (initial LEIS modules installation)
So:
          This file is missing (or not created yet - if we're talking about initial LEISWEB module installation):
               ls -la $LEISDIR/lib/wctrdb
What:
Error: pam.conf is suspect. Contact LEIS CSCC.
When:
          Initial installation of LEIS's LEISWEB module.
So:
          /etc/pam.conf contained spaces instead of tabs (because this wrong string was copied manually).
          Use :.l to understand whether you use tabs or spaces
What:
Reading shell functions defined in leisInstallFuncs ...
Error: ingvalidpw does not exist in the Ingres bin.
When:
          Initial installation of LEIS's LEISWEB module.
So:
          This file is missing:
               $INGDIR/bin/ingvalidpw
          This program will validate the client's identifier and password during it's WEB access to the DB.
          You have to create this utility manually:
     #Log as xburser

cd /tmp
sudo script mkvalidpw.out
     #Now - as root:
export II_SYSTEM=/opt/ingres10.2
export ING_HOME=$II_SYSTEM/ingres
export INGDIR=$II_SYSTEM/ingres
export LD_LIBRARY_PATH=$II_SYSTEM/ingres/lib:/lib:/usr/ccs/lib:/usr/ucblib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH_64=$II_SYSTEM/ingres/lib/lp64
export TERM=vt100
export PATH=$II_SYSTEM/ingres/bin:$II_SYSTEM/ingres/lib:$II_SYSTEM/ingres/files:$II_SYSTEM/ingres/utility:$PATH
mkvalidpw

Do not forget also:
          sudo chmod 6755 $INGDIR/bin/ingvalidpw
What:
FEadfcb: II_SYSTEM IS NOT SET CORRECTLY
ERget: Directory error.
Warning: Application login 'esm' does not have security administration
        permission.  Please use accessdb to add this permission.
Error: Application login 'lad' does not have security administration
        permission.  Please use accessdb to add this permission.
Error: Application login 'lead' does not have security administration
        permission.  Please use accessdb to add this permission.
Warning: Application login 'leim' does not have security administration
        permission.  Please use accessdb to add this permission.
Warning: Application login 'leis' does not have security administration
        permission.  Please use accessdb to add this permission.
When:
          Installation of LEIS module LEIS.
So:
          Define this general variable:

               export INGDIR=$II_SYSTEM/ingres
What:
ERROR: Failed to switch (u59978/59978) to user #59982
When:
          Running installation of module via BAIST with user leis (59978), while BAIST is installed with user lbuild (59982)
So:
What:
ld.so.1: whoami: fatal: relocation error: file /usr/local/bin/whoami: symbol libintl_bindtextdomain: referenced symbol not found
When:
          bash-3.2$ whoami
So:
          This utility is in use:
                /usr/local/bin/whoami
           It seems, that it was just manually copied to this new server - so it's uncompatible.
           Try to use this:
               /usr/ucb/whoami
            So:
               export PATH=/usr/ucb:$PATH
What:
DEBUG manager: 7/27 06:49:47 manager process id: 17760, grpid: 17760, loginid: lead
DEBUG manager: 7/27 06:49:47 config file used is /export/home/xburser/installed/topcom/300_55/config
CNF012:7/27 06:49:47 /export/home/xburser/installed/topcom/300_55/config, line 10: specified GROUP is not defined 'RANDOM_5'
CNF034:7/27 06:49:47 /export/home/xburser/installed/topcom/300_55/config, line 10: Request window less than low window for Session 'RANDOM_4'
CNF040:7/27 06:49:47 /export/home/xburser/installed/topcom/300_55/config, line 10: Missing dest= on Session 'RANDOM_4'
DEBUG manager: 7/27 06:49:47 Fatal: child process 17760 died.
MGR085:7/27 06:49:47 FATAL manager: cannot fork -- errno 0: Error 0

Output from ipcs -q:
IPC status from <running system> as of Wed Jul 27 06:49:47 EDT 2016
T         ID      KEY        MODE        OWNER    GROUP
Message Queues:

Output from ps -aef | egrep "PID|mqc|mqhandler|tpc|handler|manager|tsapd|pvc" | grep -v egrep:
     UID   PID  PPID   C    STIME TTY         TIME CMD
    lead 17759 17681   0 06:49:45 pts/3       0:00 manager -l /export/home/xburser/installed/topcom/300_55/manlog300 -f /export/ho
When:       
          Starting new (just configured) TOPCOM session.
               topctrl -ic -k778 -s0
So:
          At config file: name of group differs from names of group that are mentioned in the file in the other places (session, etc)
What:
          IN tstatall
          07/27 04:23:50: TOPCOM Session #0 (RMT1) On Handler (Hdl1)
  States: (Session Level: Idle, Application Level: Closed)
  Session down, accepting connects - connect failed - transport connect failed
  Inputs Received = 0    Outputs Sent = 0
  Inputs Waiting For Receive Request = 0
  Outputs Waiting To Be Sent = 0

          IN logfile
SLH020:7/27 04:19:38 Session initiated by TOPCOM,
                     Local Session Identifier: RMT1,
                     Called Address: TLD12TLD001, Session #: 0
start_tcp_client: bind OK for local IP addr=128.96.156.81 port=1025 errno=0
join_tcp_server: connecting to remote IP addr=128.96.249.110  sin_port=4003
DEBUG tp_open (Tpc1): 7/27 04:19:40 T-CONNECT-REQUEST FAILED: Reason not specified
DEBUG tpc (Tpc1): 7/27 04:19:40 WARNING: tp_open() failed - An unknown error occurred.
WARN:7/27 04:19:40 TPC042 tpc (Tpc1): transport connect attempt failed:  An unknown error occurred.
DEBUG manager: 7/27 04:19:40 tpcreqdisc: tpc status is OUTCONN, send TRCONN rsp to handler.
WARN:7/27 04:19:40 MGR052 manager: Invalid tpc senderpid, close transport failed. -- errno 0: Error 0
SLH023:7/27 04:19:40 Session initiated by TOPCOM failed,
                     Local Session Identifier: RMT1,
                     Called Address: TLD12TLD001, Session #: 0,
                     Reason Text: Transport connect failed
DEBUG handler (Hdl1): 7/27 04:19:40 Session(RMT1, 0): With Partner() Terminated
                 Data Inputs Received = 0    Data Outputs Sent = 0
                 Largest Message Received = 0   Largest Message Sent = 0
                 Total Data Chars Received = 0  Total Data Chars Sent = 0
                 Total ALCMs Received = 0     Total ALCMs Sent = 0
                 Total ALNCMs Received = 0    Total ALNCMs Sent = 0
When:
          Starting new (just configured) TOPCOM session.
               topctrl -ic -k778 -s0
So:
     try to re-start TOPCOM several times (sometimes it helps)
     OR
    cat config: 
          this
          Session RMT11 group=RMT1 handler=Hdl1 sesnum=0\
          org="RMT1" +lngthprefix
          instead of this
         Session RMT11 group=RMT1 handler=Hdl1 sesnum=0\
          org="RMT1"
     OR
          possible reason: the same parameters names are different (in 1 config files, or between different config files)
     OR
          just make config files via edconfig
     OR
          "There was a RCAF permissions problem on the mainframe side that needed to be fixed for event messages to flow to LEIS in the test environment"
What:
The referenced account is currently locked out and may not be logged on to.
When:
          During connection to the shared resources (after pwd changing of DTR account).
So:
          From the command line at the local PC (Windows):

               control keymgr.dll

          Delete stored password for resource.
          Restart local PC.
What:
E_US0014 Database not available at this time.
    o The database may be marked inoperable.  This can occur if
           CREATEDB failed.
         o An exclusive database lock may be held by another session.
         o The database may be open by an exclusive (/SOLE) DBMS server.
    (Wed Jun 29 07:51:44 2016)

                    AND

Wed Jun 29 07:45:44 2016 E_DM110D_CPP_DB_BUSY   Database is currently being used. Database lock conflict.
When:
                         Accordingly:

          sql -l imadb

                              AND

          ckpdb -d -j imadb
So:
          look at the locks on the database
          ipm
What:
INGRES TERMINAL MONITOR Copyright 2010 Ingres Corporation
E_US0042 The major database compatibility level does not match that of the
    server.
Be sure the server is compatible with the requested database.
    (Fri Jun 24 09:44:19 2016)
When:
          Tried to connect to the DB right after installation upgrade, but before this db was upgraded.
So:
          Finish the db upgrade (with upgradedb utility).
What:

During Ingres DB starting:
Starting the Recovery Server...FAIL

iirundbms: server would not start.
        II_SYSTEM must be set in your environment.
        Has the csinstall program been run?
        II_DATABASE, II_CHECKPOINT, II_JOURNAL and II_DUMP
            must also be set.  See II_CONFIG/symbol.tbl.
        Check the file '/opt/ingres9.2/ingres/files/errlog.log'
            for more details concerning internal errors.
        See the Installation Guide for more
            information concerning server startup.

The Recovery Server failed to start.

errlog.log:
                                                      0000000100b26200   Fri Jun 24 02:54:59 2016 E_CL2537_CS_MAP_SSEG_FAIL     Failure in attempt to map the UNIX system segment (shared memory).  The most common causes of this problem are: 1) user does not have the required privileges; 2) the shared memory has not been installed.  If not installed, the CSINSTALL utility can be used to install the shared memory segment.

logstat:
                    CS_map_sys_segment: sysseg.mem is version 28204939 (673204537). We need version 1F1C4939 (521947449)
CSMTinitiate: Error (00000001) in CS_map_sys_segment
(/devsrc/ingres2006r3/c101/src/back/dmf/dmf/logstat.c, 598) ERsend--->'                  ::[LOGSTAT           , 7827      ,  000000
0100b26200]: Fri Jun 24 07:14:06 2016 E_CL2537_CS_MAP_SSEG_FAIL Failure in attempt to map the UNIX system segment (shared memory).
The most common causes of this problem are: 1) user does not have the required privileges; 2) the shared memory has not been insta
lled.  If not installed, the CSINSTALL utility can be used to install the shared memory segment.'

When:
          After "upgrading" 9.2 -> 10.0 Ingres Db at the totally new server.
So:
          Reinstall installation and move that files (bin and lib) that were not overwritten.
What:
x pax: ingres/lib/libxerces-c.so : exists - will not overwrite

x pax: ingres/bin/lp64/cacheutil : exists - will not overwrite               x
x pax: ingres/bin/lp64/dmfacp : exists - will not overwrite                  x
x pax: ingres/bin/lp64/dmfjsp : exists - will not overwrite                  x
x pax: ingres/bin/lp64/dmfrcp : exists - will not overwrite                  x
x pax: ingres/bin/lp64/iidbms : exists - will not overwrite                  x
x pax: ingres/bin/lp64/iishowres : exists - will not overwrite               x
x pax: ingres/bin/lp64/iistar : exists - will not overwrite                  x
x pax: ingres/bin/lp64/lartool : exists - will not overwrite                 x
x pax: ingres/bin/lp64/lockstat : exists - will not overwrite                x
x pax: ingres/bin/lp64/logdump : exists - will not overwrite                 x
x pax: ingres/bin/lp64/logstat : exists - will not overwrite                 x
x pax: ingres/bin/lp64/rcpconfig : exists - will not overwrite               x
x pax: ingres/bin/lp64/rcpstat : exists - will not overwrite                 x
x pax: ingres/bin/lp64/repstat : exists - will not overwrite

x pax: ingres/bin/cacheutil : exists - will not overwrite                    x
x pax: ingres/bin/dmfacp : exists - will not overwrite                       x
x pax: ingres/bin/dmfjsp : exists - will not overwrite                       x
x pax: ingres/bin/dmfrcp : exists - will not overwrite                       x
x pax: ingres/bin/iidbms : exists - will not overwrite                       x
x pax: ingres/bin/iishowres : exists - will not overwrite                    x
x pax: ingres/bin/iistar : exists - will not overwrite                       x
x pax: ingres/bin/lartool : exists - will not overwrite                      x
x pax: ingres/bin/lockstat : exists - will not overwrite                     x
x pax: ingres/bin/logdump : exists - will not overwrite                      x
x pax: ingres/bin/logstat : exists - will not overwrite                      x
x pax: ingres/bin/rcpconfig : exists - will not overwrite                    x
x pax: ingres/bin/rcpstat : exists - will not overwrite                      x
x pax: ingres/bin/repstat : exists - will not overwrite
When:
          During setuping of new installation 10.0 on currently installation 9.2
So:
          Ignore and go on.
          
What:
Destroying database 'testdb' . . .

E_US0003 User does not have permission to access this database.
    (Wed Jun 15 03:35:02 2016)
Destruction of database 'testdb' abnormally terminated.
When:
          destroydb testdb
So:
          destroydb testdb -umydba
What:
/dev/kmem is not readable by ingres.
When:
          In particular - when Ingres starts (in general - every time syscheck runs)
So:
          http://www.ca.com/us/support/ca-support-online/product-content/knowledgebase-articles/tec484319.aspx
          Because of this permission:
ls -lgL /dev/kmem
crw-r-----   1 sys       13,  1 Jun  6 11:30 /dev/kmem

Ingres should be added (in this case) in the group sys:
cat /etc/group | grep ingres
sys::3:root,bin,adm,ingres
What:
x Your Unix command search path is not set correctly.  Please refer to the   x
x Installation Guide for instructions on how to set your Unix command search x
x path before re-running ingbuild.
When:
          Ingres installation via ingbuild utility
So:
          One of this variables isn't set:
          echo $PATH | grep $II_SYSTEM/ingres/bin
          echo $PATH | grep $II_SYSTEM/ingres/utility
          echo $LD_LIBRARY_PATH
          echo $LD_LIBRARY_PATH_64
What:
cvs server: cannot open /cvs/leisxngRepository/CVSROOT/config: Permission denied
Cannot access /cvs/leisxngRepository/CVSROOT
Permission denied
When:
          Trying to do remote checkout from cvs for non-priviledged user
               cvs -d :ext:bldadm@lnp2vm.cc.telcordia.com:/cvs/leisxngRepository co lxngTestSSO
So:
What:
cvs [checkout aborted]: end of file from server (consult above messages if any)
When:
          Trying to do remote checkout from cvs
               cvs -d :ext:bldadm@lnp2vm.cc.telcordia.com:/cvs/leisxngRepository co lxngTestSSO
So:
          This variables should be established to work with remote repository:
               export CVS_RSH=/usr/bin/ssh
               export CVS_SERVER=/usr/local/bin/cvs
What:
SLH020:4/11 11:17:53 Session initiated by TOPCOM,
                     Local Session Identifier: FSPRD150,
                     Called Address: LFACS6M, Session #: 5
start_tcp_client: bind OK for local IP addr=150.234.114.171 port=1030 errno=0
join_tcp_server: connecting to remote IP addr=135.153.226.225  sin_port=104
DEBUG tp_open (Tpc5): 4/11 11:17:55 T-CONNECT-REQUEST FAILED: Reason not specified
DEBUG tp_open (Tpc5): 4/11 11:17:55 rmt host - z1systl.mvs.sbc.com  port=104
DEBUG tp_open (Tpc5): 4/11 11:17:55 check to insure remote is listening on port
DEBUG tpc (Tpc5): 4/11 11:17:55 WARNING: tp_open() failed - An unknown error occurred.
WARN:4/11 11:17:55 TPC042 tpc (Tpc5): transport connect attempt failed:  An unknown error occurred.
DEBUG manager: 4/11 11:17:55 tpcreqdisc: tpc status is OUTCONN, send TRCONN rsp to handler.
WARN:4/11 11:17:55 MGR052 manager: Invalid tpc senderpid, close transport failed. -- errno 0: Error 0
SLH023:4/11 11:17:55 Session initiated by TOPCOM failed,
                     Local Session Identifier: FSPRD150,
                     Called Address: LFACS6M, Session #: 5,
                     Reason Text: Transport connect failed
DEBUG handler (Hdl1): 4/11 11:17:55 Session(FSPRD150, 5): With Partner() Terminated
                 Data Inputs Received = 0    Data Outputs Sent = 0
                 Largest Message Received = 0   Largest Message Sent = 0
                 Total Data Chars Received = 0  Total Data Chars Sent = 0
                 Total ALCMs Received = 0     Total ALCMs Sent = 0
                 Total ALNCMs Received = 0    Total ALNCMs Sent = 0

HDL001:4/11 11:21:48 (Hdl1) Housekeeping started, heap = 24K bytes
fs150_lead[/appl/tlc/bae/topcom/topcom16.0]:
When:
          TOPCOM configuration.
So:
There was a RCAF permissions problem on the mainframe side that needed to be fixed for event messages to flow to
LEIS in the test environment.
What:
NID-00106: LOGIN to target database failed with Oracle error:
ORA-01017: invalid username/password; logon denied
When:
          nid target=/ dbname=I2Otest
So:
          nid target=sys/oramanager dbname=I2Otest
What:
cvs commit: nothing known about `tf.txt'
cvs [commit aborted]: correct above errors first!
When:
          Trying to add a new file to existing in CVS repository module:
               cvs commit tf.txt
So:
          This command should be done prior that:
               cvs add tf.txt
What:
[ERROR][16/03/16 11:02:28] Exception during login session: java.lang.NullPointerException in thread "http-bio-6443-exec-6"
[ERROR][16/03/16 11:02:35] User xburser could not login because of an unknown error, errno -127 in thread "http-bio-6443-exec-7"
When:
          This error from log    /leis/test/R32.0/leisweb/logs/LeisWebModule.log   was written every time you try to log with correct password to LEISWEB
So:
          Another log    $LEISWEBDIR/logs/catalina.out   showed that this is because of absence of binary file leis_svc, that is involved in LEISWEB authorization.
          Eventually it figured out that this file was just renamed by someone from leis_svc to leis.svc.  After renaming it back and rebooting of Tomcat everything works fine.
What:
./setEnv.sh: line 43: syntax error: unexpected end of file
When:
          When you try to execute Unix *.sh file, which was edited in Windows.
So:
What:
./setEnv.sh: line 20: syntax error near unexpected token `$'}\r''
When:
          When you try to execute Unix *.sh file, which was edited in Windows.
So:
export PROBLEM_FILE=setEnv.sh
awk '{ sub("\r$", ""); print }' $PROBLEM_FILE > $PROBLEM_FILE.temp
mv $PROBLEM_FILE.temp $PROBLEM_FILE
chmod 777 $PROBLEM_FILE
What:
2016-02-02 16:51:43,857 482544113 [main] ERROR    ConnectionManager - Could not establish a BDL Session with region region2 - no processing can occur for this region
2016-02-02 16:51:43,866 482544122 [main] ERROR    ConnectionManager - The Xng System is currently not available for region region2
2016-02-02 16:51:43,867 482544123 [main] ERROR                WCBDL - Cannot retrieve factory for region region2
2016-02-02 16:51:44,456 482544712 [main] INFO            CmuChgJDBC - wcID=lp05; wcName=lp05test
2016-02-02 16:51:44,457 482544713 [main] INFO          TCBProcessor - CMUBGProcessor - Starting processing for wire center lp05test at Tue Feb 02 16:51:44 EST 2016
2016-02-02 16:51:50,588 482550844 [main] INFO          TCBProcessor - CMUBGProcessor - Finished processing for wire center lp05test at Tue Feb 02 16:51:50 EST 2016
When:
          TaperCode Background Process, when some of the LEIS-NP report was firing (it's log at  $LEISDIR/planetbg1/log/tcb.log)
So:
          Verify that connection is edited:
    
cp $LEISDIR/planetbg1/config/Reg2jndi.properties $LEISDIR/planetbg1/config/Reg2jndi.properties.$DATE.$TIME
vi $LEISDIR/planetbg1/config/Reg2jndi.properties

     < java.naming.provider.url=<PLBS_REGION2_PROVIDER_URL>
     ---
     > java.naming.provider.url=t3://lnp1vm.cc.telcordia.com:9280
What:
SLH020:1/27 09:52:18 Session initiated by TOPCOM,
                     Local Session Identifier: LNP41,
                     Called Address: GNP2GNP2001, Session #: 3
start_tcp_client: bind OK for local IP addr=192.4.124.39 port=1025 errno=0
join_tcp_server: connecting to remote IP addr=128.96.249.110  sin_port=4003
DEBUG tp_open (Tpc3): 1/27 09:52:18 T-CONNECT-REQUEST FAILED: Reason not specified
DEBUG tp_open (Tpc3): 1/27 09:52:18 rmt host - PYIBM8.cc.telcordia.com  port=4003
DEBUG tp_open (Tpc3): 1/27 09:52:18 check to insure remote is listening on port
DEBUG tpc (Tpc3): 1/27 09:52:18 WARNING: tp_open() failed - An unknown error occurred.
WARN:1/27 09:52:18 TPC042 tpc (Tpc3): transport connect attempt failed:  An unknown error occurred.
DEBUG /lhome/leis/PT980/topcom/160/bin/manager: 1/27 09:52:18 tpcreqdisc: tpc status is OUTCONN, send TRCONN rsp to handler.
WARN:1/27 09:52:18 MGR052 /lhome/leis/PT980/topcom/160/bin/manager: Invalid tpc senderpid, close transport failed. -- errno 0: Error 0
SLH023:1/27 09:52:18 Session initiated by TOPCOM failed,
                     Local Session Identifier: LNP41,
                     Called Address: GNP2GNP2001, Session #: 3,
                     Reason Text: Transport connect failed
DEBUG handler (Hdl1): 1/27 09:52:18 Session(LNP41, 3): With Partner() Terminated
                 Data Inputs Received = 0    Data Outputs Sent = 0
                 Largest Message Received = 0   Largest Message Sent = 0
                 Total Data Chars Received = 0  Total Data Chars Sent = 0
                 Total ALCMs Received = 0     Total ALCMs Sent = 0
                 Total ALNCMs Received = 0    Total ALNCMs Sent = 0
When:
          Topcom log, first start after server aborting
So:
          If it was successfully running before, re-start it several times.
What:
<Jan 11, 2016 12:00:09 PM EST> <Warning> <EJB> <BEA-010096> <The Message-Driven EJB ErrorServiceMDB is unable to connect to the JMS destination or bind to JCA resource adapter telcordia.jms.GTErrorQueue. The onnection failed after 2 attempts. The MDB will attempt to reconnect/rebind every 10 seconds. This log message will repeat every 600 seconds until the condition clears.>
<Jan 11, 2016 12:00:09 PM EST> <Warning> <EJB> <BEA-010061> <The Message-Driven EJB ErrorServiceMDB is unable to connect to the JMS destination telcordia.jms.GTErrorQueue. The Error was:
The Message-Driven EJB failed while creating a JMS Connection. NestedException Message is :JMSWMQ0018: Failed to connect to queue manager 'MQTest' with connection mode 'Client' and host name 'linad3.cc.telcordia.com(1515)'.>
When:
          Starting isgt managed server firstly after server reboot.
So:
          Specified queue manager on linad3 didn't work. Mistake was fixed after is was started.
What:
<Jan 4, 2016 3:27:23 PM EST> <Warning> <Connector> <BEA-190032> << eis/jms/WLSConnectionFactoryJNDINoTX > ResourceAllocationException generated by resource adapter on call to ManagedConnectionFactory.createManagedConnection(): "javax.resource.ResourceException: ConnectionFactory: failed to get initial context (InitialContextFactory =weblogic.jndi.WLInitialContextFactory, url = t3://linad2.cc.telcordia.com:8281, user name = system) ">
When:
          After successful starting of granite_core managed server of ISGT, before starting all other ISGT managed servers.
So:
          1) Messaging bridge doesn't see 1 of the managed servers involved (8281 in this case): start all involved managed servers and look again;
            2) http://linad2 ... has been mistakely specified instead of t3://lina2 ... during creation of bridges. have to be re-created
What:
<Nov 26, 2015 11:17:38 AM EST> <Info> <Security> <BEA-090065> <Getting boot identity from user.>
Enter username to boot WebLogic server:<Nov 26, 2015 11:17:38 AM EST> <Error> <Security> <BEA-090783> <Server is running in development mode and the Native Library (terminalio) to read the password securely from the command line wes not found.>
When:
Starting just added WebLogic instance
So:
          Set a boot authentification for a new server

mkdir -p $DOMAIN/servers/granite_core-two/security
vi $DOMAIN/servers/granite_core-two/security/boot.properties
username=system
password=weblogic12

What:
java.io.IOException: Cannot bind to URL [weblogic.management.mbeanservers.runtime]: javax.naming.ConfigurationException [Root exception is java.rmi.MarshalException: failed to marshal bind(Ljava.lang.String;Ljava.lang.Object;Ljava.util.Hashtable;); nested exception is:
        java.io.NotSerializableException: sun.misc.Launcher$AppClassLoader]
        at javax.management.remote.rmi.RMIConnectorServer.newIOException(RMIConnectorServer.java:826)
        at javax.management.remote.rmi.RMIConnectorServer.start(RMIConnectorServer.java:431)
        at weblogic.management.mbeanservers.internal.MBeanServerServiceBase.start(MBeanServerServiceBase.java:216)
        at weblogic.management.mbeanservers.runtime.internal.RuntimeServerService.start(RuntimeServerService.java:189)
        at weblogic.t3.srvr.SubsystemRequest.run(SubsystemRequest.java:64)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)

When:
Starting second clustered WebLogic instance while first instance is up.

What:
<Dec 28, 2015 9:08:19 AM EST> <Error> <JNDI> <BEA-050003> <Cannot create initial context. Reason: javax.naming.CommunicationException [Root exception is java.net.ConnectException: t3://lnp1vm.cc.telcordia.com:9280: Destination 192.4.124.38, 9280 unreachable; nested exception is:
        java.net.ConnectException: Connection refused; No available router to destination]
        at weblogic.jndi.internal.ExceptionTranslator.toNamingException(ExceptionTranslator.java:40)
        at weblogic.jndi.WLInitialContextFactoryDelegate.toNamingException(WLInitialContextFactoryDelegate.java:808)
        at weblogic.jndi.WLInitialContextFactoryDelegate.getInitialContext(WLInitialContextFactoryDelegate.java:365)
        at weblogic.jndi.Environment.getContext(Environment.java:319)
        at weblogic.jndi.Environment.getContext(Environment.java:288)
        at weblogic.jndi.WLInitialContextFactory.getInitialContext(WLInitialContextFactory.java:117)
        at javax.naming.spi.NamingManager.getInitialContext(NamingManager.java:684)
        at javax.naming.InitialContext.getDefaultInitCtx(InitialContext.java:307)
        at javax.naming.InitialContext.init(InitialContext.java:242)
        at javax.naming.InitialContext.<init>(InitialContext.java:216)
        at weblogic.jndi.internal.ForeignJNDIManager.<init>(ForeignJNDIManager.java:45)
        at weblogic.jndi.internal.ForeignJNDIManager.initialize(ForeignJNDIManager.java:53)
        at weblogic.jndi.internal.ForeignJNDIManagerService.start(ForeignJNDIManagerService.java:36)
        at weblogic.t3.srvr.SubsystemRequest.run(SubsystemRequest.java:64)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
Caused by: java.net.ConnectException: t3://lnp1vm.cc.telcordia.com:9280: Destination 192.4.124.38, 9280 unreachable; nested exception is:
        java.net.ConnectException: Connection refused; No available router to destination
        at weblogic.rjvm.RJVMFinder.findOrCreateInternal(RJVMFinder.java:216)
        at weblogic.rjvm.RJVMFinder.findOrCreate(RJVMFinder.java:169)
        at weblogic.rjvm.ServerURL.findOrCreateRJVM(ServerURL.java:165)
        at weblogic.jndi.WLInitialContextFactoryDelegate.getInitialContext(WLInitialContextFactoryDelegate.java:350)
        ... 13 more
Caused by: java.rmi.ConnectException: Destination 192.4.124.38, 9280 unreachable; nested exception is:
        java.net.ConnectException: Connection refused; No available router to destination
        at weblogic.rjvm.ConnectionManager.bootstrap(ConnectionManager.java:490)
        at weblogic.rjvm.ConnectionManager.bootstrap(ConnectionManager.java:328)
        at weblogic.rjvm.RJVMManager.findOrCreateRemoteInternal(RJVMManager.java:267)
        at weblogic.rjvm.RJVMManager.findOrCreate(RJVMManager.java:204)
        at weblogic.rjvm.RJVMFinder.findOrCreateRemoteServer(RJVMFinder.java:238)
        at weblogic.rjvm.RJVMFinder.findOrCreateInternal(RJVMFinder.java:200)
        ... 16 more
>
weblogic.utils.AssertionError: ***** ASSERTION FAILED *****[ Error creating initial context ]
        at weblogic.cluster.migration.MigratableGroup.<init>(MigratableGroup.java:101)
        at weblogic.cluster.migration.MigrationManager.privateRegister(MigrationManager.java:267)
        at weblogic.cluster.migration.MigrationManager.register(MigrationManager.java:224)
        at weblogic.transaction.internal.TransactionRecoveryNoOpService.start(TransactionRecoveryNoOpService.java:43)
        at weblogic.t3.srvr.SubsystemRequest.run(SubsystemRequest.java:64)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
Caused by: javax.naming.CommunicationException [Root exception is java.net.ConnectException: t3://lnp1vm.cc.telcordia.com:9280: Destination 192.4.124.38, 9280 unreachable; nested exception is:
        java.net.ConnectException: Connection refused; No available router to destination]
        at weblogic.jndi.internal.ExceptionTranslator.toNamingException(ExceptionTranslator.java:40)
        at weblogic.jndi.WLInitialContextFactoryDelegate.toNamingException(WLInitialContextFactoryDelegate.java:808)
        at weblogic.jndi.WLInitialContextFactoryDelegate.getInitialContext(WLInitialContextFactoryDelegate.java:365)
        at weblogic.jndi.Environment.getContext(Environment.java:319)
        at weblogic.jndi.Environment.getContext(Environment.java:288)
        at weblogic.jndi.WLInitialContextFactory.getInitialContext(WLInitialContextFactory.java:117)
        at javax.naming.spi.NamingManager.getInitialContext(NamingManager.java:684)
        at javax.naming.InitialContext.getDefaultInitCtx(InitialContext.java:307)
        at javax.naming.InitialContext.init(InitialContext.java:242)
        at javax.naming.InitialContext.<init>(InitialContext.java:192)
        at weblogic.cluster.migration.MigratableGroup.<init>(MigratableGroup.java:99)
        ... 6 more
Caused by: java.net.ConnectException: t3://lnp1vm.cc.telcordia.com:9280: Destination 192.4.124.38, 9280 unreachable; nested exception is:
        java.net.ConnectException: Connection refused; No available router to destination
        at weblogic.rjvm.RJVMFinder.findOrCreateInternal(RJVMFinder.java:216)
        at weblogic.rjvm.RJVMFinder.findOrCreate(RJVMFinder.java:169)
        at weblogic.rjvm.ServerURL.findOrCreateRJVM(ServerURL.java:165)
        at weblogic.jndi.WLInitialContextFactoryDelegate.getInitialContext(WLInitialContextFactoryDelegate.java:350)
        ... 14 more
Caused by: java.rmi.ConnectException: Destination 192.4.124.38, 9280 unreachable; nested exception is:
        java.net.ConnectException: Connection refused; No available router to destination
        at weblogic.rjvm.ConnectionManager.bootstrap(ConnectionManager.java:490)
        at weblogic.rjvm.ConnectionManager.bootstrap(ConnectionManager.java:328)
        at weblogic.rjvm.RJVMManager.findOrCreateRemoteInternal(RJVMManager.java:267)
        at weblogic.rjvm.RJVMManager.findOrCreate(RJVMManager.java:204)
        at weblogic.rjvm.RJVMFinder.findOrCreateRemoteServer(RJVMFinder.java:238)
        at weblogic.rjvm.RJVMFinder.findOrCreateInternal(RJVMFinder.java:200)
        ... 17 more
<Dec 28, 2015 9:08:21 AM EST> <Critical> <WebLogicServer> <BEA-000386> <Server subsystem failed. Reason: weblogic.utils.AssertionError: ***** ASSERTION FAILED *****[ Error creating initial context ]
weblogic.utils.AssertionError: ***** ASSERTION FAILED *****[ Error creating initial context ]
        at weblogic.cluster.migration.MigratableGroup.<init>(MigratableGroup.java:101)
        at weblogic.cluster.migration.MigrationManager.privateRegister(MigrationManager.java:267)
        at weblogic.cluster.migration.MigrationManager.register(MigrationManager.java:224)
        at weblogic.transaction.internal.TransactionRecoveryNoOpService.start(TransactionRecoveryNoOpService.java:43)
        at weblogic.t3.srvr.SubsystemRequest.run(SubsystemRequest.java:64)
        Truncated. see log file for complete stacktrace
Caused By: javax.naming.CommunicationException [Root exception is java.net.ConnectException: t3://lnp1vm.cc.telcordia.com:9280: Destination 192.4.124.38, 9280 unreachable; nested exception is:
        java.net.ConnectException: Connection refused; No available router to destination]
        at weblogic.jndi.internal.ExceptionTranslator.toNamingException(ExceptionTranslator.java:40)
        at weblogic.jndi.WLInitialContextFactoryDelegate.toNamingException(WLInitialContextFactoryDelegate.java:808)
        at weblogic.jndi.WLInitialContextFactoryDelegate.getInitialContext(WLInitialContextFactoryDelegate.java:365)
        at weblogic.jndi.Environment.getContext(Environment.java:319)
        at weblogic.jndi.Environment.getContext(Environment.java:288)
        Truncated. see log file for complete stacktrace
Caused By: java.net.ConnectException: t3://lnp1vm.cc.telcordia.com:9280: Destination 192.4.124.38, 9280 unreachable; nested exception is:
        java.net.ConnectException: Connection refused; No available router to destination
        at weblogic.rjvm.RJVMFinder.findOrCreateInternal(RJVMFinder.java:216)
        at weblogic.rjvm.RJVMFinder.findOrCreate(RJVMFinder.java:169)
        at weblogic.rjvm.ServerURL.findOrCreateRJVM(ServerURL.java:165)
        at weblogic.jndi.WLInitialContextFactoryDelegate.getInitialContext(WLInitialContextFactoryDelegate.java:350)
        at weblogic.jndi.Environment.getContext(Environment.java:319)
        Truncated. see log file for complete stacktrace
Caused By: java.rmi.ConnectException: Destination 192.4.124.38, 9280 unreachable; nested exception is:
        java.net.ConnectException: Connection refused; No available router to destination
        at weblogic.rjvm.ConnectionManager.bootstrap(ConnectionManager.java:490)
        at weblogic.rjvm.ConnectionManager.bootstrap(ConnectionManager.java:328)
        at weblogic.rjvm.RJVMManager.findOrCreateRemoteInternal(RJVMManager.java:267)
        at weblogic.rjvm.RJVMManager.findOrCreate(RJVMManager.java:204)
        at weblogic.rjvm.RJVMFinder.findOrCreateRemoteServer(RJVMFinder.java:238)
        Truncated. see log file for complete stacktrace
When:
          Starting second clustered WebLogic instance while first instance is down.
So:
  #All because of this file at the clustered env

cp $DOMAIN/bin/setXngEnv.sh $DOMAIN/bin/setXngEnv.sh.151222.0130
vi $DOMAIN/bin/setXngEnv.sh

  #From this

case "${SERVER_NAME}" in "admin") echo NO CHANGE;;
             "gateway") echo NO CHANGE;;
*) echo CHANGE
   PLANETBGENV=leis@lnp2vm.cc.telcordia.com
   PLANETBGDIR=/lhome/leis/PT980/planetbg1
   export PLANETBGENV PLANETBGDIR
   CLASSPATH=$LONG_DOMAIN_HOME/planet-bs-classes:$LONG_DOMAIN_HOME/Xng_config:$LONG_DOMAIN_HOME/planet-bs-classes/gateKeeper.jar:$LONG_DOMAIN_HOME/planet-bs-classes/PSE_Lite.jar:
$LONG_DOMAIN_HOME/planet-bs-classes/orai18n.jar:$CLASSPATH;;
esac

  #make this


case "${SERVER_NAME}" in "admin") echo NO CHANGE;;
             "gateway") echo NO CHANGE;;
*) echo CHANGE
   PLANETBGENV=leis@lnp2vm.cc.telcordia.com
   PLANETBGDIR=/lhome/leis/PT980/planetbg1
   export PLANETBGENV PLANETBGDIR;;
esac

if [ "$SERVER_NAME" = "granite_core-one" ] ; then
        CLASSPATH=$LONG_DOMAIN_HOME/planet-bs-classes:$LONG_DOMAIN_HOME/Xng_config:$LONG_DOMAIN_HOME/planet-bs-classes/gateKeeper.jar:$LONG_DOMAIN_HOME/planet-bs-classes/PSE_Lite.jar:$LONG_DOMAIN_HOME/planet-bs-classes/orai18n.jar:$CLASSPATH
fi

if [ "$SERVER_NAME" = "granite_core-two" ] ; then
        CLASSPATH=$LONG_DOMAIN_HOME/planet-bs-classes2:$LONG_DOMAIN_HOME/Xng_config2:$LONG_DOMAIN_HOME/planet-bs-classes2/gateKeeper.jar:$LONG_DOMAIN_HOME/planet-bs-classes2/PSE_Lite.jar:$LONG_DOMAIN_HOME/planet-bs-classes2/orai18n.jar:$CLASSPATH
fi


  #Also:
 
cp -r $DOMAIN/planet-bs-classes $DOMAIN/planet-bs-classes2
vi $DOMAIN/planet-bs-classes2/jndi.properties
:%s/9280/9290/g
:wq
vi $DOMAIN/planet-bs-classes2/planet.properties
:%s/9280/9290/g
:wq
vi $DOMAIN/planet-bs-classes2/planet.properties.ATT      <== if it's there
:%s/9280/9290/g
:wq
vi $DOMAIN/planet-bs-classes2/planet.properties.CSP      <== if it's there
:%s/9280/9290/g
:wq

  #Check changes
 
diff $DOMAIN/planet-bs-classes $DOMAIN/planet-bs-classes2

     diff /app2/bea/user_projects/domains/granite-pt/planet-bs-classes/jndi.properties /app2/bea/user_projects/domains/granite-pt/planet-bs-classes2/jndi.properties
     5c5
     < java.naming.provider.url=t3://nighthawk.cc.telcordia.com:9280
     ---
     > java.naming.provider.url=t3://nighthawk.cc.telcordia.com:9290
     diff /app2/bea/user_projects/domains/granite-pt/planet-bs-classes/planet.properties /app2/bea/user_projects/domains/granite-pt/planet-bs-classes2/planet.properties
     17c17
     < cspURL=http://nighthawk.cc.telcordia.com:9280/SSO/AuthenticationServlet
     ---
     > cspURL=http://nighthawk.cc.telcordia.com:9290/SSO/AuthenticationServlet
     30c30
     < localURL=http://nighthawk.cc.telcordia.com:9280
     ---
     > localURL=http://nighthawk.cc.telcordia.com:9290
     42c42
     < regions=region2,region3
     ---
     > regions=region2
     diff /app2/bea/user_projects/domains/granite-pt/planet-bs-classes/planet.properties.ATT /app2/bea/user_projects/domains/granite-pt/planet-bs-classes2/planet.properties.ATT
     30c30
     < localURL=http://nighthawk.cc.telcordia.com:9280
     ---
     > localURL=http://nighthawk.cc.telcordia.com:9290
     diff /app2/bea/user_projects/domains/granite-pt/planet-bs-classes/planet.properties.CSP /app2/bea/user_projects/domains/granite-pt/planet-bs-classes2/planet.properties.CSP
     17c17
     < cspURL=http://nighthawk.cc.telcordia.com:9280/SSO/AuthenticationServlet
     ---
     > cspURL=http://nighthawk.cc.telcordia.com:9290/SSO/AuthenticationServlet
     30c30
     < localURL=http://nighthawk.cc.telcordia.com:9280
     ---
     > localURL=http://nighthawk.cc.telcordia.com:9290



  #Also:
 
cp -r $DOMAIN/Xng_config $DOMAIN/Xng_config2
vi $DOMAIN/Xng_config2/granite-config.xml
:%s/9280/9290/g
:wq

  #Check changes
 
diff $DOMAIN/Xng_config $DOMAIN/Xng_config2

     diff /app2/bea/user_projects/domains/granite-pt/Xng_config/granite-config.xml /app2/bea/user_projects/domains/granite-pt/Xng_config2/granite-config.xml
     19c19
     <         <attribute name="enableDecorators" value="true"/>
     ---
     >         <attribute name="enableDecorators" value="false"/>
     173c173
     <                 <attribute name="core-client-help-url" value="http://nighthawk.cc.telcordia.com:9280/xngclient-help"/>
     ---
     >                 <attribute name="core-client-help-url" value="http://nighthawk.cc.telcordia.com:9290/xngclient-help"/>
     180c180
     <                 <attribute name="core-client-admin-help-url" value="http://nighthawk.cc.telcordia.com:9280/xngadmin-help"/>
     ---
     >                 <attribute name="core-client-admin-help-url" value="http://nighthawk.cc.telcordia.com:9290/xngadmin-help"/>
     Only in /app2/bea/user_projects/domains/granite-pt/Xng_config: granite-config_xml.backup

What:
          Caused By: javax.naming.NameNotFoundException: Unable to resolve 'xng.jdbc.xngAdmin'. Resolved 'xng.jdbc'; remaining name 'xngAdmin'
When:
          Deploying *.ear on just created managed server
So:
          Absent or incorrect (look for JNDI names, jdbc and localhost) $DOMAIN/Xng_config/granite-config.xml file.
          If it's absent, diff with the same file from another domain is ok - just restart all servers.

What:
          Begin Upload of rswlgam5 data changes at 05:26:31.
Opening the lfacsxng_temp database schema ...
Closing the lfacsxng_temp database schema ...

Program problem: The upload executable is not installed.

Update LFACS Refresh message for failure ...
20151208 05:26:33,900[main]INFO -       >>initBDL()
                              20151208 05:26:33,907[main]INFO -DB name:region2
                              20151208 05:26:40,917[main]INFO - <<initBDL()
                              20151208 05:26:40,918[main]INFO - >>updateWcRefreshMsg()
                              20151208 05:26:41,354[main]INFO -site inst Id: 1507940
                              20151208 05:26:42,554[main]INFO - <<updateWcRefreshMsg()
                              Opening file /lhome/leis/DEV980/lib/dblist (r, 3) ...
Update Refresh Status for rswlgam5 has started Tue Dec 08 05:26:43 2015.
Opening the planet_common database schema ...
Words of common memory storage used: 0
  (allocated words: 0, primary words: 1, secondary blocks: 0/200)
Closing the planet_common database schema ...
Update Refresh Status has completed Tue Dec 08 05:26:43 2015.

Error: The LFACS Refresh for wire center rswlgam5 failed.
        Check /leis/DATA/granite/DEV803.vm/rswlgam5/log/refresh.out for errors.

When:
          LFACS refresh by Palvo on lnp2vm as leis (lfacs.refresh)
So:
/lhome/leis/DEV980/bin/lfacs.refresh
In this script I this error corresponds to absence of some additional scripts.
After that scripts were added, the whole lfacs.refresh was successfully re-started by Palvo (Rochelle allows it).

What:
          JMSWMQ0018: Failed to connect to queue manager 'MQTest' with connection mode 'Client' and host name 'linad2.cc.telcordia.com(1415)'.
          JMSCMQ0001: WebSphere MQ call failed with compcode '2' ('MQCC_FAILED') reason '2538' ('MQRC_HOST_NOT_AVAILABLE').
When:
          Try to reach IBMmq queue
     providerURL:    ldap://accolade.cam.telcordia.com:9009/ou=MQTest,ou=MQIBM,ou=jms,ou=pon,o=telcordia,c=us1
     binding:           cn=TEMSFACTORY (for Kharkiv)
But it works fine for cn=temsFactory2.
So:
Jose:
The issue that you have accessing IBM WebSphere MQ was that all the Queue Managers in linad2 were down. In your particular case (for you linad2 environment), the MQTest QMgr and associated resources needed to be restarted – which I did.
strmqm MQTestPT
runmqsc MQTestPT
ps -eaf | grep MQTestPT
setmqaut -m MQTestPT -t qmgr -g granite +all
setmqaut -m MQTestPT -n temsReq_ngn_pt -t queue -g granite +all
setmqaut -m MQTestPT -n temsResp_ngn_pt -t queue -g granite +all
setmqaut -m MQTestPT -n granite_err_ngn -t queue -g granite +all
runmqsc MQTestPT

What:
<[ServletContext@768502179[app:planet-bs module:planet-bs path:null spec-version:3.0]] Servlet failed with an Exception
java.lang.NullPointerException
        at java.util.Properties$LineReader.readLine(Properties.java:434)
        at java.util.Properties.load0(Properties.java:353)
        at java.util.Properties.load(Properties.java:341)
        at com.telcordia.planet.util.PlanetProperties.<init>(PlanetProperties.java:20)
        at com.telcordia.planet.util.PlanetProperties.getInstance(PlanetProperties.java:12)
        at jsp_servlet._jsp.__login._jspService(__login.java:173)
        at weblogic.servlet.jsp.JspBase.service(JspBase.java:34)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:280)
        at weblogic.servlet.internal.StubSecurityHelper$ServletServiceAction.run(StubSecurityHelper.java:254)
        at weblogic.servlet.internal.StubSecurityHelper.invokeServlet(StubSecurityHelper.java:136)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:341)
        at weblogic.servlet.internal.ServletStubImpl.onAddToMapException(ServletStubImpl.java:478)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:367)
        at weblogic.servlet.internal.ServletStubImpl.execute(ServletStubImpl.java:238)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.wrapRun(WebAppServletContext.java:3363)
        at weblogic.servlet.internal.WebAppServletContext$ServletInvocationAction.run(WebAppServletContext.java:3333)
        at weblogic.security.acl.internal.AuthenticatedSubject.doAs(AuthenticatedSubject.java:321)
        at weblogic.security.service.SecurityManager.runAs(SecurityManager.java:120)
        at weblogic.servlet.provider.WlsSubjectHandle.run(WlsSubjectHandle.java:57)
        at weblogic.servlet.internal.WebAppServletContext.doSecuredExecute(WebAppServletContext.java:2220)
        at weblogic.servlet.internal.WebAppServletContext.securedExecute(WebAppServletContext.java:2146)
        at weblogic.servlet.internal.WebAppServletContext.execute(WebAppServletContext.java:2124)
        at weblogic.servlet.internal.ServletRequestImpl.run(ServletRequestImpl.java:1564)
        at weblogic.servlet.provider.ContainerSupportProviderImpl$WlsRequestExecutor.run(ContainerSupportProviderImpl.java:254)
        at weblogic.work.ExecuteThread.execute(ExecuteThread.java:295)
        at weblogic.work.ExecuteThread.run(ExecuteThread.java:254)
When:
          Every time we try to use just installed on WL app - in WL's logs.
So:
Check CLASSPATH
Java doesn't know where it should search for necessary file (planet.properties in this case).
In our LEIS-NP Granit's WL case:

vi $DOMAIN/bin/setXngEnv.sh         <== edit/add this:
...
*) echo CHANGE
PLANETBGENV=leis@lnp2vm.cc.telcordia.com
PLANETBGDIR=/lhome/leis/PT980/planetbg1
export PLANETBGENV PLANETBGDIR
...    
CLASSPATH=$LONG_DOMAIN_HOME/planet-bs-classes:$LONG_DOMAIN_HOME/Xng_config:$LONG_DOMAIN_HOME/planet-bs-classes/gateKeeper.jar:$LONG_DOMAIN_HOME/planet-bs-classes/PSE_Lite.jar:$LONG_DOMAIN_HOME/planet-bs-classes/orai18n.jar:$CLASSPATH;;
...

!!! Then reboot all managed servers !!!

What:
2015-Dec-22 05:25:50 DEBUG MenuIncluder.java:30 -- Getting menus from file /app1/bea/user_projects/domains/granite-pt/servers/granite_core/stage/planet-bs-local/planet-bs-local/js/blsHqSSOMenusItems.js
2015-Dec-22 05:25:50 ERROR MenuIncluder.java:39 -- Cannot read file containing menus - file name = /app1/bea/user_projects/domains/granite-pt/servers/granite_core/stage/planet-bs-local/planet-bs-local/js/blsHqSSOMenusItems.js - Exception is: java.io.FileNotFoundException: /app1/bea/user_projects/domains/granite-pt/servers/granite_core/stage/planet-bs-local/planet-bs-local/js/blsHqSSOMenusItems.js (No such file or directory)
When:
          There were such messages at WL logs and there wasn't menu at http://lnp1vm.cc.telcordia.com:9280/planet-bs/
So:
In the file     /app1/bea/user_projects/domains/granite-pt/planet-bs-classes/planet.properties:
This:
     localDirectory=/app1/bea/user_projects/domains/granite-pt/servers/granite_core/stage/planet-bs-local/planet-bs-local
replaced to this:
     localDirectory=/app1/bea/user_projects/domains/granite-pt/applications/planet-bs-local

The same for this file     /app1/bea/user_projects/domains/granite-pt/planet-bs-classes2/planet.properties      <== if it's clustered env

What:
javax.jms.JMSException: Could not create InitialContext: accolade.cam.telcordia.com:9009
     at hermes.JNDIContextFactory.createContext(JNDIContextFactory.java:282)
     at hermes.JNDIConnectionFactory.createConnection(JNDIConnectionFactory.java:105)
     at hermes.impl.jms.ConnectionManagerSupport.createConnection(ConnectionManagerSupport.java:126)
     at hermes.impl.jms.ConnectionManagerSupport.createConnection(ConnectionManagerSupport.java:92)
     at hermes.impl.jms.ConnectionSharedManager.reconnect(ConnectionSharedManager.java:81)
     at hermes.impl.jms.ConnectionSharedManager.connect(ConnectionSharedManager.java:91)
     at hermes.impl.jms.ConnectionSharedManager.getConnection(ConnectionSharedManager.java:104)
     at hermes.impl.jms.ConnectionSharedManager.getObject(ConnectionSharedManager.java:142)
     at hermes.impl.jms.ThreadLocalSessionManager.connect(ThreadLocalSessionManager.java:190)
     at hermes.impl.jms.ThreadLocalSessionManager.getSession(ThreadLocalSessionManager.java:570)
     at hermes.impl.jms.AbstractSessionManager.getDestination(AbstractSessionManager.java:460)
     at hermes.impl.DefaultHermesImpl.getDestination(DefaultHermesImpl.java:367)
     at hermes.browser.tasks.BrowseDestinationTask.invoke(BrowseDestinationTask.java:141)
     at hermes.browser.tasks.TaskSupport.run(TaskSupport.java:175)
     at hermes.browser.tasks.ThreadPool.run(ThreadPool.java:170)
     at java.lang.Thread.run(Thread.java:745)
When:
          Every time I try to open ibm-queue via Hermes.
So:
          Seems to me that server accolade.cam.telcordia.com is not available.















































































































































