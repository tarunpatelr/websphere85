import time

AdminApp.install('/tmp/deploy/myapp.war', '[-appname MyApp -cell DefaultCell01 -server server1 -MapWebModToVH [[ myapp.war myapp.war,WEB-INF/web.xml default_host ]]]')
AdminConfig.save()

time.sleep(20)

appManager = AdminControl.queryNames('cell=DefaultCell01,node=DefaultNode01,type=ApplicationManager,process=server1,*')
print appManager
AdminControl.invoke(appManager, 'startApplication', 'MyApp')