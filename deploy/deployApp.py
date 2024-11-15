import time

AdminApp.install('/tmp/deploy/myapp.war', '[-appname MyApp -cell DefaultCell01 -server server1]')
AdminConfig.save()


time.sleep(100)
Sync1 = AdminControl.completeObjectName('type=NodeSync,process=nodeagent,node=AppSrvNode01,*')
AdminControl.invoke(Sync1, 'sync')