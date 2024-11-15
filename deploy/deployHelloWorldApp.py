import time

AdminApp.install('/tmp/deploy/hello-world.war', '[-appname HelloWorld -cell DefaultCell01 -server server1]')
AdminConfig.save()


time.sleep(100)
Sync1 = AdminControl.completeObjectName('type=NodeSync,process=nodeagent,node=AppSrvNode01,*')
AdminControl.invoke(Sync1, 'sync')